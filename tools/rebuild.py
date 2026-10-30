"""Rebuild SWFs from chapter translations and editable WorkSpace graphics."""

import argparse
import hashlib
import json
import os
from pathlib import Path
import shutil
import struct
import subprocess
import sys
import tempfile
import xml.etree.ElementTree as ET
import zlib


ROOT = Path(__file__).resolve().parent.parent
LAB = ROOT / "codex-lab"
BUILD = LAB / "build"
FFDEC = LAB / "tools/ffdec_26.4.0/ffdec.jar"
SEP = "\n--- RECORDSEPARATOR ---\n"
CHARACTER_CODES = {2, 6, 11, 20, 21, 22, 32, 33, 35, 36, 37, 39, 48, 83, 90}


def require(condition, message):
    if not condition:
        raise ValueError(message)


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def read(path):
    return json.loads(path.read_text(encoding="utf-8-sig"))


def raw_swf(path):
    data = path.read_bytes()
    require(data[:3] in (b"CWS", b"FWS"), f"Unsupported SWF: {path}")
    raw = b"FWS" + data[3:8] + (zlib.decompress(data[8:]) if data[:3] == b"CWS" else data[8:])
    require(len(raw) == int.from_bytes(raw[4:8], "little"), "Incorrect SWF length")
    return raw


def tag_start(raw):
    return 12 + (5 + 4 * (raw[8] >> 3) + 7) // 8


def tags(data, start=0):
    """Read a tag container, retaining the opaque bytes after its End tag."""
    result = []
    while start < len(data):
        original = start
        header = struct.unpack_from("<H", data, start)[0]
        start += 2
        code, size = header >> 6, header & 63
        if size == 63:
            size = struct.unpack_from("<I", data, start)[0]
            start += 4
        stop = start + size
        require(stop <= len(data), "SWF tag exceeds container")
        result.append((code, data[start:stop], data[original:stop]))
        start = stop
        if code == 0:
            return result, data[start:]
    raise ValueError("SWF End tag missing")


def pack_tag(code, payload):
    header = struct.pack("<H", code << 6 | len(payload)) if len(payload) < 63 else struct.pack("<HI", code << 6 | 63, len(payload))
    return header + payload


def actions(raw):
    result = {}

    def walk(container, owner):
        frame = 1
        for index, (code, payload, _) in enumerate(tags(container)[0]):
            if code == 39:
                walk(payload[4:], int.from_bytes(payload[:2], "little"))
            elif code == 12:
                result[(owner, frame, index)] = payload
            elif code == 1:
                frame += 1
    walk(raw[tag_start(raw):], 0)
    return result


def replace_tags(raw, replacements, additions, action_changes):
    used, inserted = set(), set()

    def walk(container, owner=0):
        output = bytearray()
        frame = 1
        entries, tail = tags(container)
        for index, (code, payload, original) in enumerate(entries):
            identifier = int.from_bytes(payload[:2], "little") if code in CHARACTER_CODES else None
            if owner == 0 and identifier is not None:
                for addition in additions:
                    if addition.get("before_character", addition.get("before_sprite")) == identifier:
                        output.extend(pack_tag(addition["code"], addition["payload"]))
                        inserted.add(addition["id"])
            if (code, identifier) in replacements:
                output.extend(pack_tag(*replacements[code, identifier]))
                used.add((code, identifier))
            elif code == 39:
                child = walk(payload[4:], identifier)
                output.extend(original if child == payload[4:] else pack_tag(code, payload[:4] + child))
            elif (owner, frame, index) in action_changes:
                output.extend(pack_tag(code, action_changes[owner, frame, index]))
            else:
                output.extend(original)
            if code == 1:
                frame += 1
        output.extend(tail)
        return bytes(output)

    start = tag_start(raw)
    result = bytearray(raw[:start] + walk(raw[start:]))
    require(used == replacements.keys(), "Replacement tags not all consumed")
    require(inserted == {a["id"] for a in additions}, "Animated glyph additions not all consumed")
    result[4:8] = struct.pack("<I", len(result))
    return bytes(result)


def verify_preservation(before, after, replacements, additions, action_changes, animated_owners):
    new_ids = {a["id"] for a in additions}
    checked = changed = 0

    def walk(left, right, owner=0):
        nonlocal checked, changed
        old_tags, old_tail = tags(left)
        new_tags, new_tail = tags(right)
        require(old_tail == new_tail, f"Opaque trailer changed in sprite {owner}")
        if owner == 0:
            added = {int.from_bytes(t[1][:2], "little"): (t[0], t[1]) for t in new_tags
                     if t[0] in CHARACTER_CODES and int.from_bytes(t[1][:2], "little") in new_ids}
            require(added == {a["id"]: (a["code"], a["payload"]) for a in additions}, "Added symbol payload differs")
            new_tags = [t for t in new_tags if not (t[0] in CHARACTER_CODES and int.from_bytes(t[1][:2], "little") in new_ids)]
        require(len(old_tags) == len(new_tags), "Existing tag count changed")
        frame = 1
        for index, ((code, old, _), (new_code, new, _)) in enumerate(zip(old_tags, new_tags)):
            identifier = int.from_bytes(old[:2], "little") if code in CHARACTER_CODES else None
            replacement = replacements.get((code, identifier))
            require(new_code == (replacement[0] if replacement else code), "Tag order/type changed")
            if code == 39:
                require(old[:4] == new[:4], "Sprite ID/frame count changed")
                walk(old[4:], new[4:], identifier)
            else:
                checked += 1
                if code != new_code or old != new:
                    changed += 1
                    if (code, identifier) in replacements:
                        require((new_code, new) == replacement, "Replacement payload differs")
                    elif (owner, frame, index) in action_changes:
                        require(new == action_changes[owner, frame, index], "Script replacement differs")
                    else:
                        require(owner in animated_owners and code == 26, f"Unrelated payload changed: owner={owner}, tag={code}")
            if code == 1:
                frame += 1
    require(before[3:4] + before[8:tag_start(before)] == after[3:4] + after[8:tag_start(after)], "Movie header changed")
    walk(before[tag_start(before):], after[tag_start(after):])
    return {"existing_leaf_payloads_checked": checked, "changed_leaf_payloads": changed,
            "unrelated_payloads_identical": True, "opaque_trailers_identical": True}


def run(command, log, **kwargs):
    with log.open("a", encoding="utf-8") as stream:
        completed = subprocess.run(list(map(str, command)), cwd=BUILD, stdout=stream, stderr=subprocess.STDOUT, timeout=600, **kwargs)
    if completed.returncode:
        detail = log.read_text(encoding="utf-8", errors="replace")[-3500:]
        raise RuntimeError(f"Command failed ({completed.returncode}). See {log}\n{detail}")


def ffdec(log, *args):
    command = ["java", "-Xmx2g", "-Djava.awt.headless=true", "-Dfile.encoding=UTF-8", f"-Duser.home={BUILD}", "-jar", FFDEC,
               "-config", "parallelSpeedUp=false", "-onerror", "abort", *args]
    run(command, log, env=dict(os.environ, APPDATA=str(BUILD)))


def literal(value):
    return json.dumps(value, ensure_ascii=False)


def graphics_inputs(chapter, original_hash):
    folder = ROOT / f"WorkSpace/chapter{chapter:02}"
    baseline = folder / "graphics-baseline.json"
    require(baseline.is_file(), f"그래픽 작업 기준 파일이 없습니다: {baseline}")
    manifest = read(baseline)
    require(manifest["chapter"] == chapter and manifest["original_sha256"] == original_hash,
            f"그래픽 작업본의 장/원본 해시가 다릅니다: {baseline}")
    hashes, edits = {}, []
    for name, expected in manifest["files"].items():
        relative = Path(name)
        require(len(relative.parts) == 3 and relative.parts[0] == "assets" and
                (relative.parts[1], relative.suffix) in {("images", ".png"), ("shapes", ".svg")} and
                relative.stem.isascii() and relative.stem.isdecimal(), f"잘못된 그래픽 경로: {name}")
        path = folder / relative
        require(path.is_file(), f"그래픽 파일이 없습니다: {path}")
        hashes[name] = sha(path)
        if hashes[name] != expected:
            if relative.suffix == ".svg":
                try:
                    document = ET.parse(path)
                except ET.ParseError as error:
                    raise ValueError(f"잘못된 SVG 파일: {path}: {error}") from error
                require(document.getroot().tag == "{http://www.w3.org/2000/svg}svg", f"SVG 루트가 올바르지 않습니다: {path}")
            edits.append({"path": str(path), "symbol_id": int(relative.stem), "kind": relative.parts[1]})
    actual = {p.relative_to(folder).as_posix() for category, suffix in (("images", ".png"), ("shapes", ".svg"))
              for p in (folder / "assets" / category).iterdir() if p.suffix.lower() == suffix}
    require(actual == hashes.keys(), "그래픽 파일명이 기준 목록과 다릅니다. 심벌 번호와 확장자를 유지하세요.")
    return folder, sha(baseline), hashes, edits


def build(chapter, font, fallback, classes):
    original = ROOT / f"original_asset/XS II to III - One Year Missing - Chapter {chapter:02}.swf"
    translation = ROOT / f"WorkSpace/translations/chapter{chapter:02}.json"
    original_hash, translation_hash = sha(original), sha(translation)
    graphics_folder, baseline_hash, graphics_hashes, graphics_edits = graphics_inputs(chapter, original_hash)
    entries = read(translation)
    require(len({e["id"] for e in entries}) == len(entries), "Duplicate record IDs")
    require(all(isinstance(e.get("[KOR]", ""), str) for e in entries), "[KOR] must be a string")
    source = raw_swf(original)
    log = BUILD / f"chapter{chapter:02}-build.log"
    log.write_text("", encoding="utf-8")
    print(f"\nChapter {chapter:02}: scripts, text, embedded font and {len(graphics_edits)} edited graphics...", flush=True)
    # This context owns only the newly created run directory, never user inputs.
    with tempfile.TemporaryDirectory(prefix=f"chapter{chapter:02}-", dir=BUILD) as temporary:
        work = Path(temporary).resolve()
        require(work.is_relative_to(BUILD.resolve()), "Temporary directory escaped build folder")
        export = work / "export"
        ffdec(log, "-export", "script", export, original)
        grouped = {}
        for entry in entries:
            if entry["kind"] == "script_dialogue":
                grouped.setdefault(entry["source"], []).append(entry)
        overrides = work / "scripts"
        expected, allowed_frames = {}, set()
        applied_scripts = 0
        for name, records in grouped.items():
            relative = Path(name).relative_to("assets/scripts")
            text = (export / "scripts" / relative).read_text(encoding="utf-8-sig")
            translated = text
            for record in records:
                jp, ko = literal(record["[JPN]"]), record.get("[KOR]", "")
                require(translated.count(jp) == 1, f"Source string missing or ambiguous: {record['id']}")
                if ko.strip():
                    translated = translated.replace(jp, literal(ko), 1)
                    applied_scripts += 1
            if translated != text:
                output = overrides / relative
                output.parent.mkdir(parents=True, exist_ok=True)
                output.write_text(translated, encoding="utf-8")
                expected[relative] = translated
                allowed_frames.update((r["owner_sprite"], r["frame"]) for r in records)
        action_changes = {}
        if expected:
            compiled = work / "scripts.swf"
            ffdec(log, "-importScript", original, compiled, overrides)
            before, after = actions(source), actions(raw_swf(compiled))
            require(before.keys() == after.keys(), "Script compiler changed action locations")
            action_changes = {key: value for key, value in after.items() if before[key] != value}
            require(all(key[:2] in allowed_frames for key in action_changes), "Unselected frame script changed")
            exported = work / "verify-scripts"
            ffdec(log, "-export", "script", exported, compiled)
            for relative, wanted in expected.items():
                actual = (exported / "scripts" / relative).read_text(encoding="utf-8-sig").replace("\\'", "'")
                require(actual.strip() == wanted.strip(), f"Recompiled script differs: {relative}")
        payload_folder = work / "text"
        payload_folder.mkdir()
        graphics_file = work / "graphics.json"
        graphics_file.write_text(json.dumps(graphics_edits, ensure_ascii=False), encoding="utf-8")
        library = str(FFDEC.parent / "lib/*")
        classpath = library + os.pathsep + str(classes)
        run(["java", "-Xmx2g", "-Djava.awt.headless=true", "-cp", classpath, "RebuildText",
             original, translation, font, fallback, payload_folder, chapter, graphics_file], log)
        manifest = read(payload_folder / "changes.json")
        replacements = {(e["code"], e["id"]): (e.get("new_code", e["code"]), (payload_folder / e["file"]).read_bytes())
                        for e in manifest["replacements"]}
        additions = [dict(e, payload=(payload_folder / e["file"]).read_bytes()) for e in manifest["additions"]]
        final = replace_tags(source, replacements, additions, action_changes)
        owners = {e["layout_owner_sprite"] for e in entries if e.get("animated_glyph_instances") and e.get("[KOR]", "").strip()}
        verification = verify_preservation(source, final, replacements, additions, action_changes, owners)
        candidate = work / "result.swf"
        candidate.write_bytes(b"CWS" + final[3:8] + zlib.compress(final[8:]))
        run(["java", "-Xmx2g", "-Djava.awt.headless=true", "-cp", classpath, "RebuildText",
             "verify", candidate, payload_folder / "changes.json", translation], log)
        require(sha(original) == original_hash and sha(translation) == translation_hash, "Input changed while building")
        _, current_baseline, current_graphics, _ = graphics_inputs(chapter, original_hash)
        require(current_baseline == baseline_hash and current_graphics == graphics_hashes,
                "Graphic input changed while building")
        output = BUILD / f"chapter{chapter:02}-ko.swf"
        candidate.replace(output)
        report = dict(verification, chapter=chapter, original_sha256=original_hash, translation_sha256=translation_hash,
                      output_sha256=sha(output), font="Galmuri11 Condensed", font_file_sha256=sha(font),
                      script_records_applied=applied_scripts, text_tags_applied=len(manifest["checks"]),
                      graphics_applied=len(graphics_edits), graphics_verified=True,
                      graphics_inputs={"folder": graphics_folder.relative_to(ROOT).as_posix(), "files": graphics_hashes},
                      animated_phrase_count=len(owners), new_glyph_symbols=sum("before_sprite" in a for a in additions),
                      new_graphic_symbols=sum("before_character" in a for a in additions),
                      empty_kor_keeps_japanese=True, roundtrip_text_verified=True, runtime_verified=False)
        (BUILD / f"chapter{chapter:02}-verification.json").write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(f"OK: {output}", flush=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("chapter", nargs="?", help="1..6, 0 or all; omit for the chapter menu")
    args = parser.parse_args()
    choice = args.chapter
    if choice is None:
        print("XSMY 한글 SWF 리빌드\n1~6: 챕터 선택 / 0: 전체 / q: 종료")
        choice = input("챕터 번호: ").strip()
    if choice.lower() == "q":
        return
    require(choice.lower() in {"0", "all", "1", "2", "3", "4", "5", "6"}, "챕터는 1~6 또는 0(전체)을 입력하세요.")
    for program in ("java", "javac"):
        require(shutil.which(program), f"{program}가 없습니다. JDK를 설치하고 PATH를 확인하세요.")
    require(FFDEC.is_file(), f"FFDec 26.4.0이 필요합니다: {FFDEC}")
    folders = [Path(os.environ.get("LOCALAPPDATA", "")) / "Microsoft/Windows/Fonts",
               Path(os.environ.get("USERPROFILE", "")) / "AppData/Local/Microsoft/Windows/Fonts",
               Path(os.environ.get("WINDIR", "C:/Windows")) / "Fonts"]
    font = next((p / "Galmuri11-Condensed.ttf" for p in folders if (p / "Galmuri11-Condensed.ttf").is_file()), None)
    require(font is not None, "설치된 Galmuri11-Condensed.ttf를 찾지 못했습니다.")
    fallback = font.with_name("Galmuri11.ttf")
    require(fallback.is_file(), f"일본어 대체 글꼴이 필요합니다: {fallback}")
    BUILD.mkdir(parents=True, exist_ok=True)
    classes = BUILD / "java"
    classes.mkdir(exist_ok=True)
    run(["javac", "-encoding", "UTF-8", "-cp", FFDEC.parent / "lib/*", "-d", classes, ROOT / "tools/RebuildText.java"], BUILD / "compile.log")
    chapters = range(1, 7) if choice.lower() in ("all", "0") else [int(choice)]
    for chapter in chapters:
        build(chapter, font, fallback, classes)
    print("\n완료. 결과와 검증 기록: " + str(BUILD))


if __name__ == "__main__":
    try:
        main()
    except (ValueError, RuntimeError, OSError, subprocess.SubprocessError, EOFError) as error:
        print(f"\n리빌드 실패: {error}", file=sys.stderr)
        sys.exit(1)

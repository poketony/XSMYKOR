import com.eclipsesource.json.*;
import com.jpexs.decompiler.flash.SWF;
import com.jpexs.decompiler.flash.importers.svg.SvgImporter;
import com.jpexs.decompiler.flash.tags.*;
import com.jpexs.decompiler.flash.tags.base.*;
import com.jpexs.decompiler.flash.types.*;
import java.awt.Font;
import java.awt.image.BufferedImage;
import java.io.*;
import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import java.nio.file.*;
import java.security.MessageDigest;
import java.util.*;
import javax.imageio.ImageIO;

/** Emit only replacement tag payloads; Python preserves the original SWF container. */
public class RebuildText {
    static final String SEP = "\n--- RECORDSEPARATOR ---\n";
    static SWF swf;
    static DefineFont2Tag font;
    static Path out;
    static int nextId;
    static JsonArray changes = new JsonArray();
    static JsonArray additions = new JsonArray();
    static JsonArray checks = new JsonArray();
    static JsonArray graphicChecks = new JsonArray();

    static String normal(String value) {
        return value.replace("\r\n", "\n").replace('\r', '\n');
    }

    static String plain(TextTag tag) {
        return normal(String.join(SEP, tag.getTexts()));
    }

    static void require(boolean condition, String message) {
        if (!condition) throw new IllegalStateException(message);
    }

    static void emit(Tag tag) throws Exception {
        emit(tag, tag.getId());
    }

    static void emit(Tag tag, int sourceCode) throws Exception {
        int id = ((CharacterTag) tag).getCharacterId();
        String file = "tag-" + tag.getId() + "-" + id + ".bin";
        Files.write(out.resolve(file), tag.getData());
        changes.add(new JsonObject().add("code", sourceCode).add("new_code", tag.getId()).add("id", id).add("file", file));
    }

    static String digest(byte[] data) throws Exception {
        StringBuilder result = new StringBuilder();
        for (byte value : MessageDigest.getInstance("SHA-256").digest(data)) result.append(String.format("%02x", value & 255));
        return result.toString();
    }

    static String pixels(BufferedImage image) throws Exception {
        int width = image.getWidth(), height = image.getHeight();
        ByteBuffer data = ByteBuffer.allocate(8 + width * height * 4);
        data.putInt(width).putInt(height);
        for (int pixel : image.getRGB(0, 0, width, height, null, 0, width)) data.putInt(pixel);
        return digest(data.array());
    }

    static void graphics(Path list) throws Exception {
        JsonArray edits = JsonArray.readFrom(new String(Files.readAllBytes(list), StandardCharsets.UTF_8));
        for (JsonValue value : edits) {
            JsonObject edit = value.asObject();
            int id = edit.getInt("symbol_id", -1);
            CharacterTag original = swf.getCharacter(id);
            Path file = Paths.get(edit.getString("path", ""));
            byte[] data = Files.readAllBytes(file);
            Tag replacement;
            JsonObject check = new JsonObject().add("symbol_id", id).add("kind", edit.getString("kind", ""));
            require(original != null, "Unknown graphic symbol: " + file);
            int sourceCode = original.getId();
            if (edit.getString("kind", "").equals("images")) {
                require(original instanceof ImageTag, "Not an image symbol: " + file);
                require(data.length >= 8 && Arrays.equals(Arrays.copyOf(data, 8),
                        new byte[]{(byte)137, 80, 78, 71, 13, 10, 26, 10}), "Not a PNG file: " + file);
                BufferedImage image = ImageIO.read(new ByteArrayInputStream(data));
                require(image != null, "Cannot decode PNG: " + file);
                java.awt.Dimension size = ((ImageTag)original).getImageDimension();
                require(image.getWidth() == size.width && image.getHeight() == size.height,
                        "PNG dimensions differ from original " + size.width + "x" + size.height + ": " + file);
                // Lossless2 works in the original SWF versions and retains the alpha channel.
                DefineBitsLossless2Tag bitmap = new DefineBitsLossless2Tag(swf);
                bitmap.characterID = id;
                bitmap.setImage(data);
                replacement = bitmap;
                check.add("pixels_sha256", pixels(bitmap.getImageCached().getBufferedImage()));
            } else {
                require(original instanceof ShapeTag, "Not a shape symbol: " + file);
                Set<Integer> before = new HashSet<>(swf.getCharacters(false).keySet());
                replacement = new SvgImporter().importSvg((ShapeTag)original, new String(data, StandardCharsets.UTF_8));
                require(replacement instanceof ShapeTag, "Cannot import SVG: " + file);
                swf.updateCharacters();
                // SVG patterns may introduce embedded bitmap symbols. Insert them before their shape.
                for (CharacterTag added : new TreeMap<>(swf.getCharacters(false)).values()) {
                    if (before.contains(added.getCharacterId())) continue;
                    require(added instanceof ImageTag, "Unexpected SVG dependency: " + file);
                    String name = "graphic-" + added.getCharacterId() + ".bin";
                    Files.write(out.resolve(name), added.getData());
                    additions.add(new JsonObject().add("code", added.getId()).add("id", added.getCharacterId())
                            .add("before_character", id).add("file", name));
                }
                check.add("payload_sha256", digest(replacement.getData()));
            }
            require(((CharacterTag)replacement).getCharacterId() == id, "Graphic symbol ID changed: " + file);
            emit(replacement, sourceCode);
            graphicChecks.add(check);
        }
    }

    static int advance(char c, int height) {
        int glyph = font.charToGlyph(c);
        require(glyph >= 0, "Missing embedded glyph U+" + Integer.toHexString(c));
        return (int) Math.round(font.getGlyphAdvance(glyph) * height / 1024.0);
    }

    static int width(String text, int height) {
        int result = 0;
        for (char c : text.toCharArray()) result += advance(c, height);
        return result;
    }

    static TEXTRECORD record(String value, int x, int y, int height, RGB color) {
        TEXTRECORD result = new TEXTRECORD();
        result.styleFlagsHasFont = result.styleFlagsHasColor = true;
        result.styleFlagsHasXOffset = result.styleFlagsHasYOffset = true;
        result.fontId = font.fontID;
        result.textHeight = height;
        result.textColor = color;
        result.textColorA = color instanceof RGBA ? (RGBA) color : new RGBA(color.red, color.green, color.blue, 255);
        result.xOffset = x;
        result.yOffset = y;
        result.glyphEntries = new ArrayList<>();
        for (char c : value.toCharArray()) {
            GLYPHENTRY entry = new GLYPHENTRY();
            entry.glyphIndex = font.charToGlyph(c);
            entry.glyphAdvance = advance(c, height);
            result.glyphEntries.add(entry);
        }
        return result;
    }

    static class Style {
        int x, y, height, oldWidth;
        RGB color;
        Style(int x, int y, int height, int oldWidth, RGB color) {
            this.x = x; this.y = y; this.height = height; this.oldWidth = oldWidth; this.color = color;
        }
    }

    static List<Style> styles(StaticTextTag tag) {
        List<Style> result = new ArrayList<>();
        int x = 0, y = 0, height = 240;
        RGB color = new RGB(255, 255, 255);
        for (TEXTRECORD r : tag.textRecords) {
            if (r.styleFlagsHasXOffset) x = r.xOffset;
            if (r.styleFlagsHasYOffset) y = r.yOffset;
            if (r.styleFlagsHasFont) height = r.textHeight;
            if (r.styleFlagsHasColor) color = tag.getTextNum() == 2 ? r.textColorA : r.textColor;
            result.add(new Style(x, y, height, r.getTotalAdvance(), color));
            x += r.getTotalAdvance();
        }
        return result;
    }

    static List<String> wrap(String value, int height, int available) {
        List<String> lines = new ArrayList<>();
        for (String paragraph : normal(value).split("\n", -1)) {
            StringBuilder line = new StringBuilder();
            int used = 0;
            for (char c : paragraph.toCharArray()) {
                int size = advance(c, height);
                if (used + size > available && line.length() > 0) {
                    lines.add(line.toString()); line.setLength(0); used = 0;
                }
                line.append(c); used += size;
            }
            lines.add(line.toString());
        }
        return lines;
    }

    static void staticText(StaticTextTag tag, String translation) {
        List<Style> before = styles(tag);
        String[] parts = translation.split(SEP, -1);
        List<TEXTRECORD> result = new ArrayList<>();
        if (parts.length == before.size()) {
            int cursor = 0, previousY = Integer.MIN_VALUE;
            for (int i = 0; i < parts.length; i++) {
                Style s = before.get(i);
                if (s.y != previousY || tag.textRecords.get(i).styleFlagsHasXOffset) cursor = s.x;
                require(parts[i].indexOf('\n') < 0, "Unexpected newline in static text record " + tag.characterID);
                result.add(record(parts[i], cursor, s.y, s.height, s.color));
                cursor += width(parts[i], s.height);
                previousY = s.y;
            }
        } else {
            // The opening transcript is one translated paragraph stream rather than FFDec records.
            require(tag.characterID == 145, "Record separator count differs for text " + tag.characterID);
            Style s = before.get(0);
            int y = s.y;
            for (String line : wrap(translation, s.height, tag.textBounds.getWidth())) {
                result.add(record(line, 0, y, s.height, s.color)); y += 300;
            }
        }
        tag.textRecords = result;
        int min = Integer.MAX_VALUE, max = Integer.MIN_VALUE;
        for (TEXTRECORD r : result) { min = Math.min(min, r.xOffset); max = Math.max(max, r.xOffset + r.getTotalAdvance()); }
        int available = tag.textBounds.getWidth();
        if (max - min > available && available > 0) {
            MATRIX m = tag.textMatrix;
            float factor = available / (float) (max - min);
            m.scaleX = (m.hasScale ? m.scaleX : 1) * factor;
            if (!m.hasScale) m.scaleY = 1;
            m.hasScale = true;
        }
        tag.setModified(true);
        tag.updateTextBounds();
    }

    static void animated(JsonObject entry, StaticTextTag whole, List<Style> before, String translation) throws Exception {
        DefineSpriteTag owner = (DefineSpriteTag) swf.getCharacter(entry.getInt("layout_owner_sprite", -1));
        JsonArray instances = entry.get("animated_glyph_instances").asArray();
        String[] original = entry.getString("[JPN]", "").split(SEP, -1);
        String[] parts = translation.split(SEP, -1);
        require(parts.length == before.size(), "Animated phrase segment mismatch");
        Map<Integer, PlaceObject2Tag> placed = new HashMap<>();
        for (Tag t : owner.getTags()) if (t instanceof PlaceObject2Tag) placed.put(((PlaceObject2Tag)t).depth, (PlaceObject2Tag)t);
        int position = 0;
        for (int start = 0; start < parts.length;) {
            int end = start + 1;
            while (end < parts.length && before.get(end).y == before.get(start).y) end++;
            StringBuilder jp = new StringBuilder(), ko = new StringBuilder();
            for (int j = start; j < end; j++) { jp.append(original[j]); ko.append(parts[j]); }
            int slots = jp.length();
            JsonObject first = instances.get(position).asObject();
            PlaceObject2Tag anchor = placed.get(first.getInt("depth", -1));
            int height = before.get(start).height;
            float scale = anchor.matrix.hasScale ? anchor.matrix.scaleX : 1;
            int originalSpan = 0;
            for (int j = start; j < end; j++) originalSpan += before.get(j).oldWidth;
            int translatedWidth = width(ko.toString(), height);
            float fit = translatedWidth > originalSpan ? originalSpan / (float)translatedWidth : 1;
            int x = anchor.matrix.translateX + Math.round((originalSpan - translatedWidth * fit) * scale / 2);
            int y = anchor.matrix.translateY;
            for (int i = 0; i < slots; i++, position++) {
                JsonObject instance = instances.get(position).asObject();
                PlaceObject2Tag placement = placed.get(instance.getInt("depth", -1));
                require(placement != null && placement.characterId == instance.getInt("symbol_id", -1), "Animated placement differs");
                StaticTextTag old = (StaticTextTag)swf.getCharacter(placement.characterId);
                require(plain(old).equals(jp.substring(i, i + 1)), "Animated source glyph differs");
                String chunk = ko.substring(i * ko.length() / slots, (i + 1) * ko.length() / slots);
                StaticTextTag replacement = (StaticTextTag)old.cloneTag();
                replacement.characterID = nextId++;
                replacement.textRecords = new ArrayList<>();
                Style oldStyle = styles(old).get(0);
                replacement.textRecords.add(record(chunk, 0, oldStyle.y, height, oldStyle.color));
                replacement.setModified(true);
                replacement.updateTextBounds();
                String file = "new-" + replacement.characterID + ".bin";
                Files.write(out.resolve(file), replacement.getData());
                additions.add(new JsonObject().add("code",replacement.getId()).add("id",replacement.characterID).add("before_sprite",owner.spriteId).add("file",file));
                placement.characterId = replacement.characterID;
                placement.matrix.translateX = x;
                placement.matrix.translateY = y;
                placement.matrix.scaleX = scale * fit;
                if (!placement.matrix.hasScale) placement.matrix.scaleY = 1;
                placement.matrix.hasScale = true;
                placement.setModified(true);
                x += Math.round(width(chunk, height) * scale * fit);
            }
            start = end;
        }
        require(position == instances.size(), "Unused animated glyph slots");
        owner.setModified(true);
        emit(owner);
    }

    static void verify(String[] args) throws Exception {
        try (FileInputStream input = new FileInputStream(args[1])) { swf = new SWF(input, false); }
        JsonObject manifest = JsonObject.readFrom(new String(Files.readAllBytes(Paths.get(args[2])), StandardCharsets.UTF_8));
        for (JsonValue value : manifest.get("graphic_checks").asArray()) {
            JsonObject check = value.asObject();
            CharacterTag tag = swf.getCharacter(check.getInt("symbol_id", -1));
            if (check.getString("kind", "").equals("images")) {
                require(tag instanceof DefineBitsLossless2Tag, "Saved image is not lossless");
                require(pixels(((ImageTag)tag).getImageCached().getBufferedImage()).equals(check.getString("pixels_sha256", "")),
                        "Saved image pixels/alpha differ: " + tag.getCharacterId());
            } else {
                require(tag instanceof ShapeTag && digest(tag.getData()).equals(check.getString("payload_sha256", "")),
                        "Saved SVG shape differs: " + check.getInt("symbol_id", -1));
            }
        }
        for (JsonValue v : manifest.get("checks").asArray()) {
            JsonObject check = v.asObject();
            TextTag tag = (TextTag)swf.getCharacter(check.getInt("symbol_id", -1));
            String actual = plain(tag), wanted = check.getString("expected", "");
            if (tag.getCharacterId() == 145 && !wanted.contains(SEP)) {
                actual = actual.replace(SEP, "").replace("\n", "");
                wanted = wanted.replace("\n", "");
            }
            require(actual.equals(wanted), "Saved text mismatch " + check.getString("id", "") + ": " + actual);
            for (int id : tag.getFontIds()) require(((FontTag)swf.getCharacter(id)).getFontNameIntag().equals("Galmuri11 Condensed"), "Text font differs");
        }
        JsonArray entries = JsonArray.readFrom(new String(Files.readAllBytes(Paths.get(args[3])), StandardCharsets.UTF_8));
        for (JsonValue v : entries) {
            JsonObject entry = v.asObject();
            if (entry.get("animated_glyph_instances") == null || entry.getString("[KOR]", "").trim().isEmpty()) continue;
            DefineSpriteTag owner = (DefineSpriteTag)swf.getCharacter(entry.getInt("layout_owner_sprite", -1));
            Map<Integer, PlaceObject2Tag> placed = new HashMap<>();
            for (Tag tag : owner.getTags()) if (tag instanceof PlaceObject2Tag) placed.put(((PlaceObject2Tag)tag).depth, (PlaceObject2Tag)tag);
            StringBuilder text = new StringBuilder();
            for (JsonValue instance : entry.get("animated_glyph_instances").asArray()) {
                PlaceObject2Tag placement = placed.get(instance.asObject().getInt("depth", -1));
                text.append(plain((TextTag)swf.getCharacter(placement.characterId)));
            }
            require(text.toString().equals(entry.getString("[KOR]", "").replace(SEP, "")), "Saved animated phrase mismatch");
        }
        System.out.println("Saved text, fonts, animated phrases and graphics verified.");
    }

    public static void main(String[] args) throws Exception {
        if (args[0].equals("verify")) { verify(args); return; }
        out = Paths.get(args[4]);
        try (FileInputStream input = new FileInputStream(args[0])) { swf = new SWF(input, false); }
        if (args.length > 6) graphics(Paths.get(args[6]));
        JsonArray entries = JsonArray.readFrom(new String(Files.readAllBytes(Paths.get(args[1])), StandardCharsets.UTF_8));
        Font condensed = Font.createFont(Font.TRUETYPE_FONT, new File(args[2]));
        Font fallback = Font.createFont(Font.TRUETYPE_FONT, new File(args[3]));
        require(condensed.getFontName().contains("Condensed"), "Incorrect font face: " + condensed.getFontName());
        int chapter = Integer.parseInt(args[5]);
        int[] fontIds = {0,15,22,17,22,18,18};
        int[] fieldIds = {0,16,23,18,23,19,19};
        font = (DefineFont2Tag)swf.getCharacter(fontIds[chapter]);
        require(font.getCharacterCount() == 0, "Expected original empty dialogue font");
        nextId = Collections.max(swf.getCharacters(false).keySet()) + 1;
        SortedSet<Character> charset = new TreeSet<>();
        for (int c = 32; c < 127; c++) charset.add((char)c);
        for (JsonValue v : entries) {
            JsonObject entry = v.asObject();
            for (String key : Arrays.asList("[JPN]", "[KOR]")) {
                for (char c : entry.getString(key, "").replace(SEP, "").toCharArray()) if (!Character.isISOControl(c)) charset.add(c);
            }
        }
        font.fontName = "Galmuri11 Condensed";
        font.setHasLayout(true); font.fontAscent = 1024; font.fontDescent = 171; font.fontLeading = 0;
        for (char c : charset) {
            Font face = condensed.canDisplay(c) ? condensed : fallback;
            require(face.canDisplay(c), "Unsupported glyph U+" + Integer.toHexString(c));
            font.addCharacter(c, face);
        }
        // These SWFs use U+000B as an authored spacing glyph. Keep its original
        // outline/metrics instead of asking an operating-system font for a control character.
        for (CharacterTag candidate : swf.getCharacters(false).values()) {
            if (!(candidate instanceof DefineFont2Tag) || candidate == font) continue;
            DefineFont2Tag source = (DefineFont2Tag)candidate;
            int index = source.charToGlyph('\u000b');
            if (index < 0) continue;
            font.codeTable.add((int)'\u000b');
            font.glyphShapeTable.add(source.glyphShapeTable.get(index));
            font.fontAdvanceTable.add((int)Math.round(source.getGlyphAdvance(index)));
            font.fontBoundsTable.add(new RECT(source.getGlyphBounds(index)));
            break;
        }
        emit(font);
        DefineEditTextTag dialogue = (DefineEditTextTag)swf.getCharacter(fieldIds[chapter]);
        dialogue.useOutlines = true; dialogue.setModified(true); emit(dialogue);
        for (JsonValue v : entries) {
            JsonObject entry = v.asObject();
            String kind = entry.getString("kind", "");
            if (kind.equals("script_dialogue")) continue;
            TextTag tag = (TextTag)swf.getCharacter(entry.getInt("symbol_id", -1));
            String jp = entry.getString("[JPN]", ""), ko = entry.getString("[KOR]", "");
            require(plain(tag).equals(jp), "Source text differs: " + entry.getString("id", ""));
            if (kind.equals("animated_glyph_definition")) continue;
            if (ko.trim().isEmpty() || ko.equals(jp)) continue;
            if (tag instanceof DefineEditTextTag) {
                DefineEditTextTag t = (DefineEditTextTag)tag;
                t.initialText = ko.replace('\n', '\r');
                t.hasText = true; t.hasFont = true; t.fontId = font.fontID; t.useOutlines = true;
                t.setModified(true);
            } else {
                StaticTextTag t = (StaticTextTag)tag;
                List<Style> before = styles(t);
                if (entry.get("animated_glyph_instances") != null) animated(entry, t, before, ko);
                staticText(t, ko);
            }
            emit(tag);
            checks.add(new JsonObject().add("id",entry.getString("id", "")).add("symbol_id",entry.getInt("symbol_id", -1)).add("expected", ko));
        }
        Files.write(out.resolve("changes.json"), new JsonObject().add("replacements",changes).add("additions",additions)
                .add("checks",checks).add("graphic_checks",graphicChecks).toString().getBytes(StandardCharsets.UTF_8));
        System.out.println("Font: " + condensed.getFontName() + "; glyphs: " + font.getCharacterCount() + "; text tags: " + checks.size());
    }
}

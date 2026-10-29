# XSMY 한글패치

일본어판 **Xenosaga Episode II to III: A Missing Year**의 텍스트 한글패치 작업 공간이다.

| 경로 | 내용 |
| --- | --- |
| `original_asset/` | 수정하지 않는 일본어 원본 SWF 6개 |
| [WorkSpace](WorkSpace/README.md) | 검수할 번역 JSON과 번역 지침 |
| [codex-lab](codex-lab/README.md) | 추출 자료, 구조 분석, 조사 기록, 검증·빌드 도구 |
| `.agents/skills/` | 프로젝트 번역·한국어 편집 스킬 |
| `tools/` | 장별 SWF 리빌드 코드 |

번역은 `[JPN]`과 `[KOR]`을 함께 보존하고 내용이 있는 `[KOR]`만 적용한다. 1~6장의 텍스트 번역을 SWF로 리빌드할 수 있다. 전체 재생 검수는 남아 있다. 음성 전용 장면은 [오디오 목록](codex-lab/analysis/audio-only-scenes.md)만 정리했다.

## 리빌드

[rebuild.bat](rebuild.bat)을 더블클릭하고 **1~6** 중 챕터 번호를 입력한다. **0**은 전체 빌드이며 **q**는 종료다. 결과는 `codex-lab/build/chapter01-ko.swf`~`chapter06-ko.swf`와 장별 검증 JSON·로그로 저장된다. 기존 원본과 번역 JSON은 수정하지 않는다.

현재 PC에 설치된 Python 3.12 이상, JDK의 `java`·`javac`, Galmuri11 Condensed와 Galmuri11, `codex-lab/tools/ffdec_26.4.0`의 FFDec를 사용한다. 폰트 파일은 자동으로 찾아 직접 내장한다. 다른 PC에서는 이 실행 환경을 먼저 준비해야 한다.

명령줄에서는 `rebuild.bat 3` 또는 `rebuild.bat all`로 실행할 수 있다. 원본과 번역 데이터에서 매번 새로 빌드하고, 번역 문자열·폰트·비대상 태그와 추가 바이너리의 보존을 확인한 뒤 결과를 갱신한다. 실패하면 오류와 로그 경로를 표시하며 이전 성공 파일은 유지한다. 실행 화면의 줄바꿈·스크롤·NEXT·음성 동기화 검수는 별도로 필요하다.

분석 자료는 `codex-lab`에 한 벌만 유지한다. 테스트 실행본·비교 이미지·변환 캐시 등 중간 산출물은 보관하지 않는다. 커밋·푸시는 사용자가 담당한다.

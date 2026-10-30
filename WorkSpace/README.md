# 한글패치 작업 공간

[translations](translations/README.md)에 1~6장 번역 JSON, 첫 독백 입력, 번역 지침과 인물 말투 기준을 둔다. 검수할 때는 `[KOR]`을 편집하고 원문·ID·출처를 보존한다.

`codex-lab/extracted`의 1~6장 전체 구조를 `chapter01`~`chapter06`에 복사했다. 원본 대조용 추출본은 `codex-lab`에 보존한다. 현재 한국어 번역은 기존 JSON을 계속 사용하며, 이전 번역 JSON과 지침 10개 파일은 [백업 ZIP](backups/translations-20261030-before-asset-workspace.zip)에 원래 바이트 그대로 보관했다.

| 편집 위치 | 리빌드 적용 |
| --- | --- |
| `translations/chapterNN.json`의 `[KOR]` | 기존 대사·정적/동적 텍스트·6장 글자 연출 |
| `chapterNN/assets/images/심벌번호.png` | 변경한 PNG를 같은 번호의 이미지 심벌에 무손실로 반영. 원래 가로·세로 크기와 파일명을 유지 |
| `chapterNN/assets/shapes/심벌번호.svg` | 변경한 SVG를 같은 번호의 벡터 심벌에 반영. SVG에 포함된 비트맵도 함께 내장 |
| 그 밖의 추출 텍스트·스크립트·폰트·소리·영상·XML·CSV | 구조와 원문을 확인하는 참고 자료. 직접 편집해도 이번 리빌더의 입력으로 적용하지 않음 |

`chapterNN`은 `chapter01`~`chapter06`을 뜻한다. 텍스트 추출본에는 글리프 간격·서식·제어 구문이 섞여 있으므로 텍스트 편집은 JSON으로 유지한다. JSON 번역을 추출 텍스트·스크립트에도 중복 입력할 필요가 없다.

## 폰트

사용자가 견본 번호로 지정한 한글 폰트를 원래 텍스트 레코드의 폰트에 따라 적용한다.

| 견본 / 원본 폰트 | 적용할 한글 폰트 |
| --- | --- |
| A1 / A-OTF 新ゴ Pro B | a견고딕 |
| B1 / ヒラギノ角ゴ Pro W6 | a견고딕 |
| B2 / A-OTF ゴシックMB101 Pro B | a견고딕 |
| A3 / Osaka | a고딕14 |
| B3 / ヒラギノ角ゴ Pro W3 | a고딕14 |
| A2 / A-OTF 新ゴ Pro M | 별도 지정이 없어 기존 Galmuri11 Condensed 유지 |
| D1 / `_ゴシック`의 공통 대사창·동적 설명 | 기존 Galmuri11 Condensed 유지 |
| 영문 전용 항목과 독립 영문 구간 | 원래 영문 폰트·글리프·자간 유지 |

TTF 파일 전체를 SWF에 넣지 않고, 해당 텍스트에서 쓰는 문자 코드·글리프 윤곽·폭 정보를 내장한다. 원래 폰트 정의는 보존하고 한글용 폰트 심벌을 별도로 추가하므로, 같은 원본 폰트를 쓰는 영문 구간에도 영향을 주지 않는다. 선택한 폰트에 없는 제어 글리프·구두점은 대응하는 원본 폰트의 윤곽으로 보완한다. 원본 폰트에 폭 정보가 없으면 실제 원본 텍스트 레코드에 기록된 글자 간격을 사용한다. 보완 목록과 입력 폰트 해시는 장별 검증 JSON에 기록한다.

프로젝트 루트의 `rebuild.bat`에서 장 번호를 선택한다. 명령줄은 `rebuild.bat 1` 또는 `rebuild.bat all`이다. 결과와 로그는 `codex-lab/build`에 생성된다. 원본 SWF나 편집 입력을 덮어쓰지 않는다. 실패하면 해당 장의 이전 성공 SWF가 유지된다.

각 장의 `graphics-baseline.json`은 작업본 생성 시의 그래픽 파일 해시와 원본 SWF 해시다. 빌더는 이 기준과 비교해 바뀐 PNG·SVG만 교체하고, 나머지 원본 페이로드는 보존한다. 이 파일은 편집하지 않는다. 그래픽 파일을 삭제하거나 심벌 번호를 바꾸면 오류로 처리한다. 편집을 취소하려면 해당 파일을 `codex-lab/extracted`의 원본 추출본에서 복사해 복구한다.

이미지 심벌이 여러 장면에서 재사용되면 교체 결과도 함께 적용된다. PNG는 투명도를 유지하며 JPEG로 재압축하지 않는다. SVG의 글자는 윤곽선으로 변환한 뒤 저장하고, 필터·마스크·효과 등은 실제 SWF 화면에서 확인한다. 자동 검증 통과는 전체 재생 검수를 뜻하지 않는다.

[구조 분석](../codex-lab/analysis/README.md), [추출 안내](../codex-lab/analysis/extraction.md), [DB 참고 방식](../codex-lab/analysis/translation-notes/database-reference.md), [음성 전용 장면 오디오 목록](../codex-lab/analysis/audio-only-scenes.md)은 `codex-lab`에서 관리한다. 추출기의 재실행은 편집 중인 WorkSpace를 갱신하는 명령이 아니다.

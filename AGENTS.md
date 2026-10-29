# XSMY 작업 기준

- 일본어 원본 `original_asset`은 보존한다. 분석·추출·변환·검증 자료는 `codex-lab`에 모으고 번역 데이터와 번역 지침은 `WorkSpace`에 둔다. 테스트·중간 산출물은 검증 후 정리한다.
- 현재 저장소·브랜치를 확인하고 기본적으로 현재 브랜치를 사용한다. 커밋·푸시는 사용자가 담당한다. 작업 범위를 넘는 이식·전체 번역·배포를 자동 시작하지 않는다.
- 번역·윤문·번역 검수 전에는 `WorkSpace/translations/korean-guidelines.md`와 현재 데이터 안내를 읽는다. `.agents/skills/xsmy-korean-translation/SKILL.md`가 해당 작업을 안내한다. 한국어 윤문 스킬의 일반 처방보다 사용자 확정 지침과 해당 장면 원문을 우선한다.
- 용어는 `codex-lab/analysis/translation-notes/database-reference.md`에 따라 지정 DB를 수동 조회한다. 다른 저장소를 자동 빌드 입력으로 추가하거나 원본 DB를 수정하지 않는다.
- `[JPN]`·ID·비대상 데이터와 기존 번역을 보존한다. 기존 대사는 내용이 있는 `[KOR]`만 적용한다. 음성 전용 장면의 새 자막은 내용이 있는 `[KOR]`이 있어야 추가한다.
- SWF 구조·자막·이식 작업은 `codex-lab/analysis/README.md`, `subtitles.md`, `porting.md`의 로컬 프레임·재사용·미검증 범위를 참고한다. 실제 재생 검수와 정적 검사를 구분해 보고한다.
- 변경은 요청 범위에 한정하고 주변 코드·자료를 불필요하게 정리하지 않는다. 삭제가 필요하면 명시적인 단일 경로만 다루고 대량·재귀 삭제를 하지 않는다.

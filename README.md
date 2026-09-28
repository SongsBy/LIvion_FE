# livion

리비온(Livion) 라이브 커머스 Flutter 앱. 현재는 프론트엔드 데모 발표용으로,
홈 화면(Figma `리비온 와이어 프레임` node 26:1043)과 라이브 방송 화면(node 26:238)을
데모 데이터로 그린다.

## 실행

```bash
flutter pub get

# 모델(freezed)·provider(riverpod_generator) 생성 파일을 만든다. 처음 받았을 때와
# lib/features/**/domain/entities, presentation/providers 를 바꿨을 때 실행한다.
dart run build_runner build --delete-conflicting-outputs

flutter run
```

검증:

```bash
dart format --output=none --set-exit-if-changed lib test
flutter analyze
flutter test
```

## 구조

- `lib/app/root_tab/` — 상단 바 + 하단 내비를 한 곳에서 관리하는 루트 탭 셸.
  탭마다 `RootTabChrome`으로 표시 정책을 두고, 라이브 탭은 영상 전체 화면이라
  상단 바·하단 내비를 모두 끈다(뒤로가기로 홈 탭 복귀). 새 스크린은 `root_tabs.dart`의
  builder만 바꿔 끼운다. 홈의 라이브 카드를 누르면 `LiveDetailSelection`에 id를 넣고
  라이브 탭으로 옮긴다.
- `lib/design_system/` — Figma 토큰(`AppColors`, `AppTextStyles`, `AppSpacing` …)과 공통 위젯.
  화면에서 색·글자 스타일을 직접 만들면 `design_token_guard_test`가 실패한다.
- `lib/features/home/` — 홈 feature. `domain`(entity·repository 계약) → `data`(데모 구현)
  → `presentation`(Riverpod provider·화면·위젯).
  API가 준비되면 `presentation/providers/home_dependencies.dart`에서 `DemoHomeRepository`를
  remote 구현으로 바꾸면 된다. 화면은 `HomeRepository` interface만 안다.
- `lib/features/live_detail/` — 라이브 방송 화면 feature. 하단 내비 LIVE 탭의 본문이자
  홈의 공식 방송·인기 급상승·마감 D-7·전체 라이브 카드에서 도착하는 화면이다.
  `LiveDetailRepository` 계약 + `DemoLiveDetailRepository`(데모)로 구성되며, 방송 화면은
  지금 사진 에셋이고 영상이 붙으면 `LiveBroadcastBackdrop`의 이미지 자리만 플레이어로 바꾼다.
  "채팅 · 입찰현황" 알약을 누르면 `LiveDetailBody`가 `sliding_up_panel`로
  `LiveActivityPanel`(Figma 라이브 디테일_채팅 26:366 · 입찰현황 26:551)을 올린다.
  패널 안은 탭 또는 옆으로 넘기기로 채팅(스크롤·전송)과 입찰현황(현재가·참여인원·
  추이 차트 `LiveBidTrendChart`·순위)을 오간다. 채팅 전송은 데모라 목록에만 붙고,
  입찰·공유·경매 상세·자동입찰 변경은 Figma 화면이 붙기 전이라 "준비 중" 안내만 보인다.
- `lib/shared/` — 여러 feature가 공유하는 순수 계약(`InspectionGrade`)과 그 UI 매핑.
- `asset/images/demo/` — 데모 발표용 이미지. 서버 이미지가 붙으면 제거한다.

자세한 개발 지침은 `AGENTS.md`를 따른다.

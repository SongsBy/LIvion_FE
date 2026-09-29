import 'dart:ui' show Size;

/// 선 두께 토큰.
abstract final class AppBorderWidth {
  /// 1 — 기본 테두리
  static const double thin = 1;

  /// 1.5 — 선택된 큰 선택 카드 테두리 (판매자 유형, 방송 방식)
  static const double medium = 1.5;

  /// 2 — 강조 테두리, 선택 탭 밑줄, 아바타 링
  static const double thick = 2;
}

/// 아이콘 크기 토큰.
abstract final class AppIconSize {
  /// 12 — 뱃지 안 눈 아이콘
  static const double xs = 12;

  /// 14 — 타이머 뱃지 시계
  static const double sm = 14;

  /// 15 — 입찰현황 통계(참여인원·총 입찰) 아이콘, 입력창 안 "확인완료" 체크
  static const double stat = 15;

  /// 16 — 등급 뱃지
  static const double md = 16;

  /// 18 — 체크박스 안 흰 체크
  static const double checkMark = 18;

  /// 20 — 체크, 체크박스, 하단 내비 아이콘
  static const double lg = 20;

  /// 24 — 기본 아이콘
  static const double xl = 24;

  /// 30 — 카드 우상단 북마크
  static const double bookmark = 30;

  /// 36 — 안내 카드 왼쪽 원형 아이콘 (판매자 전환 혜택)
  static const double feature = 36;

  /// 3 — 안내 목록 글머리 점
  static const double bullet = 3;

  /// 40 — 공식 방송 히어로 북마크
  static const double bookmarkLg = 40;

  /// 35 — 하단 내비 LIVE
  static const double navLive = 35;

  /// 44 — 터치 영역
  static const double touch = 44;

  /// 48 — 신뢰 안내 일러스트
  static const double illustration = 48;

  /// 64 — 신뢰 안내 일러스트 원형 배경, 결제 완료 일러스트
  static const double illustrationBackdrop = 64;

  /// 54 — 카테고리 아이콘 원
  static const double category = 54;

  /// 90 — 빈 프로필 사진 자리 안 실루엣
  static const double photoPlaceholder = 90;

  /// 80 — 은행 등 로고 타일
  static const double logo = 80;

  /// 48 — 완료 화면 위 오렌지 체크 원
  static const double resultBadge = 48;

  /// 27.43 — 완료 체크 원 안의 흰 체크 (Figma 원시값)
  static const double resultCheck = 27.4286;

  /// 30 — 사진 칸 오른쪽 위 삭제 버튼 (재고 등록 사진)
  static const double photoRemove = 30;

  /// 40 — 빈 사진 칸 가운데 카메라
  static const double photoAdd = 40;

  /// 13×13 — 네이버 로그인 버튼의 N
  static const double naverLogo = 13;

  /// 79×13 — 네이버 로그인 버튼의 "네이버 로그인" 글자
  static const Size naverLoginText = Size(79, 13);

  /// 358×46 — 카카오 로그인 버튼 그림 원본 크기
  static const Size kakaoLogin = Size(358, 46);

  /// 40 — 예상 검수 등급 큰 뱃지
  static const double gradeLg = 40;

  /// 9.75×7.5 — 글자 앞 오렌지 체크 자리 (그림은 선 두께만큼 넘친다, Figma 원시값)
  static const Size checkGlyph = Size(9.75, 7.5);

  /// 11.75×9.5 — [checkGlyph] 그림 원본 크기
  static const Size checkGlyphArt = Size(11.75, 9.5);

  /// 8.07×8 — 글자 앞 회색 × 자리 (Figma 원시값)
  static const Size crossGlyph = Size(8.071, 8);

  /// 10.07×10 — [crossGlyph] 그림 원본 크기
  static const Size crossGlyphArt = Size(10.0705, 10);

  /// 16.4×15 — 툴팁 아래 꼬리 (Figma 원시값)
  static const Size tooltipPointer = Size(16.4013, 15);
}

/// 아바타 지름 토큰.
abstract final class AppAvatarSize {
  static const double xs = 24;
  static const double sm = 32;
  static const double md = 48;
  static const double lg = 54;

  /// 62 — LIVE 링이 있는 아바타 바깥 지름
  static const double ring = 62;

  /// 40 — 라이브 화면 상단 판매자 링 아바타 바깥 지름 (안쪽 34)
  static const double ringSm = 40;

  /// 40 — 게시글 작성자 아바타 (흰 테두리 2)
  static const double post = 40;

  /// 70 — 판매자 페이지 프로필 사진
  static const double profile = 70;

  /// 80 — 판매자 페이지 프로필 오렌지 링 바깥 지름 (안쪽 여백 4)
  static const double profileRing = 80;
}

/// 컴포넌트 높이 토큰.
abstract final class AppControlHeight {
  /// 16 — 작은 뱃지 (판매자, D-12)
  static const double badgeSm = 16;

  /// 14 — 아주 작은 태그 ("냉동", "120개")
  static const double badgeXs = 14;

  /// 18 — 아바타 아래 LIVE 뱃지, 외곽선 뱃지 ("자동결제")
  static const double badgeLive = 18;

  /// 20 — 기본 뱃지
  static const double badge = 20;

  /// 24 — 섹션 제목 옆 작은 외곽선 버튼 ("수정")
  static const double buttonXs = 24;

  /// 32 — 탭
  static const double tab = 32;

  /// 36 — 어두운 알약 안내 버튼 (경매 상세 보기)
  static const double pillSm = 36;

  /// 36 — 알약 버튼
  static const double buttonSm = 36;

  /// 40 — 입력창, 더보기 버튼
  static const double input = 40;
  static const double buttonMd = 40;

  /// 44 — 검색창
  static const double search = 44;

  /// 44 — 폼 입력창·선택 필드 (판매자 전환)
  static const double inputLg = 44;

  /// 46 — 카카오·네이버 로그인 버튼
  static const double socialLogin = 46;

  /// 50 — 로그인·가입 화면 CTA ("로그인", "가입하기")
  static const double buttonCtaMd = 50;

  /// 52 — CTA 버튼, 아이콘 버튼
  static const double buttonLg = 52;

  /// 56 — 상단 바
  static const double topBar = 56;

  /// 72 — 하단 내비
  static const double bottomNav = 72;

  /// 120 — 프로필 사진 자리
  static const double photo = 120;

  /// 4 — 아래 시트 손잡이 두께
  static const double sheetHandle = 4;

  /// 2×30 — 댓글 시트 손잡이 (얇은 막대)
  static const double sheetHandleThin = 2;
  static const double sheetHandleWidth = 30;

  /// 240 — 판매자 페이지 커버 사진
  static const double channelCover = 240;
}

/// 불투명도 토큰.
abstract final class AppOpacity {
  /// 0.4 — 비활성 글자·버튼
  static const double disabled = 0.4;

  /// 0.5 — 보조 글자 (1/4의 /4), 저작권 문구
  static const double muted = 0.5;

  /// 0.6 — 푸터 사업자 정보
  static const double secondary = 0.6;

  /// 0.7 — 지난 상태 행
  static const double dimmed = 0.7;

  /// 0.65 — "전체보기 ⌄" 펼치기 버튼
  static const double expandToggle = 0.65;
}

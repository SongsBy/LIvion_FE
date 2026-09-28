/// 선 두께 토큰.
abstract final class AppBorderWidth {
  /// 1 — 기본 테두리
  static const double thin = 1;

  /// 2 — 강조 테두리, 선택 탭 밑줄, 아바타 링
  static const double thick = 2;
}

/// 아이콘 크기 토큰.
abstract final class AppIconSize {
  /// 12 — 뱃지 안 눈 아이콘
  static const double xs = 12;

  /// 14 — 타이머 뱃지 시계
  static const double sm = 14;

  /// 15 — 입찰현황 통계(참여인원·총 입찰) 아이콘
  static const double stat = 15;

  /// 16 — 등급 뱃지
  static const double md = 16;

  /// 20 — 체크, 하단 내비 아이콘
  static const double lg = 20;

  /// 24 — 기본 아이콘
  static const double xl = 24;

  /// 30 — 카드 우상단 북마크
  static const double bookmark = 30;

  /// 40 — 공식 방송 히어로 북마크
  static const double bookmarkLg = 40;

  /// 35 — 하단 내비 LIVE
  static const double navLive = 35;

  /// 44 — 터치 영역
  static const double touch = 44;

  /// 48 — 신뢰 안내 일러스트
  static const double illustration = 48;

  /// 64 — 신뢰 안내 일러스트 원형 배경
  static const double illustrationBackdrop = 64;
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
}

/// 컴포넌트 높이 토큰.
abstract final class AppControlHeight {
  /// 16 — 작은 뱃지 (판매자, D-12)
  static const double badgeSm = 16;

  /// 18 — 아바타 아래 LIVE 뱃지
  static const double badgeLive = 18;

  /// 20 — 기본 뱃지
  static const double badge = 20;

  /// 32 — 탭
  static const double tab = 32;

  /// 36 — 어두운 알약 안내 버튼 (경매 상세 보기)
  static const double pillSm = 36;

  /// 36 — 알약 버튼
  static const double buttonSm = 36;

  /// 40 — 입력창, 더보기 버튼
  static const double input = 40;
  static const double buttonMd = 40;

  /// 52 — CTA 버튼, 아이콘 버튼
  static const double buttonLg = 52;

  /// 56 — 상단 바
  static const double topBar = 56;

  /// 72 — 하단 내비
  static const double bottomNav = 72;
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
}

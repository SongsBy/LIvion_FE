/// SVG 아이콘 에셋 경로. Figma 컴포넌트 시트(node 26:1904)의 icon 세트.
///
/// 단색 아이콘은 `AppSvgIcon`의 color로 칠하고, 색이 있는 아이콘
/// (LIVE, 북마크, 로고)은 원본 색을 유지한다.
abstract final class AppIcons {
  static const String _dir = 'asset/icons';

  // ── 24 기본 아이콘 (단색) ───────────────────────────────────────
  static const String bell = '$_dir/bell.svg';
  static const String search = '$_dir/search.svg';
  static const String arrowLeft = '$_dir/arrow_left.svg';
  static const String arrowNarrowLeft = '$_dir/arrow_narrow_left.svg';
  static const String chevronLeft = '$_dir/chevron_left.svg';
  static const String chevronDown = '$_dir/chevron_down.svg';
  static const String chevronUp = '$_dir/chevron_up.svg';
  static const String share = '$_dir/share.svg';
  static const String dotsVertical = '$_dir/dots_vertical.svg';
  static const String dotsHorizontal = '$_dir/dots_horizontal.svg';
  static const String eye = '$_dir/eye.svg';
  static const String checkCircle = '$_dir/check_circle.svg';

  // ── 작은 아이콘 ────────────────────────────────────────────────
  /// 12 — 시청자 수 뱃지
  static const String eyeSmall = '$_dir/eye_small.svg';

  /// 14 — 타이머 뱃지
  static const String clock = '$_dir/clock.svg';

  /// 15 — 입찰현황 참여인원
  static const String userGroup = '$_dir/user_group.svg';

  /// 15 — 입찰현황 총 입찰
  static const String currencyDollar = '$_dir/currency_dollar.svg';

  /// 20 — 에스크로 체크 (오렌지, 원본 색 유지)
  static const String check = '$_dir/check.svg';

  /// 11×12 — 답글 꺾쇠
  static const String replyCorner = '$_dir/reply_corner.svg';

  // ── 하단 내비 (단색, 20 기준) ──────────────────────────────────
  static const String navHome = '$_dir/nav_home.svg';
  static const String navGrid = '$_dir/nav_grid.svg';
  static const String navCalendar = '$_dir/nav_calendar.svg';
  static const String navUser = '$_dir/nav_user.svg';

  /// 35 — 하단 내비 LIVE (원본 색 유지)
  static const String navLive = '$_dir/nav_live.svg';

  // ── 그림 (원본 색 유지) ────────────────────────────────────────
  /// 61.65×16.19 — 상단 로고
  static const String logoLivion = '$_dir/logo_livion.svg';

  /// 빈 아바타 실루엣 (흰색). Figma 원본은 48 아바타 안의 52×52, 여기선 26 뷰박스
  static const String userSilhouette = '$_dir/user_silhouette.svg';

  /// 30 — 라이브 카드 북마크
  static const String bookmark = '$_dir/bookmark_group.svg';
}

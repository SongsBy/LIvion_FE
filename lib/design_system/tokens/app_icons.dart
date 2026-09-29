/// SVG 아이콘 에셋 경로. Figma 컴포넌트 시트(node 26:1904)의 icon 세트.
///
/// 단색 아이콘은 `AppSvgIcon`의 color로 칠하고, 색이 있는 아이콘
/// (LIVE, 북마크, 로고)은 원본 색을 유지한다.
abstract final class AppIcons {
  static const String _dir = 'asset/icons';

  // ── 24 기본 아이콘 (단색) ───────────────────────────────────────
  static const String bell = '$_dir/bell.svg';
  static const String search = '$_dir/search.svg';

  /// 24 — 검색창 안 돋보기 (lucide/search). 상단 바의 [search]와 모양이 다르다.
  static const String searchLucide = '$_dir/search_lucide.svg';
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

  /// 24 — 오른쪽 화살표 (약관 행, 은행 선택)
  static const String chevronRight = '$_dir/chevron_right.svg';

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

  /// 12 — "에스크로 예치 완료" 뱃지 체크 (단색)
  static const String checkSmall = '$_dir/check_small.svg';

  /// 16 — 거래 단계 사이 화살표 "수취 확인 › 판매자 지급" (원본 색 유지)
  static const String chevronRightSmall = '$_dir/chevron_right_small.svg';

  /// 7×12 — 선택 필드 화살표. 오른쪽을 향하므로 90° 돌려 아래로 쓴다 (원본 색 유지)
  static const String chevronRightFilled = '$_dir/chevron_right_filled.svg';

  /// 15 — 입력창 안 "확인완료" 체크 원 (오렌지, 원본 색 유지)
  static const String checkCircleSmall = '$_dir/check_circle_small.svg';

  /// 20 — 오렌지 원 안 흰 체크, 지난 단계 표시 (원본 색 유지)
  static const String checkCircleFilled = '$_dir/check_circle_filled.svg';

  /// 27.43 — 완료 체크 원 안의 굵은 흰 체크 (원본 색 유지)
  static const String checkBold = '$_dir/check_bold.svg';

  /// 60.67×24 — 진행 단계 사이 점선 (가로로 늘려 쓴다, 원본 색 유지)
  static const String dashedConnector = '$_dir/dashed_connector.svg';

  /// 16 — 선택된 라디오 (오렌지 링, 원본 색 유지)
  static const String radioOn = '$_dir/radio_on.svg';

  /// 16 — 빈 라디오 (옅은 회색 원, 원본 색 유지)
  static const String radioOff = '$_dir/radio_off.svg';

  /// 18 — 체크박스 안 흰 체크 (원본 색 유지)
  static const String checkboxCheck = '$_dir/checkbox_check.svg';

  /// 11.75×9.5 — 글자 앞 오렌지 체크 (선택된 기준, 제공한 사진, 원본 색 유지)
  static const String checkMark = '$_dir/check_mark.svg';

  /// 10.07×10 — 글자 앞 회색 × (빠진 사진, 원본 색 유지)
  static const String crossSmall = '$_dir/cross_small.svg';

  /// 20 — 안내 원 안의 i (흰색)
  static const String info = '$_dir/info.svg';

  /// 30 — 사진 칸 삭제 버튼 (어두운 모서리 칸 + 흰 ×, 원본 색 유지)
  static const String photoRemove = '$_dir/photo_remove.svg';

  /// 40 — 빈 사진 칸 카메라 (흰색, 원본 색 유지)
  static const String camera = '$_dir/camera.svg';

  /// 16.4×15 — 어두운 툴팁 꼬리 (위를 향한 둥근 삼각형, 원본 색 유지)
  static const String tooltipPointer = '$_dir/tooltip_pointer.svg';

  /// 24 — 좋아요 빈 하트 (원본 색 유지)
  static const String heartOutline = '$_dir/heart_outline.svg';

  /// 24 — 좋아요 누른 하트 (오렌지 채움, 원본 색 유지)
  static const String heartFilled = '$_dir/heart_filled.svg';

  /// 20 — 오렌지 버튼 안 흰 빈 하트 (팔로우)
  static const String heartOutlineSmall = '$_dir/heart_outline_small.svg';

  /// 24 — 댓글 말풍선
  static const String chatOutline = '$_dir/chat_outline.svg';

  /// 36 — 옅은 테두리 칸 안 말풍선 (판매자 문의, 원본 색 유지)
  static const String messageBox = '$_dir/message_box.svg';

  /// 16 — 회색 원 안 체크, 약관 "전체 동의" (원본 색 유지)
  static const String checkCircleMuted = '$_dir/check_circle_muted.svg';

  /// 20 — 약관 행 "보기 ›" 화살표 (검정 40%, 원본 색 유지)
  static const String chevronRightMuted = '$_dir/chevron_right_muted.svg';

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

  /// 90 — 빈 프로필 사진 자리의 사람 실루엣 (검정 20%, 원본 색 유지)
  static const String userPlaceholder = '$_dir/user_placeholder.svg';

  /// 52×40 — 결제 일러스트 카드 몸체
  static const String paymentCard = '$_dir/payment_card.svg';

  /// 18.28×10.98 — 결제 일러스트 카드 브랜드 원 2개
  static const String paymentCardBrand = '$_dir/payment_card_brand.svg';

  /// 358×46 — 카카오 로그인 버튼 (노란 바탕 · 말풍선 · "카카오 로그인" 포함)
  static const String kakaoLogin = '$_dir/kakao_login.svg';

  /// 13 — 네이버 로그인 버튼의 흰 N
  static const String naverLogo = '$_dir/naver_logo.svg';

  /// 79×13 — 네이버 로그인 버튼의 흰 "네이버 로그인" 글자
  static const String naverLoginText = '$_dir/naver_login_text.svg';

  /// 30 — 라이브 카드 북마크
  static const String bookmark = '$_dir/bookmark_group.svg';

  // ── 판매자 전환 안내 (원본 색 유지) ────────────────────────────
  /// 36 — 옅은 오렌지 원 안의 카드 (수수료)
  static const String featureCard = '$_dir/benefit_card.svg';

  /// 36 — 옅은 오렌지 원 안의 방패 체크 (검수 등급)
  static const String featureShield = '$_dir/benefit_shield.svg';

  /// 36 — 옅은 오렌지 원 안의 자물쇠 (에스크로)
  static const String featureLock = '$_dir/benefit_lock.svg';

  /// 3 — 회색 글머리 점
  static const String bulletDot = '$_dir/bullet_dot.svg';

  /// 221×140 — "평균 시작가 대비" 일러스트 (Figma 37:3627)
  static const String illustrationSellerMultiplier =
      '$_dir/seller_intro_multiplier.svg';

  /// 170×140 — "낙찰 · 낙찰률" 일러스트 (Figma 37:3859)
  static const String illustrationSellerWinRate =
      '$_dir/seller_intro_win_rate.svg';
}

/// 은행 로고 타일(80, 흰 바탕 · 테두리 · radius 20 포함). Figma 판매자 전환_05 (37:3324).
///
/// 원본 색을 유지한다. 은행 코드와의 연결은 쓰는 feature가 정한다.
abstract final class AppBankLogos {
  static const String _dir = 'asset/images/banks';

  static const String kakao = '$_dir/bank_kakao.svg';
  static const String toss = '$_dir/bank_toss.svg';
  static const String kbank = '$_dir/bank_kbank.svg';
  static const String kb = '$_dir/bank_kb.svg';
  static const String shinhan = '$_dir/bank_shinhan.svg';
  static const String woori = '$_dir/bank_woori.svg';
  static const String sc = '$_dir/bank_sc.svg';
  static const String hana = '$_dir/bank_hana.svg';
  static const String citi = '$_dir/bank_citi.svg';
  static const String ibk = '$_dir/bank_ibk.svg';
  static const String nh = '$_dir/bank_nh.svg';
  static const String post = '$_dir/bank_post.svg';
  static const String mg = '$_dir/bank_mg.svg';
  static const String busan = '$_dir/bank_busan.svg';
  static const String suhyup = '$_dir/bank_suhyup.svg';
  static const String kdb = '$_dir/bank_kdb.svg';
  static const String shinhyup = '$_dir/bank_shinhyup.svg';
  static const String gwangju = '$_dir/bank_gwangju.svg';
  static const String sbi = '$_dir/bank_sbi.svg';
  static const String im = '$_dir/bank_im.svg';
}

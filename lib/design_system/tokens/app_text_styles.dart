import 'package:flutter/painting.dart';

import 'app_colors.dart';
import 'app_fonts.dart';

/// 글자 스타일 토큰.
///
/// 앞부분은 Figma Text Sheet(node 26:1775)의 타이포그래피 체계이고,
/// `sheet*` 는 디자인 갤러리 문서 화면 자체에만 쓰는 스타일이다.
/// `height`는 Figma line-height ÷ font-size 로 계산한다. Text Sheet는 line-height 1.
abstract final class AppTextStyles {
  static const TextStyle _pretendard = TextStyle(
    fontFamily: AppFonts.pretendard,
    color: AppColors.textPrimary,
    height: 1,
    leadingDistribution: TextLeadingDistribution.even,
  );

  /// Archivo에는 한글 글리프가 없으므로 한글은 Pretendard로 대체한다.
  static const TextStyle _archivo = TextStyle(
    fontFamily: AppFonts.archivo,
    fontFamilyFallback: [AppFonts.pretendard],
    color: AppColors.textPrimary,
    height: 1,
    leadingDistribution: TextLeadingDistribution.even,
  );

  // ── Pretendard ─────────────────────────────────────────────────
  /// H1 · Pretendard Bold 18 — 현재 입찰가, 상품명 대제목, 결제 금액
  static final TextStyle pretendardH1 = _pretendard.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );

  /// H1 · Pretendard Bold 18, 자간 -0.45 — 입찰현황 현재 입찰가
  static final TextStyle pretendardH1Tight = pretendardH1.copyWith(
    letterSpacing: -0.45,
  );

  /// H2 · Pretendard Bold 16 — 활성 탭, 결제 금액 라벨
  static final TextStyle pretendardH2 = _pretendard.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );

  /// H3 · Pretendard Bold 14 — 판매자명, 입찰가, 순위
  static final TextStyle pretendardH3 = _pretendard.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );

  /// Body 1 · Pretendard Medium 16 — 판매자명, 입찰가, 순위
  static final TextStyle pretendardBody1 = _pretendard.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  /// Body 1 · Pretendard Regular 16 — 받는 사람, 카드 번호 ("홍길동", "****1234")
  static final TextStyle pretendardBody1Regular = _pretendard.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  /// Body 1 · Pretendard Regular 16 / 1.4 — 여러 줄 입력창 ("채널 소개")
  static final TextStyle pretendardBody1RegularRelaxed = pretendardBody1Regular
      .copyWith(height: 1.4);

  /// Body 2 · Pretendard Medium 14 — 상품명
  static final TextStyle pretendardBody2 = _pretendard.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  /// Body 2 · Pretendard Medium 14 / 1.4 — 채팅 패널의 여러 줄 메시지
  static final TextStyle pretendardBody2Relaxed = pretendardBody2.copyWith(
    height: 1.4,
  );

  /// Body 2 · Pretendard Regular 14 — 채팅
  static final TextStyle pretendardBody2Regular = _pretendard.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  /// Body 2 · Pretendard Regular 14 / 1.4 — 댓글 본문
  static final TextStyle pretendardBody2RegularRelaxed = pretendardBody2Regular
      .copyWith(height: 1.4);

  /// Label · Pretendard SemiBold 14 — 카테고리 칩
  static final TextStyle pretendardLabel = _pretendard.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  /// Caption 1 · Pretendard Bold 12 — 가격
  static final TextStyle pretendardCaption1Bold = _pretendard.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w700,
  );

  /// Caption 1 · Pretendard Bold 12 / 1.4 — "회원가입" 글자 링크
  static final TextStyle pretendardCaption1BoldRelaxed = pretendardCaption1Bold
      .copyWith(height: 1.4);

  /// Caption 1 · Pretendard Medium 12 — 메타
  static final TextStyle pretendardCaption1Medium = _pretendard.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  /// Caption 1 · Pretendard Medium 12 / 1.4 — 푸터 사업자 정보
  static final TextStyle pretendardCaption1MediumRelaxed =
      pretendardCaption1Medium.copyWith(height: 1.4);

  /// Caption 1 · Pretendard Regular 12 / 1.4 — 안내 목록 설명 (배송·반품)
  static final TextStyle pretendardCaption1RegularRelaxed = _pretendard
      .copyWith(fontSize: 12, fontWeight: FontWeight.w400, height: 1.4);

  /// Caption 1 · Pretendard Regular 12 — 닉네임
  static final TextStyle pretendardCaption1Regular = _pretendard.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  /// Caption 2 · Pretendard Medium 10 — 배지, 태그
  static final TextStyle pretendardCaption2 = _pretendard.copyWith(
    fontSize: 10,
    fontWeight: FontWeight.w500,
  );

  /// Pretendard Bold 11 — 아바타 아래 LIVE 뱃지
  static final TextStyle pretendardCaption2Bold = _pretendard.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w700,
  );

  // ── Archivo ────────────────────────────────────────────────────
  /// H1 · Archivo ExtraBold 18 — 버튼, 섹션 제목
  static final TextStyle archivoH1 = _archivo.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w800,
  );

  /// Archivo ExtraBold 16 — 로그인·가입 화면 CTA ("로그인", "가입하기")
  static final TextStyle archivoH2 = _archivo.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w800,
  );

  /// H1 · Archivo Bold 18 — 편성 시각
  static final TextStyle archivoH1Bold = _archivo.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );

  /// Archivo ExtraBold 18, 자간 -0.45 — 섹션 제목의 강조 부분
  static final TextStyle archivoH1Tight = archivoH1.copyWith(
    letterSpacing: -0.45,
  );

  /// Archivo ExtraBold 18 / 1.4 — 두 줄 가운데 제목 ("간편하게 / 재고 목록만 올리세요")
  static final TextStyle archivoH1Relaxed = archivoH1.copyWith(height: 1.4);

  /// Archivo Bold 22 — 완료 화면 제목 ("판매자 심사 접수 완료")
  static final TextStyle archivoTitle = _archivo.copyWith(
    fontSize: 22,
    fontWeight: FontWeight.w700,
  );

  /// Archivo Bold 48, 자간 -1.2 — 큰 수치 ("2.0", "68")
  static final TextStyle archivoDisplay = _archivo.copyWith(
    fontSize: 48,
    fontWeight: FontWeight.w700,
    letterSpacing: -1.2,
  );

  /// Archivo Bold 24 — 큰 수치 옆 단위 ("배", "%")
  static final TextStyle archivoDisplayUnit = _archivo.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );

  /// Archivo Bold 18, 자간 -0.45 — 편성 시각 (썸네일 위)
  static final TextStyle archivoH1BoldTight = archivoH1Bold.copyWith(
    letterSpacing: -0.45,
  );

  /// H3 · Archivo Bold 14 — 신뢰 블록 제목
  static final TextStyle archivoH3 = _archivo.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );

  /// Body 1 · Archivo Medium 16 — 신뢰 블록 제목
  static final TextStyle archivoBody1 = _archivo.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  /// Body 1 · Archivo Medium 16 / 1.4 — 신뢰 블록 두 줄 제목
  static final TextStyle archivoBody1Relaxed = archivoBody1.copyWith(
    height: 1.4,
  );

  /// Body 1 · Archivo Regular 16 — CTA 보조 문구 ("다음 품목 4/5")
  static final TextStyle archivoBody1Regular = _archivo.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  /// Body 2 · Archivo Regular 14 — 밑줄 텍스트 링크 ("주문 상세 보기")
  static final TextStyle archivoBody2Regular = _archivo.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  /// Label · Archivo SemiBold 14 — 메인 상단 탭
  static final TextStyle archivoLabel = _archivo.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  /// Caption 1 · Archivo ExtraBold 12 — 등급
  static final TextStyle archivoCaption1ExtraBold = _archivo.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w800,
  );

  /// Caption 1 · Archivo Bold 12 — 편성표 판매자
  static final TextStyle archivoCaption1Bold = _archivo.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w700,
  );

  /// Archivo Bold 12, 자간 -0.3 — 편성 날짜 (썸네일 위)
  static final TextStyle archivoCaption1BoldTight = archivoCaption1Bold
      .copyWith(letterSpacing: -0.3);

  /// Archivo ExtraBold 12, 자간 -0.44 — 등급 뱃지 글자
  static final TextStyle archivoGradeBadge = archivoCaption1ExtraBold.copyWith(
    letterSpacing: -0.44,
    color: AppColors.textInverse,
  );

  /// Archivo ExtraBold 20, 자간 -0.44 — 예상 검수 등급 큰 뱃지 글자
  static final TextStyle archivoGradeBadgeLg = archivoGradeBadge.copyWith(
    fontSize: 20,
  );

  // ── 디자인 갤러리 시트 전용 ─────────────────────────────────────
  /// Archivo ExtraBold 22 / 30 — 시트 제목
  static final TextStyle sheetHeading = _archivo.copyWith(
    fontSize: 22,
    height: 30 / 22,
    fontWeight: FontWeight.w800,
  );

  /// Archivo ExtraBold 15 / 20 — 섹션 제목
  static final TextStyle sheetSectionTitle = _archivo.copyWith(
    fontSize: 15,
    height: 20 / 15,
    fontWeight: FontWeight.w800,
  );

  /// Archivo Regular 10 / 14 — 섹션 설명
  static final TextStyle sheetSectionCaption = _archivo.copyWith(
    fontSize: 10,
    height: 14 / 10,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  /// Archivo Bold 12 / 16 — 스와치 이름
  static final TextStyle sheetLabel = _archivo.copyWith(
    fontSize: 12,
    height: 16 / 12,
    fontWeight: FontWeight.w700,
  );

  /// Archivo Regular 11 / 14 — 스와치 값(hex)
  static final TextStyle sheetCaption = _archivo.copyWith(
    fontSize: 11,
    height: 14 / 11,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  /// Pretendard Regular 12 · black 40% — 스타일 용도 설명
  static final TextStyle sheetUsage = pretendardCaption1Regular.copyWith(
    color: AppColors.opacityBlack40,
  );
}

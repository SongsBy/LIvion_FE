import 'package:flutter/material.dart';

/// Figma "리비온 와이어 프레임" 색상 토큰.
///
/// 앞부분은 Color Sheet(node 26:1645)의 palette, 뒷부분은 컴포넌트 시트
/// (node 26:1904)에서 쓰는 semantic alias다. 이름은 Figma variable을 따른다.
/// 위젯에서는 `Color(0x...)`를 직접 쓰지 않고 이 클래스를 참조한다.
abstract final class AppColors {
  // ── Palette · Main ─────────────────────────────────────────────
  /// palette/main/orange — 메인 오렌지. LIVE, CTA, 강조.
  static const Color mainOrange = Color(0xFFFF7D0C);

  /// palette/main/orange-dark
  static const Color mainOrangeDark = Color(0xFFB85300);

  /// palette/main/orange-20 — #FF7D0C · 20%
  static const Color mainOrange20 = Color(0x33FF7D0C);

  /// palette/main/orange-10 — #FF7D0C · 10%
  static const Color mainOrange10 = Color(0x1AFF7D0C);

  // ── Palette · Neutral ──────────────────────────────────────────
  static const Color neutral900 = Color(0xFF201E1D);
  static const Color neutral500 = Color(0xFF7D7979);
  static const Color neutral300 = Color(0xFFD7D3D3);
  static const Color neutral100 = Color(0xFFF3F2F2);

  /// #F8F8F8 — 카테고리 화면 검색창·카테고리 아이콘 원 (Figma 원시값)
  static const Color neutral50 = Color(0xFFF8F8F8);
  static const Color neutral0 = Color(0xFFFFFFFF);

  // ── Palette · Grade (검수 등급) ─────────────────────────────────
  static const Color gradeA = Color(0xFF32B67A);
  static const Color gradeB = Color(0xFF78BFA3);
  static const Color gradeC = Color(0xFFA69C82);

  // ── Palette · Opacity · Black (#201E1D 기반) ───────────────────
  static const Color opacityBlack65 = Color(0xA6201E1D);
  static const Color opacityBlack55 = Color(0x8C201E1D);
  static const Color opacityBlack40 = Color(0x66201E1D);
  static const Color opacityBlack10 = Color(0x1A201E1D);
  static const Color opacityBlack5 = Color(0x0D201E1D);

  // ── Palette · Opacity · White (#FFFFFF 기반) ───────────────────
  static const Color opacityWhite80 = Color(0xCCFFFFFF);
  static const Color opacityWhite30 = Color(0x4DFFFFFF);
  static const Color opacityWhite15 = Color(0x26FFFFFF);

  // ── Semantic · Text ────────────────────────────────────────────
  /// text/primary
  static const Color textPrimary = neutral900;

  /// text/secondary
  static const Color textSecondary = neutral500;

  /// text/tertiary — 채팅 닉네임 등 약한 글자
  static const Color textTertiary = opacityBlack55;

  /// text/disabled — 시각, 비활성 글자
  static const Color textDisabled = opacityBlack40;

  /// text/placeholder — 입력 힌트, 비선택 탭
  static const Color textPlaceholder = neutral300;

  /// text/inverse — 오렌지·어두운 배경 위 글자
  static const Color textInverse = neutral0;

  /// text/inverse-sub — 오렌지 배경 위 보조 글자 (LIVE, 버튼)
  static const Color textInverseSub = neutral100;

  /// text/brand — 오렌지 강조 글자
  static const Color textBrand = mainOrange;

  /// text/point — 배수, 순위, 선택 탭 등 포인트 글자
  static const Color textPoint = mainOrangeDark;

  // ── Semantic · Background ──────────────────────────────────────
  /// background/default
  static const Color backgroundDefault = neutral0;

  /// background/dark
  static const Color backgroundDark = neutral900;

  /// background/brand — CTA, LIVE 뱃지
  static const Color backgroundBrand = mainOrange;

  /// background/brand-weaker — 타이머 뱃지
  static const Color backgroundBrandWeaker = mainOrange20;

  /// background/brand-weak — 신뢰 안내 일러스트 배경
  static const Color backgroundBrandWeak = mainOrange10;

  /// background/subtle — 회색 뱃지, 아바타 기본
  static const Color backgroundSubtle = neutral100;

  /// background/muted — 검색창, 카테고리 아이콘 원형 배경
  static const Color backgroundMuted = neutral50;

  /// background/pressed — 입력창, 눌린 행
  static const Color backgroundPressed = opacityBlack5;

  /// background/transparent — 화면 배경이 그대로 비치는 상단 바
  static const Color backgroundTransparent = Color(0x00000000);

  /// background/dim — 썸네일 위 시청자 수 뱃지
  static const Color backgroundDim = opacityBlack65;

  /// background/placeholder — 빈 아바타
  static const Color backgroundPlaceholder = neutral300;

  /// background/disabled-cta — 누를 수 없는 CTA 바탕 (흰 글자, 재고 등록 "검수 요청 및 편성 신청")
  static const Color backgroundDisabledCta = opacityBlack10;

  /// background/disabled — 예정 편성 썸네일 위 어두운 덮개
  static const Color backgroundDisabled = opacityBlack40;

  /// background/overlay — 아래 시트 뒤 어두운 막 (dark-gray 65%)
  static const Color backgroundOverlay = opacityBlack65;

  /// fill/handle — 아래 시트 위 손잡이 (rgba(118,118,128,0.12), Figma 원시값)
  static const Color fillHandle = Color(0x1F767680);

  // ── Semantic · Border ──────────────────────────────────────────
  /// border/strong
  static const Color borderStrong = neutral300;

  /// border/default
  static const Color borderDefault = neutral100;

  /// border/subtle — 하단 내비, 행 구분선
  static const Color borderSubtle = opacityBlack10;

  /// border/brand
  static const Color borderBrand = mainOrange;

  /// border/secondary — 섹션 제목 옆 작은 외곽선 버튼 ("수정")
  static const Color borderSecondary = neutral500;

  /// border/bold — 결제 금액 합계 위 굵은 구분선
  static const Color borderBold = neutral900;

  /// border/inverse-subtle — 오렌지 CTA 안 세로 구분선 (흰 30%)
  static const Color borderInverseSubtle = opacityWhite30;

  /// border/inverse — 썸네일 위 아바타 테두리
  static const Color borderInverse = neutral0;

  /// #C7C9D9 — 빈 체크박스·라디오 테두리 (판매자 전환 폼, Figma 원시값)
  static const Color borderControl = Color(0xFFC7C9D9);

  /// #EBEDF0 — 판매자 페이지 섹션 사이 4px 띠 (Figma keyboard-accessory-bar-selection)
  static const Color dividerBand = Color(0xFFEBEDF0);

  /// 검정 20% — 회색 트레이 안 세로 구분선 ("화·목 20:00 | 토·일 19:00", Figma 원시값)
  static const Color dividerOnTint = Color(0x33000000);

  // ── Brand · 외부 로그인 (각 공급자 가이드 색) ─────────────────
  /// #FEE500 — 카카오 로그인 버튼 바탕 (Figma kakao_login_kr_large)
  static const Color kakaoYellow = Color(0xFFFEE500);

  /// #03A94D — 네이버 로그인 버튼 바탕 (Figma 로그인 37:4070)
  static const Color naverGreen = Color(0xFF03A94D);

  // ── Semantic · Effect ──────────────────────────────────────────
  /// 카드 그림자 (rgba(0,0,0,0.1))
  static const Color shadow = Color(0x1A000000);

  /// 떠 있는 알약 그림자 (rgba(0,0,0,0.08)) — 판매자 전환 단계 표시
  static const Color shadowSoft = Color(0x14000000);

  // ── Semantic · Scrim (라이브 영상 위 그라데이션, 순수 검정 기반) ──
  /// 그라데이션 시작 — 투명
  static const Color scrimTransparent = Color(0x00000000);

  /// 그라데이션 중간 — 검정 30%
  static const Color scrimBlack30 = Color(0x4D000000);

  /// 그라데이션 끝 — 검정 60%. 영상 아래쪽 채팅·카드가 읽히게 한다.
  static const Color scrimBlack60 = Color(0x99000000);
}

import 'package:flutter/painting.dart';

import 'package:livion/design_system/tokens/tokens.dart';

/// Color Sheet 한 칸(스와치)의 표시 정보.
final class ColorSwatchSpec {
  const ColorSwatchSpec({
    required this.name,
    required this.color,
    this.tileBackground = AppColors.backgroundDefault,
  });

  final String name;
  final Color color;

  /// 반투명 색상을 올려 볼 바탕. 흰색 계열 opacity는 어두운 바탕 위에 표시한다.
  final Color tileBackground;
}

/// Color Sheet의 한 섹션(Main, Neutral, ...).
final class ColorSectionSpec {
  const ColorSectionSpec({
    required this.title,
    required this.caption,
    required this.swatches,
  });

  final String title;
  final String caption;
  final List<ColorSwatchSpec> swatches;
}

/// Figma Color Sheet(node 26:1645)의 섹션 순서와 항목.
const List<ColorSectionSpec> colorSheetSections = [
  ColorSectionSpec(
    title: 'Main',
    caption: '메인 오렌지 · LIVE, CTA, 강조',
    swatches: [
      ColorSwatchSpec(name: 'Orange', color: AppColors.mainOrange),
      ColorSwatchSpec(name: 'Orange Dark', color: AppColors.mainOrangeDark),
      ColorSwatchSpec(name: 'Orange 20%', color: AppColors.mainOrange20),
      ColorSwatchSpec(name: 'Orange 10%', color: AppColors.mainOrange10),
    ],
  ),
  ColorSectionSpec(
    title: 'Neutral',
    caption: '글자·배경·선의 기본 회색 단계',
    swatches: [
      ColorSwatchSpec(name: '900', color: AppColors.neutral900),
      ColorSwatchSpec(name: '500', color: AppColors.neutral500),
      ColorSwatchSpec(name: '300', color: AppColors.neutral300),
      ColorSwatchSpec(name: '100', color: AppColors.neutral100),
      ColorSwatchSpec(name: '0 White', color: AppColors.neutral0),
    ],
  ),
  ColorSectionSpec(
    title: 'Grade',
    caption: '검수 등급 A / B / C',
    swatches: [
      ColorSwatchSpec(name: 'A', color: AppColors.gradeA),
      ColorSwatchSpec(name: 'B', color: AppColors.gradeB),
      ColorSwatchSpec(name: 'C', color: AppColors.gradeC),
    ],
  ),
  ColorSectionSpec(
    title: 'Opacity · Black',
    caption: '오버레이, 약한 글자, 구분선',
    swatches: [
      ColorSwatchSpec(name: 'Black 65%', color: AppColors.opacityBlack65),
      ColorSwatchSpec(name: 'Black 55%', color: AppColors.opacityBlack55),
      ColorSwatchSpec(name: 'Black 40%', color: AppColors.opacityBlack40),
      ColorSwatchSpec(name: 'Black 10%', color: AppColors.opacityBlack10),
      ColorSwatchSpec(name: 'Black 5%', color: AppColors.opacityBlack5),
    ],
  ),
  ColorSectionSpec(
    title: 'Opacity · White',
    caption: '어두운 배경 위 요소',
    swatches: [
      ColorSwatchSpec(
        name: 'White 80%',
        color: AppColors.opacityWhite80,
        tileBackground: AppColors.backgroundDark,
      ),
      ColorSwatchSpec(
        name: 'White 30%',
        color: AppColors.opacityWhite30,
        tileBackground: AppColors.backgroundDark,
      ),
      ColorSwatchSpec(
        name: 'White 15%',
        color: AppColors.opacityWhite15,
        tileBackground: AppColors.backgroundDark,
      ),
    ],
  ),
];

/// 스와치 아래 표기 문자열. 불투명이면 `#FF7D0C`, 반투명이면 `#FF7D0C · 20%`.
String formatSwatchValue(Color color) {
  final argb = color.toARGB32();
  final rgb = argb & 0xFFFFFF;
  final alpha = (argb >> 24) & 0xFF;
  final hex = '#${rgb.toRadixString(16).padLeft(6, '0').toUpperCase()}';
  if (alpha == 0xFF) return hex;
  final percent = (alpha / 0xFF * 100).round();
  return '$hex · $percent%';
}

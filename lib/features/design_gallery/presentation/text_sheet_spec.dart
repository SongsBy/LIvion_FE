import 'package:flutter/painting.dart';

import 'package:livion/design_system/tokens/tokens.dart';

/// Text Sheet 한 항목: 스타일 토큰과 용도 설명.
/// 표기(패밀리·크기·굵기)는 스타일에서 계산하므로 토큰과 어긋나지 않는다.
final class TypographyEntrySpec {
  const TypographyEntrySpec({required this.style, required this.usage});

  final TextStyle style;
  final String usage;
}

/// Text Sheet 한 행(H1, H2, ...): 이름과 Pretendard / Archivo 항목.
final class TypographyRowSpec {
  const TypographyRowSpec({
    required this.name,
    required this.nameStyle,
    required this.pretendard,
    this.archivo = const [],
  });

  final String name;

  /// 행 이름 스타일. Figma에서는 그 행 크기의 Pretendard Bold.
  final TextStyle nameStyle;
  final List<TypographyEntrySpec> pretendard;
  final List<TypographyEntrySpec> archivo;
}

/// Figma Text Sheet(node 26:1775)의 행 순서와 항목.
final List<TypographyRowSpec> textSheetRows = [
  TypographyRowSpec(
    name: 'H1',
    nameStyle: AppTextStyles.pretendardH1,
    pretendard: [
      TypographyEntrySpec(
        style: AppTextStyles.pretendardH1,
        usage: '현재 입찰가, 상품명 대제목, 결제 금액',
      ),
    ],
    archivo: [
      TypographyEntrySpec(style: AppTextStyles.archivoH1, usage: '버튼, 섹션 제목'),
    ],
  ),
  TypographyRowSpec(
    name: 'H2',
    nameStyle: AppTextStyles.pretendardH2,
    pretendard: [
      TypographyEntrySpec(
        style: AppTextStyles.pretendardH2,
        usage: '활성 탭, 결제 금액 라벨',
      ),
    ],
  ),
  TypographyRowSpec(
    name: 'H3',
    nameStyle: AppTextStyles.pretendardH3,
    pretendard: [
      TypographyEntrySpec(
        style: AppTextStyles.pretendardH3,
        usage: '판매자명, 입찰가, 순위',
      ),
    ],
    archivo: [
      TypographyEntrySpec(style: AppTextStyles.archivoH3, usage: '신뢰 블록 제목'),
    ],
  ),
  TypographyRowSpec(
    name: 'Body 1',
    nameStyle: AppTextStyles.pretendardH2,
    pretendard: [
      TypographyEntrySpec(
        style: AppTextStyles.pretendardBody1,
        usage: '판매자명, 입찰가, 순위',
      ),
    ],
    archivo: [
      TypographyEntrySpec(style: AppTextStyles.archivoBody1, usage: '신뢰 블록 제목'),
    ],
  ),
  TypographyRowSpec(
    name: 'Body 2',
    nameStyle: AppTextStyles.pretendardH3,
    pretendard: [
      TypographyEntrySpec(style: AppTextStyles.pretendardBody2, usage: '상품명'),
      TypographyEntrySpec(
        style: AppTextStyles.pretendardBody2Regular,
        usage: '채팅',
      ),
    ],
  ),
  TypographyRowSpec(
    name: 'Label',
    nameStyle: AppTextStyles.pretendardH3,
    pretendard: [
      TypographyEntrySpec(
        style: AppTextStyles.pretendardLabel,
        usage: '카테고리 칩',
      ),
    ],
    archivo: [
      TypographyEntrySpec(style: AppTextStyles.archivoLabel, usage: '메인 상단 탭'),
    ],
  ),
  TypographyRowSpec(
    name: 'Caption 1',
    nameStyle: AppTextStyles.pretendardCaption1Bold,
    pretendard: [
      TypographyEntrySpec(
        style: AppTextStyles.pretendardCaption1Bold,
        usage: '가격',
      ),
      TypographyEntrySpec(
        style: AppTextStyles.pretendardCaption1Medium,
        usage: '메타',
      ),
      TypographyEntrySpec(
        style: AppTextStyles.pretendardCaption1Regular,
        usage: '닉네임',
      ),
    ],
    archivo: [
      TypographyEntrySpec(
        style: AppTextStyles.archivoCaption1ExtraBold,
        usage: '등급',
      ),
      TypographyEntrySpec(
        style: AppTextStyles.archivoCaption1Bold,
        usage: '편성표 판매자',
      ),
    ],
  ),
  TypographyRowSpec(
    name: 'Caption 2',
    nameStyle: AppTextStyles.pretendardCaption2.copyWith(
      fontWeight: FontWeight.w700,
    ),
    pretendard: [
      TypographyEntrySpec(
        style: AppTextStyles.pretendardCaption2,
        usage: '배지, 태그',
      ),
    ],
  ),
];

/// `FontWeight.w700` → `Bold` 처럼 Figma 굵기 이름으로 바꾼다.
String fontWeightName(FontWeight? weight) {
  return switch (weight) {
    FontWeight.w100 => 'Thin',
    FontWeight.w200 => 'ExtraLight',
    FontWeight.w300 => 'Light',
    FontWeight.w500 => 'Medium',
    FontWeight.w600 => 'SemiBold',
    FontWeight.w700 => 'Bold',
    FontWeight.w800 => 'ExtraBold',
    FontWeight.w900 => 'Black',
    _ => 'Regular',
  };
}

/// `16pt` 형식의 크기 표기.
String fontSizeLabel(TextStyle style) {
  final size = style.fontSize ?? 0;
  final text = size == size.roundToDouble()
      ? size.toInt().toString()
      : size.toString();
  return '${text}pt';
}

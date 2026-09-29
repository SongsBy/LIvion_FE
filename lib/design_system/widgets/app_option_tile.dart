import 'package:flutter/material.dart';

import '../tokens/tokens.dart';
import 'app_selection_mark.dart';

enum _AppOptionTileKind { radio, checkbox, plain }

/// 흰 칸 한 개짜리 선택지 (높이 40). 선택되면 오렌지 테두리 + 오렌지 글씨.
///
/// - [AppOptionTile.radio]    여럿 중 하나 ("1회", "임박")
/// - [AppOptionTile.checkbox] 여러 개 ("과잉", "리퍼브")
/// - [AppOptionTile.plain]    표시 없이 가운데 글자, 앞에 [badge] ("[정기] 20:00")
///
/// 여러 칸을 나란히 둘 때는 [AppTileGrid]를 쓴다.
class AppOptionTile extends StatelessWidget {
  const AppOptionTile.radio({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  }) : _kind = _AppOptionTileKind.radio,
       badge = null;

  const AppOptionTile.checkbox({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  }) : _kind = _AppOptionTileKind.checkbox,
       badge = null;

  const AppOptionTile.plain({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
    this.badge,
  }) : _kind = _AppOptionTileKind.plain;

  final String label;
  final bool selected;

  /// null이면 누를 수 없다.
  final VoidCallback? onTap;

  /// plain 전용. 글자 앞 뱃지 (예: `AppBadge.filled('정기')`).
  final Widget? badge;
  final _AppOptionTileKind _kind;

  @override
  Widget build(BuildContext context) {
    final plain = _kind == _AppOptionTileKind.plain;
    final text = Text(
      label,
      style: AppTextStyles.pretendardH3.copyWith(
        color: selected ? AppColors.textBrand : AppColors.opacityBlack65,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
    return Semantics(
      button: true,
      checked: plain ? null : selected,
      selected: plain ? selected : null,
      inMutuallyExclusiveGroup: _kind == _AppOptionTileKind.checkbox
          ? null
          : true,
      enabled: onTap != null,
      label: label,
      onTap: onTap,
      excludeSemantics: true,
      child: Material(
        color: AppColors.backgroundDefault,
        borderRadius: AppRadius.r4All,
        child: InkWell(
          onTap: onTap,
          borderRadius: AppRadius.r4All,
          child: Container(
            height: AppControlHeight.input,
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s10),
            decoration: BoxDecoration(
              borderRadius: AppRadius.r4All,
              // 선택 전에도 같은 두께의 투명 테두리를 둬 크기가 변하지 않게 한다.
              border: Border.all(
                color: selected
                    ? AppColors.borderBrand
                    : AppColors.backgroundTransparent,
                width: AppBorderWidth.thin,
              ),
            ),
            child: plain
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (badge != null) ...[
                        badge!,
                        const SizedBox(width: AppSpacing.s8),
                      ],
                      Flexible(child: text),
                    ],
                  )
                : Row(
                    children: [
                      _kind == _AppOptionTileKind.checkbox
                          ? AppCheckboxMark(checked: selected)
                          : AppRadioMark(selected: selected),
                      const SizedBox(width: AppSpacing.s10),
                      Expanded(child: text),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

/// 제목 + 설명이 있는 큰 라디오 카드. 선택되면 1.5 오렌지 테두리.
///
/// Figma 판매자 전환: "사업자 / 사업자등록번호로 즉시 심사 …",
/// "Livion 공식 방송 위탁 / 검수·진행·CS 대행 [권장]".
/// [onTap]이 null이면 50% 흐리게 보이고 누를 수 없다 ("개인 판매자 [준비중]").
class AppOptionCard extends StatelessWidget {
  const AppOptionCard({
    super.key,
    required this.title,
    required this.caption,
    required this.selected,
    required this.onTap,
    this.badge,
  });

  final String title;
  final String caption;
  final bool selected;
  final VoidCallback? onTap;

  /// 오른쪽 끝 뱃지 (예: `AppBadge.outline('권장')`).
  final Widget? badge;

  @override
  Widget build(BuildContext context) {
    final enabled = onTap != null;
    return Semantics(
      button: true,
      checked: selected,
      inMutuallyExclusiveGroup: true,
      enabled: enabled,
      label: '$title, $caption',
      onTap: onTap,
      excludeSemantics: true,
      child: Opacity(
        opacity: enabled ? 1 : AppOpacity.muted,
        child: Material(
          color: AppColors.backgroundDefault,
          borderRadius: AppRadius.r4All,
          child: InkWell(
            onTap: onTap,
            borderRadius: AppRadius.r4All,
            child: Container(
              padding: const EdgeInsets.all(AppSpacing.s16),
              decoration: BoxDecoration(
                borderRadius: AppRadius.r4All,
                border: Border.all(
                  color: selected
                      ? AppColors.borderBrand
                      : AppColors.backgroundTransparent,
                  width: AppBorderWidth.medium,
                ),
              ),
              child: Row(
                children: [
                  AppRadioMark(selected: selected),
                  const SizedBox(width: AppSpacing.s16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style: AppTextStyles.pretendardH1),
                        const SizedBox(height: AppSpacing.s10),
                        Text(
                          caption,
                          style: AppTextStyles.pretendardCaption1Medium
                              .copyWith(color: AppColors.textSecondary),
                        ),
                      ],
                    ),
                  ),
                  if (badge != null) ...[
                    const SizedBox(width: AppSpacing.s8),
                    badge!,
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// 같은 폭의 칸을 [columns]개씩 줄지어 놓는다. 칸 사이·줄 사이 간격은 [spacing] (기본 8).
///
/// 마지막 줄이 모자라면 빈 자리로 채워 폭을 맞춘다.
class AppTileGrid extends StatelessWidget {
  const AppTileGrid({
    super.key,
    required this.columns,
    required this.children,
    this.spacing = AppSpacing.s8,
  }) : assert(columns > 0);

  final int columns;
  final List<Widget> children;

  /// 재고 등록 사진 칸은 12.
  final double spacing;

  @override
  Widget build(BuildContext context) {
    final rows = <Widget>[];
    for (var start = 0; start < children.length; start += columns) {
      if (rows.isNotEmpty) rows.add(SizedBox(height: spacing));
      rows.add(
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (var i = 0; i < columns; i++) ...[
                if (i > 0) SizedBox(width: spacing),
                Expanded(
                  child: start + i < children.length
                      ? children[start + i]
                      : const SizedBox.shrink(),
                ),
              ],
            ],
          ),
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: rows,
    );
  }
}

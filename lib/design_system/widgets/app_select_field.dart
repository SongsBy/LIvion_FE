import 'package:flutter/material.dart';

import '../tokens/tokens.dart';
import 'app_bottom_sheet.dart';
import 'app_svg_icon.dart';

/// 목록에서 하나를 고르는 필드 ("선택해주세요 ⌄"). 높이 40, 옅은 테두리, radius 4.
///
/// 누르면 [onTap]을 부른다. 고르는 창은 보통 [showAppSelectSheet]를 쓴다.
class AppSelectField extends StatelessWidget {
  const AppSelectField({
    super.key,
    required this.hint,
    this.value,
    this.onTap,
    this.semanticLabel,
  });

  /// 값이 없을 때 40% 글씨로 보인다.
  final String hint;
  final String? value;
  final VoidCallback? onTap;

  /// 읽어 줄 필드 이름 ("배송 메모").
  final String? semanticLabel;

  static const double _arrowSize = AppIconSize.xs;

  @override
  Widget build(BuildContext context) {
    final hasValue = value != null;
    return Semantics(
      button: true,
      enabled: onTap != null,
      label: [?semanticLabel, value ?? hint].join(', '),
      excludeSemantics: true,
      child: Material(
        color: AppColors.backgroundDefault,
        borderRadius: AppRadius.r4All,
        child: InkWell(
          onTap: onTap,
          borderRadius: AppRadius.r4All,
          child: Container(
            height: AppControlHeight.input,
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s16),
            decoration: BoxDecoration(
              borderRadius: AppRadius.r4All,
              border: Border.all(
                color: AppColors.borderSubtle,
                width: AppBorderWidth.thin,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    value ?? hint,
                    style: AppTextStyles.pretendardBody2Regular.copyWith(
                      color: hasValue
                          ? AppColors.textPrimary
                          : AppColors.textDisabled,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: AppSpacing.s8),
                // Figma는 오른쪽 화살표를 90° 돌려 아래 화살표로 쓴다.
                const RotatedBox(
                  quarterTurns: 1,
                  child: AppSvgIcon(
                    AppIcons.chevronRightFilled,
                    size: _arrowSize,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// [options] 중 하나를 고르는 아래 시트를 띄우고 고른 값을 돌려준다. 닫으면 null.
Future<String?> showAppSelectSheet(
  BuildContext context, {
  required String title,
  required List<String> options,
  String? selected,
}) {
  return showAppBottomSheet<String>(
    context,
    title: title,
    builder: (context) => [
      for (final option in options)
        _SelectOption(
          label: option,
          selected: option == selected,
          onTap: () => Navigator.of(context).pop(option),
        ),
    ],
  );
}

class _SelectOption extends StatelessWidget {
  const _SelectOption({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      selected: selected,
      label: label,
      excludeSemantics: true,
      child: InkWell(
        onTap: onTap,
        child: Container(
          constraints: const BoxConstraints(minHeight: AppControlHeight.topBar),
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s16),
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  label,
                  style: selected
                      ? AppTextStyles.pretendardH3.copyWith(
                          color: AppColors.textBrand,
                        )
                      : AppTextStyles.pretendardBody2Regular,
                ),
              ),
              if (selected)
                const AppSvgIcon(
                  AppIcons.checkSmall,
                  size: AppIconSize.md,
                  color: AppColors.textBrand,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

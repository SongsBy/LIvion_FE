import 'package:flutter/material.dart';

import '../tokens/tokens.dart';
import 'app_selection_mark.dart';
import 'app_svg_icon.dart';

/// 체크박스 + 라벨 한 줄. 약관 동의 목록에 쓴다.
///
/// - 기본: 흰 상자(사방 10) 안에 체크박스 · 굵은 라벨 · [badge] · 오른쪽 화살표.
///   화살표는 [onOpen]이 있을 때만 보이고 따로 눌린다 (약관 보기).
/// - [AppCheckRow.heading]: 상자 없이 체크박스 + Archivo 18 라벨 ("전체동의").
/// - [AppCheckRow.consent]: 상자 없이 라디오 표시 + 굵은 14 라벨. 확인하면 오렌지 글씨
///   ("검수 결과에 따라 등급·편성이 변경될 수 있음을 확인했습니다").
class AppCheckRow extends StatelessWidget {
  const AppCheckRow({
    super.key,
    required this.label,
    required this.checked,
    required this.onChanged,
    this.badge,
    this.onOpen,
    this.openLabel,
  }) : _heading = false,
       _consent = false;

  const AppCheckRow.heading({
    super.key,
    required this.label,
    required this.checked,
    required this.onChanged,
  }) : badge = null,
       onOpen = null,
       openLabel = null,
       _heading = true,
       _consent = false;

  const AppCheckRow.consent({
    super.key,
    required this.label,
    required this.checked,
    required this.onChanged,
  }) : badge = null,
       onOpen = null,
       openLabel = null,
       _heading = false,
       _consent = true;

  final String label;
  final bool checked;

  /// 누르면 반대 값으로 부른다. null이면 누를 수 없다.
  final ValueChanged<bool>? onChanged;

  /// 라벨 뒤 뱃지 (예: `AppBadge.outline('필수')`).
  final Widget? badge;

  /// 오른쪽 화살표를 눌렀을 때. 내용 보기.
  final VoidCallback? onOpen;

  /// 화살표를 읽어 줄 이름. 없으면 "[label] 보기".
  final String? openLabel;

  final bool _heading;
  final bool _consent;

  @override
  Widget build(BuildContext context) {
    final toggle = onChanged == null ? null : () => onChanged!(!checked);
    if (_consent) {
      return Semantics(
        container: true,
        checked: checked,
        enabled: onChanged != null,
        label: label,
        onTap: toggle,
        excludeSemantics: true,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: toggle,
          child: Row(
            children: [
              AppRadioMark(selected: checked),
              const SizedBox(width: AppSpacing.s10),
              Expanded(
                child: Text(
                  label,
                  style: AppTextStyles.pretendardH3.copyWith(
                    color: checked
                        ? AppColors.textBrand
                        : AppColors.opacityBlack65,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
    // 체크와 화살표를 따로 읽고 누르도록 각자 semantics 노드를 만든다.
    final check = Semantics(
      container: true,
      checked: checked,
      enabled: onChanged != null,
      label: label,
      onTap: toggle,
      excludeSemantics: true,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: toggle,
        child: Row(
          children: [
            AppCheckboxMark(checked: checked),
            SizedBox(width: _heading ? AppSpacing.s8 : AppSpacing.s10),
            Flexible(
              child: Text(
                label,
                style: _heading
                    ? AppTextStyles.archivoH1
                    : AppTextStyles.pretendardH3,
              ),
            ),
            if (badge != null) ...[
              const SizedBox(width: AppSpacing.s10),
              badge!,
            ],
          ],
        ),
      ),
    );

    if (_heading) return check;

    return Material(
      color: AppColors.backgroundDefault,
      borderRadius: AppRadius.r4All,
      child: InkWell(
        onTap: toggle,
        borderRadius: AppRadius.r4All,
        excludeFromSemantics: true,
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.s10),
          child: Row(
            children: [
              Expanded(child: check),
              if (onOpen != null) ...[
                const SizedBox(width: AppSpacing.s8),
                Semantics(
                  container: true,
                  button: true,
                  label: openLabel ?? '$label 보기',
                  onTap: onOpen,
                  excludeSemantics: true,
                  child: InkResponse(
                    onTap: onOpen,
                    radius: AppIconSize.xl,
                    child: const AppSvgIcon(
                      AppIcons.chevronRight,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

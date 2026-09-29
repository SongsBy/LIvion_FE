import 'package:flutter/material.dart';

import '../tokens/tokens.dart';
import 'app_selection_mark.dart';
import 'app_svg_icon.dart';

/// 약관 동의 한 줄. Figma 회원가입 약관 목록 (37:4133).
///
/// - 기본: 라디오 표시(16) + Pretendard Regular 14 라벨 + 오른쪽 "보기 ›".
///   "보기"는 [onView]가 있을 때만 보이고 따로 눌린다.
/// - [AppAgreementRow.all]: "전체 동의". 다 고르기 전엔 회색 체크 원, 다 고르면 오렌지
///   라디오. 라벨은 굵은 14.
///
/// 줄 높이는 누르기 쉽게 30으로 잡는다 (Figma 행 간격).
/// 상자가 있는 판매자 전환 약관 줄은 [AppCheckRow]를 쓴다.
class AppAgreementRow extends StatelessWidget {
  const AppAgreementRow({
    super.key,
    required this.label,
    required this.checked,
    required this.onChanged,
    this.onView,
    this.viewLabel = '보기',
  }) : _all = false;

  const AppAgreementRow.all({
    super.key,
    this.label = '전체 동의',
    required this.checked,
    required this.onChanged,
  }) : onView = null,
       viewLabel = '보기',
       _all = true;

  final String label;
  final bool checked;

  /// 누르면 반대 값으로 부른다. null이면 누를 수 없다.
  final ValueChanged<bool>? onChanged;

  /// "보기"를 눌렀을 때. 약관 내용 보기.
  final VoidCallback? onView;
  final String viewLabel;
  final bool _all;

  static const double _rowHeight = AppSpacing.s30;

  @override
  Widget build(BuildContext context) {
    final toggle = onChanged == null ? null : () => onChanged!(!checked);
    final Widget mark = _all && !checked
        ? const AppSvgIcon(AppIcons.checkCircleMuted, size: AppIconSize.md)
        : AppRadioMark(selected: checked);

    // 체크와 "보기"를 따로 읽고 누르도록 각자 semantics 노드를 만든다.
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
        child: SizedBox(
          height: _rowHeight,
          child: Row(
            children: [
              mark,
              const SizedBox(width: AppSpacing.s10),
              Flexible(
                child: Text(
                  label,
                  style: _all
                      ? AppTextStyles.pretendardH3
                      : AppTextStyles.pretendardBody2Regular,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );

    if (onView == null) return check;

    return Row(
      children: [
        Expanded(child: check),
        const SizedBox(width: AppSpacing.s32),
        Semantics(
          container: true,
          button: true,
          label: '$label $viewLabel',
          onTap: onView,
          excludeSemantics: true,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onView,
            child: SizedBox(
              height: _rowHeight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    viewLabel,
                    style: AppTextStyles.pretendardBody2Regular.copyWith(
                      color: AppColors.textDisabled,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.s4),
                  const AppSvgIcon(
                    AppIcons.chevronRightMuted,
                    size: AppIconSize.lg,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

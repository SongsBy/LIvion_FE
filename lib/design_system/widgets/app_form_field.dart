import 'package:flutter/material.dart';

import '../tokens/tokens.dart';

/// 폼 항목 한 개: 라벨 줄 + 입력 + (선택) 아래 안내 문구.
///
/// 라벨 줄은 "사업자등록번호 *", "취급 재고 유형 중복선택가능 *"처럼
/// 굵은 제목 뒤에 작은 [note]와 오렌지 필수 표시(*)가 붙는다.
/// [noteHighlighted]면 note가 오렌지로 보인다 ("사진 소비기한 라벨 필수 *").
/// [message]는 입력 아래 12pt 문구다. [isError]면 진한 오렌지로 보인다.
class AppFormField extends StatelessWidget {
  const AppFormField({
    super.key,
    required this.label,
    required this.child,
    this.isRequired = false,
    this.note,
    this.noteHighlighted = false,
    this.message,
    this.isError = false,
    this.spacing = AppSpacing.s12,
  });

  final String label;
  final Widget child;
  final bool isRequired;
  final String? note;
  final bool noteHighlighted;
  final String? message;
  final bool isError;

  /// 라벨과 입력 사이 간격. Figma 대부분 12, "월 예상 방송"은 10.
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Semantics(
          header: true,
          label: [label, ?note, if (isRequired) '필수'].join(', '),
          excludeSemantics: true,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(child: Text(label, style: AppTextStyles.pretendardH3)),
              if (note != null) ...[
                const SizedBox(width: AppSpacing.s3),
                Text(
                  note!,
                  style: noteHighlighted
                      ? AppTextStyles.pretendardCaption1Regular.copyWith(
                          color: AppColors.textBrand,
                        )
                      : AppTextStyles.pretendardCaption1Regular,
                ),
              ],
              if (isRequired) ...[
                const SizedBox(width: AppSpacing.s3),
                Text(
                  '*',
                  style: AppTextStyles.pretendardH3.copyWith(
                    color: AppColors.textBrand,
                  ),
                ),
              ],
            ],
          ),
        ),
        SizedBox(height: spacing),
        child,
        if (message != null) ...[
          const SizedBox(height: AppSpacing.s10),
          Text(
            message!,
            style: AppTextStyles.pretendardCaption1Medium.copyWith(
              color: isError ? AppColors.textPoint : AppColors.textSecondary,
            ),
          ),
        ],
      ],
    );
  }
}

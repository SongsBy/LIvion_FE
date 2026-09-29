import 'package:flutter/material.dart';

import '../tokens/tokens.dart';

/// 검수 등급.
enum AppGrade {
  a('A', AppColors.gradeA),
  b('B', AppColors.gradeB),
  c('C', AppColors.gradeC);

  const AppGrade(this.label, this.color);

  final String label;
  final Color color;
}

/// Figma `Badge/Grade`: 등급 색 배경 + Archivo ExtraBold 흰 글자.
///
/// - 기본: 16×16, radius 2, 12pt (상품 카드)
/// - [GradeBadge.large]: 40×40, radius 8, 20pt (예상 검수 등급)
class GradeBadge extends StatelessWidget {
  const GradeBadge(this.grade, {super.key}) : _large = false;

  const GradeBadge.large(this.grade, {super.key}) : _large = true;

  final AppGrade grade;
  final bool _large;

  @override
  Widget build(BuildContext context) {
    final size = _large ? AppIconSize.gradeLg : AppIconSize.md;
    return Semantics(
      label: '등급 ${grade.label}',
      child: Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: grade.color,
          borderRadius: _large ? AppRadius.r8All : AppRadius.r2All,
        ),
        child: ExcludeSemantics(
          child: Text(
            grade.label,
            style: _large
                ? AppTextStyles.archivoGradeBadgeLg
                : AppTextStyles.archivoGradeBadge,
          ),
        ),
      ),
    );
  }
}

/// 예상 검수 등급 상자: 왼쪽 제목 + 근거 한 줄, 오른쪽 큰 등급 뱃지.
///
/// - 기본: 흰 바탕 + 옅은 테두리 (재고 등록 상태·검수 입력)
/// - [GradeSummaryCard.muted]: 검정 10% 바탕, 테두리 없음 (검토 화면)
///
/// [grade]가 null이면 뱃지 없이 제목·문구만 보인다 (아직 고르지 않은 항목이 있을 때).
class GradeSummaryCard extends StatelessWidget {
  const GradeSummaryCard({
    super.key,
    required this.title,
    required this.caption,
    this.grade,
  }) : _muted = false;

  const GradeSummaryCard.muted({
    super.key,
    required this.title,
    required this.caption,
    this.grade,
  }) : _muted = true;

  final String title;

  /// 예: "B 범위 · 외관 이상 없음 · 미개봉"
  final String caption;
  final AppGrade? grade;
  final bool _muted;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      label: [
        title,
        if (grade != null) '등급 ${grade!.label}',
        caption,
      ].join(', '),
      excludeSemantics: true,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(AppSpacing.s10),
        decoration: BoxDecoration(
          color: _muted
              ? AppColors.opacityBlack10
              : AppColors.backgroundDefault,
          borderRadius: AppRadius.r4All,
          border: _muted
              ? null
              : Border.all(
                  color: AppColors.borderSubtle,
                  width: AppBorderWidth.thin,
                ),
        ),
        // 뱃지가 없어도 높이가 같게 둔다.
        constraints: const BoxConstraints(
          minHeight: AppIconSize.gradeLg + AppSpacing.s10 * 2,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyles.pretendardH3),
                  const SizedBox(height: AppSpacing.s8),
                  Text(
                    caption,
                    style: AppTextStyles.pretendardCaption1Medium.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            if (grade != null) ...[
              const SizedBox(width: AppSpacing.s12),
              GradeBadge.large(grade!),
            ],
          ],
        ),
      ),
    );
  }
}

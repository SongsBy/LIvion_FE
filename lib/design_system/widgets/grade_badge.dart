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

/// Figma `Badge/Grade`: 16×16, radius 2, 등급 색 배경 + Archivo ExtraBold 글자.
class GradeBadge extends StatelessWidget {
  const GradeBadge(this.grade, {super.key});

  final AppGrade grade;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: '등급 ${grade.label}',
      child: Container(
        width: AppIconSize.md,
        height: AppIconSize.md,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: grade.color,
          borderRadius: AppRadius.r2All,
        ),
        child: ExcludeSemantics(
          child: Text(grade.label, style: AppTextStyles.archivoGradeBadge),
        ),
      ),
    );
  }
}

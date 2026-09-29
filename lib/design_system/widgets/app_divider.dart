import 'package:flutter/material.dart';

import '../tokens/tokens.dart';

/// 가로 구분선.
///
/// - 기본: 1px 상자 안 옅은 선
/// - [AppDivider.bold]: 1px 합계 위 진한 선
/// - [AppDivider.band]: 4px 화면 폭 섹션 띠 (판매자 페이지)
class AppDivider extends StatelessWidget {
  const AppDivider({super.key, this.color = AppColors.borderDefault})
    : thickness = AppBorderWidth.thin;

  const AppDivider.bold({super.key})
    : color = AppColors.borderBold,
      thickness = AppBorderWidth.thin;

  const AppDivider.band({super.key})
    : color = AppColors.dividerBand,
      thickness = _bandThickness;

  final Color color;
  final double thickness;

  static const double _bandThickness = AppSpacing.s4;

  @override
  Widget build(BuildContext context) {
    return Container(height: thickness, color: color);
  }
}

/// 가운데 글자를 둔 가로 구분선 ("── SNS 로그인 ──"). Figma 로그인 (37:4062).
class AppLabeledDivider extends StatelessWidget {
  const AppLabeledDivider({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: AppDivider(color: AppColors.borderSubtle)),
        const SizedBox(width: AppSpacing.s15),
        Text(
          label,
          style: AppTextStyles.pretendardCaption1MediumRelaxed.copyWith(
            color: AppColors.textDisabled,
          ),
        ),
        const SizedBox(width: AppSpacing.s15),
        const Expanded(child: AppDivider(color: AppColors.borderSubtle)),
      ],
    );
  }
}

/// 1px 세로 구분선. 한 줄 안의 값 사이 ("010-0000-0000 | 주소", "21:14:07 | 카드").
class AppVerticalDivider extends StatelessWidget {
  const AppVerticalDivider({
    super.key,
    required this.height,
    this.color = AppColors.borderSubtle,
  });

  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(width: AppBorderWidth.thin, height: height, color: color);
  }
}

/// 1px 가로 점선. 기준표 줄 사이 (Figma border-dashed, 검정 40%).
class AppDashedDivider extends StatelessWidget {
  const AppDashedDivider({super.key, this.color = AppColors.opacityBlack40});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppBorderWidth.thin,
      width: double.infinity,
      child: CustomPaint(painter: _DashPainter(color)),
    );
  }
}

class _DashPainter extends CustomPainter {
  _DashPainter(this.color);

  final Color color;

  static const double _dash = AppSpacing.s3;
  static const double _gap = AppSpacing.s3;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = size.height;
    final y = size.height / 2;
    for (double x = 0; x < size.width; x += _dash + _gap) {
      final end = (x + _dash).clamp(0, size.width).toDouble();
      canvas.drawLine(Offset(x, y), Offset(end, y), paint);
    }
  }

  @override
  bool shouldRepaint(_DashPainter oldDelegate) => oldDelegate.color != color;
}

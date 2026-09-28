import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:livion/core/formatting/number_format.dart';
import 'package:livion/core/formatting/time_format.dart';
import 'package:livion/design_system/design_system.dart';

import '../../domain/entities/live_detail.dart';

/// Figma 입찰현황(26:551)의 "입찰가 추이" 계단 차트.
///
/// 시작가를 바닥으로 두고 입찰이 들어올 때마다 계단으로 오른다. 연장이 시작된
/// 시점에는 오렌지 점선을 긋고 그 뒤 구간은 오렌지로 그리며, 끝에 현재 점을 찍는다.
/// 데이터가 바뀌면 눈금도 다시 계산하므로 고정 이미지가 아니다.
class LiveBidTrendChart extends StatelessWidget {
  const LiveBidTrendChart({super.key, required this.status});

  final LiveBidStatus status;

  /// 도표 높이 (Figma 107) + x축 라벨 간격(10) + 라벨 높이(14).
  static const double plotHeight = 107;
  static const double height = plotHeight + AppSpacing.s10 + _xLabelHeight;
  static const double _xLabelHeight = 14;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: '입찰가 추이 차트',
      child: SizedBox(
        height: height,
        width: double.infinity,
        child: CustomPaint(
          painter: _BidTrendPainter(
            status: status,
            labelStyle: AppTextStyles.pretendardCaption1Medium.copyWith(
              color: AppColors.textSecondary,
            ),
            textDirection: Directionality.of(context),
          ),
        ),
      ),
    );
  }
}

class _BidTrendPainter extends CustomPainter {
  _BidTrendPainter({
    required this.status,
    required this.labelStyle,
    required this.textDirection,
  });

  final LiveBidStatus status;
  final TextStyle labelStyle;
  final TextDirection textDirection;

  /// y축 라벨 열 너비 (Figma 28).
  static const double _yLabelWidth = AppSpacing.s28;

  /// 세로 눈금은 시작가부터 2칸(라벨 3개)이고, 보조선은 반 칸마다 긋는다.
  static const int _yIntervals = 2;
  static const List<int> _yStepCandidates = [
    500,
    1000,
    2000,
    3000,
    5000,
    10000,
    20000,
    30000,
    50000,
    100000,
    200000,
    500000,
    1000000,
  ];

  /// 가로 눈금 후보(초). 눈금이 4개 이하가 되는 첫 값을 고른다.
  static const List<int> _xStepCandidates = [30, 60, 120, 300, 600, 1800];

  /// 지금(오른쪽 끝) 점이 도표의 94% 지점에 오도록 축을 조금 더 늘린다.
  static const double _nowFraction = 0.94;

  static const double _lineWidth = AppBorderWidth.thin;
  static const double _nowDotRadius = 8 / 3;
  static const double _dashLength = 2;
  static const double _dashGap = 4;

  @override
  void paint(Canvas canvas, Size size) {
    final plot = Rect.fromLTWH(
      _yLabelWidth,
      0,
      math.max(0, size.width - _yLabelWidth),
      LiveBidTrendChart.plotHeight,
    );

    final yMin = status.startPriceWon;
    final maxPrice = [
      status.currentPriceWon,
      ...status.priceHistory.map((p) => p.priceWon),
    ].fold(yMin, math.max);
    final yStep = _pickStep(_yStepCandidates, maxPrice - yMin, _yIntervals);
    final yMax = yMin + yStep * _yIntervals;

    final lastElapsed = [
      status.elapsedSeconds,
      status.extensionStartSeconds ?? 0,
      ...status.priceHistory.map((p) => p.elapsedSeconds),
    ].fold(0, math.max);
    final xMax = math.max(lastElapsed / _nowFraction, 1.0);
    final xStep = _pickStep(_xStepCandidates, xMax.ceil(), 4);

    double x(num seconds) => plot.left + plot.width * (seconds / xMax);
    double y(num price) =>
        plot.bottom - plot.height * ((price - yMin) / (yMax - yMin));

    _paintGrid(canvas, plot, yMin: yMin, yStep: yStep, y: y);
    _paintAxes(canvas, plot);
    _paintXLabels(canvas, plot, xMax: xMax, xStep: xStep, x: x);
    _paintExtension(canvas, plot, x: x);
    _paintSteps(canvas, x: x, y: y);
  }

  static int _pickStep(List<int> candidates, int range, int maxIntervals) {
    for (final step in candidates) {
      if (range <= step * maxIntervals) return step;
    }
    return candidates.last;
  }

  void _paintGrid(
    Canvas canvas,
    Rect plot, {
    required int yMin,
    required int yStep,
    required double Function(num) y,
  }) {
    final gridPaint = Paint()
      ..color = AppColors.opacityBlack5
      ..strokeWidth = _lineWidth
      ..strokeCap = StrokeCap.round;
    // 반 칸마다 보조선, 한 칸마다 라벨. 바닥(시작가)은 축이 대신한다.
    for (var half = 1; half <= _yIntervals * 2; half++) {
      final price = yMin + yStep * half / 2;
      final dy = y(price);
      canvas.drawLine(Offset(plot.left, dy), Offset(plot.right, dy), gridPaint);
    }
    for (var i = 0; i <= _yIntervals; i++) {
      final price = yMin + yStep * i;
      _paintLabel(
        canvas,
        formatShortKoreanWon(price),
        Offset(0, y(price)),
        anchor: Alignment.centerLeft,
      );
    }
  }

  void _paintAxes(Canvas canvas, Rect plot) {
    final axisPaint = Paint()
      ..color = AppColors.borderSubtle
      ..strokeWidth = _lineWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    final path = Path()
      ..moveTo(plot.left, plot.top)
      ..lineTo(plot.left, plot.bottom)
      ..lineTo(plot.right, plot.bottom);
    canvas.drawPath(path, axisPaint);
  }

  void _paintXLabels(
    Canvas canvas,
    Rect plot, {
    required double xMax,
    required int xStep,
    required double Function(num) x,
  }) {
    final top = plot.bottom + AppSpacing.s10;
    for (var seconds = 0; seconds <= xMax; seconds += xStep) {
      _paintLabel(
        canvas,
        formatElapsedShort(seconds),
        Offset(x(seconds), top),
        anchor: Alignment.topLeft,
      );
    }
  }

  void _paintExtension(
    Canvas canvas,
    Rect plot, {
    required double Function(num) x,
  }) {
    final start = status.extensionStartSeconds;
    if (start == null) return;
    final dx = x(start);
    final dashPaint = Paint()
      ..color = AppColors.borderBrand
      ..strokeWidth = _lineWidth
      ..strokeCap = StrokeCap.round;
    var dy = plot.top;
    while (dy < plot.bottom) {
      final end = math.min(dy + _dashLength, plot.bottom);
      canvas.drawLine(Offset(dx, dy), Offset(dx, end), dashPaint);
      dy = end + _dashGap;
    }
  }

  void _paintSteps(
    Canvas canvas, {
    required double Function(num) x,
    required double Function(num) y,
  }) {
    final points = [...status.priceHistory]
      ..sort((a, b) => a.elapsedSeconds.compareTo(b.elapsedSeconds));
    if (points.isEmpty) return;

    final extensionStart = status.extensionStartSeconds;
    bool extended(int seconds) =>
        extensionStart != null && seconds >= extensionStart;

    Paint stroke(bool brand) => Paint()
      ..color = brand ? AppColors.backgroundBrand : AppColors.textPrimary
      ..strokeWidth = _lineWidth
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke;

    // 각 점에서 다음 점까지: 가로로 간 뒤 세로로 오른다 (step-after).
    for (var i = 0; i < points.length - 1; i++) {
      final from = points[i];
      final to = points[i + 1];
      final path = Path()
        ..moveTo(x(from.elapsedSeconds), y(from.priceWon))
        ..lineTo(x(to.elapsedSeconds), y(from.priceWon))
        ..lineTo(x(to.elapsedSeconds), y(to.priceWon));
      canvas.drawPath(path, stroke(extended(to.elapsedSeconds)));
    }

    // 마지막 입찰가는 지금까지 유지된다. 끝에 현재 점.
    final last = points.last;
    final nowSeconds = math.max(status.elapsedSeconds, last.elapsedSeconds);
    final brand = extended(nowSeconds);
    final lastY = y(last.priceWon);
    canvas.drawLine(
      Offset(x(last.elapsedSeconds), lastY),
      Offset(x(nowSeconds), lastY),
      stroke(brand),
    );
    canvas.drawCircle(
      Offset(x(nowSeconds), lastY),
      _nowDotRadius,
      Paint()
        ..color = brand ? AppColors.backgroundBrand : AppColors.textPrimary,
    );
  }

  void _paintLabel(
    Canvas canvas,
    String text,
    Offset at, {
    required Alignment anchor,
  }) {
    final painter = TextPainter(
      text: TextSpan(text: text, style: labelStyle),
      textDirection: textDirection,
    )..layout();
    final offset = Offset(
      at.dx - painter.width * (anchor.x + 1) / 2,
      at.dy - painter.height * (anchor.y + 1) / 2,
    );
    painter.paint(canvas, offset);
    painter.dispose();
  }

  @override
  bool shouldRepaint(_BidTrendPainter oldDelegate) =>
      oldDelegate.status != status ||
      oldDelegate.labelStyle != labelStyle ||
      oldDelegate.textDirection != textDirection;
}

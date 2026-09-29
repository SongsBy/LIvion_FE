import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';

import '../tokens/tokens.dart';

/// 화면 아래 고정 줄의 바탕: 흰 80% + 약한 흐림. 뒤로 스크롤되는 내용이 비친다.
///
/// Scaffold의 `bottomNavigationBar`에 두고 `extendBody: true`로 쓴다.
/// 아래 안전 영역을 포함해 최소 [minBottom]만큼 띄운다.
class AppFrostedBar extends StatelessWidget {
  const AppFrostedBar({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.fromLTRB(
      AppSpacing.s16,
      AppSpacing.s12,
      AppSpacing.s16,
      0,
    ),
    this.minBottom = AppSpacing.s24,
  });

  final Widget child;
  final EdgeInsets padding;
  final double minBottom;

  /// Figma backdrop-blur 2 ≈ sigma 1.
  static const double _blurSigma = 1;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: _blurSigma, sigmaY: _blurSigma),
        child: ColoredBox(
          color: AppColors.opacityWhite80,
          child: SafeArea(
            top: false,
            minimum: EdgeInsets.only(bottom: minBottom),
            child: Padding(padding: padding, child: child),
          ),
        ),
      ),
    );
  }
}

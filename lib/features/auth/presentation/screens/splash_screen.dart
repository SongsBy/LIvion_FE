import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:livion/design_system/design_system.dart';

/// 스플래시 (Figma "스플래시 1안" 37:4182).
///
/// 오렌지 바탕 한가운데에 흰 로고와 문구를 둔다. [duration]이 지나면
/// [onFinished]를 한 번 부른다. 다음 화면으로 넘기는 일은 여는 쪽이 정한다.
class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
    required this.onFinished,
    this.duration = defaultDuration,
  });

  static const defaultDuration = Duration(milliseconds: 1500);

  final VoidCallback onFinished;
  final Duration duration;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(widget.duration, () {
      if (mounted) widget.onFinished();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 오렌지 바탕 위라 상태 바 글자를 흰색으로 둔다.
    return const AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColors.backgroundBrand,
        body: Center(child: _SplashBrand()),
      ),
    );
  }
}

/// 흰 Livion 로고 + "취향을 만나는 라이브 쇼핑" (Figma 37:4183).
class _SplashBrand extends StatelessWidget {
  const _SplashBrand();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const AppLogo(width: AppLogo.largeWidth, color: AppColors.textInverse),
        const SizedBox(height: AppSpacing.s16),
        Text(
          '취향을 만나는 라이브 쇼핑',
          style: AppTextStyles.archivoBody1.copyWith(
            color: AppColors.textInverse,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

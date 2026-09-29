import 'dart:async';

import 'package:flutter/widgets.dart';

import 'package:livion/core/formatting/duration_format.dart';
import 'package:livion/design_system/design_system.dart';

/// 인증번호 입력창 오른쪽 남은 시간 "02:58". 1초마다 다시 그리고 0이 되면 멈춘다.
///
/// [now]는 feature의 시계 provider를 넘긴다 (테스트에서 고정 시각으로 바꾼다).
class VerificationCountdown extends StatefulWidget {
  const VerificationCountdown({
    super.key,
    required this.expiresAt,
    required this.now,
  });

  final DateTime expiresAt;
  final DateTime Function() now;

  @override
  State<VerificationCountdown> createState() => _VerificationCountdownState();
}

class _VerificationCountdownState extends State<VerificationCountdown> {
  Timer? _ticker;
  late String _label = _currentLabel();

  @override
  void initState() {
    super.initState();
    _ticker = Timer.periodic(const Duration(seconds: 1), (_) {
      final label = _currentLabel();
      if (label == _label) return;
      setState(() => _label = label);
      if (_remainingSeconds() == 0) _ticker?.cancel();
    });
  }

  @override
  void dispose() {
    _ticker?.cancel();
    super.dispose();
  }

  /// 초 단위를 올림해 3:00에서 시작하고 0초가 지나야 00:00이 된다.
  int _remainingSeconds() {
    final left = widget.expiresAt.difference(widget.now());
    return left.isNegative ? 0 : (left.inMilliseconds / 1000).ceil();
  }

  String _currentLabel() => formatMinutesSeconds(_remainingSeconds());

  @override
  Widget build(BuildContext context) => AppInputTrailing.timer(_label);
}

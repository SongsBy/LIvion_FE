import 'package:flutter/material.dart';

import 'package:livion/design_system/design_system.dart';

/// 화면 전체를 덮는 방송 화면 + 아래쪽 어두운 그라데이션.
///
/// 지금은 사진([image])을 cover로 채운다. 영상이 붙으면 이 위젯 안의
/// 이미지 자리만 플레이어로 바꾸고 그라데이션은 그대로 둔다.
class LiveBroadcastBackdrop extends StatelessWidget {
  const LiveBroadcastBackdrop({super.key, this.image});

  final ImageProvider? image;

  /// Figma: 34.6%까지 투명 → 50.7%에서 검정 30% → 85.6%에서 검정 60%.
  static const List<double> _stops = [0.346, 0.507, 0.856];

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.backgroundDark,
        image: image == null
            ? null
            : DecorationImage(image: image!, fit: BoxFit.cover),
      ),
      child: const DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: _stops,
            colors: [
              AppColors.scrimTransparent,
              AppColors.scrimBlack30,
              AppColors.scrimBlack60,
            ],
          ),
        ),
      ),
    );
  }
}

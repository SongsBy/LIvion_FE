import 'package:flutter/material.dart';

import 'package:livion/design_system/design_system.dart';

/// Android 시스템 PiP 창 안에 그리는 화면: 방송만 꽉 채운다.
///
/// 앱 창 전체가 PiP 창으로 줄어든 동안 경매 상세 대신 보인다. 창이 작아
/// 글자·버튼은 두지 않는다. 영상이 붙으면 이미지 자리만 플레이어로 바꾼다.
class LivePipWindow extends StatelessWidget {
  const LivePipWindow({super.key, required this.image});

  final ImageProvider? image;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: '라이브 방송',
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.backgroundDark,
          image: image == null
              ? null
              : DecorationImage(image: image!, fit: BoxFit.cover),
        ),
        child: const SizedBox.expand(),
      ),
    );
  }
}

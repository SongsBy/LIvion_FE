import 'package:flutter/foundation.dart';

/// 이 기기에서 네이티브 PiP(Picture in Picture)가 동작하는 방식.
enum PipSupport {
  /// PiP를 쓸 수 없다 (iOS 15 미만, PiP 기능이 없는 Android, 웹·데스크톱).
  unsupported,

  /// 앱 위에 시스템 창이 따로 뜬다 (iOS). 앱을 쓰는 중에도 바로 띄울 수 있고,
  /// 창 안의 화면은 네이티브 뷰가 그린다.
  overlay,

  /// 앱 창 자체가 작은 창으로 줄어든다 (Android). 사용자가 앱을 떠날 때 들어가고,
  /// 그동안 Flutter 화면이 창 크기에 맞게 다시 그려진다.
  appWindow,
}

/// 네이티브 PiP 창의 실제 상태 변화.
enum PipEvent { started, stopped, failed }

/// PiP 창에 보일 내용.
@immutable
class PipContent {
  const PipContent({
    required this.image,
    required this.aspectWidth,
    required this.aspectHeight,
  }) : assert(aspectWidth > 0 && aspectHeight > 0);

  /// 창에 그릴 방송 화면. `asset/` 경로 또는 URL.
  final String image;

  /// 창 가로:세로 비율. Android는 1:2.39 ~ 2.39:1 범위만 받는다.
  final int aspectWidth;
  final int aspectHeight;

  @override
  bool operator ==(Object other) =>
      other is PipContent &&
      other.image == image &&
      other.aspectWidth == aspectWidth &&
      other.aspectHeight == aspectHeight;

  @override
  int get hashCode => Object.hash(image, aspectWidth, aspectHeight);
}

/// 네이티브 PiP 창 하나를 다루는 창구. 앱 전체에서 하나만 쓴다.
///
/// 요청 메서드의 결과는 "요청이 받아들여졌는지"일 뿐이고, 창이 실제로 떴는지·
/// 닫혔는지는 [events]가 알린다. 도메인을 모르므로 무엇을 띄울지는 호출하는 쪽이 정한다.
abstract interface class PictureInPicture {
  /// 이 기기의 PiP 방식. 처음 한 번 확인한 뒤 같은 값을 돌려준다.
  Future<PipSupport> support();

  /// [PipSupport.overlay]에서 창을 바로 띄운다. 요청이 거절되면 false.
  /// 사용자 동작(버튼 탭)에 대한 응답으로만 부른다 (App Store 심사 기준).
  Future<bool> show(PipContent content);

  /// [PipSupport.appWindow]에서 사용자가 앱을 떠날 때 PiP로 들어가도록 준비한다.
  /// 준비하지 못하면 false.
  Future<bool> enterOnLeave(PipContent content);

  /// 띄운 창을 닫고 자동 진입을 해제한다. 아무것도 하지 않았어도 부를 수 있다.
  Future<void> close();

  Stream<PipEvent> get events;
}

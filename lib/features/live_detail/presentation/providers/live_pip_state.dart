import 'package:freezed_annotation/freezed_annotation.dart';

part 'live_pip_state.freezed.dart';

/// 경매 상세를 보는 동안 떠 있는 방송 창의 출처.
@freezed
abstract class LivePipSource with _$LivePipSource {
  const factory LivePipSource({
    required String liveId,

    /// 방송 화면. 데모 단계에서는 사진 에셋이고, 영상이 붙으면 스트림 URL로 바뀐다.
    String? broadcastImage,
  }) = _LivePipSource;
}

/// 방송 창을 지금 어디에 어떻게 보이는지.
enum LivePipPresentation {
  /// 보이지 않는다. 시스템 창을 여는 중이거나 사용자가 닫았다.
  hidden,

  /// 앱 안에 떠 있는 Flutter 미니 플레이어 (Figma 우상단 118×230).
  /// Android가 앱 안에 있을 때와, 시스템 PiP를 쓸 수 없을 때 쓴다.
  floating,

  /// iOS 시스템 PiP 창이 앱 위에 떠 있다. 앱은 아무것도 그리지 않는다.
  systemOverlay,

  /// Android 앱 창 자체가 PiP 창이 됐다. 화면은 방송만 꽉 채워 그린다.
  systemAppWindow,
}

@freezed
abstract class LivePipState with _$LivePipState {
  const factory LivePipState({
    LivePipSource? source,
    @Default(LivePipPresentation.hidden) LivePipPresentation presentation,
  }) = _LivePipState;
}

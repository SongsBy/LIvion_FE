import 'dart:async';

import 'package:livion/core/pip/picture_in_picture.dart';

/// 요청을 기록하고, 테스트가 [emit]으로 네이티브 창 상태를 흉내 내는 fake.
class FakePictureInPicture implements PictureInPicture {
  FakePictureInPicture({
    this.supportValue = PipSupport.appWindow,
    this.showResult = true,
  });

  final PipSupport supportValue;
  final bool showResult;

  /// null이 아니면 [support]가 이 completer를 기다린다. 늦은 응답을 흉내 낸다.
  Completer<void>? supportGate;

  final List<String> calls = [];
  final List<PipContent> contents = [];
  final StreamController<PipEvent> _events = StreamController.broadcast();

  void emit(PipEvent event) => _events.add(event);

  @override
  Stream<PipEvent> get events => _events.stream;

  @override
  Future<PipSupport> support() async {
    await supportGate?.future;
    return supportValue;
  }

  @override
  Future<bool> show(PipContent content) async {
    calls.add('show');
    contents.add(content);
    return showResult;
  }

  @override
  Future<bool> enterOnLeave(PipContent content) async {
    calls.add('enterOnLeave');
    contents.add(content);
    return true;
  }

  @override
  Future<void> close() async => calls.add('close');
}

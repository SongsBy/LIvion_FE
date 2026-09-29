import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:livion/core/pip/picture_in_picture.dart';
import 'package:livion/features/live_detail/presentation/providers/live_detail_dependencies.dart';
import 'package:livion/features/live_detail/presentation/providers/live_pip_controller.dart';
import 'package:livion/features/live_detail/presentation/providers/live_pip_state.dart';

import '../../helpers/fake_picture_in_picture.dart';

const _source = LivePipSource(
  liveId: 'official-1',
  broadcastImage: 'asset/images/demo/live_broadcast_dumpling.jpg',
);

/// autoDispose provider를 살려 두는 구독과 함께 container를 만든다.
ProviderContainer _container(FakePictureInPicture pip) {
  final container = ProviderContainer.test(
    overrides: [pictureInPictureProvider.overrideWithValue(pip)],
  );
  container.listen(livePipControllerProvider, (_, _) {});
  return container;
}

LivePipPresentation _presentation(ProviderContainer c) =>
    c.read(livePipControllerProvider).presentation;

Future<void> _present(ProviderContainer c, [LivePipSource source = _source]) =>
    c.read(livePipControllerProvider.notifier).present(source);

/// 이벤트 스트림 전달을 기다린다.
Future<void> _flush() => Future<void>.delayed(Duration.zero);

void main() {
  group('iOS (시스템 창이 앱 위에 뜬다)', () {
    test('창을 요청하고, 실제로 뜨면 systemOverlay · 닫히면 hidden', () async {
      final pip = FakePictureInPicture(supportValue: PipSupport.overlay);
      final c = _container(pip);

      await _present(c);
      expect(pip.calls, ['show']);
      expect(
        pip.contents.single,
        const PipContent(
          image: 'asset/images/demo/live_broadcast_dumpling.jpg',
          aspectWidth: LivePipController.aspectWidth,
          aspectHeight: LivePipController.aspectHeight,
        ),
      );
      expect(c.read(livePipControllerProvider).source, _source);
      expect(_presentation(c), LivePipPresentation.hidden);

      pip.emit(PipEvent.started);
      await _flush();
      expect(_presentation(c), LivePipPresentation.systemOverlay);

      // 사용자가 창을 닫으면 앱 안 미니 플레이어로 다시 띄우지 않는다.
      pip.emit(PipEvent.stopped);
      await _flush();
      expect(_presentation(c), LivePipPresentation.hidden);
    });

    test('요청이 거절되면 앱 안 미니 플레이어로 대신한다', () async {
      final pip = FakePictureInPicture(
        supportValue: PipSupport.overlay,
        showResult: false,
      );
      final c = _container(pip);

      await _present(c);
      expect(_presentation(c), LivePipPresentation.floating);
    });

    test('창을 띄우다 실패하면 앱 안 미니 플레이어로 대신한다', () async {
      final pip = FakePictureInPicture(supportValue: PipSupport.overlay);
      final c = _container(pip);

      await _present(c);
      pip.emit(PipEvent.failed);
      await _flush();
      expect(_presentation(c), LivePipPresentation.floating);
    });
  });

  group('Android (앱 창이 줄어든다)', () {
    test('앱 안에서는 미니 플레이어, 떠나면 systemAppWindow, 돌아오면 다시 미니 플레이어', () async {
      final pip = FakePictureInPicture(supportValue: PipSupport.appWindow);
      final c = _container(pip);

      await _present(c);
      expect(pip.calls, ['enterOnLeave']);
      expect(_presentation(c), LivePipPresentation.floating);

      pip.emit(PipEvent.started);
      await _flush();
      expect(_presentation(c), LivePipPresentation.systemAppWindow);

      pip.emit(PipEvent.stopped);
      await _flush();
      expect(_presentation(c), LivePipPresentation.floating);
    });
  });

  test('PiP를 쓸 수 없으면 네이티브 요청 없이 미니 플레이어만 띄운다', () async {
    final pip = FakePictureInPicture(supportValue: PipSupport.unsupported);
    final c = _container(pip);

    await _present(c);
    expect(pip.calls, isEmpty);
    expect(_presentation(c), LivePipPresentation.floating);
  });

  test('방송 화면이 없으면 네이티브 창을 열지 않고 미니 플레이어만 띄운다', () async {
    final pip = FakePictureInPicture(supportValue: PipSupport.overlay);
    final c = _container(pip);

    await _present(c, const LivePipSource(liveId: 'official-1'));
    expect(pip.calls, isEmpty);
    expect(_presentation(c), LivePipPresentation.floating);
  });

  test('present 전의 이벤트는 무시한다', () async {
    final pip = FakePictureInPicture(supportValue: PipSupport.appWindow);
    final c = _container(pip);

    pip.emit(PipEvent.started);
    await _flush();
    expect(c.read(livePipControllerProvider), const LivePipState());
  });

  test('늦게 끝난 이전 요청은 버리고 마지막 요청만 창을 연다', () async {
    final pip = FakePictureInPicture(supportValue: PipSupport.overlay)
      ..supportGate = Completer<void>();
    final c = _container(pip);
    const second = LivePipSource(
      liveId: 'live-2',
      broadcastImage: 'asset/images/demo/live_duck.jpg',
    );

    final first = _present(c);
    final latest = _present(c, second);
    pip.supportGate!.complete();
    await Future.wait([first, latest]);

    expect(pip.calls, ['show']);
    expect(pip.contents.single.image, second.broadcastImage);
    expect(c.read(livePipControllerProvider).source, second);
  });

  test('구독이 끝나 dispose되면 창을 닫는다', () async {
    final pip = FakePictureInPicture(supportValue: PipSupport.appWindow);
    final container = ProviderContainer.test(
      overrides: [pictureInPictureProvider.overrideWithValue(pip)],
    );
    final sub = container.listen(livePipControllerProvider, (_, _) {});
    await _present(container);

    sub.close();
    await container.pump();
    expect(pip.calls, ['enterOnLeave', 'close']);
  });
}

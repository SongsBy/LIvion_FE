// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_detail_selection.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 라이브 탭이 보여 줄 방송 id. null이면 대표(공식) 방송이다.
///
/// 홈의 라이브 카드를 누르면 [select]로 id를 넣고 라이브 탭으로 옮긴다.
/// 탭 전환과 무관하게 살아 있어야 하는 앱 수준 선택 상태라 keepAlive다.

@ProviderFor(LiveDetailSelection)
const liveDetailSelectionProvider = LiveDetailSelectionProvider._();

/// 라이브 탭이 보여 줄 방송 id. null이면 대표(공식) 방송이다.
///
/// 홈의 라이브 카드를 누르면 [select]로 id를 넣고 라이브 탭으로 옮긴다.
/// 탭 전환과 무관하게 살아 있어야 하는 앱 수준 선택 상태라 keepAlive다.
final class LiveDetailSelectionProvider
    extends $NotifierProvider<LiveDetailSelection, String?> {
  /// 라이브 탭이 보여 줄 방송 id. null이면 대표(공식) 방송이다.
  ///
  /// 홈의 라이브 카드를 누르면 [select]로 id를 넣고 라이브 탭으로 옮긴다.
  /// 탭 전환과 무관하게 살아 있어야 하는 앱 수준 선택 상태라 keepAlive다.
  const LiveDetailSelectionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'liveDetailSelectionProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$liveDetailSelectionHash();

  @$internal
  @override
  LiveDetailSelection create() => LiveDetailSelection();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }
}

String _$liveDetailSelectionHash() =>
    r'9d7efaba56984d861778b8d79fe942f5be16cc30';

/// 라이브 탭이 보여 줄 방송 id. null이면 대표(공식) 방송이다.
///
/// 홈의 라이브 카드를 누르면 [select]로 id를 넣고 라이브 탭으로 옮긴다.
/// 탭 전환과 무관하게 살아 있어야 하는 앱 수준 선택 상태라 keepAlive다.

abstract class _$LiveDetailSelection extends $Notifier<String?> {
  String? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String?, String?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String?, String?>,
              String?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 로그인 요청. 상태는 요청 중인지 여부다. 입력값은 화면의 입력창이 가진다.

@ProviderFor(LoginController)
const loginControllerProvider = LoginControllerProvider._();

/// 로그인 요청. 상태는 요청 중인지 여부다. 입력값은 화면의 입력창이 가진다.
final class LoginControllerProvider
    extends $NotifierProvider<LoginController, bool> {
  /// 로그인 요청. 상태는 요청 중인지 여부다. 입력값은 화면의 입력창이 가진다.
  const LoginControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loginControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loginControllerHash();

  @$internal
  @override
  LoginController create() => LoginController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$loginControllerHash() => r'c459fcac25fb59a138d616bbf48863a6c2b397c8';

/// 로그인 요청. 상태는 요청 중인지 여부다. 입력값은 화면의 입력창이 가진다.

abstract class _$LoginController extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

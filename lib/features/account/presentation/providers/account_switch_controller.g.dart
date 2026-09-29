// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_switch_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 로그인한 사용자의 계정 목록과 전환. 상단 바가 앱 내내 쓰므로 유지한다.

@ProviderFor(AccountSwitchController)
const accountSwitchControllerProvider = AccountSwitchControllerProvider._();

/// 로그인한 사용자의 계정 목록과 전환. 상단 바가 앱 내내 쓰므로 유지한다.
final class AccountSwitchControllerProvider
    extends
        $AsyncNotifierProvider<AccountSwitchController, AccountSwitchState> {
  /// 로그인한 사용자의 계정 목록과 전환. 상단 바가 앱 내내 쓰므로 유지한다.
  const AccountSwitchControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: _noRetry,
        name: r'accountSwitchControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$accountSwitchControllerHash();

  @$internal
  @override
  AccountSwitchController create() => AccountSwitchController();
}

String _$accountSwitchControllerHash() =>
    r'19691e05f4d509ce63d483a85b653d022572e793';

/// 로그인한 사용자의 계정 목록과 전환. 상단 바가 앱 내내 쓰므로 유지한다.

abstract class _$AccountSwitchController
    extends $AsyncNotifier<AccountSwitchState> {
  FutureOr<AccountSwitchState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<AccountSwitchState>, AccountSwitchState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<AccountSwitchState>, AccountSwitchState>,
              AsyncValue<AccountSwitchState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

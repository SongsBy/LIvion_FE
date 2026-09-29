// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_dependencies.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 계정 feature 의존성 조립. 이 파일만 data 구현을 import한다.
///
/// 데모 구현이 지금 계정을 메모리에 들고 있으므로 앱이 사는 동안 유지한다.
/// 테스트에서는 `accountRepositoryProvider.overrideWithValue(fake)`로 갈아끼운다.

@ProviderFor(accountRepository)
const accountRepositoryProvider = AccountRepositoryProvider._();

/// 계정 feature 의존성 조립. 이 파일만 data 구현을 import한다.
///
/// 데모 구현이 지금 계정을 메모리에 들고 있으므로 앱이 사는 동안 유지한다.
/// 테스트에서는 `accountRepositoryProvider.overrideWithValue(fake)`로 갈아끼운다.

final class AccountRepositoryProvider
    extends
        $FunctionalProvider<
          AccountRepository,
          AccountRepository,
          AccountRepository
        >
    with $Provider<AccountRepository> {
  /// 계정 feature 의존성 조립. 이 파일만 data 구현을 import한다.
  ///
  /// 데모 구현이 지금 계정을 메모리에 들고 있으므로 앱이 사는 동안 유지한다.
  /// 테스트에서는 `accountRepositoryProvider.overrideWithValue(fake)`로 갈아끼운다.
  const AccountRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'accountRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$accountRepositoryHash();

  @$internal
  @override
  $ProviderElement<AccountRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AccountRepository create(Ref ref) {
    return accountRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AccountRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AccountRepository>(value),
    );
  }
}

String _$accountRepositoryHash() => r'17414bbc7af5f541ad7873563c4adf3f8d360695';

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_dependencies.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 로그인·회원가입 feature 의존성 조립. data 구현은 여기서만 import한다.
///
/// 인증 서버 계약이 확정되면 `DemoAuthRepository`를 remote 구현으로 바꾼다.

@ProviderFor(authRepository)
const authRepositoryProvider = AuthRepositoryProvider._();

/// 로그인·회원가입 feature 의존성 조립. data 구현은 여기서만 import한다.
///
/// 인증 서버 계약이 확정되면 `DemoAuthRepository`를 remote 구현으로 바꾼다.

final class AuthRepositoryProvider
    extends $FunctionalProvider<AuthRepository, AuthRepository, AuthRepository>
    with $Provider<AuthRepository> {
  /// 로그인·회원가입 feature 의존성 조립. data 구현은 여기서만 import한다.
  ///
  /// 인증 서버 계약이 확정되면 `DemoAuthRepository`를 remote 구현으로 바꾼다.
  const AuthRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authRepositoryHash();

  @$internal
  @override
  $ProviderElement<AuthRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthRepository create(Ref ref) {
    return authRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthRepository>(value),
    );
  }
}

String _$authRepositoryHash() => r'af60d1e4911e921b80410f170f6c43da7571529e';

/// 인증번호 남은 시간 계산용 시계. 테스트에서 고정 시각으로 바꾼다.

@ProviderFor(authClock)
const authClockProvider = AuthClockProvider._();

/// 인증번호 남은 시간 계산용 시계. 테스트에서 고정 시각으로 바꾼다.

final class AuthClockProvider
    extends
        $FunctionalProvider<
          DateTime Function(),
          DateTime Function(),
          DateTime Function()
        >
    with $Provider<DateTime Function()> {
  /// 인증번호 남은 시간 계산용 시계. 테스트에서 고정 시각으로 바꾼다.
  const AuthClockProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authClockProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authClockHash();

  @$internal
  @override
  $ProviderElement<DateTime Function()> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DateTime Function() create(Ref ref) {
    return authClock(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DateTime Function() value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DateTime Function()>(value),
    );
  }
}

String _$authClockHash() => r'ff645cb91ff24fa273b277d5ca4e8905ec6891af';

/// 로그인·회원가입의 필수 입력 검사 여부.
///
/// 데모 발표 동안은 꺼 두어 빈 칸이 있어도 "로그인"·"가입하기"로 넘어간다
/// (판매자 전환 폼과 같은 방식). true로 바꾸면 빠진 항목을 안내하고 멈춘다.

@ProviderFor(authRequiresInput)
const authRequiresInputProvider = AuthRequiresInputProvider._();

/// 로그인·회원가입의 필수 입력 검사 여부.
///
/// 데모 발표 동안은 꺼 두어 빈 칸이 있어도 "로그인"·"가입하기"로 넘어간다
/// (판매자 전환 폼과 같은 방식). true로 바꾸면 빠진 항목을 안내하고 멈춘다.

final class AuthRequiresInputProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// 로그인·회원가입의 필수 입력 검사 여부.
  ///
  /// 데모 발표 동안은 꺼 두어 빈 칸이 있어도 "로그인"·"가입하기"로 넘어간다
  /// (판매자 전환 폼과 같은 방식). true로 바꾸면 빠진 항목을 안내하고 멈춘다.
  const AuthRequiresInputProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authRequiresInputProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authRequiresInputHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return authRequiresInput(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$authRequiresInputHash() => r'095e91e59d2119b7e7bc5973359891cd77476d7b';

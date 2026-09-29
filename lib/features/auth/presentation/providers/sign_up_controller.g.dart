// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 회원가입 폼. 화면이 닫히면 입력값도 버린다.
///
/// 확인 요청(아이디 중복·휴대폰 인증)은 요청한 값을 기억해 두고, 응답이 오기 전에
/// 사용자가 값을 고쳤으면 그 응답을 버린다. 값을 고치면 확인 결과도 처음으로 돌아간다.

@ProviderFor(SignUpController)
const signUpControllerProvider = SignUpControllerProvider._();

/// 회원가입 폼. 화면이 닫히면 입력값도 버린다.
///
/// 확인 요청(아이디 중복·휴대폰 인증)은 요청한 값을 기억해 두고, 응답이 오기 전에
/// 사용자가 값을 고쳤으면 그 응답을 버린다. 값을 고치면 확인 결과도 처음으로 돌아간다.
final class SignUpControllerProvider
    extends $NotifierProvider<SignUpController, SignUpState> {
  /// 회원가입 폼. 화면이 닫히면 입력값도 버린다.
  ///
  /// 확인 요청(아이디 중복·휴대폰 인증)은 요청한 값을 기억해 두고, 응답이 오기 전에
  /// 사용자가 값을 고쳤으면 그 응답을 버린다. 값을 고치면 확인 결과도 처음으로 돌아간다.
  const SignUpControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'signUpControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$signUpControllerHash();

  @$internal
  @override
  SignUpController create() => SignUpController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SignUpState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SignUpState>(value),
    );
  }
}

String _$signUpControllerHash() => r'ef9725bd05dd2a95a6c314644eba71c0123e719c';

/// 회원가입 폼. 화면이 닫히면 입력값도 버린다.
///
/// 확인 요청(아이디 중복·휴대폰 인증)은 요청한 값을 기억해 두고, 응답이 오기 전에
/// 사용자가 값을 고쳤으면 그 응답을 버린다. 값을 고치면 확인 결과도 처음으로 돌아간다.

abstract class _$SignUpController extends $Notifier<SignUpState> {
  SignUpState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<SignUpState, SignUpState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SignUpState, SignUpState>,
              SignUpState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

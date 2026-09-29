import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:livion/shared/domain/check_status.dart';
import 'package:livion/shared/domain/contact_rules.dart';

import '../../domain/entities/sign_up.dart';
import '../../domain/repositories/auth_repository.dart';
import 'auth_dependencies.dart';

export 'package:livion/shared/domain/check_status.dart';

part 'sign_up_controller.freezed.dart';
part 'sign_up_controller.g.dart';

/// 가입하기 전에 채워야 하는 항목. 화면이 안내 문구로 바꾼다.
enum SignUpIssue {
  usernameInvalid,
  usernameUnchecked,
  passwordInvalid,
  passwordMismatch,
  emailInvalid,
  phoneUnverified,
  agreementsMissing,
}

/// "가입하기" 결과.
sealed class SignUpOutcome {
  const SignUpOutcome();
}

/// 가입 완료. 로그인 화면이 [username]을 채워 둔다.
final class SignUpCompleted extends SignUpOutcome {
  const SignUpCompleted(this.username);

  final String username;
}

/// 빠진 항목이 있어 요청하지 않았다.
final class SignUpIncomplete extends SignUpOutcome {
  const SignUpIncomplete(this.issue);

  final SignUpIssue issue;
}

/// 통신 실패. 다시 시도할 수 있다.
final class SignUpFailed extends SignUpOutcome {
  const SignUpFailed();
}

/// 회원가입 폼 상태 (Figma 회원가입 37:4077).
///
/// 비밀번호가 로그에 남지 않도록 생성 toString을 끄고 직접 만든다.
@Freezed(toStringOverride: false)
abstract class SignUpState with _$SignUpState {
  const SignUpState._();

  const factory SignUpState({
    @Default('') String username,
    @Default(CheckStatus.idle) CheckStatus usernameCheck,
    @Default('') String password,
    @Default('') String passwordConfirm,

    /// 이메일 "@" 앞부분.
    @Default('') String emailLocal,
    String? emailDomain,

    /// 숫자만 ("01012345678").
    @Default('') String phone,

    /// 인증번호 보내기 요청. passed면 [phoneCodeExpiresAt]까지 번호를 받는다.
    @Default(CheckStatus.idle) CheckStatus phoneCodeRequest,
    DateTime? phoneCodeExpiresAt,
    @Default('') String phoneCode,

    /// 인증번호 확인. passed면 휴대폰 인증 완료.
    @Default(CheckStatus.idle) CheckStatus phoneCheck,
    @Default(<SignUpAgreement>{}) Set<SignUpAgreement> agreements,

    /// 가입 요청 중. 성공하면 화면이 닫힐 때까지 true로 둔다.
    @Default(false) bool isSubmitting,
  }) = _SignUpState;

  String get email => emailDomain == null ? '' : '$emailLocal@$emailDomain';

  bool get agreedToAll => agreements.length == SignUpAgreement.values.length;

  bool get passwordMatches => password == passwordConfirm;

  /// 아직 채우지 않은 첫 항목. 다 채웠으면 null.
  SignUpIssue? get firstIssue {
    if (!AuthRules.isUsername(username)) return SignUpIssue.usernameInvalid;
    if (!usernameCheck.isPassed) return SignUpIssue.usernameUnchecked;
    if (!AuthRules.isPassword(password)) return SignUpIssue.passwordInvalid;
    if (!passwordMatches) return SignUpIssue.passwordMismatch;
    if (!AuthRules.isEmail(email)) return SignUpIssue.emailInvalid;
    if (!phoneCheck.isPassed) return SignUpIssue.phoneUnverified;
    final missing = SignUpAgreement.values.any(
      (a) => a.isRequired && !agreements.contains(a),
    );
    if (missing) return SignUpIssue.agreementsMissing;
    return null;
  }

  SignUpRequest toRequest() => SignUpRequest(
    username: username,
    password: password,
    email: email,
    phone: phone,
    agreements: agreements,
  );

  @override
  String toString() =>
      'SignUpState(username: $username, usernameCheck: $usernameCheck, '
      'phoneCheck: $phoneCheck, agreements: $agreements, '
      'isSubmitting: $isSubmitting)';
}

/// 회원가입 폼. 화면이 닫히면 입력값도 버린다.
///
/// 확인 요청(아이디 중복·휴대폰 인증)은 요청한 값을 기억해 두고, 응답이 오기 전에
/// 사용자가 값을 고쳤으면 그 응답을 버린다. 값을 고치면 확인 결과도 처음으로 돌아간다.
@riverpod
class SignUpController extends _$SignUpController {
  late AuthRepository _repository;
  late DateTime Function() _now;
  late bool _requiresInput;

  @override
  SignUpState build() {
    _repository = ref.watch(authRepositoryProvider);
    _now = ref.watch(authClockProvider);
    _requiresInput = ref.watch(authRequiresInputProvider);
    return const SignUpState();
  }

  // ── 아이디 ───────────────────────────────────────────────────

  void setUsername(String value) {
    if (value == state.username) return;
    state = state.copyWith(username: value, usernameCheck: CheckStatus.idle);
  }

  Future<void> checkUsername() async {
    final username = state.username;
    if (!AuthRules.isUsername(username) || state.usernameCheck.isChecking) {
      return;
    }
    state = state.copyWith(usernameCheck: CheckStatus.checking);
    final result = await _check(
      () => _repository.isUsernameAvailable(username),
    );
    if (!ref.mounted || state.username != username) return;
    state = state.copyWith(usernameCheck: result);
  }

  // ── 비밀번호 ─────────────────────────────────────────────────

  void setPassword(String value) => state = state.copyWith(password: value);

  void setPasswordConfirm(String value) =>
      state = state.copyWith(passwordConfirm: value);

  // ── 이메일 ───────────────────────────────────────────────────

  void setEmailLocal(String value) => state = state.copyWith(emailLocal: value);

  void selectEmailDomain(String domain) =>
      state = state.copyWith(emailDomain: domain);

  // ── 휴대폰 ───────────────────────────────────────────────────

  /// 번호를 고치면 보낸 인증번호와 인증 결과를 모두 버린다.
  void setPhone(String value) {
    if (value == state.phone) return;
    state = state.copyWith(
      phone: value,
      phoneCodeRequest: CheckStatus.idle,
      phoneCodeExpiresAt: null,
      phoneCode: '',
      phoneCheck: CheckStatus.idle,
    );
  }

  /// 인증번호를 (다시) 보낸다. 성공하면 입력한 번호를 비우고 시간을 새로 잰다.
  Future<void> requestPhoneCode() async {
    final phone = state.phone;
    if (!ContactRules.isMobilePhone(phone) ||
        state.phoneCodeRequest.isChecking ||
        state.phoneCheck.isPassed) {
      return;
    }
    state = state.copyWith(phoneCodeRequest: CheckStatus.checking);
    try {
      final validity = await _repository.requestPhoneCode(phone);
      if (!ref.mounted || state.phone != phone) return;
      state = state.copyWith(
        phoneCodeRequest: CheckStatus.passed,
        phoneCodeExpiresAt: _now().add(validity),
        phoneCode: '',
        phoneCheck: CheckStatus.idle,
      );
    } catch (_) {
      if (!ref.mounted || state.phone != phone) return;
      state = state.copyWith(phoneCodeRequest: CheckStatus.failed);
    }
  }

  /// 6자리를 다 넣으면 바로 확인한다.
  void setPhoneCode(String code) {
    if (code == state.phoneCode) return;
    state = state.copyWith(phoneCode: code, phoneCheck: CheckStatus.idle);
    if (ContactRules.isVerificationCode(code)) confirmPhoneCode();
  }

  Future<void> confirmPhoneCode() async {
    final expiresAt = state.phoneCodeExpiresAt;
    final phone = state.phone;
    final code = state.phoneCode;
    if (expiresAt == null ||
        !ContactRules.isVerificationCode(code) ||
        state.phoneCheck.isChecking ||
        state.phoneCheck.isPassed) {
      return;
    }
    if (!_now().isBefore(expiresAt)) {
      state = state.copyWith(phoneCheck: CheckStatus.expired);
      return;
    }
    state = state.copyWith(phoneCheck: CheckStatus.checking);
    final result = await _check(
      () => _repository.confirmPhoneCode(phone: phone, code: code),
    );
    if (!ref.mounted || state.phone != phone || state.phoneCode != code) {
      return;
    }
    state = state.copyWith(phoneCheck: result);
  }

  // ── 약관 ─────────────────────────────────────────────────────

  void toggleAgreement(SignUpAgreement agreement) {
    final next = {...state.agreements};
    if (!next.remove(agreement)) next.add(agreement);
    state = state.copyWith(agreements: next);
  }

  void setAllAgreements(bool agreed) => state = state.copyWith(
    agreements: agreed ? SignUpAgreement.values.toSet() : const {},
  );

  // ── 가입 ─────────────────────────────────────────────────────

  /// 가입을 요청한다. 요청 중이면 null.
  ///
  /// 필수 입력 검사([authRequiresInputProvider])가 켜져 있으면 빠진 항목이 있을 때
  /// 요청하지 않고 [SignUpIncomplete]를 돌려준다. 꺼져 있으면 빠진 항목이 있을 때
  /// 서버를 부르지 않고 바로 완료로 본다 (데모).
  Future<SignUpOutcome?> submit() async {
    if (state.isSubmitting) return null;
    final issue = state.firstIssue;
    if (issue != null) {
      return _requiresInput
          ? SignUpIncomplete(issue)
          : SignUpCompleted(state.username.trim());
    }

    state = state.copyWith(isSubmitting: true);
    try {
      await _repository.signUp(state.toRequest());
    } catch (_) {
      if (ref.mounted) state = state.copyWith(isSubmitting: false);
      return const SignUpFailed();
    }
    return SignUpCompleted(state.username);
  }

  Future<CheckStatus> _check(Future<bool> Function() request) async {
    try {
      return await request() ? CheckStatus.passed : CheckStatus.rejected;
    } catch (_) {
      return CheckStatus.failed;
    }
  }
}

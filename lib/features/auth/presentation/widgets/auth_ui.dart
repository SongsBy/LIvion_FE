import '../../domain/entities/sign_up.dart';
import '../providers/login_controller.dart';
import '../providers/sign_up_controller.dart';

/// 로그인·회원가입 화면 문구. 도메인 값은 문구를 모르고 여기서만 바꾼다.

extension SignUpAgreementLabel on SignUpAgreement {
  /// Figma 회원가입 약관 목록 문구.
  String get label {
    final title = switch (this) {
      SignUpAgreement.terms => '서비스 이용문의 동의',
      SignUpAgreement.privacy => '개인정보 수집 · 이용 동의',
      SignUpAgreement.marketing => '마케팅 정보 수신 동의',
    };
    return '${isRequired ? '[필수]' : '[선택]'} $title';
  }
}

extension SignUpIssueMessage on SignUpIssue {
  String get message => switch (this) {
    SignUpIssue.usernameInvalid => '아이디 형식을 확인해주세요.',
    SignUpIssue.usernameUnchecked => '아이디 중복 확인을 해주세요.',
    SignUpIssue.passwordInvalid => '비밀번호 형식을 확인해주세요.',
    SignUpIssue.passwordMismatch => '비밀번호가 일치하지 않아요.',
    SignUpIssue.emailInvalid => '이메일을 입력해주세요.',
    SignUpIssue.phoneUnverified => '휴대폰 번호를 인증해주세요.',
    SignUpIssue.agreementsMissing => '필수 약관에 동의해주세요.',
  };
}

extension LoginResultMessage on LoginResult {
  /// 로그인 실패 안내. 성공이면 null.
  String? get message => switch (this) {
    LoginResult.signedIn => null,
    LoginResult.usernameMissing => '아이디를 입력해주세요.',
    LoginResult.passwordMissing => '비밀번호를 입력해주세요.',
    LoginResult.rejected => '아이디 또는 비밀번호가 맞지 않아요.',
    LoginResult.failed => '로그인하지 못했어요. 잠시 후 다시 시도해 주세요.',
  };
}

/// 확인 요청 실패 안내. 실패가 아니면 null.
String? checkFailureMessage(CheckStatus status, {required String rejected}) =>
    switch (status) {
      CheckStatus.rejected => rejected,
      CheckStatus.expired => '인증 시간이 지났어요. 인증번호를 다시 받아주세요.',
      CheckStatus.failed => '확인하지 못했어요. 잠시 후 다시 시도해 주세요.',
      CheckStatus.idle || CheckStatus.checking || CheckStatus.passed => null,
    };

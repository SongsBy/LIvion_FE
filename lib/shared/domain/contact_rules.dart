/// 연락처 입력 형식 규칙. 판매자 전환·회원가입이 함께 쓴다.
abstract final class ContactRules {
  static final RegExp _mobilePhone = RegExp(r'^01\d{8,9}$');
  static final RegExp _verificationCode = RegExp(r'^\d{6}$');
  static final RegExp _email = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

  /// 휴대폰 번호 숫자 최대 자리 ("01012345678").
  static const int mobilePhoneMaxLength = 11;

  /// 문자로 받는 인증번호 자리.
  static const int verificationCodeLength = 6;

  static bool isMobilePhone(String value) => _mobilePhone.hasMatch(value);

  static bool isVerificationCode(String value) =>
      _verificationCode.hasMatch(value);

  static bool isEmail(String value) => _email.hasMatch(value.trim());
}

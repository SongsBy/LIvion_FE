import 'package:livion/shared/domain/contact_rules.dart';

/// 회원가입 약관 (Figma 회원가입 37:4133). 라벨은 presentation이 정한다.
enum SignUpAgreement {
  terms,
  privacy,
  marketing;

  /// Figma는 세 약관 모두 [필수]로 표시한다.
  bool get isRequired => true;
}

/// 회원가입 요청. 비밀번호가 로그에 남지 않도록 [toString]에서 뺀다.
final class SignUpRequest {
  const SignUpRequest({
    required this.username,
    required this.password,
    required this.email,
    required this.phone,
    required this.agreements,
  });

  final String username;
  final String password;
  final String email;

  /// 숫자만 ("01012345678").
  final String phone;
  final Set<SignUpAgreement> agreements;

  @override
  String toString() =>
      'SignUpRequest(username: $username, agreements: $agreements)';
}

/// 로그인·회원가입 입력 형식 규칙 (Figma 회원가입 안내 문구 기준).
abstract final class AuthRules {
  /// 4~12자 / 영문 소문자(숫자 조합 가능). 영문 소문자가 하나는 있어야 한다.
  static final RegExp _username = RegExp(r'^(?=.*[a-z])[a-z0-9]{4,12}$');

  static const int usernameMaxLength = 12;
  static const int passwordMinLength = 6;
  static const int passwordMaxLength = 20;

  /// 가입 화면 이메일 도메인 선택지.
  static const emailDomains = [
    'naver.com',
    'gmail.com',
    'daum.net',
    'hanmail.net',
    'kakao.com',
    'nate.com',
  ];

  static bool isUsername(String value) => _username.hasMatch(value);

  /// 6~20자 / 영문 대문자, 소문자, 숫자, 특수문자 중 2가지 이상 조합. 공백은 안 된다.
  static bool isPassword(String value) {
    if (value.length < passwordMinLength || value.length > passwordMaxLength) {
      return false;
    }
    if (value.contains(RegExp(r'\s'))) return false;
    final kinds = [
      RegExp('[A-Z]'),
      RegExp('[a-z]'),
      RegExp('[0-9]'),
      RegExp('[^A-Za-z0-9]'),
    ].where((kind) => kind.hasMatch(value)).length;
    return kinds >= 2;
  }

  static bool isEmail(String value) => ContactRules.isEmail(value);
}

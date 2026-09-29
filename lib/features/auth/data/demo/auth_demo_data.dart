/// 로그인·회원가입 데모 데이터. API가 붙으면 서버 값으로 바뀐다.
abstract final class AuthDemoData {
  /// 이미 쓰이는 아이디. 중복 확인 거절을 보여 주는 용도.
  static const takenUsernames = {'livion', 'admin', 'test'};

  /// 인증번호 유효 시간.
  static const phoneCodeValidity = Duration(minutes: 3);
}

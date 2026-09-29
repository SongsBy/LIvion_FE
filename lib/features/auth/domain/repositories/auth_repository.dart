import '../entities/sign_up.dart';

/// 로그인·회원가입 데이터 계약.
///
/// 지금은 데모 구현만 있고, 인증 서버 계약(토큰·갱신·오류 형식)이 확정되면
/// data/에 remote 구현을 추가해 `auth_dependencies.dart`에서만 교체한다.
/// 확인 요청은 통과하면 true, 서버가 거절하면 false, 통신 실패는 예외로 알린다.
abstract interface class AuthRepository {
  /// 아이디·비밀번호로 로그인한다. 맞지 않으면 false.
  Future<bool> signIn({required String username, required String password});

  /// 아이디를 쓸 수 있는지(중복이 아닌지) 확인한다.
  Future<bool> isUsernameAvailable(String username);

  /// 휴대폰으로 인증번호를 보내고 번호의 유효 시간을 돌려준다.
  Future<Duration> requestPhoneCode(String phone);

  /// 받은 인증번호가 맞는지 확인한다.
  Future<bool> confirmPhoneCode({required String phone, required String code});

  /// 회원가입한다.
  Future<void> signUp(SignUpRequest request);
}

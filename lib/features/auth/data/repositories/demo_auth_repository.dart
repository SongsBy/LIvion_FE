import 'package:livion/shared/domain/contact_rules.dart';

import '../../domain/entities/sign_up.dart';
import '../../domain/repositories/auth_repository.dart';
import '../demo/auth_demo_data.dart';

/// 데모 발표용 [AuthRepository]. 토큰을 만들거나 저장하지 않는다.
///
/// 로그인은 아이디·비밀번호가 비어 있지 않으면 통과한다. 아이디는
/// [AuthDemoData.takenUsernames]만 중복으로 거절하고, 인증번호는 6자리면
/// 아무 숫자나 맞는 것으로 본다. 회원가입은 항상 성공한다.
final class DemoAuthRepository implements AuthRepository {
  const DemoAuthRepository({this.latency = const Duration(milliseconds: 300)});

  final Duration latency;

  Future<void> _wait() async {
    if (latency > Duration.zero) await Future<void>.delayed(latency);
  }

  @override
  Future<bool> signIn({
    required String username,
    required String password,
  }) async {
    await _wait();
    return username.isNotEmpty && password.isNotEmpty;
  }

  @override
  Future<bool> isUsernameAvailable(String username) async {
    await _wait();
    return !AuthDemoData.takenUsernames.contains(username.toLowerCase());
  }

  @override
  Future<Duration> requestPhoneCode(String phone) async {
    await _wait();
    return AuthDemoData.phoneCodeValidity;
  }

  @override
  Future<bool> confirmPhoneCode({
    required String phone,
    required String code,
  }) async {
    await _wait();
    return ContactRules.isVerificationCode(code);
  }

  @override
  Future<void> signUp(SignUpRequest request) => _wait();
}

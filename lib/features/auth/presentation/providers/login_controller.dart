import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/repositories/auth_repository.dart';
import 'auth_dependencies.dart';

part 'login_controller.g.dart';

/// 로그인 요청 결과. 화면이 이동이나 안내 문구로 바꾼다.
enum LoginResult {
  signedIn,
  usernameMissing,
  passwordMissing,

  /// 아이디·비밀번호가 맞지 않다.
  rejected,

  /// 통신 실패. 다시 시도할 수 있다.
  failed,
}

/// 로그인 요청. 상태는 요청 중인지 여부다. 입력값은 화면의 입력창이 가진다.
@riverpod
class LoginController extends _$LoginController {
  late AuthRepository _repository;
  late bool _requiresInput;

  @override
  bool build() {
    _repository = ref.watch(authRepositoryProvider);
    _requiresInput = ref.watch(authRequiresInputProvider);
    return false;
  }

  /// 로그인한다. 이미 요청 중이면 null.
  ///
  /// 필수 입력 검사([authRequiresInputProvider])가 꺼져 있으면 빈 칸이 있을 때
  /// 서버를 부르지 않고 바로 로그인된 것으로 본다 (데모).
  /// 성공하면 화면이 떠날 때까지 요청 중 상태로 둔다.
  Future<LoginResult?> submit({
    required String username,
    required String password,
  }) async {
    if (state) return null;
    final id = username.trim();
    if (id.isEmpty || password.isEmpty) {
      if (!_requiresInput) return LoginResult.signedIn;
      return id.isEmpty
          ? LoginResult.usernameMissing
          : LoginResult.passwordMissing;
    }

    state = true;
    final LoginResult result;
    try {
      final ok = await _repository.signIn(username: id, password: password);
      result = ok ? LoginResult.signedIn : LoginResult.rejected;
    } catch (_) {
      if (ref.mounted) state = false;
      return LoginResult.failed;
    }
    if (ref.mounted && result != LoginResult.signedIn) state = false;
    return result;
  }
}

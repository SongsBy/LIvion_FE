import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:livion/features/auth/data/repositories/demo_auth_repository.dart';
import 'package:livion/features/auth/domain/entities/sign_up.dart';
import 'package:livion/features/auth/domain/repositories/auth_repository.dart';
import 'package:livion/features/auth/presentation/providers/auth_dependencies.dart';
import 'package:livion/features/auth/presentation/providers/login_controller.dart';
import 'package:livion/features/auth/presentation/providers/sign_up_controller.dart';

/// 지연 없는 데모 응답. 중복 확인·가입은 테스트가 끝내거나 실패시킬 수 있다.
class _FakeRepository implements AuthRepository {
  static const _demo = DemoAuthRepository(latency: Duration.zero);

  Completer<bool>? usernameCheck;
  bool failSignUp = false;
  bool acceptSignIn = true;
  final signedUp = <SignUpRequest>[];

  @override
  Future<bool> signIn({
    required String username,
    required String password,
  }) async => acceptSignIn;

  @override
  Future<bool> isUsernameAvailable(String username) =>
      usernameCheck?.future ?? _demo.isUsernameAvailable(username);

  @override
  Future<Duration> requestPhoneCode(String phone) =>
      _demo.requestPhoneCode(phone);

  @override
  Future<bool> confirmPhoneCode({
    required String phone,
    required String code,
  }) async => code == '123456';

  @override
  Future<void> signUp(SignUpRequest request) async {
    if (failSignUp) throw Exception('network');
    signedUp.add(request);
  }
}

void main() {
  late _FakeRepository repository;
  late DateTime now;
  late ProviderContainer container;

  ProviderContainer create({bool requiresInput = true}) {
    final c = ProviderContainer(
      overrides: [
        authRepositoryProvider.overrideWithValue(repository),
        authClockProvider.overrideWithValue(() => now),
        authRequiresInputProvider.overrideWithValue(requiresInput),
      ],
    );
    addTearDown(c.dispose);
    // autoDispose 상태가 테스트 동안 살아 있도록 구독한다.
    c.listen(signUpControllerProvider, (_, _) {});
    c.listen(loginControllerProvider, (_, _) {});
    return c;
  }

  SignUpController controller() =>
      container.read(signUpControllerProvider.notifier);
  SignUpState state() => container.read(signUpControllerProvider);

  /// 필수 항목을 모두 채운다 (중복 확인·휴대폰 인증 포함).
  Future<void> fillValidForm() async {
    controller()
      ..setUsername('hanbit01')
      ..setPassword('abc123')
      ..setPasswordConfirm('abc123')
      ..setEmailLocal('hong')
      ..selectEmailDomain('naver.com')
      ..setPhone('01012345678')
      ..setAllAgreements(true);
    await controller().checkUsername();
    await controller().requestPhoneCode();
    controller().setPhoneCode('123456');
    await Future<void>.delayed(Duration.zero);
  }

  setUp(() {
    repository = _FakeRepository();
    now = DateTime(2026, 9, 29, 12);
    container = create();
  });

  group('AuthRules', () {
    test('아이디: 4~12자 영문 소문자, 숫자 조합 가능', () {
      expect(AuthRules.isUsername('abcd'), isTrue);
      expect(AuthRules.isUsername('abc123'), isTrue);
      expect(AuthRules.isUsername('abc'), isFalse);
      expect(AuthRules.isUsername('abcdefghijklm'), isFalse);
      expect(AuthRules.isUsername('1234'), isFalse, reason: '영문이 없다');
      expect(AuthRules.isUsername('Abcd'), isFalse);
    });

    test('비밀번호: 6~20자, 네 종류 중 2가지 이상, 공백 없음', () {
      expect(AuthRules.isPassword('abc123'), isTrue);
      expect(AuthRules.isPassword('ABCdef'), isTrue);
      expect(AuthRules.isPassword('abc!@#'), isTrue);
      expect(AuthRules.isPassword('abcdef'), isFalse);
      expect(AuthRules.isPassword('ab12'), isFalse);
      expect(AuthRules.isPassword('abc 123'), isFalse);
      expect(AuthRules.isPassword('a1' * 11), isFalse);
    });
  });

  test('중복 아이디는 거절, 고치면 확인 결과가 처음으로 돌아간다', () async {
    controller().setUsername('livion');
    await controller().checkUsername();
    expect(state().usernameCheck, CheckStatus.rejected);

    controller().setUsername('livion2');
    expect(state().usernameCheck, CheckStatus.idle);
    await controller().checkUsername();
    expect(state().usernameCheck, CheckStatus.passed);
  });

  test('형식이 틀린 아이디는 중복 확인을 요청하지 않는다', () async {
    controller().setUsername('ab');
    await controller().checkUsername();
    expect(state().usernameCheck, CheckStatus.idle);
  });

  test('중복 확인 응답 전에 아이디를 고치면 늦은 응답을 버린다', () async {
    repository.usernameCheck = Completer<bool>();
    controller().setUsername('first1');
    final pending = controller().checkUsername();
    controller().setUsername('second2');
    repository.usernameCheck!.complete(true);
    await pending;
    expect(state().usernameCheck, CheckStatus.idle);
  });

  test('인증번호: 보내면 유효 시간이 생기고 6자리를 넣으면 확인한다', () async {
    controller().setPhone('01012345678');
    await controller().requestPhoneCode();
    expect(state().phoneCodeExpiresAt, now.add(const Duration(minutes: 3)));

    controller().setPhoneCode('000000');
    await Future<void>.delayed(Duration.zero);
    expect(state().phoneCheck, CheckStatus.rejected);

    controller().setPhoneCode('123456');
    await Future<void>.delayed(Duration.zero);
    expect(state().phoneCheck, CheckStatus.passed);
  });

  test('유효 시간이 지나면 확인하지 않고 만료로 알린다', () async {
    controller().setPhone('01012345678');
    await controller().requestPhoneCode();
    now = now.add(const Duration(minutes: 3));
    controller().setPhoneCode('123456');
    await Future<void>.delayed(Duration.zero);
    expect(state().phoneCheck, CheckStatus.expired);
  });

  test('번호를 고치면 보낸 인증번호와 결과를 버린다', () async {
    await fillValidForm();
    expect(state().phoneCheck, CheckStatus.passed);
    controller().setPhone('01099998888');
    expect(state().phoneCheck, CheckStatus.idle);
    expect(state().phoneCodeExpiresAt, isNull);
  });

  test('전체 동의는 모든 약관을 켜고 끈다', () {
    controller().setAllAgreements(true);
    expect(state().agreedToAll, isTrue);
    controller().toggleAgreement(SignUpAgreement.marketing);
    expect(state().agreedToAll, isFalse);
    controller().setAllAgreements(false);
    expect(state().agreements, isEmpty);
  });

  test('필수 검사가 켜져 있으면 첫 빠진 항목을 알리고 요청하지 않는다', () async {
    controller()
      ..setUsername('hanbit01')
      ..setPassword('abc123');
    final outcome = await controller().submit();
    expect(outcome, isA<SignUpIncomplete>());
    expect((outcome! as SignUpIncomplete).issue, SignUpIssue.usernameUnchecked);
    expect(repository.signedUp, isEmpty);
  });

  test('다 채우면 가입을 요청하고 아이디를 돌려준다', () async {
    await fillValidForm();
    final outcome = await controller().submit();
    expect(outcome, isA<SignUpCompleted>());
    expect((outcome! as SignUpCompleted).username, 'hanbit01');
    expect(repository.signedUp.single.email, 'hong@naver.com');
    expect(state().isSubmitting, isTrue, reason: '화면이 닫힐 때까지 둔다');
  });

  test('가입 요청이 실패하면 다시 누를 수 있다', () async {
    await fillValidForm();
    repository.failSignUp = true;
    expect(await controller().submit(), isA<SignUpFailed>());
    expect(state().isSubmitting, isFalse);
  });

  test('필수 검사가 꺼져 있으면 빈 폼도 요청 없이 완료로 본다 (데모)', () async {
    container = create(requiresInput: false);
    expect(await controller().submit(), isA<SignUpCompleted>());
    expect(repository.signedUp, isEmpty);
  });

  test('상태 문자열에 비밀번호를 남기지 않는다', () {
    controller().setPassword('secret99');
    expect(state().toString(), isNot(contains('secret99')));
    expect(state().toRequest().toString(), isNot(contains('secret99')));
  });

  group('LoginController', () {
    LoginController login() => container.read(loginControllerProvider.notifier);

    test('필수 검사가 켜져 있으면 빈 칸을 알린다', () async {
      expect(
        await login().submit(username: ' ', password: 'x'),
        LoginResult.usernameMissing,
      );
      expect(
        await login().submit(username: 'hong', password: ''),
        LoginResult.passwordMissing,
      );
    });

    test('서버가 거절하면 rejected, 다시 누를 수 있다', () async {
      repository.acceptSignIn = false;
      expect(
        await login().submit(username: 'hong', password: 'pw'),
        LoginResult.rejected,
      );
      expect(container.read(loginControllerProvider), isFalse);
    });

    test('성공하면 signedIn이고 화면이 떠날 때까지 요청 중으로 둔다', () async {
      expect(
        await login().submit(username: 'hong', password: 'pw'),
        LoginResult.signedIn,
      );
      expect(container.read(loginControllerProvider), isTrue);
    });

    test('필수 검사가 꺼져 있으면 빈 칸이어도 로그인된다 (데모)', () async {
      container = create(requiresInput: false);
      expect(
        await login().submit(username: '', password: ''),
        LoginResult.signedIn,
      );
    });
  });
}

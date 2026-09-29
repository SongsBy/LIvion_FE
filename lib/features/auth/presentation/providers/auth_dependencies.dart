import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/demo_auth_repository.dart';
import '../../domain/repositories/auth_repository.dart';

part 'auth_dependencies.g.dart';

/// 로그인·회원가입 feature 의존성 조립. data 구현은 여기서만 import한다.
///
/// 인증 서버 계약이 확정되면 `DemoAuthRepository`를 remote 구현으로 바꾼다.
@riverpod
AuthRepository authRepository(Ref ref) => const DemoAuthRepository();

/// 인증번호 남은 시간 계산용 시계. 테스트에서 고정 시각으로 바꾼다.
@riverpod
DateTime Function() authClock(Ref ref) => DateTime.now;

/// 로그인·회원가입의 필수 입력 검사 여부.
///
/// 데모 발표 동안은 꺼 두어 빈 칸이 있어도 "로그인"·"가입하기"로 넘어간다
/// (판매자 전환 폼과 같은 방식). true로 바꾸면 빠진 항목을 안내하고 멈춘다.
@riverpod
bool authRequiresInput(Ref ref) => false;

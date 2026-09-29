import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/account_profile.dart';
import 'account_dependencies.dart';

part 'account_switch_controller.freezed.dart';
part 'account_switch_controller.g.dart';

/// 계정 전환 화면 상태. 요청 중에도 지금 계정([session])을 그대로 보인다.
@freezed
abstract class AccountSwitchState with _$AccountSwitchState {
  const factory AccountSwitchState({
    required AccountSession session,

    /// 계정 전환·판매자 등록 요청 중.
    @Default(false) bool isSubmitting,
  }) = _AccountSwitchState;
}

/// 실패 시 Riverpod 자동 재시도를 끈다. 다시 시도는 사용자가 한다.
Duration? _noRetry(int retryCount, Object error) => null;

/// 로그인한 사용자의 계정 목록과 전환. 상단 바가 앱 내내 쓰므로 유지한다.
@Riverpod(keepAlive: true, retry: _noRetry)
class AccountSwitchController extends _$AccountSwitchController {
  @override
  Future<AccountSwitchState> build() async => AccountSwitchState(
    session: await ref.watch(accountRepositoryProvider).fetchSession(),
  );

  /// [profileId] 계정으로 전환한다. 성공하면 true.
  ///
  /// 요청 중이거나 같은 계정이면 요청하지 않고 false. 실패하면 이전 계정을 유지한다.
  Future<bool> switchTo(String profileId) => _submit(
    skip: (s) => s.activeProfileId == profileId,
    request: () => ref.read(accountRepositoryProvider).switchProfile(profileId),
  );

  /// 판매자 전환을 마치고 새 판매자 계정으로 바꾼다. 성공하면 true.
  ///
  /// 이미 판매자 계정이 있거나 요청 중이면 false.
  Future<bool> registerSeller() => _submit(
    skip: (s) => s.hasSeller,
    request: () => ref.read(accountRepositoryProvider).registerSeller(),
  );

  Future<bool> _submit({
    required bool Function(AccountSession session) skip,
    required Future<AccountSession> Function() request,
  }) async {
    final current = state.value;
    if (current == null || current.isSubmitting || skip(current.session)) {
      return false;
    }
    state = AsyncData(current.copyWith(isSubmitting: true));
    try {
      final session = await request();
      if (!ref.mounted) return false;
      state = AsyncData(AccountSwitchState(session: session));
      return true;
    } catch (_) {
      if (ref.mounted) state = AsyncData(current);
      return false;
    }
  }
}

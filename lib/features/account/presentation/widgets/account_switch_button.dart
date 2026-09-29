import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:livion/design_system/design_system.dart';
import 'package:livion/features/seller_onboarding/presentation/screens/seller_intro_screen.dart';

import '../../domain/entities/account_profile.dart';
import '../providers/account_switch_controller.dart';

/// 상단 바 프로필 자리의 구매자 ↔ 판매자 계정 전환 토글.
///
/// 누르면 계정 목록 시트를 연다. 계정을 고르면 바로 전환하고, 판매자 계정이
/// 아직 없으면 시트 아래 "판매자로 전환하기"로 판매자 전환 안내 화면을 연다.
/// 안내에서 시작하기를 누르면 판매자 계정을 만들고 그 계정으로 바꾼다.
/// 요청 중에는 토글에 진행 표시가 돌고 다시 누를 수 없다.
class AccountSwitchButton extends ConsumerWidget {
  const AccountSwitchButton({super.key, this.onLongPress, this.onSwitched});

  /// 길게 눌렀을 때. 데모에서는 디자인 갤러리를 연다.
  final VoidCallback? onLongPress;

  /// 다른 계정으로 바꾼 뒤 새 계정 종류를 알린다 (판매자면 판매자 페이지로 옮긴다).
  final ValueChanged<AccountRole>? onSwitched;

  static const _sellerAction = AppProfileAction(
    label: '판매자로 전환하기',
    caption: '재고만 올리면 검수·방송·정산은 Livion이 해요',
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final account = ref.watch(accountSwitchControllerProvider);
    final data = account.value;
    final active = data?.session.active;
    return AppProfileSwitch(
      image: resolveAppImageOrNull(active?.avatar),
      semanticLabel: active == null
          ? '계정 전환'
          : '현재 ${active.role.label} 계정 ${active.name}, 계정 전환',
      isBusy: data?.isSubmitting ?? false,
      onTap: account.hasError
          ? () => ref.invalidate(accountSwitchControllerProvider)
          : data == null
          ? null
          : () => _openSheet(context, ref, data.session),
      onLongPress: onLongPress,
    );
  }

  Future<void> _openSheet(
    BuildContext context,
    WidgetRef ref,
    AccountSession session,
  ) async {
    final profiles = session.profiles;
    final result = await showAppProfileSwitchSheet(
      context,
      selectedIndex: profiles.indexWhere((p) => p.id == session.active.id),
      options: [
        for (final p in profiles)
          AppProfileOption(
            name: p.name,
            caption: '${p.role.label} 계정',
            image: resolveAppImageOrNull(p.avatar),
            badge: p.role == AccountRole.seller ? p.role.label : null,
          ),
      ],
      action: session.hasSeller ? null : _sellerAction,
    );
    if (!context.mounted) return;
    switch (result) {
      case null:
        return;
      case AppProfileSheetSelected(:final index):
        final target = profiles[index];
        if (target.id == session.active.id) return;
        final ok = await ref
            .read(accountSwitchControllerProvider.notifier)
            .switchTo(target.id);
        if (context.mounted) _showResult(context, ref, ok);
      case AppProfileSheetActionTapped():
        final started = await SellerIntroScreen.open(context);
        if (!started || !context.mounted) return;
        final ok = await ref
            .read(accountSwitchControllerProvider.notifier)
            .registerSeller();
        if (context.mounted) _showResult(context, ref, ok);
    }
  }

  /// 성공이면 지금 계정 이름으로, 실패면 다시 시도 안내로 알린다.
  void _showResult(BuildContext context, WidgetRef ref, bool ok) {
    final active = ref
        .read(accountSwitchControllerProvider)
        .value
        ?.session
        .active;
    if (ok && active != null) onSwitched?.call(active.role);
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            ok && active != null
                ? '${active.role.label} 계정(${active.name})으로 전환했어요.'
                : '계정을 전환하지 못했어요. 잠시 후 다시 시도해 주세요.',
          ),
        ),
      );
  }
}

extension on AccountRole {
  String get label => switch (this) {
    AccountRole.buyer => '구매자',
    AccountRole.seller => '판매자',
  };
}

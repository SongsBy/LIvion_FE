import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:livion/design_system/design_system.dart';

import '../providers/seller_onboarding_providers.dart';
import '../widgets/seller_intro_view.dart';
import 'seller_application_screen.dart';

/// 판매자 전환 첫 화면 "판매자 전환_00" (Figma node 37:3593).
///
/// "판매자 전환 시작하기"를 누르면 판매자 전환 1/4 ~ 4/4([SellerApplicationScreen])를
/// 연다. 거기서 심사 신청까지 마치면 접수 완료 화면이 위에 떠 있는 채로 이 화면은
/// 밑에서 `true`로 빠진다 (완료 화면에서 뒤로 가면 시작한 화면이 보인다).
/// 1단계에서 뒤로 오면 이 화면에 남는다. 뒤로가기는 `null`로 닫힌다.
class SellerIntroScreen extends ConsumerWidget {
  const SellerIntroScreen({super.key});

  /// 화면을 띄우고 심사 신청까지 마쳤는지 돌려준다.
  static Future<bool> open(BuildContext context) async {
    final started = await Navigator.of(
      context,
    ).push<bool>(MaterialPageRoute(builder: (_) => const SellerIntroScreen()));
    return started ?? false;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stats = ref.watch(sellerProgramStatsProvider);
    return Scaffold(
      backgroundColor: AppColors.backgroundSubtle,
      extendBody: true,
      appBar: AppTopBar.back(onBack: () => Navigator.of(context).maybePop()),
      bottomNavigationBar: AppFrostedBar(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.s16,
          AppSpacing.s8,
          AppSpacing.s16,
          0,
        ),
        minBottom: AppSpacing.s25,
        child: AppButton.cta(
          label: '판매자 전환 시작하기',
          onPressed: () => _start(context),
        ),
      ),
      body: SellerIntroView(
        stats: stats,
        onRetryStats: () => ref.invalidate(sellerProgramStatsProvider),
      ),
    );
  }

  Future<void> _start(BuildContext context) async {
    final receipt = await SellerApplicationScreen.open(context);
    if (receipt == null || !context.mounted) return;
    final route = ModalRoute.of(context);
    // 완료 화면이 위에 있으므로 pop 대신 이 화면만 빼며 결과를 넘긴다.
    if (route != null) Navigator.of(context).removeRoute(route, true);
  }
}

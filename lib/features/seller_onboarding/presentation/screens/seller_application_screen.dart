import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:livion/design_system/design_system.dart';

import '../../domain/entities/seller_application.dart';
import '../providers/seller_application_controller.dart';
import '../widgets/business_info_step.dart';
import '../widgets/channel_info_step.dart';
import '../widgets/seller_application_ui.dart';
import '../widgets/seller_type_step.dart';
import '../widgets/settlement_terms_step.dart';
import 'seller_application_complete_screen.dart';

/// 판매자 전환 1/4 ~ 4/4 (Figma 37:2861, 37:2974, 37:3093, 37:3209).
///
/// 한 화면 안에서 단계를 바꾼다. 네 단계를 [IndexedStack]에 함께 두어 오가도
/// 입력칸·스크롤 위치가 그대로 남는다. 마지막 "심사 신청"이 성공하면 이 화면을
/// 접수 완료 화면([SellerApplicationCompleteScreen])으로 바꾸고, 여는 쪽에는 접수
/// 결과를 돌려준다. 첫 단계에서 뒤로 가면 null로 닫힌다 (안내 화면으로 돌아간다).
class SellerApplicationScreen extends ConsumerWidget {
  const SellerApplicationScreen({super.key});

  /// 화면을 띄우고, 심사 신청을 마쳤으면 접수 결과를 돌려준다.
  ///
  /// 결과가 오는 시점에는 접수 완료 화면이 이미 위에 떠 있다.
  static Future<SellerApplicationReceipt?> open(BuildContext context) {
    return Navigator.of(context).push<SellerApplicationReceipt>(
      MaterialPageRoute(builder: (_) => const SellerApplicationScreen()),
    );
  }

  static final _stepLabels = [
    for (final step in SellerApplicationStep.values) step.label,
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final step = ref.watch(
      sellerApplicationControllerProvider.select((s) => s.step),
    );
    final isSubmitting = ref.watch(
      sellerApplicationControllerProvider.select((s) => s.isSubmitting),
    );

    return PopScope(
      canPop: step == SellerApplicationStep.values.first && !isSubmitting,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) _back(context, ref);
      },
      child: Scaffold(
        backgroundColor: AppColors.backgroundSubtle,
        extendBody: true,
        appBar: AppTopBar.steps(
          title: '판매자 전환',
          step: step.index + 1,
          totalSteps: SellerApplicationStep.values.length,
          onBack: () => _back(context, ref),
        ),
        bottomNavigationBar: AppStepActionBar(
          nextLabel: step == SellerApplicationStep.values.last ? '심사 신청' : '다음',
          isLoading: isSubmitting,
          onBack: () => _back(context, ref),
          onNext: () => _next(context, ref),
        ),
        body: Column(
          children: [
            const SizedBox(height: AppSpacing.s10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s16),
              child: AppStepIndicator(
                labels: _stepLabels,
                currentIndex: step.index,
              ),
            ),
            Expanded(
              child: IndexedStack(
                index: step.index,
                children: [
                  const SellerTypeStep(),
                  const BusinessInfoStep(),
                  ChannelInfoStep(
                    onPickProfilePhoto: () =>
                        _showMessage(context, '프로필 사진 등록은 준비 중입니다.'),
                  ),
                  SettlementTermsStep(
                    onMessage: (message) => _showMessage(context, message),
                    onOpenAgreement: (agreement) => _showMessage(
                      context,
                      '${agreement.label} 보기는 준비 중입니다.',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 이전 단계로. 첫 단계면 화면을 닫는다. 신청 중에는 움직이지 않는다.
  void _back(BuildContext context, WidgetRef ref) {
    final state = ref.read(sellerApplicationControllerProvider);
    if (state.isSubmitting) return;
    FocusScope.of(context).unfocus();
    if (!ref.read(sellerApplicationControllerProvider.notifier).back()) {
      Navigator.of(context).pop();
    }
  }

  Future<void> _next(BuildContext context, WidgetRef ref) async {
    final controller = ref.read(sellerApplicationControllerProvider.notifier);
    final before = ref.read(sellerApplicationControllerProvider);
    if (before.isSubmitting) return;
    FocusScope.of(context).unfocus();

    final issue = controller.next();
    if (issue != null) {
      _showMessage(context, issue.message);
      return;
    }
    if (!before.isLastStep) return;

    final receipt = await controller.submit();
    if (!context.mounted) return;
    if (receipt != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute<void>(
          builder: (_) => SellerApplicationCompleteScreen(receipt: receipt),
        ),
        result: receipt,
      );
    } else {
      _showMessage(context, '심사 신청에 실패했어요. 잠시 후 다시 시도해 주세요.');
    }
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }
}

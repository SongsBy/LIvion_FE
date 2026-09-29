import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:livion/design_system/design_system.dart';

import '../../domain/entities/inventory_listing.dart';
import '../providers/inventory_registration_controller.dart';
import '../widgets/basic_info_step.dart';
import '../widgets/condition_step.dart';
import '../widgets/inventory_registration_ui.dart';
import '../widgets/pricing_step.dart';
import '../widgets/review_step.dart';

/// 재고 등록 1~4단계 (Figma 37:1640, 37:1745, 37:1937, 37:2076).
///
/// 판매자 심사 접수 완료 화면의 "첫 재고 등록하기"로 연다. 네 단계를 [IndexedStack]에
/// 함께 두어 오가도 입력칸·스크롤 위치가 그대로 남는다. 마지막 "검수 요청 및 편성 신청"이
/// 성공하면 접수 결과를 돌려주며 닫히고, 첫 단계에서 뒤로 가면 null로 닫힌다.
class InventoryRegistrationScreen extends ConsumerWidget {
  const InventoryRegistrationScreen({super.key});

  /// 화면을 띄우고, 신청을 마쳤으면 접수 결과를 돌려준다.
  static Future<InventoryListingReceipt?> open(BuildContext context) {
    return Navigator.of(context).push<InventoryListingReceipt>(
      MaterialPageRoute(builder: (_) => const InventoryRegistrationScreen()),
    );
  }

  static final _stepLabels = [
    for (final step in InventoryRegistrationStep.values) step.label,
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final step = ref.watch(
      inventoryRegistrationControllerProvider.select((s) => s.step),
    );
    final isSubmitting = ref.watch(
      inventoryRegistrationControllerProvider.select((s) => s.isSubmitting),
    );
    final consentConfirmed = ref.watch(
      inventoryRegistrationControllerProvider.select((s) => s.consentConfirmed),
    );
    final isLastStep = step == InventoryRegistrationStep.values.last;

    return PopScope(
      canPop: step == InventoryRegistrationStep.values.first && !isSubmitting,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) _back(context, ref);
      },
      child: Scaffold(
        backgroundColor: AppColors.backgroundSubtle,
        extendBody: true,
        appBar: AppTopBar.steps(
          title: '재고 등록',
          step: step.index + 1,
          totalSteps: InventoryRegistrationStep.values.length,
          onBack: () => _back(context, ref),
          actionLabel: '임시저장',
          onAction: () => _showMessage(context, '임시저장은 준비 중입니다.'),
        ),
        bottomNavigationBar: AppStepActionBar(
          nextLabel: isLastStep ? '검수 요청 및 편성 신청' : '다음',
          isLoading: isSubmitting,
          onBack: () => _back(context, ref),
          // 마지막 단계는 변경 안내를 확인해야 신청할 수 있다.
          onNext: isLastStep && !consentConfirmed
              ? null
              : () => _next(context, ref),
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
                  BasicInfoStep(
                    onMessage: (message) => _showMessage(context, message),
                  ),
                  const ConditionStep(),
                  PricingStep(
                    onMessage: (message) => _showMessage(context, message),
                  ),
                  const ReviewStep(),
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
    if (ref.read(inventoryRegistrationControllerProvider).isSubmitting) return;
    FocusScope.of(context).unfocus();
    if (!ref.read(inventoryRegistrationControllerProvider.notifier).back()) {
      Navigator.of(context).pop();
    }
  }

  Future<void> _next(BuildContext context, WidgetRef ref) async {
    final controller = ref.read(
      inventoryRegistrationControllerProvider.notifier,
    );
    final before = ref.read(inventoryRegistrationControllerProvider);
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
      Navigator.of(context).pop(receipt);
    } else {
      _showMessage(context, '신청하지 못했어요. 잠시 후 다시 시도해 주세요.');
    }
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }
}

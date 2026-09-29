import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:livion/design_system/design_system.dart';
import 'package:livion/features/account/presentation/widgets/account_switch_button.dart';

import '../../domain/entities/order_payment.dart';
import '../providers/order_payment_controller.dart';
import '../widgets/payment_complete_view.dart';
import '../widgets/payment_ui.dart';

/// 결제 완료 화면 (Figma 37:5982). 경매 상세에서 입찰해 낙찰되면 열린다.
///
/// 조회 상태(loading / error / data)만 나누고 배치는 [PaymentCompleteView]가 맡는다.
/// 아래 "라이브로 돌아가기"는 [onBackToLive]를 부른다. 배송지 변경·카드 관리·
/// 주문 상세는 화면이 붙기 전이라 준비 중 안내만 보인다.
class PaymentCompleteScreen extends ConsumerWidget {
  const PaymentCompleteScreen({
    super.key,
    required this.orderId,
    this.onBackToLive,
  });

  final String orderId;

  /// 라이브 방송으로 돌아간다. null이면 이 화면만 닫는다.
  final VoidCallback? onBackToLive;

  /// 배송 메모 선택지. 서버 계약이 생기면 서버 목록으로 바꾼다.
  static const List<String> deliveryMemoOptions = [
    '문 앞에 놓아주세요',
    '경비실에 맡겨주세요',
    '택배함에 넣어주세요',
    '배송 전에 연락주세요',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = orderPaymentControllerProvider(orderId);
    final payment = ref.watch(provider);
    final data = payment.value;
    return Scaffold(
      backgroundColor: AppColors.backgroundSubtle,
      extendBody: true,
      appBar: AppTopBar.home(
        onSearch: () {},
        onNotification: () {},
        hasNotification: true,
        profile: const AccountSwitchButton(),
      ),
      bottomNavigationBar: data == null ? null : _bottomBar(context, data),
      body: payment.when(
        loading: () => const AppLoadingView(),
        error: (_, _) => AppErrorView(
          message: '결제 정보를 불러오지 못했어요.\n잠시 후 다시 시도해 주세요.',
          onRetry: () => ref.invalidate(provider),
        ),
        data: (data) => PaymentCompleteView(
          payment: data,
          onChangeAddress: () => _showPending(context, '배송지 변경'),
          onManageCards: () => _showPending(context, '결제 수단 관리'),
          onMemoTap: () => _pickMemo(context, ref, data),
        ),
      ),
    );
  }

  Widget _bottomBar(BuildContext context, OrderPayment data) {
    return AppFrostedBar(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.s16,
        AppSpacing.s8,
        AppSpacing.s16,
        0,
      ),
      // 링크 아래 터치 여백(15)이 있어 Figma 아래 여백 25를 맞춘다.
      minBottom: AppSpacing.s10,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppButton.cta(
            label: '라이브로 돌아가기',
            secondaryLabel: data.nextItemLabel,
            onPressed: () => _backToLive(context),
          ),
          const SizedBox(height: AppSpacing.s4),
          AppTextLink(
            label: '주문 상세 보기',
            onTap: () => _showPending(context, '주문 상세'),
          ),
        ],
      ),
    );
  }

  void _backToLive(BuildContext context) {
    final back = onBackToLive;
    if (back != null) {
      back();
    } else {
      Navigator.of(context).maybePop();
    }
  }

  Future<void> _pickMemo(
    BuildContext context,
    WidgetRef ref,
    OrderPayment data,
  ) async {
    final memo = await showAppSelectSheet(
      context,
      title: '배송 메모',
      options: deliveryMemoOptions,
      selected: data.deliveryMemo,
    );
    if (memo == null || !context.mounted) return;
    final ok = await ref
        .read(orderPaymentControllerProvider(orderId).notifier)
        .updateDeliveryMemo(memo);
    if (!ok && context.mounted) _showMessage(context, '배송 메모를 저장하지 못했어요.');
  }

  void _showPending(BuildContext context, String feature) =>
      _showMessage(context, '$feature 기능은 준비 중입니다.');

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:livion/design_system/design_system.dart';
import 'package:livion/features/account/presentation/widgets/account_switch_button.dart';
import 'package:livion/features/payment/presentation/screens/payment_complete_screen.dart';

import '../../domain/entities/auction_detail.dart';
import '../../domain/entities/bid_outcome.dart';
import '../providers/auction_bid_controller.dart';
import '../providers/auction_detail_provider.dart';
import '../providers/live_pip_controller.dart';
import '../providers/live_pip_state.dart';
import '../widgets/auction_detail_view.dart';
import '../widgets/live_detail_ui.dart';
import '../widgets/live_pip_host.dart';

/// 경매 상세 화면 (Figma 37:6134). 라이브 화면의 입찰 버튼·상품 카드나 채팅·입찰현황
/// 패널의 "경매 상세 보기"를 누르면 열린다.
///
/// 보는 동안 [pipSource] 방송을 작은 창으로 계속 보여 준다 ([LivePipHost], [LivePipController]).
/// iOS는 시스템 PiP 창, Android는 앱 안 미니 플레이어이고 앱을 떠나면 시스템 PiP다.
/// 미니 플레이어를 누르면 라이브 화면으로 돌아가고, 화면을 벗어나면 창을 닫는다.
/// 입찰 버튼은 [AuctionBidController]로 입찰하고, 낙찰되면 이 화면을 결제 완료
/// 화면(Figma 37:5982)으로 바꾼다. 경매가 끝났으므로 작은 창도 함께 닫힌다.
/// 입찰 옵션·자동입찰 변경은 준비 중 안내만 보인다.
class AuctionDetailScreen extends ConsumerStatefulWidget {
  const AuctionDetailScreen({
    super.key,
    required this.liveId,
    required this.itemId,
    this.pipSource,
    this.now,
  });

  final String liveId;
  final String itemId;

  /// 작은 창으로 띄울 방송. null이면 띄우지 않는다.
  final LivePipSource? pipSource;

  /// 순위의 "13초전" 기준 시각. null이면 그리는 시각. 테스트에서 고정한다.
  final DateTime? now;

  @override
  ConsumerState<AuctionDetailScreen> createState() =>
      _AuctionDetailScreenState();
}

class _AuctionDetailScreenState extends ConsumerState<AuctionDetailScreen> {
  AuctionDetailProvider get _detailProvider =>
      auctionDetailProvider(liveId: widget.liveId, itemId: widget.itemId);

  AuctionBidControllerProvider get _bidProvider => auctionBidControllerProvider(
    liveId: widget.liveId,
    itemId: widget.itemId,
  );

  @override
  Widget build(BuildContext context) {
    final detail = ref.watch(_detailProvider);
    final data = detail.value;
    return LivePipHost(
      source: widget.pipSource,
      onReturn: () => Navigator.of(context).maybePop(),
      builder: (context, floatingPlayer) => Scaffold(
        backgroundColor: AppColors.backgroundSubtle,
        extendBody: true,
        appBar: AppTopBar.home(
          onSearch: () {},
          onNotification: () {},
          hasNotification: true,
          profile: const AccountSwitchButton(),
        ),
        bottomNavigationBar: data == null ? null : _bidBar(data),
        body: Stack(
          fit: StackFit.expand,
          children: [
            detail.when(
              loading: () => const AppLoadingView(),
              error: (_, _) => AppErrorView(
                message: '경매 정보를 불러오지 못했어요.\n잠시 후 다시 시도해 주세요.',
                onRetry: () => ref.invalidate(_detailProvider),
              ),
              data: (data) => AuctionDetailView(
                detail: data,
                now: widget.now ?? DateTime.now(),
                onChangeAutoBid: () => _showPending('자동입찰 변경'),
              ),
            ),
            ?floatingPlayer,
          ],
        ),
      ),
    );
  }

  Widget _bidBar(AuctionDetail data) => AuctionBidBar(
    item: data.item,
    paymentNotice: data.paymentNotice,
    isSubmitting: ref.watch(_bidProvider).isLoading,
    onBid: () => _placeBid(data),
    onOptions: () => _showPending('입찰 옵션'),
  );

  Future<void> _placeBid(AuctionDetail data) async {
    final outcome = await ref
        .read(_bidProvider.notifier)
        .submit(data.item.currentPriceWon);
    if (!mounted) return;
    switch (outcome) {
      case BidWon(:final orderId):
        _openPayment(orderId);
      case BidLeading():
        _showMessage('최고가로 입찰했어요. 낙찰되면 바로 결제됩니다.');
      case null:
        // 요청 중 중복 탭은 조용히 무시하고, 실패만 알린다.
        if (ref.read(_bidProvider).hasError) {
          _showMessage('입찰하지 못했어요. 잠시 후 다시 시도해 주세요.');
        }
    }
  }

  void _openPayment(String orderId) {
    final navigator = Navigator.of(context);
    navigator.pushReplacement(
      MaterialPageRoute<void>(
        builder: (_) => PaymentCompleteScreen(
          orderId: orderId,
          onBackToLive: () => navigator.popUntil((route) => route.isFirst),
        ),
      ),
    );
  }

  void _showPending(String feature) => _showMessage('$feature 기능은 준비 중입니다.');

  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }
}

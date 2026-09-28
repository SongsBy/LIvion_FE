import 'package:flutter/material.dart';

import 'package:livion/design_system/design_system.dart';

import '../../domain/entities/live_detail.dart';
import 'live_auction_carousel.dart';
import 'live_bid_action_bar.dart';
import 'live_bid_status_page.dart';
import 'live_chat_page.dart';
import 'live_detail_ui.dart';

/// 패널의 탭.
enum LiveActivityTab { chat, bids }

/// 라이브 화면 위로 솟아오르는 채팅·입찰현황 패널의 내용 (Figma 26:366 · 26:551).
///
/// 손잡이 · 탭 · 페이지(채팅 / 입찰현황, 옆으로 넘길 수 있다) · 상품 카드 ·
/// 입찰 줄 순서다. 패널을 여닫는 일은 [LiveDetailBody]가 맡고, 여기서는
/// 현재 탭만 로컬 상태로 둔다.
class LiveActivityPanel extends StatefulWidget {
  const LiveActivityPanel({
    super.key,
    required this.detail,
    this.initialTab = LiveActivityTab.chat,
    this.now,
    this.onSendMessage,
    this.onAuctionItemTap,
    this.onBid,
    this.onBidOptions,
    this.onOpenAuctionDetail,
    this.onChangeAutoBid,
  });

  final LiveDetail detail;
  final LiveActivityTab initialTab;

  /// 입찰현황의 "13초전" 기준 시각. 테스트에서 고정한다.
  final DateTime? now;
  final ValueChanged<String>? onSendMessage;
  final ValueChanged<LiveAuctionItem>? onAuctionItemTap;
  final ValueChanged<LiveAuctionItem>? onBid;
  final VoidCallback? onBidOptions;
  final VoidCallback? onOpenAuctionDetail;
  final VoidCallback? onChangeAutoBid;

  /// Figma 손잡이: 30×2, 위에서 10.
  static const double handleWidth = AppSpacing.s30;
  static const double _handleHeight = AppBorderWidth.thick;
  static const double _handleTop = AppSpacing.s10;

  /// 손잡이 아래 ~ 탭 위 (Figma 탭 top 30 − 손잡이 bottom 12).
  static const double _handleToTabs = AppSpacing.s18;

  static const Duration _pageDuration = Duration(milliseconds: 250);

  @override
  State<LiveActivityPanel> createState() => _LiveActivityPanelState();
}

class _LiveActivityPanelState extends State<LiveActivityPanel> {
  late final PageController _pageController = PageController(
    initialPage: widget.initialTab.index,
  );
  late LiveActivityTab _tab = widget.initialTab;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _selectTab(int index) {
    final tab = LiveActivityTab.values[index];
    if (tab == _tab) return;
    setState(() => _tab = tab);
    _pageController.animateToPage(
      index,
      duration: LiveActivityPanel._pageDuration,
      curve: Curves.easeOut,
    );
  }

  void _onPageChanged(int index) {
    final tab = LiveActivityTab.values[index];
    if (tab != _tab) setState(() => _tab = tab);
  }

  @override
  Widget build(BuildContext context) {
    final detail = widget.detail;
    final current = detail.currentAuctionItem;
    return SafeArea(
      top: false,
      minimum: const EdgeInsets.only(bottom: AppSpacing.s20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: LiveActivityPanel._handleTop),
          const _Handle(),
          const SizedBox(height: LiveActivityPanel._handleToTabs),
          AppTabBar(
            items: [
              AppTabItem(label: '채팅', count: detail.chatCountLabel),
              AppTabItem(label: '입찰현황', count: detail.bidCountLabel),
            ],
            selectedIndex: _tab.index,
            onChanged: _selectTab,
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              children: [
                LiveChatPage(
                  messages: detail.recentChats,
                  onSend: widget.onSendMessage,
                ),
                LiveBidStatusPage(
                  status: detail.bidStatus,
                  now: widget.now,
                  onOpenAuctionDetail: widget.onOpenAuctionDetail,
                  onChangeAutoBid: widget.onChangeAutoBid,
                ),
              ],
            ),
          ),
          LiveAuctionCarousel(
            items: detail.auctionItems,
            onItemTap: widget.onAuctionItemTap,
          ),
          const SizedBox(height: AppSpacing.s12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s16),
            child: LiveBidActionBar(
              item: current,
              paymentNotice: detail.paymentNotice,
              noticeColor: AppColors.textSecondary,
              onBid: current == null || widget.onBid == null
                  ? null
                  : () => widget.onBid!(current),
              onOptions: widget.onBidOptions,
            ),
          ),
        ],
      ),
    );
  }
}

class _Handle extends StatelessWidget {
  const _Handle();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: LiveActivityPanel.handleWidth,
        height: LiveActivityPanel._handleHeight,
        decoration: const BoxDecoration(
          color: AppColors.backgroundPlaceholder,
          borderRadius: AppRadius.r4All,
        ),
      ),
    );
  }
}

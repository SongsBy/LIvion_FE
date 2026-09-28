import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:livion/design_system/design_system.dart';

import '../../domain/entities/live_detail.dart';
import 'live_activity_panel.dart';
import 'live_detail_view.dart';

/// 조회가 끝난 라이브 화면 본문: [LiveDetailView] 위에 채팅·입찰현황 패널이 솟아오른다.
///
/// "채팅 · 입찰현황" 알약을 누르면 [SlidingUpPanel]이 열리고, 손잡이·탭 영역을
/// 아래로 끌거나 영상 영역을 누르면 닫힌다. 패널이 닫혀 있을 때는 패널 내용을
/// 만들지 않아 영상 위 화면만 그린다.
class LiveDetailBody extends StatefulWidget {
  const LiveDetailBody({
    super.key,
    required this.detail,
    this.now,
    this.onBack,
    this.onFollowTap,
    this.onShare,
    this.onMore,
    this.onMinimize,
    this.onSendMessage,
    this.onAuctionItemTap,
    this.onBid,
    this.onBidOptions,
    this.onOpenAuctionDetail,
    this.onChangeAutoBid,
  });

  final LiveDetail detail;

  /// 입찰현황의 "13초전" 기준 시각. 테스트에서 고정한다.
  final DateTime? now;
  final VoidCallback? onBack;
  final VoidCallback? onFollowTap;
  final VoidCallback? onShare;
  final VoidCallback? onMore;
  final VoidCallback? onMinimize;
  final ValueChanged<String>? onSendMessage;
  final ValueChanged<LiveAuctionItem>? onAuctionItemTap;
  final ValueChanged<LiveAuctionItem>? onBid;
  final VoidCallback? onBidOptions;
  final VoidCallback? onOpenAuctionDetail;
  final VoidCallback? onChangeAutoBid;

  /// Figma: 패널 높이 568 / 화면 815.
  static const double panelHeightFactor = 568 / 815;

  @override
  State<LiveDetailBody> createState() => _LiveDetailBodyState();
}

class _LiveDetailBodyState extends State<LiveDetailBody> {
  final PanelController _panel = PanelController();

  /// 패널이 조금이라도 올라와 있으면 true. 내용은 이때만 만든다.
  bool _panelVisible = false;

  void _onPanelSlide(double position) {
    final visible = position > 0;
    if (visible != _panelVisible) setState(() => _panelVisible = visible);
  }

  void _openPanel() {
    if (_panel.isAttached) _panel.open();
  }

  void _closePanel() {
    if (_panel.isAttached && _panel.isPanelOpen) _panel.close();
  }

  void _onPanelClosed() => FocusManager.instance.primaryFocus?.unfocus();

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        // 키보드가 올라오면 본문이 줄어들므로 패널도 남은 높이에 맞춘다.
        final available = constraints.maxHeight - media.padding.top;
        final maxHeight = math.max(
          0.0,
          math.min(
            media.size.height * LiveDetailBody.panelHeightFactor,
            available,
          ),
        );
        return PopScope(
          canPop: !_panelVisible,
          onPopInvokedWithResult: (didPop, _) {
            if (!didPop) _closePanel();
          },
          child: SlidingUpPanel(
            controller: _panel,
            minHeight: 0,
            maxHeight: maxHeight,
            color: AppColors.backgroundSubtle,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(AppRadius.r12),
            ),
            boxShadow: const [],
            backdropEnabled: true,
            backdropOpacity: 0,
            backdropTapClosesPanel: true,
            onPanelSlide: _onPanelSlide,
            onPanelClosed: _onPanelClosed,
            panel: _panelVisible
                ? LiveActivityPanel(
                    detail: widget.detail,
                    now: widget.now,
                    onSendMessage: widget.onSendMessage,
                    onAuctionItemTap: widget.onAuctionItemTap,
                    onBid: widget.onBid,
                    onBidOptions: widget.onBidOptions,
                    onOpenAuctionDetail: widget.onOpenAuctionDetail,
                    onChangeAutoBid: widget.onChangeAutoBid,
                  )
                : const SizedBox.shrink(),
            body: LiveDetailView(
              detail: widget.detail,
              onBack: widget.onBack,
              onFollowTap: widget.onFollowTap,
              onShare: widget.onShare,
              onMore: widget.onMore,
              onMinimize: widget.onMinimize,
              onOpenActivity: _openPanel,
              onAuctionItemTap: widget.onAuctionItemTap,
              onBid: widget.onBid,
              onBidOptions: widget.onBidOptions,
            ),
          ),
        );
      },
    );
  }
}

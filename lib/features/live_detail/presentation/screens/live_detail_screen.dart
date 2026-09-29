import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:livion/design_system/design_system.dart';

import '../../domain/entities/live_detail.dart';
import '../providers/live_detail_controller.dart';
import '../providers/live_pip_state.dart';
import '../providers/minimized_live.dart';
import '../widgets/live_detail_body.dart';
import '../widgets/live_detail_ui.dart';
import 'auction_detail_screen.dart';

/// 라이브 방송 화면. 하단 내비 LIVE 탭의 본문이자, 홈의 공식 방송·인기 급상승·
/// 마감 D-7·전체 라이브 카드를 눌렀을 때 도착하는 화면이다.
///
/// 조회 상태(loading / error / data)만 나누고 실제 배치는 [LiveDetailBody]가 맡는다.
/// 입찰 버튼·상품 카드(패널이 열리기 전·후 모두)와 패널의 "경매 상세 보기"는 [AuctionDetailScreen]을
/// 열고, 그동안 이 방송이 작은 창(PiP)으로 계속 보인다. 공유·입찰 옵션 등은
/// 준비 중 안내만 보인다.
///
/// 우측 상단 "화면 축소"는 이 방송을 [MinimizedLive]에 넣어 작은 창으로 띄우고
/// [onMinimize]로 화면을 비킨다. 루트 탭에서는 홈 탭을 보인다.
class LiveDetailScreen extends ConsumerWidget {
  const LiveDetailScreen({super.key, this.onBack, this.onMinimize});

  /// 상단 뒤로가기. 루트 탭에서는 홈 탭으로 돌아간다.
  final VoidCallback? onBack;

  /// 방송을 작은 창으로 넘긴 뒤 이 화면 대신 보일 곳으로 옮긴다.
  /// null이면 축소할 곳이 없으므로 준비 중 안내만 보인다.
  final VoidCallback? onMinimize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detail = ref.watch(liveDetailControllerProvider);
    return detail.when(
      loading: () => const AppLoadingView(),
      error: (_, _) => AppErrorView(
        message: '방송 정보를 불러오지 못했어요.\n잠시 후 다시 시도해 주세요.',
        onRetry: () => ref.invalidate(liveDetailControllerProvider),
      ),
      data: (data) => LiveDetailBody(
        detail: data,
        onBack: onBack,
        onFollowTap: () => _toggleFollow(context, ref),
        onShare: () => _showPending(context, '공유'),
        onMore: () => _showPending(context, '더보기'),
        onMinimize: () => _minimize(context, ref, data),
        onSendMessage: (text) => _sendChat(context, ref, text),
        onAuctionItemTap: (item) => _openAuctionDetail(context, data, item),
        onBid: (item) => _openAuctionDetail(context, data, item),
        onBidOptions: () => _showPending(context, '입찰 옵션'),
        onOpenAuctionDetail: () => _openCurrentAuctionDetail(context, data),
        onChangeAutoBid: () => _showPending(context, '자동입찰 변경'),
      ),
    );
  }

  void _minimize(BuildContext context, WidgetRef ref, LiveDetail live) {
    final leave = onMinimize;
    if (leave == null) {
      _showPending(context, '화면 축소');
      return;
    }
    ref.read(minimizedLiveProvider.notifier).minimize(_pipSource(live));
    leave();
  }

  LivePipSource _pipSource(LiveDetail live) =>
      LivePipSource(liveId: live.id, broadcastImage: live.broadcastImage);

  void _openCurrentAuctionDetail(BuildContext context, LiveDetail live) {
    final item = live.currentAuctionItem;
    if (item == null) {
      _showMessage(context, '진행 중인 경매 상품이 없어요.');
      return;
    }
    _openAuctionDetail(context, live, item);
  }

  void _openAuctionDetail(
    BuildContext context,
    LiveDetail live,
    LiveAuctionItem item,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => AuctionDetailScreen(
          liveId: live.id,
          itemId: item.id,
          pipSource: _pipSource(live),
        ),
      ),
    );
  }

  Future<void> _toggleFollow(BuildContext context, WidgetRef ref) async {
    final ok = await ref
        .read(liveDetailControllerProvider.notifier)
        .toggleFollow();
    if (!ok && context.mounted) _showMessage(context, '팔로우를 변경하지 못했어요.');
  }

  Future<void> _sendChat(
    BuildContext context,
    WidgetRef ref,
    String text,
  ) async {
    final ok = await ref
        .read(liveDetailControllerProvider.notifier)
        .sendChat(text);
    if (!ok && context.mounted) _showMessage(context, '메시지를 보내지 못했어요.');
  }

  void _showPending(BuildContext context, String feature) =>
      _showMessage(context, '$feature 기능은 준비 중입니다.');

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }
}

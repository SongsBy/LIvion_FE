import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:livion/design_system/design_system.dart';

import '../providers/live_detail_controller.dart';
import '../widgets/live_detail_body.dart';

/// 라이브 방송 화면. 하단 내비 LIVE 탭의 본문이자, 홈의 공식 방송·인기 급상승·
/// 마감 D-7·전체 라이브 카드를 눌렀을 때 도착하는 화면이다.
///
/// 조회 상태(loading / error / data)만 나누고 실제 배치는 [LiveDetailBody]가 맡는다.
/// 채팅·입찰현황 패널은 붙어 있고, 입찰·공유·경매 상세·결제는 Figma 화면
/// (경매 상세, 결제)이 붙기 전이라 준비 중 안내만 보인다.
class LiveDetailScreen extends ConsumerWidget {
  const LiveDetailScreen({super.key, this.onBack});

  /// 상단 뒤로가기. 루트 탭에서는 홈 탭으로 돌아간다.
  final VoidCallback? onBack;

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
        onMinimize: () => _showPending(context, '화면 축소'),
        onSendMessage: (text) => _sendChat(context, ref, text),
        onAuctionItemTap: (_) => _showPending(context, '경매 상세'),
        onBid: (_) => _showPending(context, '입찰'),
        onBidOptions: () => _showPending(context, '입찰 옵션'),
        onOpenAuctionDetail: () => _showPending(context, '경매 상세'),
        onChangeAutoBid: () => _showPending(context, '자동입찰 변경'),
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

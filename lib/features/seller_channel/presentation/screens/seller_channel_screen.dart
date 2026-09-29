import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:livion/design_system/design_system.dart';

import '../../domain/entities/seller_channel.dart';
import '../providers/seller_channel_controller.dart';
import '../widgets/channel_live_now_section.dart';
import '../widgets/channel_profile_section.dart';
import '../widgets/channel_tabs.dart';
import '../widgets/post_comments_sheet.dart';
import '../widgets/seller_channel_ui.dart';

/// 판매자 페이지 (Figma 37:2253 홈 탭, 37:2702 콘텐츠 탭, 37:2441 댓글).
///
/// 판매자 계정으로 전환하면 "마이" 탭에 보인다. 프로필 · 지금 방송 중 · 탭 칩 아래로
/// 고른 탭 내용이 한 스크롤로 이어진다. 라이브·상품을 누르면 [onOpenLive]로 방송 id를
/// 넘긴다. 문의·공유는 화면이 붙기 전이라 준비 중 안내만 보인다.
class SellerChannelScreen extends ConsumerStatefulWidget {
  const SellerChannelScreen({
    super.key,
    required this.sellerId,
    required this.onOpenLive,
  });

  final String sellerId;
  final ValueChanged<String> onOpenLive;

  @override
  ConsumerState<SellerChannelScreen> createState() =>
      _SellerChannelScreenState();
}

class _SellerChannelScreenState extends ConsumerState<SellerChannelScreen> {
  SellerChannelTab _tab = SellerChannelTab.home;

  /// Figma 세로 간격: 버튼 줄 → 띠 10, 띠 → 방송 20, 방송 → 띠 20,
  /// 띠 → 탭 칩 15, 탭 칩 → 탭 내용 30, 내용 아래 40.
  static const double _afterActions = AppSpacing.s10;
  static const double _aroundLive = AppSpacing.s20;
  static const double _bandToChips = AppSpacing.s15;
  static const double _chipsToContent = AppSpacing.s30;
  static const double _bottom = AppSpacing.s40;

  SellerChannelController get _controller =>
      ref.read(sellerChannelControllerProvider(widget.sellerId).notifier);

  @override
  Widget build(BuildContext context) {
    final provider = sellerChannelControllerProvider(widget.sellerId);
    final channel = ref.watch(provider);
    return ColoredBox(
      color: AppColors.backgroundDefault,
      child: channel.when(
        data: _content,
        loading: () => const AppLoadingView(),
        error: (_, _) => AppErrorView(
          message: '판매자 페이지를 불러오지 못했어요.',
          onRetry: () => ref.invalidate(provider),
        ),
      ),
    );
  }

  Widget _content(SellerChannel channel) {
    final postActions = ChannelPostActions(
      onLike: (post) => _like(post),
      onComment: (post) => showPostCommentsSheet(
        context,
        postId: post.id,
        onCountChanged: (count) => _controller.setCommentCount(post.id, count),
      ),
      onShare: (_) => _showMessage('공유는 준비 중입니다.'),
    );
    final live = channel.liveNow;
    final labels = [for (final t in SellerChannelTab.values) t.label];

    return ListView(
      padding: const EdgeInsets.only(bottom: _bottom),
      children: [
        ChannelProfileSection(
          channel: channel,
          onToggleFollow: _toggleFollow,
          onMessage: () => _showMessage('판매자 문의는 준비 중입니다.'),
        ),
        const SizedBox(height: _afterActions),
        const AppDivider.band(),
        if (live != null) ...[
          const SizedBox(height: _aroundLive),
          ChannelLiveNowSection(live: live, onOpenLive: widget.onOpenLive),
          const SizedBox(height: _aroundLive),
          const AppDivider.band(),
        ],
        const SizedBox(height: _bandToChips),
        AppChoiceChips(
          options: labels,
          selected: _tab.label,
          onChanged: (label) => setState(
            () => _tab = SellerChannelTab.values.firstWhere(
              (t) => t.label == label,
            ),
          ),
        ),
        SizedBox(
          height: _tab == SellerChannelTab.home || _tab == SellerChannelTab.info
              // 제목 줄로 시작하는 탭은 제목 줄 터치 여백을 뺀다.
              ? _chipsToContent - AppSectionHeader.touchInset
              : _chipsToContent,
        ),
        switch (_tab) {
          SellerChannelTab.home => ChannelHomeTab(
            channel: channel,
            postActions: postActions,
            onOpenLive: widget.onOpenLive,
            onSelectTab: (tab) => setState(() => _tab = tab),
          ),
          SellerChannelTab.contents => ChannelContentsTab(
            posts: channel.posts,
            postActions: postActions,
          ),
          SellerChannelTab.lives => ChannelLivesTab(
            channel: channel,
            onOpenLive: widget.onOpenLive,
          ),
          SellerChannelTab.info => ChannelNoticeSection(channel: channel),
        },
      ],
    );
  }

  Future<void> _toggleFollow() async {
    if (!await _controller.toggleFollow() && mounted) {
      _showMessage('팔로우를 바꾸지 못했어요. 잠시 후 다시 시도해 주세요.');
    }
  }

  Future<void> _like(SellerPost post) async {
    if (!await _controller.toggleLike(post.id) && mounted) {
      _showMessage('좋아요를 반영하지 못했어요. 잠시 후 다시 시도해 주세요.');
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }
}

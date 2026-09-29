import 'package:flutter/material.dart';

import 'package:livion/design_system/design_system.dart';
import 'package:livion/features/home/domain/entities/live_summary.dart';
import 'package:livion/features/home/presentation/widgets/live_summary_ui.dart';

import '../../domain/entities/seller_channel.dart';
import 'seller_channel_ui.dart';

/// 게시글 카드에서 일어나는 동작. 화면이 컨트롤러·시트와 연결한다.
class ChannelPostActions {
  const ChannelPostActions({
    required this.onLike,
    required this.onComment,
    required this.onShare,
  });

  final ValueChanged<SellerPost> onLike;
  final ValueChanged<SellerPost> onComment;
  final ValueChanged<SellerPost> onShare;
}

/// 게시글 하나를 디자인 시스템 [AppPostCard]로 그린다.
class ChannelPostCard extends StatelessWidget {
  const ChannelPostCard({super.key, required this.post, required this.actions});

  final SellerPost post;
  final ChannelPostActions actions;

  @override
  Widget build(BuildContext context) {
    return AppPostCard(
      authorName: post.authorName,
      authorAvatar: resolveAppImageOrNull(post.authorAvatar),
      dateLabel: formatPostDate(post.publishedAt),
      image: resolveAppImageOrNull(post.image),
      body: post.body,
      likeCount: post.likeCount,
      commentCount: post.commentCount,
      liked: post.isLiked,
      onLike: () => actions.onLike(post),
      onComment: () => actions.onComment(post),
      onShare: () => actions.onShare(post),
    );
  }
}

/// [LiveSummary]를 판매자 페이지용 [LiveCard.compact]로 그린다.
class ChannelLiveCard extends StatelessWidget {
  const ChannelLiveCard({
    super.key,
    required this.live,
    required this.isOnAir,
    required this.onTap,
    this.width = LiveCard.defaultWidth,
  });

  final LiveSummary live;
  final bool isOnAir;
  final VoidCallback onTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    return LiveCard.compact(
      title: live.title,
      viewers: live.viewersLabel,
      tags: live.tags,
      product: live.productLine,
      thumbnail: resolveAppImageOrNull(live.thumbnail),
      isLive: isOnAir,
      showBookmark: live.isBookmarked,
      width: width,
      onTap: onTap,
    );
  }
}

/// 섹션 제목 줄 아래로 내용이 오기까지. Figma 20에서 제목 줄 터치 여백을 뺀다.
const double _headerToContent = AppSpacing.s20 - AppSectionHeader.touchInset;

/// Figma: 홈 탭 섹션 사이 60 (다음 제목 줄 터치 여백을 뺀다).
const double _sectionGap = 60 - AppSectionHeader.touchInset;

/// "홈" 탭: 콘텐츠 가로 목록 · 라이브 가로 목록 · 배송·반품·교환·A/S.
class ChannelHomeTab extends StatelessWidget {
  const ChannelHomeTab({
    super.key,
    required this.channel,
    required this.postActions,
    required this.onOpenLive,
    required this.onSelectTab,
  });

  final SellerChannel channel;
  final ChannelPostActions postActions;
  final ValueChanged<String> onOpenLive;
  final ValueChanged<SellerChannelTab> onSelectTab;

  /// Figma 가로 게시글 카드 폭과 간격.
  static const double _postWidth = 320;
  static const double _postGap = AppSpacing.s15;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppSectionHeader(
          title: SellerChannelTab.contents.label,
          actionLabel: '전체 보기',
          onAction: () => onSelectTab(SellerChannelTab.contents),
        ),
        const SizedBox(height: _headerToContent),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var i = 0; i < channel.posts.length; i++) ...[
                if (i > 0) const SizedBox(width: _postGap),
                SizedBox(
                  width: _postWidth,
                  child: ChannelPostCard(
                    post: channel.posts[i],
                    actions: postActions,
                  ),
                ),
              ],
            ],
          ),
        ),
        const SizedBox(height: _sectionGap),
        AppSectionHeader(
          title: SellerChannelTab.lives.label,
          actionLabel: '전체 보기',
          onAction: () => onSelectTab(SellerChannelTab.lives),
        ),
        const SizedBox(height: _headerToContent),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var i = 0; i < channel.lives.length; i++) ...[
                if (i > 0) const SizedBox(width: AppSpacing.s12),
                ChannelLiveCard(
                  live: channel.lives[i],
                  isOnAir: channel.lives[i].id == channel.liveNow?.liveId,
                  onTap: () => onOpenLive(channel.lives[i].id),
                ),
              ],
            ],
          ),
        ),
        const SizedBox(height: _sectionGap),
        ChannelNoticeSection(
          channel: channel,
          onSeeAll: () => onSelectTab(SellerChannelTab.info),
        ),
      ],
    );
  }
}

/// "배송·반품·교환·A/S" 제목 + 안내 목록. [onSeeAll]이 없으면 "전체 보기"를 숨긴다.
class ChannelNoticeSection extends StatelessWidget {
  const ChannelNoticeSection({super.key, required this.channel, this.onSeeAll});

  final SellerChannel channel;
  final VoidCallback? onSeeAll;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppSectionHeader(
          title: '배송·반품·교환·A/S',
          actionLabel: onSeeAll == null ? null : '전체 보기',
          onAction: onSeeAll,
        ),
        const SizedBox(height: _headerToContent),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s16),
          child: AppNoticeList(items: channel.noticeItems),
        ),
      ],
    );
  }
}

/// "콘텐츠" 탭: 게시글 세로 목록 (Figma 37:2702). 게시글 사이 40.
class ChannelContentsTab extends StatelessWidget {
  const ChannelContentsTab({
    super.key,
    required this.posts,
    required this.postActions,
  });

  final List<SellerPost> posts;
  final ChannelPostActions postActions;

  static const double _postGap = AppSpacing.s40;

  @override
  Widget build(BuildContext context) {
    if (posts.isEmpty) return const AppEmptyView(message: '아직 올린 콘텐츠가 없어요.');
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (var i = 0; i < posts.length; i++) ...[
            if (i > 0) const SizedBox(height: _postGap),
            ChannelPostCard(post: posts[i], actions: postActions),
          ],
        ],
      ),
    );
  }
}

/// "라이브" 탭: 라이브 카드 2열. Figma 시안이 없어 홈 전체 라이브 격자 간격을 따른다.
class ChannelLivesTab extends StatelessWidget {
  const ChannelLivesTab({
    super.key,
    required this.channel,
    required this.onOpenLive,
  });

  final SellerChannel channel;
  final ValueChanged<String> onOpenLive;

  static const int _columns = 2;
  static const double _columnGap = AppSpacing.s12;
  static const double _rowGap = AppSpacing.s24;

  @override
  Widget build(BuildContext context) {
    if (channel.lives.isEmpty) {
      return const AppEmptyView(message: '아직 진행한 라이브가 없어요.');
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s16),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width =
              (constraints.maxWidth - _columnGap * (_columns - 1)) / _columns;
          return Wrap(
            spacing: _columnGap,
            runSpacing: _rowGap,
            children: [
              for (final live in channel.lives)
                ChannelLiveCard(
                  live: live,
                  isOnAir: live.id == channel.liveNow?.liveId,
                  width: width,
                  onTap: () => onOpenLive(live.id),
                ),
            ],
          );
        },
      ),
    );
  }
}

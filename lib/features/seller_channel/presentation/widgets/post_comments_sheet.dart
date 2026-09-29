import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:livion/design_system/design_system.dart';

import '../providers/post_comments_controller.dart';
import '../providers/seller_channel_dependencies.dart';
import 'seller_channel_ui.dart';

/// 게시글 댓글 시트를 띄운다 (Figma 판매자 페이지_댓글 37:2441).
///
/// 댓글을 남기면 [onCountChanged]로 바뀐 댓글 수를 알린다.
Future<void> showPostCommentsSheet(
  BuildContext context, {
  required String postId,
  required ValueChanged<int> onCountChanged,
}) => showAppPanelSheet<void>(
  context,
  builder: (_) =>
      PostCommentsSheet(postId: postId, onCountChanged: onCountChanged),
);

/// 댓글 시트 내용: "댓글 N" · 댓글 목록 · 입력줄.
class PostCommentsSheet extends ConsumerStatefulWidget {
  const PostCommentsSheet({
    super.key,
    required this.postId,
    required this.onCountChanged,
  });

  final String postId;
  final ValueChanged<int> onCountChanged;

  @override
  ConsumerState<PostCommentsSheet> createState() => _PostCommentsSheetState();
}

class _PostCommentsSheetState extends ConsumerState<PostCommentsSheet> {
  final _scroll = ScrollController();

  /// Figma: 손잡이 아래 → 제목 18, 제목 → 목록 36, 댓글 사이 15, 입력줄 아래 20.
  static const double _titleTop = AppSpacing.s18;
  static const double _titleToList = AppSpacing.s16 * 2 + AppSpacing.s4;
  static const double _commentGap = AppSpacing.s15;
  static const double _inputBottom = AppSpacing.s20;

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  Future<void> _send(String message) async {
    final count = await ref
        .read(postCommentsControllerProvider(widget.postId).notifier)
        .send(message);
    if (!mounted) return;
    if (count == null) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(content: Text('댓글을 남기지 못했어요. 다시 시도해 주세요.')),
        );
      return;
    }
    widget.onCountChanged(count);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scroll.hasClients) {
        _scroll.animateTo(
          _scroll.position.maxScrollExtent,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = postCommentsControllerProvider(widget.postId);
    final comments = ref.watch(provider);
    final now = ref.watch(sellerChannelClockProvider)();
    final data = comments.value;
    final pointStyle = AppTextStyles.pretendardH2.copyWith(
      color: AppColors.textPoint,
    );
    final bottomSafe = MediaQuery.paddingOf(context).bottom;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: _titleTop),
          Semantics(
            header: true,
            label: '댓글 ${data?.comments.length ?? 0}개',
            excludeSemantics: true,
            child: Row(
              children: [
                Text('댓글', style: pointStyle),
                const SizedBox(width: AppSpacing.s4),
                Text(
                  '${data?.comments.length ?? 0}',
                  style: AppTextStyles.archivoBody1.copyWith(
                    color: AppColors.textPoint,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: _titleToList),
          Expanded(
            child: comments.when(
              data: (state) => state.comments.isEmpty
                  ? const AppEmptyView(message: '첫 댓글을 남겨 보세요.')
                  : ListView.separated(
                      controller: _scroll,
                      padding: EdgeInsets.zero,
                      itemCount: state.comments.length,
                      separatorBuilder: (_, _) =>
                          const SizedBox(height: _commentGap),
                      itemBuilder: (context, i) {
                        final c = state.comments[i];
                        return CommentRow(
                          name: c.authorName,
                          message: c.message,
                          time: formatCommentTime(c.writtenAt, now),
                          avatarImage: resolveAppImageOrNull(c.authorAvatar),
                          isSeller: c.isSeller,
                          isReply: c.isReply,
                        );
                      },
                    ),
              loading: () => const AppLoadingView(),
              error: (_, _) => AppErrorView(
                message: '댓글을 불러오지 못했어요.',
                onRetry: () => ref.invalidate(provider),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.s10),
          AppMessageField(
            onSend: _send,
            enabled: data != null && !data.isSending,
          ),
          SizedBox(height: _inputBottom + bottomSafe),
        ],
      ),
    );
  }
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/seller_channel.dart';
import 'seller_channel_dependencies.dart';

part 'post_comments_controller.freezed.dart';
part 'post_comments_controller.g.dart';

/// 댓글 시트 상태. 보내는 중에도 이미 불러온 댓글을 그대로 보인다.
@freezed
abstract class PostCommentsState with _$PostCommentsState {
  const factory PostCommentsState({
    required List<PostComment> comments,
    @Default(false) bool isSending,
  }) = _PostCommentsState;
}

Duration? _noRetry(int retryCount, Object error) => null;

/// 게시글 하나의 댓글. 시트를 닫으면 버린다.
@Riverpod(retry: _noRetry)
class PostCommentsController extends _$PostCommentsController {
  @override
  Future<PostCommentsState> build(String postId) async => PostCommentsState(
    comments: await ref
        .watch(sellerChannelRepositoryProvider)
        .fetchComments(postId),
  );

  /// 댓글을 남긴다. 성공하면 남긴 뒤의 댓글 수, 실패하거나 보낼 수 없으면 null.
  Future<int?> send(String message) async {
    final current = state.value;
    final text = message.trim();
    if (current == null || current.isSending || text.isEmpty) return null;
    state = AsyncData(current.copyWith(isSending: true));
    try {
      final comment = await ref
          .read(sellerChannelRepositoryProvider)
          .addComment(postId, text);
      if (!ref.mounted) return null;
      final comments = [...current.comments, comment];
      state = AsyncData(PostCommentsState(comments: comments));
      return comments.length;
    } catch (_) {
      if (ref.mounted) state = AsyncData(current);
      return null;
    }
  }
}

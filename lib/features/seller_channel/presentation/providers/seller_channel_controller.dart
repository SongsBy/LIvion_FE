import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/seller_channel.dart';
import 'seller_channel_dependencies.dart';

part 'seller_channel_controller.g.dart';

/// 실패 시 Riverpod 자동 재시도를 끈다. 다시 시도는 화면 버튼으로만 한다.
Duration? _noRetry(int retryCount, Object error) => null;

/// 판매자 페이지 한 곳. 화면을 벗어나면 버린다.
///
/// 팔로우·좋아요는 누르자마자 화면에 반영하고, 서버가 실패하면 되돌린 뒤 false를
/// 돌려준다. 같은 대상에 요청이 가는 중이면 다시 보내지 않는다.
@Riverpod(retry: _noRetry)
class SellerChannelController extends _$SellerChannelController {
  bool _followPending = false;
  final Set<String> _likePending = {};

  @override
  Future<SellerChannel> build(String sellerId) =>
      ref.watch(sellerChannelRepositoryProvider).fetchChannel(sellerId);

  Future<bool> toggleFollow() async {
    final current = state.value;
    if (current == null || _followPending) return false;
    final following = !current.isFollowing;
    _followPending = true;
    state = AsyncData(
      current.copyWith(
        isFollowing: following,
        followerCount: current.followerCount + (following ? 1 : -1),
      ),
    );
    try {
      final count = await ref
          .read(sellerChannelRepositoryProvider)
          .setFollowing(sellerId, following: following);
      if (!ref.mounted) return true;
      final latest = state.value;
      if (latest != null) {
        state = AsyncData(latest.copyWith(followerCount: count));
      }
      return true;
    } catch (_) {
      if (ref.mounted) state = AsyncData(current);
      return false;
    } finally {
      _followPending = false;
    }
  }

  Future<bool> toggleLike(String postId) async {
    final current = state.value;
    final post = current?.posts.where((p) => p.id == postId).firstOrNull;
    if (current == null || post == null || !_likePending.add(postId)) {
      return false;
    }
    final liked = !post.isLiked;
    _replacePost(
      post.copyWith(
        isLiked: liked,
        likeCount: post.likeCount + (liked ? 1 : -1),
      ),
    );
    try {
      final count = await ref
          .read(sellerChannelRepositoryProvider)
          .setPostLiked(postId, liked: liked);
      if (ref.mounted) _updatePost(postId, (p) => p.copyWith(likeCount: count));
      return true;
    } catch (_) {
      if (ref.mounted) _replacePost(post);
      return false;
    } finally {
      _likePending.remove(postId);
    }
  }

  /// 댓글 시트에서 댓글을 남기면 게시글 댓글 수를 맞춘다.
  void setCommentCount(String postId, int count) =>
      _updatePost(postId, (p) => p.copyWith(commentCount: count));

  void _replacePost(SellerPost post) => _updatePost(post.id, (_) => post);

  void _updatePost(String postId, SellerPost Function(SellerPost) update) {
    final current = state.value;
    if (current == null) return;
    state = AsyncData(
      current.copyWith(
        posts: [for (final p in current.posts) p.id == postId ? update(p) : p],
      ),
    );
  }
}

import '../../domain/entities/seller_channel.dart';
import '../../domain/repositories/seller_channel_repository.dart';
import '../demo/seller_channel_demo_data.dart';

/// 데모 발표용 [SellerChannelRepository]. 팔로우·좋아요·댓글을 앱이 떠 있는 동안
/// 메모리에 둔다. 어떤 판매자 id든 한빛식품 페이지를 돌려준다.
///
/// 새 댓글은 판매자 본인(판매자 계정으로 보는 페이지)이 쓴 것으로 남긴다.
final class DemoSellerChannelRepository implements SellerChannelRepository {
  DemoSellerChannelRepository({
    this.latency = const Duration(milliseconds: 300),
    this.clock,
  });

  final Duration latency;

  /// 날짜 계산용. null이면 지금 시각.
  final DateTime Function()? clock;

  DateTime get _now => (clock ?? DateTime.now)();

  final Map<String, SellerChannel> _channels = {};
  final Map<String, List<PostComment>> _comments = {};
  int _commentSeq = 0;

  Future<void> _wait() async {
    if (latency > Duration.zero) await Future<void>.delayed(latency);
  }

  SellerChannel _channel(String sellerId) => _channels.putIfAbsent(
    sellerId,
    () => SellerChannelDemoData.channel(sellerId, _now),
  );

  List<PostComment> _commentsOf(String postId) => _comments.putIfAbsent(
    postId,
    () => SellerChannelDemoData.comments(postId, _now),
  );

  @override
  Future<SellerChannel> fetchChannel(String sellerId) async {
    await _wait();
    final channel = _channel(sellerId);
    // 게시글 댓글 수는 지금까지 남긴 댓글에 맞춘다.
    return channel.copyWith(
      posts: [
        for (final p in channel.posts)
          p.copyWith(commentCount: _commentsOf(p.id).length),
      ],
    );
  }

  @override
  Future<int> setFollowing(String sellerId, {required bool following}) async {
    await _wait();
    final channel = _channel(sellerId);
    if (channel.isFollowing == following) return channel.followerCount;
    final count = channel.followerCount + (following ? 1 : -1);
    _channels[sellerId] = channel.copyWith(
      isFollowing: following,
      followerCount: count,
    );
    return count;
  }

  @override
  Future<int> setPostLiked(String postId, {required bool liked}) async {
    await _wait();
    for (final entry in _channels.entries) {
      final posts = entry.value.posts;
      final index = posts.indexWhere((p) => p.id == postId);
      if (index < 0) continue;
      final post = posts[index];
      if (post.isLiked == liked) return post.likeCount;
      final updated = post.copyWith(
        isLiked: liked,
        likeCount: post.likeCount + (liked ? 1 : -1),
      );
      _channels[entry.key] = entry.value.copyWith(
        posts: [...posts]..[index] = updated,
      );
      return updated.likeCount;
    }
    throw StateError('Unknown post $postId');
  }

  @override
  Future<List<PostComment>> fetchComments(String postId) async {
    await _wait();
    return List.unmodifiable(_commentsOf(postId));
  }

  @override
  Future<PostComment> addComment(String postId, String message) async {
    await _wait();
    final comment = PostComment(
      id: '$postId-new-${++_commentSeq}',
      authorName: SellerChannelDemoData.sellerName,
      authorAvatar: SellerChannelDemoData.sellerAvatar,
      writtenAt: _now,
      message: message,
      isSeller: true,
    );
    _commentsOf(postId).add(comment);
    return comment;
  }
}

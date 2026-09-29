import '../entities/seller_channel.dart';

/// 판매자 페이지 데이터 계약.
///
/// 지금은 데모 구현만 있고, API가 확정되면 data/에 remote 구현을 추가해
/// `seller_channel_dependencies.dart`에서만 교체한다.
abstract interface class SellerChannelRepository {
  Future<SellerChannel> fetchChannel(String sellerId);

  /// 팔로우를 켜거나 끄고 바뀐 팔로워 수를 돌려준다.
  Future<int> setFollowing(String sellerId, {required bool following});

  /// 게시글 좋아요를 켜거나 끄고 바뀐 좋아요 수를 돌려준다.
  Future<int> setPostLiked(String postId, {required bool liked});

  /// 게시글 댓글 (오래된 것부터).
  Future<List<PostComment>> fetchComments(String postId);

  /// 지금 계정으로 댓글을 남기고 저장된 댓글을 돌려준다.
  Future<PostComment> addComment(String postId, String message);
}

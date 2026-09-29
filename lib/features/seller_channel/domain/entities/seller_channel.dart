import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:livion/features/home/domain/entities/live_summary.dart';

part 'seller_channel.freezed.dart';

/// 판매자 페이지 한 곳의 내용 (Figma 판매자 페이지 37:2253).
///
/// 라이브 목록은 홈과 같은 [LiveSummary] 계약을 쓴다.
@freezed
abstract class SellerChannel with _$SellerChannel {
  const factory SellerChannel({
    required String id,
    required String name,

    /// 에셋 경로 또는 URL.
    String? avatar,
    String? cover,
    required String intro,
    required int followerCount,
    @Default(false) bool isFollowing,

    /// 지금 방송 중인 라이브. 없으면 null.
    SellerLiveNow? liveNow,
    @Default(<SellerPost>[]) List<SellerPost> posts,
    @Default(<LiveSummary>[]) List<LiveSummary> lives,

    /// 배송·반품·교환·A/S 안내.
    @Default(<SellerNotice>[]) List<SellerNotice> notices,
  }) = _SellerChannel;
}

/// 지금 방송 중인 라이브와 경매 상품.
@freezed
abstract class SellerLiveNow with _$SellerLiveNow {
  const factory SellerLiveNow({
    required String liveId,
    required int viewerCount,

    /// 지금까지 들어온 입찰 수.
    required int bidCount,
    required List<SellerLiveProduct> products,
  }) = _SellerLiveNow;
}

/// 방송 중 경매 상품 한 개. 금액은 원 단위 정수.
@freezed
abstract class SellerLiveProduct with _$SellerLiveProduct {
  const factory SellerLiveProduct({
    required String name,
    required InspectionGrade grade,
    required int quantity,

    /// 소비기한까지 남은 날. null이면 표시하지 않는다.
    int? dDay,
    required int startPriceWon,

    /// 현재가.
    required int priceWon,
    double? multiplier,

    /// 경매 마감까지 남은 초. null이면 표시하지 않는다.
    int? remainingSeconds,
    String? thumbnail,
  }) = _SellerLiveProduct;
}

/// 판매자 게시글.
@freezed
abstract class SellerPost with _$SellerPost {
  const factory SellerPost({
    required String id,
    required String authorName,
    String? authorAvatar,
    required DateTime publishedAt,
    String? image,
    required String body,
    required int likeCount,
    required int commentCount,
    @Default(false) bool isLiked,
  }) = _SellerPost;
}

/// 게시글 댓글. [isReply]는 판매자가 바로 위 댓글에 단 답글이다.
@freezed
abstract class PostComment with _$PostComment {
  const factory PostComment({
    required String id,
    required String authorName,
    String? authorAvatar,
    required DateTime writtenAt,
    required String message,
    @Default(false) bool isSeller,
    @Default(false) bool isReply,
  }) = _PostComment;
}

/// 안내 항목 (배송, 반품·교환 …).
@freezed
abstract class SellerNotice with _$SellerNotice {
  const factory SellerNotice({required String title, required String body}) =
      _SellerNotice;
}

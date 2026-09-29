import 'package:freezed_annotation/freezed_annotation.dart';

import 'live_detail.dart';

part 'auction_detail.freezed.dart';

/// 경매 상세 화면(Figma 37:6134) 한 번 조회로 받는 묶음.
///
/// 라이브 화면의 상품 카드나 "경매 상세 보기"에서 들어온다. 상품 정보·입찰 현황·
/// 결제수단 안내는 서버 값으로 바뀌고, 화면은 이 entity만 안다.
@freezed
abstract class AuctionDetail with _$AuctionDetail {
  const factory AuctionDetail({
    /// 상품을 올린 판매자. 이름 옆 "공식" 뱃지는 [LiveSeller.isOfficial]을 따른다.
    required LiveSeller seller,
    required LiveAuctionItem item,

    /// 이 상품의 입찰 현황. 아직 입찰이 시작되지 않았으면 null.
    LiveBidStatus? bidStatus,

    /// 낙찰 시 결제할 등록 결제수단 표시 ("국민 ****1234"). null이면 안내 문구를 숨긴다.
    String? paymentMethodLabel,
  }) = _AuctionDetail;
}

import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:livion/shared/domain/inspection_grade.dart';

part 'live_detail.freezed.dart';

/// 방송 판매자.
@freezed
abstract class LiveSeller with _$LiveSeller {
  const factory LiveSeller({
    required String id,
    required String name,

    /// 에셋 경로 또는 URL.
    String? avatar,

    /// Livion 공식 방송이면 이름 옆에 "공식" 뱃지가 붙는다.
    @Default(false) bool isOfficial,
    @Default(false) bool isFollowing,
  }) = _LiveSeller;
}

/// 영상 위·채팅 패널에 보이는 채팅 한 줄.
@freezed
abstract class LiveChatMessage with _$LiveChatMessage {
  const factory LiveChatMessage({
    required String id,
    required String senderName,
    String? senderAvatar,
    required String message,

    /// 보낸 시각(기기 로컬). 채팅 패널에서 "오후 8:14"로 보이고, null이면 숨긴다.
    DateTime? sentAt,

    /// 판매자가 보낸 메시지면 이름 옆에 "판매자" 뱃지가 붙는다.
    @Default(false) bool isSeller,

    /// 바로 앞 메시지에 대한 답글이면 꺾쇠를 붙여 들여쓴다.
    @Default(false) bool isReply,
  }) = _LiveChatMessage;
}

/// 방송 중 경매에 올라온 상품.
@freezed
abstract class LiveAuctionItem with _$LiveAuctionItem {
  const LiveAuctionItem._();

  const factory LiveAuctionItem({
    required String id,
    required String name,
    required int quantity,
    required InspectionGrade grade,

    /// 시작가 (원, 정수).
    required int startPriceWon,

    /// 현재 최고 입찰가 (원, 정수).
    required int currentPriceWon,

    /// 마감까지 남은 일수. null이면 D-day 뱃지를 보이지 않는다.
    int? dDay,

    /// 이번 입찰 마감까지 남은 초. 서버 시각 계약을 따르며 데모에서는 고정값이다.
    required int remainingSeconds,

    /// 에셋 경로 또는 URL.
    String? thumbnail,

    /// 경매 상세의 상품 사진들 (에셋 경로 또는 URL). 비어 있으면 [thumbnail]을 쓴다.
    @Default(<String>[]) List<String> images,

    /// 보관·포장 상태 ("냉동", "미개봉"). 경매 상세에서 " · "로 이어 보인다.
    @Default(<String>[]) List<String> conditions,

    /// 소비기한 (날짜만 의미 있다). null이면 숨긴다.
    DateTime? expiryDate,

    /// 검수 완료일 (날짜만 의미 있다). null이면 "검수완료" 뱃지를 숨긴다.
    DateTime? inspectedAt,
  }) = _LiveAuctionItem;

  /// 시작가 대비 현재가 배수. 시작가가 0 이하면 계산할 수 없어 null.
  double? get multiplier =>
      startPriceWon <= 0 ? null : currentPriceWon / startPriceWon;
}

/// 입찰가 추이 한 점. 경매 시작 기준 경과 초와 그 시점의 최고가.
@freezed
abstract class LiveBidPoint with _$LiveBidPoint {
  const factory LiveBidPoint({
    required int elapsedSeconds,
    required int priceWon,
  }) = _LiveBidPoint;
}

/// 입찰 순위 한 줄. "2위 김*빈 7,400원 13초전".
@freezed
abstract class LiveBidEntry with _$LiveBidEntry {
  const factory LiveBidEntry({
    required int rank,

    /// 서버가 마스킹해 내려주는 표시용 이름.
    required String bidderName,
    required int priceWon,
    required DateTime placedAt,
  }) = _LiveBidEntry;
}

/// 지금 입찰을 받는 상품의 입찰 현황 (패널 "입찰현황" 탭).
@freezed
abstract class LiveBidStatus with _$LiveBidStatus {
  const LiveBidStatus._();

  const factory LiveBidStatus({
    required int startPriceWon,
    required int currentPriceWon,
    required int participantCount,
    required int totalBidCount,

    /// 경매 시작 후 경과 초. 추이 차트의 오른쪽 끝(지금)이다.
    required int elapsedSeconds,

    /// 입찰가 추이. 경과 초 오름차순.
    @Default(<LiveBidPoint>[]) List<LiveBidPoint> priceHistory,

    /// 마감 직전 입찰로 연장이 시작된 경과 초. null이면 연장이 없었다.
    int? extensionStartSeconds,

    /// 한 번 연장될 때 늘어나는 초. [extensionStartSeconds]가 있을 때만 의미 있다.
    int? extensionSeconds,

    /// 내가 넣은 입찰. 없으면 null.
    LiveBidEntry? myBid,

    /// 자동입찰 최대가. 설정하지 않았으면 null.
    int? maxAutoBidWon,

    /// 순위 목록. rank 오름차순.
    @Default(<LiveBidEntry>[]) List<LiveBidEntry> ranking,

    /// 유사 품목의 평균 낙찰 배수 (시작가 대비). 경매 상세의 추이 참고 문구에 쓴다.
    double? similarAverageMultiplier,

    /// 유사 품목의 최근 낙찰가 (원, 정수).
    int? recentWinningPriceWon,
  }) = _LiveBidStatus;

  /// 시작가 대비 현재가 배수. 시작가가 0 이하면 null.
  double? get multiplier =>
      startPriceWon <= 0 ? null : currentPriceWon / startPriceWon;
}

/// 라이브 방송 화면 한 번 조회로 받는 묶음.
///
/// API 연동 시 상품·채팅·가격·방송 화면·판매자 모두 서버 값으로 바뀐다.
/// 화면은 이 entity만 알고 데모 데이터의 구조를 알지 않는다.
@freezed
abstract class LiveDetail with _$LiveDetail {
  const factory LiveDetail({
    required String id,
    required LiveSeller seller,
    required String title,

    /// 방송 화면. 데모 단계에서는 사진 에셋이고, 영상이 붙으면 스트림 URL로 바뀐다.
    String? broadcastImage,
    required int viewers,
    required int chatCount,
    required int bidCount,

    /// 영상 위·채팅 패널에 보이는 최근 채팅. 오래된 것이 앞이다.
    @Default(<LiveChatMessage>[]) List<LiveChatMessage> recentChats,

    /// 경매 상품. 첫 항목이 지금 입찰을 받는 상품이다.
    @Default(<LiveAuctionItem>[]) List<LiveAuctionItem> auctionItems,

    /// 지금 입찰을 받는 상품의 입찰 현황. 진행 중인 경매가 없으면 null.
    LiveBidStatus? bidStatus,

    /// 낙찰 시 결제할 등록 결제수단 표시 ("국민 ****1234"). null이면 안내 문구를 숨긴다.
    String? paymentMethodLabel,
  }) = _LiveDetail;
}

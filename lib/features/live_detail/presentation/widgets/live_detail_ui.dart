import 'package:livion/core/formatting/duration_format.dart';
import 'package:livion/core/formatting/number_format.dart';
import 'package:livion/core/formatting/time_format.dart';

import '../../domain/entities/live_detail.dart';

/// domain 값을 화면 문자열로 바꾼다. 문구를 한 곳에 모아 API 연동 후에도 유지한다.
extension LiveDetailUi on LiveDetail {
  String get viewersLabel => formatThousands(viewers);
  String get chatCountLabel => formatThousands(chatCount);
  String get bidCountLabel => formatThousands(bidCount);

  /// 지금 입찰을 받는 상품. 없으면 null.
  LiveAuctionItem? get currentAuctionItem =>
      auctionItems.isEmpty ? null : auctionItems.first;

  /// "낙찰 시 등록 카드(국민 ****1234)로 즉시 결제 · 에스크로 예치"
  String? get paymentNotice => paymentMethodLabel == null
      ? null
      : '낙찰 시 등록 카드($paymentMethodLabel)로 즉시 결제 · 에스크로 예치';
}

extension LiveChatMessageUi on LiveChatMessage {
  /// "오후 8:14". 시각이 없으면 null.
  String? get timeLabel => sentAt == null ? null : formatKoreanClock(sentAt!);
}

extension LiveAuctionItemUi on LiveAuctionItem {
  String get quantityLabel => '수량 $quantity개';
  String? get dDayLabel => dDay == null ? null : 'D-$dDay';
  String get startPriceLabel => '시작가 ${formatThousands(startPriceWon)}원';
  String get priceLabel => formatThousands(currentPriceWon);
  String? get multiplierLabel =>
      multiplier == null ? null : formatMultiplier(multiplier!);
  String get remainingTimeLabel => formatMinutesSeconds(remainingSeconds);

  /// CTA 문구. 입찰 단위·증가 규칙은 서버 계약 확정 전이라 현재가를 그대로 쓴다.
  String get bidCtaLabel => '${formatThousands(currentPriceWon)}원에 입찰';
}

extension LiveBidStatusUi on LiveBidStatus {
  /// "7,900"
  String get currentPriceLabel => formatThousands(currentPriceWon);

  /// "2.6배". 시작가가 없으면 null.
  String? get multiplierLabel =>
      multiplier == null ? null : '${formatMultiplier(multiplier!)}배';

  /// "시작가 3,000원"
  String get startPriceLabel => '시작가 ${formatThousands(startPriceWon)}원';
  String get participantLabel => formatThousands(participantCount);
  String get totalBidLabel => formatThousands(totalBidCount);

  /// "+30초 연장". 연장이 없었으면 null.
  String? get extensionLabel =>
      extensionStartSeconds == null || extensionSeconds == null
      ? null
      : '+$extensionSeconds초 연장';

  /// "최대가 자동입찰 9,000원". 설정하지 않았으면 null.
  String? get maxAutoBidLabel => maxAutoBidWon == null
      ? null
      : '최대가 자동입찰 ${formatThousands(maxAutoBidWon!)}원';
}

extension LiveBidEntryUi on LiveBidEntry {
  /// "7,400원"
  String get priceLabel => '${formatThousands(priceWon)}원';

  /// "13초전". [now]는 화면이 그려지는 시각이다.
  String timeAgoLabel(DateTime now) => formatTimeAgo(now.difference(placedAt));
}

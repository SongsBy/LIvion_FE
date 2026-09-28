import 'package:livion/shared/domain/inspection_grade.dart';

import '../../domain/entities/live_detail.dart';
import 'live_detail_demo_assets.dart';

/// Figma 라이브 디테일(node 26:238)·채팅(26:366)·입찰현황(26:551)의 내용을 그대로 옮긴 데모 데이터.
///
/// 어떤 라이브를 골라도 같은 내용을 돌려주고 id만 바뀐다. API가 붙으면 제거한다.
abstract final class LiveDetailDemoData {
  /// 홈의 "Livion 공식 방송" id와 같다. LIVE 탭으로 바로 들어오면 이 방송을 보인다.
  static const String featuredLiveId = 'official-1';

  /// 채팅 시각의 날짜 부분. 화면에는 시각만 보인다.
  static final DateTime _chatDay = DateTime(2026, 9, 28);

  static DateTime _at(int hour, int minute) =>
      DateTime(_chatDay.year, _chatDay.month, _chatDay.day, hour, minute);

  /// [now]는 "3초전" 같은 상대 시각의 기준이다. 테스트에서 고정한다.
  static LiveDetail build({String liveId = featuredLiveId, DateTime? now}) {
    final reference = now ?? DateTime.now();
    return LiveDetail(
      id: liveId,
      seller: const LiveSeller(
        id: 'seller-hanbit',
        name: '한빛식품',
        avatar: LiveDetailDemoAssets.avatarHanbit,
        isOfficial: true,
      ),
      title: '화요일 공식 방송 · 냉동식품 5종 급처분',
      broadcastImage: LiveDetailDemoAssets.broadcastDumpling,
      viewers: 1204,
      chatCount: 1204,
      bidCount: 14,
      // 마지막 4줄이 영상 위 오버레이의 Figma(26:238) 원본이고, 앞쪽은 위로 스크롤했을 때
      // 보이는 이전 채팅이다. 채팅 패널(26:366)의 이*림·HACCP 답글은 그 앞에 둔다.
      recentChats: [
        LiveChatMessage(
          id: 'chat-a',
          senderName: '이*수',
          message: '오늘 주문하면 언제 와요?',
          sentAt: _at(20, 2),
        ),
        LiveChatMessage(
          id: 'chat-b',
          senderName: '한빛식품',
          senderAvatar: LiveDetailDemoAssets.avatarHanbit,
          message: '내일 새벽 도착합니다!',
          sentAt: _at(20, 3),
          isSeller: true,
          isReply: true,
        ),
        LiveChatMessage(
          id: 'chat-c',
          senderName: '박*영',
          message: '가격 진짜 좋네요',
          sentAt: _at(20, 5),
        ),
        LiveChatMessage(
          id: 'chat-d',
          senderName: '최*훈',
          message: '한 봉지에 몇 개 들었어요?',
          sentAt: _at(20, 8),
        ),
        LiveChatMessage(
          id: 'chat-e',
          senderName: '한빛식품',
          senderAvatar: LiveDetailDemoAssets.avatarHanbit,
          message: '약 40개 들어 있어요',
          sentAt: _at(20, 9),
          isSeller: true,
          isReply: true,
        ),
        LiveChatMessage(
          id: 'chat-f',
          senderName: '정*아',
          message: '지난주에 샀는데 맛있어요',
          sentAt: _at(20, 11),
        ),
        LiveChatMessage(
          id: 'chat-5',
          senderName: '이*림',
          message: '음 이거 정말 괜찮은 것 맞나요?',
          sentAt: _at(20, 12),
        ),
        LiveChatMessage(
          id: 'chat-6',
          senderName: '한빛식품',
          senderAvatar: LiveDetailDemoAssets.avatarHanbit,
          message: 'HACCP 인증 받은 믿을 수 있는 제품입니다:D',
          sentAt: _at(20, 13),
          isSeller: true,
          isReply: true,
        ),
        LiveChatMessage(
          id: 'chat-1',
          senderName: '김*륜',
          message: '냉동실 필수템이죠',
          sentAt: _at(20, 14),
        ),
        LiveChatMessage(
          id: 'chat-2',
          senderName: '김*빈',
          senderAvatar: LiveDetailDemoAssets.chatAvatarKim,
          message: '많이 매울까요?',
          sentAt: _at(20, 20),
        ),
        LiveChatMessage(
          id: 'chat-3',
          senderName: '한빛식품',
          senderAvatar: LiveDetailDemoAssets.avatarHanbit,
          message: '전혀 맵지 않습니다!',
          sentAt: _at(20, 21),
          isSeller: true,
          isReply: true,
        ),
        LiveChatMessage(
          id: 'chat-4',
          senderName: '황*필',
          message: '와 이거 사야해요',
          sentAt: _at(20, 30),
        ),
      ],
      // Figma 원본이 같은 카드를 두 장 보여 주므로 그대로 둔다.
      auctionItems: const [
        LiveAuctionItem(
          id: 'item-1',
          name: '냉동만두 1.2kg',
          quantity: 100,
          grade: InspectionGrade.a,
          startPriceWon: 3000,
          currentPriceWon: 8400,
          dDay: 12,
          remainingSeconds: 47,
          thumbnail: LiveDetailDemoAssets.productDumpling,
        ),
        LiveAuctionItem(
          id: 'item-2',
          name: '냉동만두 1.2kg',
          quantity: 100,
          grade: InspectionGrade.a,
          startPriceWon: 3000,
          currentPriceWon: 8400,
          dDay: 12,
          remainingSeconds: 47,
          thumbnail: LiveDetailDemoAssets.productDumpling,
        ),
      ],
      // Figma 입찰현황(26:551) 원본. 현재가 7,900은 상품 카드의 8,400과 다르지만 원본대로 둔다.
      bidStatus: LiveBidStatus(
        startPriceWon: 3000,
        currentPriceWon: 7900,
        participantCount: 14,
        totalBidCount: 32,
        elapsedSeconds: 330,
        priceHistory: const [
          LiveBidPoint(elapsedSeconds: 0, priceWon: 3000),
          LiveBidPoint(elapsedSeconds: 37, priceWon: 3700),
          LiveBidPoint(elapsedSeconds: 78, priceWon: 4500),
          LiveBidPoint(elapsedSeconds: 120, priceWon: 5300),
          LiveBidPoint(elapsedSeconds: 165, priceWon: 6100),
          LiveBidPoint(elapsedSeconds: 203, priceWon: 6900),
          LiveBidPoint(elapsedSeconds: 273, priceWon: 7400),
          LiveBidPoint(elapsedSeconds: 296, priceWon: 7900),
        ],
        extensionStartSeconds: 254,
        extensionSeconds: 30,
        myBid: LiveBidEntry(
          rank: 2,
          bidderName: '김*빈',
          priceWon: 7400,
          placedAt: reference.subtract(const Duration(seconds: 13)),
        ),
        maxAutoBidWon: 9000,
        ranking: [
          LiveBidEntry(
            rank: 1,
            bidderName: '홍*동',
            priceWon: 7900,
            placedAt: reference.subtract(const Duration(seconds: 3)),
          ),
          LiveBidEntry(
            rank: 2,
            bidderName: '김*빈',
            priceWon: 7400,
            placedAt: reference.subtract(const Duration(seconds: 13)),
          ),
          LiveBidEntry(
            rank: 3,
            bidderName: '박*수',
            priceWon: 7400,
            placedAt: reference.subtract(const Duration(seconds: 23)),
          ),
        ],
      ),
      paymentMethodLabel: '국민 ****1234',
    );
  }
}

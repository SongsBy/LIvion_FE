import 'package:livion/features/home/data/demo/home_demo_assets.dart';
import 'package:livion/features/home/domain/entities/live_summary.dart';

import '../../domain/entities/seller_channel.dart';

/// 데모 발표용 판매자 페이지 (Figma 37:2253 · 37:2702 · 37:2441, 한빛식품).
///
/// 날짜는 [now] 기준으로 만든다. 라이브 id는 홈 데모와 같아 누르면 같은 방송이 열린다.
abstract final class SellerChannelDemoData {
  static const String _dir = 'asset/images/demo';
  static const String cover = '$_dir/seller_cover.jpg';
  static const String postVegetables = '$_dir/post_vegetables.jpg';
  static const String postDumplings = '$_dir/post_dumplings.jpg';
  static const String postPersimmons = '$_dir/post_persimmons.jpg';
  static const String commentAvatarLee = '$_dir/comment_avatar_lee.jpg';
  static const String commentAvatarKim = '$_dir/chat_avatar_kim.jpg';

  static const String sellerName = '한빛식품';

  /// Figma 판매자 페이지 프로필은 로고가 아닌 인물 사진이다.
  static const String sellerAvatar = HomeDemoAssets.avatarHanbit;

  static SellerChannel channel(String sellerId, DateTime now) => SellerChannel(
    id: sellerId,
    name: sellerName,
    avatar: sellerAvatar,
    cover: cover,
    intro:
        '산지와 제조처에서 엄선한 신선식품과 간편식을 라이브로 소개합니다. '
        '상품의 상태와 특징을 직접 확인하고 합리적인 가격으로 만나보세요.',
    followerCount: 1435,
    // 방송 중인 라이브는 아래 라이브 목록의 첫 카드(LIVE 뱃지)와 같다.
    liveNow: const SellerLiveNow(
      liveId: 'trend-1',
      viewerCount: 1204,
      bidCount: 14,
      products: [
        SellerLiveProduct(
          name: '냉동만두 1.2kg',
          grade: InspectionGrade.a,
          quantity: 100,
          dDay: 12,
          startPriceWon: 3000,
          priceWon: 8400,
          multiplier: 2.8,
          remainingSeconds: 47,
          thumbnail: HomeDemoAssets.productDumpling,
        ),
        SellerLiveProduct(
          name: '냉동만두 1.2kg',
          grade: InspectionGrade.a,
          quantity: 100,
          dDay: 12,
          startPriceWon: 3000,
          priceWon: 8400,
          multiplier: 2.8,
          remainingSeconds: 47,
          thumbnail: HomeDemoAssets.productDumpling,
        ),
      ],
    ),
    posts: [
      _post(
        'post-vegetables',
        now.subtract(const Duration(days: 1)),
        postVegetables,
        '오늘도 신선하게 입고됐어요 🥬\n'
            '아침에 들어온 채소들 상태 확인 완료했습니다. '
            '오늘 방송에서 실제 상품 상태도 함께 보여드릴게요.',
      ),
      _post(
        'post-dumplings',
        now.subtract(const Duration(days: 2)),
        postDumplings,
        '오늘의 추천 상품은 냉동만두입니다 🥟\n'
            '간단하게 한 끼 챙기기 좋은 제품으로 준비했어요. '
            '방송에서 구성과 크기까지 자세히 소개해드릴게요.',
      ),
      _post(
        'post-persimmons',
        now.subtract(const Duration(days: 4)),
        postPersimmons,
        '이번 주 과일 입고 완료 🍓\n'
            '당도와 상태를 확인해 좋은 상품들로 준비했습니다. '
            '수량이 많지 않아 조기 품절될 수 있어요.',
      ),
    ],
    lives: const [
      LiveSummary(
        id: 'trend-1',
        sellerName: sellerName,
        title: '(마감 임박) 견과믹스 특가 판매',
        thumbnail: HomeDemoAssets.liveNuts,
        viewers: 1204,
        category: '푸드',
        dDay: 12,
        isBookmarked: true,
        product: LiveProduct(
          name: '견과믹스 20봉',
          grade: InspectionGrade.b,
          priceWon: 4500,
          multiplier: 2.6,
          thumbnail: HomeDemoAssets.productNuts,
        ),
      ),
      LiveSummary(
        id: 'trend-2',
        sellerName: sellerName,
        title: '냉동 식품 급처분 - 간편식품 피자 4판',
        thumbnail: HomeDemoAssets.livePizza,
        viewers: 0,
        category: '푸드',
        dDay: 5,
        isClosingSoon: true,
        isBookmarked: true,
        product: LiveProduct(
          name: '냉동피자 4판',
          grade: InspectionGrade.a,
          priceWon: 6000,
          multiplier: 1.45,
          thumbnail: HomeDemoAssets.productPizza,
        ),
      ),
      LiveSummary(
        id: 'trend-3',
        sellerName: sellerName,
        title: '북경식 로스팅 오리 7,500 초특가',
        thumbnail: HomeDemoAssets.liveDuck,
        viewers: 0,
        category: '푸드',
        dDay: 25,
        isClosingSoon: true,
        isBookmarked: true,
        product: LiveProduct(
          name: '북경식 로스팅 오리',
          grade: InspectionGrade.a,
          priceWon: 126000,
          multiplier: 134,
          thumbnail: HomeDemoAssets.productDuck,
        ),
      ),
    ],
    notices: const [
      SellerNotice(
        title: '배송',
        body:
            '주문 확인 후 택배로 배송됩니다. 신선식품의 경우 상품 특성에 따라 '
            '냉장 또는 냉동 포장되어 출고됩니다.',
      ),
      SellerNotice(
        title: '배송비',
        body:
            '기본 배송비 3,000원이며, 50,000원 이상 구매 시 무료배송됩니다. '
            '제주 및 도서산간 지역은 추가 배송비가 발생할 수 있습니다.',
      ),
      SellerNotice(
        title: '배송출발',
        body:
            '평일 오후 2시 이전 결제 완료 건은 당일 출고되며, 이후 주문 건은 '
            '다음 영업일에 순차적으로 출고됩니다.',
      ),
      SellerNotice(
        title: '반품·교환',
        body:
            '상품 수령 후 7일 이내 신청 가능합니다. 단, 신선식품은 단순 변심에 의한 '
            '반품·교환이 제한될 수 있으며 상품 이상 또는 오배송의 경우 판매자가 '
            '배송비를 부담합니다.',
      ),
      SellerNotice(
        title: 'A/S 연락처',
        body: '한빛식품 고객센터 02-1234-5678 / 평일 09:00~18:00',
      ),
      SellerNotice(
        title: 'A/S 안내',
        body:
            '상품 이상 또는 배송 중 파손이 확인된 경우 고객센터를 통해 접수해 주세요. '
            '사진 확인 후 교환·환불 등 필요한 절차를 안내드립니다.',
      ),
    ],
  );

  static SellerPost _post(
    String id,
    DateTime publishedAt,
    String image,
    String body,
  ) => SellerPost(
    id: id,
    authorName: sellerName,
    authorAvatar: sellerAvatar,
    publishedAt: publishedAt,
    image: image,
    body: body,
    likeCount: 0,
    commentCount: comments(id, publishedAt).length,
  );

  /// Figma 37:2441의 댓글. 모든 게시글이 같은 대화를 보인다.
  /// 앞 세 개는 오늘 저녁, 나머지는 게시일에 달렸다.
  static List<PostComment> comments(String postId, DateTime now) {
    final evening = DateTime(now.year, now.month, now.day, 20);
    final earlier = now.subtract(const Duration(days: 1));
    return [
      PostComment(
        id: '$postId-c1',
        authorName: '박*륜',
        writtenAt: evening.add(const Duration(minutes: 14)),
        message: '냉동실 필수템이죠',
      ),
      PostComment(
        id: '$postId-c2',
        authorName: '김*빈',
        authorAvatar: commentAvatarKim,
        writtenAt: evening.add(const Duration(minutes: 20)),
        message: '정말 맵지 않고 맛있더라구요. 잘먹었습니다.',
      ),
      PostComment(
        id: '$postId-c3',
        authorName: sellerName,
        authorAvatar: sellerAvatar,
        writtenAt: evening.add(const Duration(minutes: 21)),
        message: '전혀 맵지 않으셨다니 다행입니다. 저희 아이들도 잘먹을 수 있는 맛이에요.',
        isSeller: true,
        isReply: true,
      ),
      PostComment(
        id: '$postId-c4',
        authorName: '김*지',
        writtenAt: earlier,
        message: '와 이거 사야해요',
      ),
      PostComment(
        id: '$postId-c5',
        authorName: '이*림',
        authorAvatar: commentAvatarLee,
        writtenAt: earlier,
        message: '음 이거 정말 괜찮은 것 맞나요?',
      ),
      PostComment(
        id: '$postId-c6',
        authorName: sellerName,
        authorAvatar: sellerAvatar,
        writtenAt: earlier,
        message: 'HACCP 인증 받은 믿을 수 있는 제품입니다:D',
        isSeller: true,
        isReply: true,
      ),
    ];
  }
}

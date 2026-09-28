import 'package:flutter/material.dart';

import 'package:livion/design_system/design_system.dart';
import 'package:livion/shared/presentation/inspection_grade_ui.dart';

import '../../domain/entities/live_detail.dart';
import 'live_detail_ui.dart';

/// 경매 상품 카드(329×96) 가로 목록. 다음 카드가 오른쪽에 살짝 보인다.
class LiveAuctionCarousel extends StatelessWidget {
  const LiveAuctionCarousel({super.key, required this.items, this.onItemTap});

  final List<LiveAuctionItem> items;
  final ValueChanged<LiveAuctionItem>? onItemTap;

  static const double cardWidth = 329;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const SizedBox(
        height: ProductCard.height,
        child: AppEmptyView(message: '진행 중인 경매 상품이 없어요.'),
      );
    }
    return SizedBox(
      height: ProductCard.height,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s16),
        itemCount: items.length,
        separatorBuilder: (_, _) => const SizedBox(width: AppSpacing.s8),
        itemBuilder: (_, i) => SizedBox(
          width: cardWidth,
          child: LiveAuctionItemCard(
            item: items[i],
            onTap: onItemTap == null ? null : () => onItemTap!(items[i]),
          ),
        ),
      ),
    );
  }
}

/// [LiveAuctionItem] 하나를 디자인 시스템 [ProductCard]로 그린다.
class LiveAuctionItemCard extends StatelessWidget {
  const LiveAuctionItemCard({super.key, required this.item, this.onTap});

  final LiveAuctionItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ProductCard(
      name: item.name,
      grade: item.grade.toAppGrade(),
      price: item.priceLabel,
      quantityLabel: item.quantityLabel,
      dDay: item.dDayLabel,
      startPriceLabel: item.startPriceLabel,
      multiplier: item.multiplierLabel,
      remainingTime: item.remainingTimeLabel,
      thumbnail: resolveAppImageOrNull(item.thumbnail),
      onTap: onTap,
    );
  }
}

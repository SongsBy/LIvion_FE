import 'package:flutter/material.dart';

import 'package:livion/design_system/design_system.dart';
import 'package:livion/shared/presentation/inspection_grade_ui.dart';

import '../../domain/entities/live_detail.dart';
import 'auction_image_gallery.dart';
import 'live_detail_ui.dart';

/// 경매 상세 위쪽 흰 영역: 사진 줄 · 판매자 · 상품명과 뱃지 · 상태 줄 (Figma 37:6134).
class AuctionItemHeader extends StatelessWidget {
  const AuctionItemHeader({
    super.key,
    required this.seller,
    required this.item,
  });

  final LiveSeller seller;
  final LiveAuctionItem item;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.backgroundDefault,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.s20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AuctionImageGallery(
              images: item.galleryImages.map(resolveAppImage).toList(),
            ),
            const SizedBox(height: AppSpacing.s15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _SellerRow(seller: seller),
                  const SizedBox(height: AppSpacing.s18),
                  _TitleRow(item: item),
                  const SizedBox(height: AppSpacing.s14),
                  _AttributeLine(item: item),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// "한빛마을 [공식]"
class _SellerRow extends StatelessWidget {
  const _SellerRow({required this.seller});

  final LiveSeller seller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Text(
            seller.name,
            style: AppTextStyles.pretendardCaption1Medium.copyWith(
              color: AppColors.textSecondary,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (seller.isOfficial) ...[
          const SizedBox(width: AppSpacing.s4),
          const AppBadge.seller(text: '공식'),
        ],
      ],
    );
  }
}

/// "냉동만두 1.2kg  [A] [D-12] [9/22 검수완료]"
class _TitleRow extends StatelessWidget {
  const _TitleRow({required this.item});

  final LiveAuctionItem item;

  @override
  Widget build(BuildContext context) {
    final dDay = item.dDayLabel;
    final inspected = item.inspectedLabel;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Flexible(
          child: Text(
            item.name,
            style: AppTextStyles.pretendardH1,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: AppSpacing.s8),
        GradeBadge(item.grade.toAppGrade()),
        if (dDay != null) ...[
          const SizedBox(width: AppSpacing.s4),
          AppBadge.neutral(dDay),
        ],
        if (inspected != null) ...[
          const SizedBox(width: AppSpacing.s4),
          AppBadge.neutral(inspected),
        ],
      ],
    );
  }
}

/// "냉동 · 미개봉 | 수량 100개 | 소비기한 2026.09.26" — 좁으면 다음 줄로 넘긴다.
class _AttributeLine extends StatelessWidget {
  const _AttributeLine({required this.item});

  final LiveAuctionItem item;

  @override
  Widget build(BuildContext context) {
    final parts = [?item.conditionLabel, item.quantityLabel, ?item.expiryLabel];
    final style = AppTextStyles.pretendardCaption1Medium.copyWith(
      color: AppColors.textSecondary,
    );
    return Wrap(
      spacing: AppSpacing.s6,
      runSpacing: AppSpacing.s6,
      children: [
        for (var i = 0; i < parts.length; i++) ...[
          if (i > 0) ExcludeSemantics(child: Text('|', style: style)),
          Text(parts[i], style: style),
        ],
      ],
    );
  }
}

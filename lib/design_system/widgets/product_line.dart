import 'package:flutter/material.dart';

import '../tokens/tokens.dart';
import 'app_price_label.dart';
import 'app_thumbnail.dart';
import 'grade_badge.dart';

/// 카드 안 상품 한 줄에 필요한 표시 값.
class ProductLineData {
  const ProductLineData({
    required this.name,
    required this.grade,
    required this.price,
    this.multiplier,
    this.thumbnail,
  });

  final String name;
  final AppGrade grade;
  final String price;
  final String? multiplier;
  final ImageProvider? thumbnail;
}

/// 썸네일(40) + 등급 + 상품명 + 가격. 라이브 카드·판매자 카드가 공유한다.
class ProductLine extends StatelessWidget {
  const ProductLine({
    super.key,
    required this.data,
    this.priceSize = AppPriceSize.sm,
  });

  static const double _thumbnailSize = 40;

  final ProductLineData data;
  final AppPriceSize priceSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppThumbnail.square(size: _thumbnailSize, image: data.thumbnail),
        const SizedBox(width: AppSpacing.s8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  GradeBadge(data.grade),
                  const SizedBox(width: AppSpacing.s4),
                  Expanded(
                    child: Text(
                      data.name,
                      style: AppTextStyles.pretendardCaption1Medium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.s6),
              AppPriceLabel(
                price: data.price,
                multiplier: data.multiplier,
                size: priceSize,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

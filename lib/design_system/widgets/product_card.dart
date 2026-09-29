import 'package:flutter/material.dart';

import '../tokens/tokens.dart';
import 'app_badge.dart';
import 'app_price_label.dart';
import 'app_thumbnail.dart';
import 'grade_badge.dart';

/// Figma `Card ui/Frame 2147238608`: 가로형 상품 카드 (높이 96, 그림자).
class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.name,
    required this.grade,
    required this.price,
    this.quantityLabel,
    this.dDay,
    this.startPriceLabel,
    this.multiplier,
    this.remainingTime,
    this.thumbnail,
    this.onTap,
  });

  final String name;
  final AppGrade grade;

  /// 포맷된 현재가 (예: "12,000").
  final String price;

  /// 예: "수량 3개"
  final String? quantityLabel;

  /// 예: "D-12"
  final String? dDay;

  /// 예: "시작가 8,000원"
  final String? startPriceLabel;
  final String? multiplier;

  /// 예: "00:47"
  final String? remainingTime;
  final ImageProvider? thumbnail;
  final VoidCallback? onTap;

  static const double height = 96;
  static const double _thumbnailSize = 70;

  @override
  Widget build(BuildContext context) {
    // 그림자는 흰 바탕 아래에 깔아야 한다. 바탕 위에 그리면 카드 전체가 회색으로 덮인다.
    return DecoratedBox(
      decoration: const BoxDecoration(
        borderRadius: AppRadius.r6All,
        boxShadow: AppShadows.card,
      ),
      child: Material(
        color: AppColors.backgroundDefault,
        borderRadius: AppRadius.r6All,
        child: InkWell(
          onTap: onTap,
          borderRadius: AppRadius.r6All,
          child: Container(
            constraints: const BoxConstraints(minHeight: height),
            padding: const EdgeInsets.all(AppSpacing.s16),
            child: Row(
              children: [
                AppThumbnail.square(size: _thumbnailSize, image: thumbnail),
                const SizedBox(width: AppSpacing.s8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    name,
                                    style: AppTextStyles.pretendardBody2,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                if (quantityLabel != null) ...[
                                  const SizedBox(width: AppSpacing.s4),
                                  Text(
                                    quantityLabel!,
                                    style: AppTextStyles.pretendardCaption2
                                        .copyWith(
                                          color: AppColors.textSecondary,
                                        ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                          const SizedBox(width: AppSpacing.s4),
                          GradeBadge(grade),
                          if (dDay != null) ...[
                            const SizedBox(width: AppSpacing.s4),
                            AppBadge.neutral(dDay!),
                          ],
                        ],
                      ),
                      const SizedBox(height: AppSpacing.s10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (startPriceLabel != null) ...[
                                  Text(
                                    startPriceLabel!,
                                    style: AppTextStyles
                                        .pretendardCaption1Medium
                                        .copyWith(
                                          color: AppColors.textSecondary,
                                        ),
                                  ),
                                  const SizedBox(height: AppSpacing.s6),
                                ],
                                AppPriceLabel(
                                  price: price,
                                  multiplier: multiplier,
                                  size: AppPriceSize.lg,
                                ),
                              ],
                            ),
                          ),
                          if (remainingTime != null)
                            AppBadge.timer(remainingTime!),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

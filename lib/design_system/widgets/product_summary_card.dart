import 'package:flutter/material.dart';

import '../tokens/tokens.dart';
import 'app_badge.dart';
import 'app_divider.dart';
import 'app_panel.dart';
import 'app_price_label.dart';
import 'app_thumbnail.dart';
import 'grade_badge.dart';

/// 상품 요약 카드: 썸네일(60) · 상품명 · 등급/D-day · 구분선 · 가격 줄.
///
/// - 기본 (결제 완료, Figma 37:5982): 시작가 한 줄 + "낙찰가원 배수배"
/// - [ProductSummaryCard.listing] (재고 등록 검토, Figma 37:2076): 등급·D-day 뒤에
///   어두운 태그("냉동", "120개"), 가격 줄은 "시작가 3,000원 호가 500원"
class ProductSummaryCard extends StatelessWidget {
  const ProductSummaryCard({
    super.key,
    required this.name,
    required AppGrade this.grade,
    required this.price,
    this.dDay,
    this.startPriceLabel,
    this.multiplier,
    this.thumbnail,
  }) : tags = const [],
       _listing = false,
       _priceLead = null;

  /// [startPrice]·[bidIncrement]는 포맷된 금액 ("3,000", "500"). [grade]가 null이면
  /// 등급 뱃지를 숨긴다 (아직 예상 등급이 없을 때).
  const ProductSummaryCard.listing({
    super.key,
    required this.name,
    this.grade,
    required String startPrice,
    String? bidIncrement,
    this.dDay,
    this.tags = const [],
    this.thumbnail,
  }) : price = startPrice,
       multiplier = bidIncrement,
       startPriceLabel = null,
       _listing = true,
       _priceLead = '시작가 ';

  final String name;
  final AppGrade? grade;

  /// listing 전용 어두운 작은 태그.
  final List<String> tags;
  final bool _listing;
  final String? _priceLead;

  /// 포맷된 금액 (예: "8,400").
  final String price;

  /// 예: "D-12"
  final String? dDay;

  /// 예: "시작가 3,000원"
  final String? startPriceLabel;

  /// 예: "2.8"
  final String? multiplier;
  final ImageProvider? thumbnail;

  static const double _thumbnailSize = 60;

  @override
  Widget build(BuildContext context) {
    return AppPanel.compact(
      child: Row(
        children: [
          AppThumbnail.square(size: _thumbnailSize, image: thumbnail),
          const SizedBox(width: AppSpacing.s8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        style: AppTextStyles.pretendardCaption1Medium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (grade != null) ...[
                      const SizedBox(width: AppSpacing.s4),
                      GradeBadge(grade!),
                    ],
                    if (dDay != null) ...[
                      const SizedBox(width: AppSpacing.s4),
                      AppBadge.neutral(dDay!),
                    ],
                    for (final tag in tags) ...[
                      const SizedBox(width: AppSpacing.s4),
                      AppBadge.tag(tag, compact: true),
                    ],
                  ],
                ),
                const SizedBox(height: AppSpacing.s6),
                const AppDivider(),
                const SizedBox(height: AppSpacing.s6),
                if (startPriceLabel != null) ...[
                  Text(
                    startPriceLabel!,
                    style: AppTextStyles.pretendardCaption2.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.s4),
                ],
                _listing
                    ? AppPriceLabel(
                        price: '$_priceLead$price',
                        multiplier: multiplier == null
                            ? null
                            : '호가 $multiplier',
                        multiplierUnit: '원',
                      )
                    : AppPriceLabel(price: price, multiplier: multiplier),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../tokens/tokens.dart';
import 'app_avatar.dart';
import 'app_badge.dart';
import 'app_price_label.dart';
import 'product_line.dart';

/// Figma `Card ui/Frame 2147238626`: 판매자 라이브 카드 (246).
class SellerLiveCard extends StatelessWidget {
  const SellerLiveCard({
    super.key,
    required this.sellerName,
    required this.title,
    required this.product,
    this.tags = const [],
    this.avatar,
    this.leading,
    this.width = defaultWidth,
    this.onTap,
  });

  final String sellerName;
  final String title;
  final ProductLineData product;
  final List<String> tags;
  final ImageProvider? avatar;

  /// 아바타 자리에 대신 놓을 위젯 (예: [AppBrandAvatar]). 있으면 [avatar]는 무시한다.
  final Widget? leading;
  final double width;
  final VoidCallback? onTap;

  static const double defaultWidth = 246;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Material(
        color: AppColors.backgroundDefault,
        borderRadius: AppRadius.r8All,
        child: InkWell(
          onTap: onTap,
          borderRadius: AppRadius.r8All,
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.s10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    leading ??
                        AppAvatar(
                          size: AppAvatarSize.sm,
                          image: avatar,
                          silhouette: true,
                        ),
                    const SizedBox(width: AppSpacing.s6),
                    Expanded(
                      child: Text(
                        sellerName,
                        style: AppTextStyles.archivoH3,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.s8),
                Text(
                  title,
                  style: AppTextStyles.pretendardCaption1Medium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (tags.isNotEmpty) ...[
                  const SizedBox(height: AppSpacing.s8),
                  Wrap(
                    spacing: AppSpacing.s4,
                    runSpacing: AppSpacing.s4,
                    children: [for (final t in tags) AppBadge.neutral(t)],
                  ),
                ],
                const SizedBox(height: AppSpacing.s8),
                const Divider(
                  height: AppBorderWidth.thin,
                  thickness: AppBorderWidth.thin,
                  color: AppColors.borderSubtle,
                ),
                const SizedBox(height: AppSpacing.s8),
                ProductLine(data: product, priceSize: AppPriceSize.md),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

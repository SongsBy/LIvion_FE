import 'package:flutter/material.dart';

import 'package:livion/design_system/design_system.dart';

import '../../data/demo/home_demo_assets.dart';

/// 서비스 신뢰 안내 3종 (검수 등급 · 에스크로 · 수취 후 지급). 고정 마케팅 문구.
class TrustBannerList extends StatelessWidget {
  const TrustBannerList({super.key});

  static const _banners = [
    _TrustBannerData(
      title: '전문 검수로 확인하는\n상품별 A/B/C 등급',
      caption: '공식 검수 A/B/C 등급',
      illustration: HomeDemoAssets.trustGrade,
    ),
    _TrustBannerData(
      title: '거래가 완료될 때까지\n안전하게 보호되는 결제',
      caption: '에스크로 안전결제',
      illustration: HomeDemoAssets.trustEscrow,
    ),
    _TrustBannerData(
      title: '상품 수령을 확인한 뒤\n판매자에게 안전하게 지급',
      caption: '수취 후 확인 지급',
      illustration: HomeDemoAssets.trustPayout,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s16),
      child: Column(
        children: [
          for (var i = 0; i < _banners.length; i++) ...[
            if (i > 0) const SizedBox(height: AppSpacing.s16),
            _TrustBanner(data: _banners[i]),
          ],
        ],
      ),
    );
  }
}

class _TrustBannerData {
  const _TrustBannerData({
    required this.title,
    required this.caption,
    required this.illustration,
  });

  final String title;
  final String caption;
  final String illustration;
}

class _TrustBanner extends StatelessWidget {
  const _TrustBanner({required this.data});

  final _TrustBannerData data;

  static const double _height = 120;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.s24,
        vertical: AppSpacing.s20,
      ),
      decoration: const BoxDecoration(
        color: AppColors.backgroundDefault,
        borderRadius: AppRadius.r12All,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  style: AppTextStyles.archivoBody1Relaxed,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: AppSpacing.s8),
                Text(
                  data.caption,
                  style: AppTextStyles.archivoH3.copyWith(
                    color: AppColors.textBrand,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.s8),
          Container(
            width: AppIconSize.illustrationBackdrop,
            height: AppIconSize.illustrationBackdrop,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: AppColors.backgroundBrandWeak,
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              data.illustration,
              width: AppIconSize.illustration,
              height: AppIconSize.illustration,
              excludeFromSemantics: true,
            ),
          ),
        ],
      ),
    );
  }
}

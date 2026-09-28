import 'package:flutter/material.dart';

import 'package:livion/design_system/design_system.dart';

import '../../domain/entities/live_summary.dart';
import '../../domain/entities/scheduled_live.dart';
import 'live_summary_ui.dart';

/// "Livion 공식 방송": 히어로 카드(266×398) + 오른쪽 편성 썸네일 열(80).
class OfficialLiveSection extends StatelessWidget {
  const OfficialLiveSection({
    super.key,
    required this.live,
    required this.schedule,
    this.onLiveTap,
    this.onScheduleTap,
    this.onBookmark,
  });

  final LiveSummary live;
  final List<ScheduledLive> schedule;
  final VoidCallback? onLiveTap;
  final ValueChanged<ScheduledLive>? onScheduleTap;
  final VoidCallback? onBookmark;

  static const double height = 398;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s16),
      child: SizedBox(
        height: height,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: OfficialLiveHero(
                live: live,
                onTap: onLiveTap,
                onBookmark: onBookmark,
              ),
            ),
            const SizedBox(width: AppSpacing.s12),
            ScheduleColumn(items: schedule, onTap: onScheduleTap),
          ],
        ),
      ),
    );
  }
}

/// 히어로: 썸네일 위에 LIVE·시청자 뱃지, 북마크, 아래 흰 판매자 카드.
class OfficialLiveHero extends StatelessWidget {
  const OfficialLiveHero({
    super.key,
    required this.live,
    this.onTap,
    this.onBookmark,
  });

  final LiveSummary live;
  final VoidCallback? onTap;
  final VoidCallback? onBookmark;

  static const double _badgeInset = AppSpacing.s6;
  static const double _cardInset = AppSpacing.s10;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: '${live.sellerName} ${live.title}',
      child: InkWell(
        onTap: onTap,
        borderRadius: AppRadius.r6All,
        child: AppThumbnail(
          image: resolveAppImageOrNull(live.thumbnail),
          borderRadius: AppRadius.r6All,
          child: Stack(
            children: [
              Positioned(
                left: _badgeInset,
                top: _badgeInset,
                child: Row(
                  children: [
                    const AppBadge.live(),
                    const SizedBox(width: AppSpacing.s4),
                    AppBadge.viewers(live.viewersLabel),
                  ],
                ),
              ),
              if (live.isBookmarked)
                Positioned(
                  right: 0,
                  top: 0,
                  child: Semantics(
                    button: true,
                    label: '북마크',
                    child: InkWell(
                      onTap: onBookmark,
                      child: const Padding(
                        padding: EdgeInsets.all(_badgeInset),
                        child: AppSvgIcon(
                          AppIcons.bookmark,
                          size: AppIconSize.bookmarkLg,
                        ),
                      ),
                    ),
                  ),
                ),
              Positioned(
                left: _cardInset,
                right: _cardInset,
                bottom: _cardInset,
                child: SellerLiveCard(
                  sellerName: live.sellerName,
                  title: live.title,
                  tags: live.tags,
                  leading: const AppBrandAvatar(),
                  product: live.productLine,
                  width: double.infinity,
                  onTap: onTap,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 편성 썸네일 세로 열. 현재 방송은 오렌지 테두리, 예정 방송은 어둡게 + 시각.
class ScheduleColumn extends StatelessWidget {
  const ScheduleColumn({super.key, required this.items, this.onTap});

  final List<ScheduledLive> items;
  final ValueChanged<ScheduledLive>? onTap;

  static const double width = 80;
  static const double itemHeight = 120;
  static const double _fadeHeight = 20;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Stack(
        children: [
          ListView.separated(
            padding: EdgeInsets.zero,
            itemCount: items.length,
            separatorBuilder: (_, _) => const SizedBox(height: AppSpacing.s10),
            itemBuilder: (_, i) => _ScheduleTile(
              item: items[i],
              onTap: onTap == null ? null : () => onTap!(items[i]),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: _fadeHeight,
            child: IgnorePointer(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.backgroundDefault.withValues(alpha: 0),
                      AppColors.backgroundDefault,
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ScheduleTile extends StatelessWidget {
  const _ScheduleTile({required this.item, required this.onTap});

  final ScheduledLive item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final startsAt = item.startsAt;
    return Semantics(
      button: true,
      selected: item.isOnAir,
      label: item.isOnAir
          ? '현재 방송'
          : startsAt == null
          ? '편성 예정'
          : '${_formatDate(startsAt)} ${_formatTime(startsAt)} 방송 예정',
      child: InkWell(
        onTap: onTap,
        borderRadius: AppRadius.r6All,
        child: Container(
          height: ScheduleColumn.itemHeight,
          decoration: item.isOnAir
              ? BoxDecoration(
                  borderRadius: AppRadius.r6All,
                  border: Border.all(
                    color: AppColors.borderBrand,
                    width: AppBorderWidth.thick,
                  ),
                )
              : null,
          child: AppThumbnail(
            image: resolveAppImageOrNull(item.thumbnail),
            borderRadius: AppRadius.r6All,
            child: item.isOnAir || startsAt == null
                ? null
                : ColoredBox(
                    color: AppColors.backgroundDisabled,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            _formatDate(startsAt),
                            style: AppTextStyles.archivoCaption1BoldTight
                                .copyWith(color: AppColors.textInverseSub),
                          ),
                          const SizedBox(height: AppSpacing.s4),
                          Text(
                            _formatTime(startsAt),
                            style: AppTextStyles.archivoH1BoldTight.copyWith(
                              color: AppColors.textInverseSub,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  static String _formatDate(DateTime d) => '${d.month}월 ${d.day}일';

  static String _formatTime(DateTime d) =>
      '${d.hour.toString().padLeft(2, '0')}:'
      '${d.minute.toString().padLeft(2, '0')}';
}

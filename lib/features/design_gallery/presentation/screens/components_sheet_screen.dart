import 'package:flutter/material.dart';

import 'package:livion/design_system/design_system.dart';

import '../widgets/sheet_card.dart';

/// Figma 컴포넌트 시트(node 26:1904). 디자인 시스템 위젯을 한 화면에서 확인한다.
class ComponentsSheetScreen extends StatefulWidget {
  const ComponentsSheetScreen({super.key});

  @override
  State<ComponentsSheetScreen> createState() => _ComponentsSheetScreenState();
}

class _ComponentsSheetScreenState extends State<ComponentsSheetScreen> {
  int _tabIndex = 0;
  int _categoryIndex = 0;
  AppBottomNavItem _navItem = AppBottomNavItem.home;

  static const _sampleProduct = ProductLineData(
    name: '상세 제품명',
    grade: AppGrade.a,
    price: '0,000',
    multiplier: '0',
  );

  static const _iconAssets = [
    AppIcons.bell,
    AppIcons.search,
    AppIcons.arrowLeft,
    AppIcons.arrowNarrowLeft,
    AppIcons.chevronLeft,
    AppIcons.chevronDown,
    AppIcons.chevronUp,
    AppIcons.share,
    AppIcons.dotsVertical,
    AppIcons.eye,
    AppIcons.checkCircle,
  ];

  @override
  Widget build(BuildContext context) {
    return SheetCard(
      title: 'Components',
      children: [
        _Section(
          title: 'Icon',
          child: Wrap(
            spacing: AppSpacing.s12,
            runSpacing: AppSpacing.s12,
            children: [
              for (final asset in _iconAssets)
                AppSvgIcon(asset, color: AppColors.textPrimary),
            ],
          ),
        ),
        _Section(
          title: 'Button',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: AppSpacing.s8,
                runSpacing: AppSpacing.s8,
                children: [
                  AppButton.primary(label: '텍스트', onPressed: () {}),
                  AppButton.outline(label: '텍스트', onPressed: () {}),
                  const AppButton.primary(label: '비활성', onPressed: null),
                  AppButton.primary(
                    label: '로딩',
                    onPressed: () {},
                    isLoading: true,
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.s16),
              Row(
                children: [
                  Expanded(
                    child: AppButton.cta(label: '8400원에 입찰', onPressed: () {}),
                  ),
                  const SizedBox(width: AppSpacing.s6),
                  AppIconButton.boxed(
                    icon: AppIcons.dotsHorizontal,
                    onPressed: () {},
                    semanticLabel: '더보기',
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.s16),
              AppTabBar(
                items: const [
                  AppTabItem(label: '채팅', count: '1,204'),
                  AppTabItem(label: '입찰현황', count: '14'),
                ],
                selectedIndex: _tabIndex,
                onChanged: (i) => setState(() => _tabIndex = i),
              ),
            ],
          ),
        ),
        _Section(
          title: 'Category tab',
          child: AppCategoryTabBar(
            labels: const ['추천', '추천'],
            selectedIndex: _categoryIndex,
            onChanged: (i) => setState(() => _categoryIndex = i),
          ),
        ),
        _Section(
          title: 'Badge',
          child: Wrap(
            spacing: AppSpacing.s8,
            runSpacing: AppSpacing.s8,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: const [
              AppBadge.live(),
              AppBadge.viewers('1,204'),
              AppBadge.timer('00:47'),
              AppBadge.dim('1,204 시청'),
              AppBadge.seller(),
              AppBadge.neutral('마감 임박'),
              AppBadge.neutral('D-12'),
              GradeBadge(AppGrade.a),
              GradeBadge(AppGrade.b),
              GradeBadge(AppGrade.c),
            ],
          ),
        ),
        const _Section(
          title: 'Avatar',
          child: Wrap(
            spacing: AppSpacing.s16,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              AppAvatar(size: AppAvatarSize.xs),
              AppAvatar(size: AppAvatarSize.sm),
              AppAvatar(size: AppAvatarSize.md),
              AppAvatar(size: AppAvatarSize.lg),
              AppAvatar(size: AppAvatarSize.sm, silhouette: true),
              AppAvatar(
                size: AppAvatarSize.md,
                silhouette: true,
                borderColor: AppColors.borderInverse,
                borderWidth: AppBorderWidth.thick,
              ),
              AppLiveAvatar(),
            ],
          ),
        ),
        _Section(
          title: 'Message field',
          child: AppMessageField(onSend: (_) {}),
        ),
        _Section(
          title: 'Top bar',
          child: Column(
            children: [
              AppTopBar.steps(
                title: '판매자 전환',
                step: 1,
                totalSteps: 4,
                onBack: () {},
              ),
              const SizedBox(height: AppSpacing.s16),
              AppTopBar.home(
                onSearch: () {},
                onNotification: () {},
                hasNotification: true,
              ),
            ],
          ),
        ),
        _Section(
          title: 'Bottom nav',
          child: AppBottomNav(
            selected: _navItem,
            onChanged: (item) => setState(() => _navItem = item),
          ),
        ),
        const _Section(
          title: 'Row',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppStatusRow.checked('에스크로 예치'),
              SizedBox(height: AppSpacing.s8),
              AppStatusRow.step(3, '배송 중'),
              SizedBox(height: AppSpacing.s16),
              BidRankRow(
                rank: 2,
                name: '김*빈',
                price: '7,400원',
                timeAgo: '13초전',
                highlighted: true,
              ),
              BidRankRow(rank: 1, name: '홍*동', price: '7,900원', timeAgo: '3초전'),
              SizedBox(height: AppSpacing.s16),
              ChatMessageRow(name: '김*빈', message: '많이 매울까요?', time: '오후 8:20'),
              SizedBox(height: AppSpacing.s10),
              ChatMessageRow(
                name: '한빛식품',
                message: '전혀 맵지 않습니다!',
                time: '오후 8:21',
                isReply: true,
                isSeller: true,
              ),
            ],
          ),
        ),
        _Section(
          title: 'Card',
          child: Wrap(
            spacing: AppSpacing.s10,
            runSpacing: AppSpacing.s10,
            crossAxisAlignment: WrapCrossAlignment.start,
            children: [
              const LiveCard(
                sellerName: '업체명',
                title: '라이브 타이틀',
                viewers: '000',
                tags: ['마감 임박', 'D-12'],
                product: _sampleProduct,
              ),
              SizedBox(
                width: 329,
                child: ProductCard(
                  name: '상세 제품명',
                  grade: AppGrade.a,
                  price: '0,000',
                  quantityLabel: '수량 00개',
                  dDay: 'D-12',
                  startPriceLabel: '시작가 000원',
                  multiplier: '0',
                  remainingTime: '00:47',
                  onTap: () {},
                ),
              ),
              const SellerLiveCard(
                sellerName: '업체명',
                title: '라이브 타이틀',
                tags: ['마감 임박', 'D-12'],
                product: _sampleProduct,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title, style: AppTextStyles.sheetSectionTitle),
        const SizedBox(height: AppSpacing.s12),
        child,
      ],
    );
  }
}

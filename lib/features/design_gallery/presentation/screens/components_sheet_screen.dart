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
  String _chip = '전체';
  AppBottomNavItem _navItem = AppBottomNavItem.home;
  int _radio = 0;
  bool _checked = true;

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
    AppIcons.chevronRight,
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
              Row(
                children: [
                  SizedBox(
                    width: 120,
                    child: AppButton.ctaOutline(label: '이전', onPressed: () {}),
                  ),
                  const SizedBox(width: AppSpacing.s10),
                  Expanded(
                    child: AppButton.cta(label: '다음', onPressed: () {}),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.s16),
              AppButton.cta(
                label: '라이브로 돌아가기',
                secondaryLabel: '다음 품목 4/5',
                onPressed: () {},
              ),
              const SizedBox(height: AppSpacing.s8),
              Center(
                child: AppTextLink(label: '주문 상세 보기', onTap: () {}),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppCategoryTabBar(
                labels: const ['추천', '추천'],
                selectedIndex: _categoryIndex,
                onChanged: (i) => setState(() => _categoryIndex = i),
              ),
              const SizedBox(height: AppSpacing.s16),
              Row(
                children: [
                  for (var i = 0; i < 2; i++) ...[
                    if (i > 0) const SizedBox(width: AppSpacing.s12),
                    AppCategoryIcon.mark(
                      label: '전체',
                      mark: 'ALL',
                      selected: i == _categoryIndex,
                      onTap: () => setState(() => _categoryIndex = i),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
        _Section(
          title: 'Choice chips',
          child: AppChoiceChips(
            options: const ['전체', '농산물', '건강식품', '축산물'],
            selected: _chip,
            onChanged: (c) => setState(() => _chip = c),
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
              AppBadge.outline('자동결제'),
              AppBadge.outlineMuted('선택'),
              AppBadge.subtle('준비중'),
              AppBadge.done('에스크로 예치 완료'),
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
        const _Section(
          title: 'Live avatar list',
          child: AppLiveAvatarList(
            items: [
              AppLiveAvatarItem(name: '판매자명', isLive: true),
              AppLiveAvatarItem(name: '판매자명', isLive: true),
              AppLiveAvatarItem(name: '판매자명'),
            ],
          ),
        ),
        const _Section(
          title: 'Guide',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppFeatureCard(
                icon: AppIcons.featureCard,
                title: '안내 제목',
                caption: '안내 설명',
              ),
              SizedBox(height: AppSpacing.s16),
              AppStatFigure(title: '수치 제목', value: '2.0', unit: '배'),
              SizedBox(height: AppSpacing.s16),
              AppPanel(
                padding: EdgeInsets.all(AppSpacing.s16),
                child: AppBulletList(items: ['안내 문구', '안내 문구']),
              ),
            ],
          ),
        ),
        _Section(
          title: 'Form',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const AppStepIndicator(
                labels: ['유형', '사업자', '채널', '정산·약관'],
                currentIndex: 1,
              ),
              const SizedBox(height: AppSpacing.s16),
              const AppFormField(
                label: '입력 제목',
                isRequired: true,
                message: '안내 문구',
                child: AppTextInput(
                  hint: '입력해주세요.',
                  trailing: AppInputTrailing.status('확인완료'),
                ),
              ),
              const SizedBox(height: AppSpacing.s12),
              AppTextInput(
                hint: '01012345678',
                trailing: AppInputTrailing.action('인증번호', onPressed: () {}),
              ),
              const SizedBox(height: AppSpacing.s12),
              const AppTextInput(
                hint: '인증번호 입력',
                trailing: AppInputTrailing.timer('02:58'),
              ),
              const SizedBox(height: AppSpacing.s12),
              AppPickerField(hint: '은행 선택', onTap: () {}),
              const SizedBox(height: AppSpacing.s16),
              AppTileGrid(
                columns: 2,
                children: [
                  for (var i = 0; i < 2; i++)
                    AppOptionTile.radio(
                      label: '선택지',
                      selected: _radio == i,
                      onTap: () => setState(() => _radio = i),
                    ),
                  AppOptionTile.checkbox(
                    label: '여러 개',
                    selected: _checked,
                    onTap: () => setState(() => _checked = !_checked),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.s16),
              AppOptionCard(
                title: '선택 카드',
                caption: '설명',
                selected: true,
                badge: const AppBadge.outline('권장'),
                onTap: () {},
              ),
              const SizedBox(height: AppSpacing.s10),
              const AppOptionCard(
                title: '준비 중 카드',
                caption: '설명',
                selected: false,
                onTap: null,
                badge: AppBadge.subtle('준비중'),
              ),
              const SizedBox(height: AppSpacing.s16),
              AppCheckRow.heading(
                label: '전체동의',
                checked: _checked,
                onChanged: (v) => setState(() => _checked = v),
              ),
              const SizedBox(height: AppSpacing.s16),
              AppCheckRow(
                label: '약관 이름',
                checked: _checked,
                onChanged: (v) => setState(() => _checked = v),
                badge: const AppBadge.outline('필수'),
                onOpen: () {},
              ),
              const SizedBox(height: AppSpacing.s16),
              const AppPanel(
                padding: EdgeInsets.all(AppSpacing.s16),
                child: AppInfoRow(label: '항목', value: '값'),
              ),
              const SizedBox(height: AppSpacing.s16),
              Row(
                children: [
                  AppPhotoSlot(onTap: () {}),
                  const SizedBox(width: AppSpacing.s16),
                  const AppRadioMark(selected: true),
                  const SizedBox(width: AppSpacing.s8),
                  const AppRadioMark(selected: false),
                  const SizedBox(width: AppSpacing.s8),
                  const AppCheckboxMark(checked: true),
                  const SizedBox(width: AppSpacing.s8),
                  const AppCheckboxMark(checked: false),
                ],
              ),
            ],
          ),
        ),
        _Section(
          title: 'Auth',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const AppTextInput(hint: '아이디를 입력해주세요.', bordered: true),
              const SizedBox(height: AppSpacing.s12),
              Row(
                children: [
                  const Expanded(child: AppTextInput(hint: '아이디')),
                  const SizedBox(width: AppSpacing.s12),
                  AppFieldButton(label: '중복 확인', onPressed: () {}),
                ],
              ),
              const SizedBox(height: AppSpacing.s12),
              const Row(
                children: [
                  Expanded(child: AppTextInput(hint: '휴대폰 번호')),
                  SizedBox(width: AppSpacing.s12),
                  AppFieldButton(label: '인증번호 받기', onPressed: null),
                ],
              ),
              const SizedBox(height: AppSpacing.s16),
              AppButton.ctaMedium(label: '로그인', onPressed: () {}),
              const SizedBox(height: AppSpacing.s16),
              const AppLabeledDivider(label: 'SNS 로그인'),
              const SizedBox(height: AppSpacing.s14),
              AppSocialLoginButton.kakao(onPressed: () {}),
              const SizedBox(height: AppSpacing.s10),
              AppSocialLoginButton.naver(onPressed: () {}),
              const SizedBox(height: AppSpacing.s16),
              AppAgreementRow.all(
                checked: _checked,
                onChanged: (v) => setState(() => _checked = v),
              ),
              AppAgreementRow(
                label: '[필수] 약관 이름',
                checked: _checked,
                onChanged: (v) => setState(() => _checked = v),
                onView: () {},
              ),
            ],
          ),
        ),
        _Section(
          title: 'Result',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const AppResultHeader(title: '완료 제목', message: '안내 문구'),
              const SizedBox(height: AppSpacing.s16),
              const AppStepProgress(
                labels: ['접수', '서류확인', '채널 개설', '첫 편성'],
                completedCount: 1,
              ),
              const SizedBox(height: AppSpacing.s16),
              AppNavRow(label: '이동할 화면', onTap: () {}),
              const SizedBox(height: AppSpacing.s16),
              Row(
                children: [
                  AppLogoTile(
                    label: '로고 타일',
                    logo: AppBankLogos.kakao,
                    onTap: () => showAppLogoGridSheet<String>(
                      context,
                      semanticLabel: '로고 선택',
                      options: const [
                        AppLogoOption(
                          value: 'kakao',
                          label: '카카오뱅크',
                          logo: AppBankLogos.kakao,
                        ),
                        AppLogoOption(
                          value: 'toss',
                          label: '토스뱅크',
                          logo: AppBankLogos.toss,
                        ),
                        AppLogoOption(value: 'none', label: '로고 없음'),
                      ],
                    ),
                  ),
                  const SizedBox(width: AppSpacing.s12),
                  AppLogoTile(
                    label: '선택됨',
                    logo: AppBankLogos.kb,
                    selected: true,
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
        _Section(
          title: 'Search bar',
          child: AppSearchBar(placeholder: '상품, 판매자, 채널 검색', onTap: () {}),
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
              AppTopBar.back(onBack: () {}),
              const SizedBox(height: AppSpacing.s16),
              AppTopBar.home(
                onSearch: () {},
                onNotification: () {},
                hasNotification: true,
                profile: AppProfileSwitch(
                  semanticLabel: '계정 전환',
                  onTap: () => showAppProfileSwitchSheet(
                    context,
                    selectedIndex: 0,
                    options: const [
                      AppProfileOption(name: '홍길동', caption: '구매자 계정'),
                      AppProfileOption(
                        name: '상점명',
                        caption: '판매자 계정',
                        badge: '판매자',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.s16),
              const Row(
                children: [
                  AppProfileSwitch(semanticLabel: '계정 전환'),
                  SizedBox(width: AppSpacing.s12),
                  AppProfileSwitch(semanticLabel: '전환 중', isBusy: true),
                ],
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
              SizedBox(height: AppSpacing.s8),
              AppStatusRow.step(4, '수취 확인', nextLabel: '판매자 지급'),
              SizedBox(height: AppSpacing.s8),
              AppStatusRow.step(1, '접수', dimmed: false),
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
          title: 'Payment',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: AppIllustrationBadge.card(),
              ),
              const SizedBox(height: AppSpacing.s16),
              const ProductSummaryCard(
                name: '상세 제품명',
                grade: AppGrade.a,
                dDay: 'D-12',
                startPriceLabel: '시작가 0,000원',
                price: '0,000',
                multiplier: '0',
              ),
              const SizedBox(height: AppSpacing.s10),
              const AppPanel(
                child: Column(
                  children: [
                    AppAmountRow(label: '낙찰가', amount: '0,000'),
                    SizedBox(height: AppSpacing.s16),
                    AppDivider(),
                    SizedBox(height: AppSpacing.s16),
                    AppDivider.bold(),
                    SizedBox(height: AppSpacing.s16),
                    AppAmountRow.total(label: '결제 금액', amount: '00,000'),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.s10),
              AppPanel(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppTitlePair(title: '우리집', value: '홍길동'),
                    const SizedBox(height: AppSpacing.s10),
                    const Row(
                      children: [
                        Text('010-0000-0000'),
                        SizedBox(width: AppSpacing.s12),
                        AppVerticalDivider(height: AppSpacing.s8),
                        SizedBox(width: AppSpacing.s12),
                        Flexible(
                          child: Text(
                            '서울특별시 00구 00로 00-0',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.s16),
                    AppSelectField(hint: '선택해주세요', onTap: () {}),
                  ],
                ),
              ),
            ],
          ),
        ),
        _Section(
          title: 'Inventory',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppTopBar.steps(
                title: '재고 등록',
                step: 1,
                totalSteps: 4,
                onBack: () {},
                actionLabel: '임시저장',
                onAction: () {},
              ),
              const SizedBox(height: AppSpacing.s16),
              AppTileGrid(
                columns: 2,
                spacing: AppSpacing.s12,
                children: [
                  AppPhotoTile(
                    label: '정면',
                    image: const AssetImage(
                      'asset/images/demo/inventory_front.jpg',
                    ),
                    onRemove: () {},
                  ),
                  AppPhotoTile(label: '포장 상태', onAdd: () {}),
                ],
              ),
              const SizedBox(height: AppSpacing.s16),
              AppPickerField.dropdown(hint: '선택해주세요.', onTap: () {}),
              const SizedBox(height: AppSpacing.s8),
              AppPickerField(
                hint: '선택해주세요.',
                value: '2026.09.26',
                trailing: const AppBadge.outline('D-12'),
                onTap: () {},
              ),
              const SizedBox(height: AppSpacing.s8),
              const AppTextInput(
                hint: '3,000',
                trailing: AppInputTrailing.unit('원'),
              ),
              const SizedBox(height: AppSpacing.s16),
              AppSegmentedChoice(
                options: const ['월', '화', '수', '목', '금', '토', '일'],
                selectedIndex: 1,
                onChanged: (_) {},
              ),
              const SizedBox(height: AppSpacing.s5),
              AppPanel.muted(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AppTileGrid(
                      columns: 3,
                      children: [
                        AppOptionTile.plain(
                          label: '19:00',
                          selected: false,
                          onTap: () {},
                        ),
                        AppOptionTile.plain(
                          label: '20:00',
                          selected: true,
                          badge: const AppBadge.filled('정기'),
                          onTap: () {},
                        ),
                        AppOptionTile.plain(
                          label: '21:00',
                          selected: false,
                          onTap: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.s8),
                    const AppPanel.translucent(
                      child: Wrap(
                        spacing: AppSpacing.s5,
                        children: [
                          AppBadge.tag('정기'),
                          AppBadge.tag('냉동', compact: true),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.s16),
              const GradeSummaryCard(
                title: '예상 검수 등급',
                caption: 'B 범위 · 외관 이상 없음 · 미개봉',
                grade: AppGrade.b,
              ),
              const SizedBox(height: AppSpacing.s5),
              const AppCriteriaTable(
                columns: ['A', 'B', 'C'],
                rows: [
                  AppCriteriaRow(
                    cells: ['D-30 이상', 'D-8~29', 'D-7'],
                    highlightedIndex: 1,
                  ),
                  AppCriteriaRow(cells: ['미개봉', '재포장 외', '재포장']),
                ],
              ),
              const SizedBox(height: AppSpacing.s16),
              const AppTooltipCard(
                title: '주의사항',
                message: '검수 완료 후 소비기한·수량·사진을 수정하면 재 검수가 필요합니다',
              ),
              const SizedBox(height: AppSpacing.s16),
              Row(
                children: [
                  Expanded(
                    child: Text('기본 정보', style: AppTextStyles.archivoH1),
                  ),
                  AppButton.smallOutline(label: '수정', onPressed: () {}),
                ],
              ),
              const SizedBox(height: AppSpacing.s16),
              AppPanel.card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppInfoRow(
                      label: '소비기한',
                      value: '2026.09.26',
                      badge: AppBadge.outline('D-12'),
                    ),
                    const SizedBox(height: AppSpacing.s16),
                    const AppInfoRow.regular(label: '수수료 12%', value: '-948원'),
                    const SizedBox(height: AppSpacing.s16),
                    const AppInfoRow.emphasis(label: '예상 정산', value: '6,952원'),
                    const SizedBox(height: AppSpacing.s16),
                    const AppDashedDivider(),
                    const SizedBox(height: AppSpacing.s16),
                    const Wrap(
                      spacing: AppSpacing.s16,
                      children: [
                        AppCheckLabel(label: '정면 사진', checked: true),
                        AppCheckLabel(label: '포장 상태', checked: false),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.s16),
              const ProductSummaryCard.listing(
                name: '냉동만두 1.2kg',
                grade: AppGrade.a,
                dDay: 'D-12',
                tags: ['냉동', '120개'],
                startPrice: '3,000',
                bidIncrement: '500',
              ),
              const SizedBox(height: AppSpacing.s16),
              const IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: AppFeatureCard.stacked(
                        icon: AppIcons.featureShield,
                        title: '검수',
                        caption: '영업일 1일 소요',
                      ),
                    ),
                    SizedBox(width: AppSpacing.s10),
                    Expanded(
                      child: AppFeatureCard.stacked(
                        icon: AppIcons.featureCard,
                        title: '편성 확정',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.s16),
              AppCheckRow.consent(
                label: '검수 결과에 따라 등급·편성이 변경될 수 있음을 확인했습니다',
                checked: false,
                onChanged: (_) {},
              ),
              const SizedBox(height: AppSpacing.s16),
              AppStepActionBar(
                nextLabel: '검수 요청 및 편성 신청',
                onBack: () {},
                onNext: null,
              ),
            ],
          ),
        ),
        _Section(
          title: 'Seller channel',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const AppChannelHeader(name: '업체명', meta: '팔로워 1,435'),
              const SizedBox(height: AppSpacing.s16),
              const AppExpandableText(
                '산지와 제조처에서 엄선한 신선식품과 간편식을 라이브로 소개합니다. '
                '상품의 상태와 특징을 직접 확인하고 합리적인 가격으로 만나보세요.',
              ),
              const SizedBox(height: AppSpacing.s16),
              Row(
                children: [
                  AppIconButton(
                    icon: AppIcons.messageBox,
                    onPressed: () {},
                    size: AppControlHeight.buttonSm,
                    iconSize: AppControlHeight.buttonSm,
                    iconColor: null,
                  ),
                  const SizedBox(width: AppSpacing.s5),
                  Expanded(
                    child: AppButton.compact(
                      icon: AppIcons.heartOutlineSmall,
                      label: '팔로워 1.4천',
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.s8),
              AppButton.compact(
                icon: AppIcons.bell,
                label: '라이브 알림 신청',
                outlined: true,
                onPressed: () {},
              ),
              const SizedBox(height: AppSpacing.s16),
              const AppDivider.band(),
              const SizedBox(height: AppSpacing.s16),
              AppPostCard(
                authorName: '업체명',
                dateLabel: '2026.00.00',
                body: '오늘도 신선하게 입고됐어요\n아침에 들어온 채소들 상태 확인 완료했습니다.',
                likeCount: 1,
                commentCount: 1,
                liked: true,
                onLike: () {},
                onComment: () {},
                onShare: () {},
              ),
              const SizedBox(height: AppSpacing.s16),
              const LiveCard.compact(
                title: '라이브 타이틀',
                viewers: '000',
                isLive: false,
                tags: ['마감 임박', 'D-12'],
                product: _sampleProduct,
              ),
              const SizedBox(height: AppSpacing.s16),
              const CommentRow(
                name: '김*빈',
                message: '정말 맵지 않고 맛있더라구요.',
                time: '오후 8:20',
              ),
              const SizedBox(height: AppSpacing.s15),
              const CommentRow(
                name: '업체명',
                message: '전혀 맵지 않으셨다니 다행입니다.',
                time: '오후 8:21',
                isReply: true,
                isSeller: true,
              ),
              const SizedBox(height: AppSpacing.s16),
              const AppNoticeList(
                items: [
                  AppNotice(title: '배송', body: '주문 확인 후 택배로 배송됩니다.'),
                  AppNotice(title: '배송비', body: '기본 배송비 3,000원입니다.'),
                ],
              ),
              const SizedBox(height: AppSpacing.s16),
              AppButton.outline(
                label: '댓글 시트 열기',
                onPressed: () => showAppPanelSheet<void>(
                  context,
                  builder: (_) => const Center(child: Text('내용')),
                ),
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

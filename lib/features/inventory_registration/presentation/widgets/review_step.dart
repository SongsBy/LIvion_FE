import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:livion/core/formatting/date_format.dart';
import 'package:livion/core/formatting/number_format.dart';
import 'package:livion/design_system/design_system.dart';
import 'package:livion/shared/presentation/inspection_grade_ui.dart';

import '../../domain/entities/inventory_listing.dart';
import '../../domain/usecases/inventory_rules.dart';
import '../providers/inventory_registration_controller.dart';
import '../providers/inventory_registration_dependencies.dart';
import 'inventory_registration_ui.dart';

/// 4단계 "검토" (Figma 17_RegisterReview, node 37:2076).
///
/// 상품 요약 카드 · 단계별 입력 요약(각각 "수정"으로 그 단계로 이동) · 진행 안내 ·
/// 등급·편성 변경 확인. 비어 있는 값은 "-"로 보인다.
class ReviewStep extends ConsumerWidget {
  const ReviewStep({super.key});

  /// Figma: 섹션 사이 25 + 4(바탕색 구분 띠) + 25.
  static const double _sectionBreak =
      AppSpacing.s25 + AppSpacing.s4 + AppSpacing.s25;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(inventoryRegistrationControllerProvider);
    final controller = ref.read(
      inventoryRegistrationControllerProvider.notifier,
    );
    final today = ref.watch(inventoryRegistrationClockProvider)();
    final referencePrice = ref
        .watch(inventoryFormOptionsProvider)
        .value
        ?.pricingGuide
        .referenceWinningPrice;

    final daysLeft = state.daysLeft(today);
    final grade = state.estimatedGrade(today);
    final quantity = state.supplyQuantityValue;
    final startPrice = state.startPriceValue;
    final slot = state.slot;
    final payout = referencePrice == null
        ? null
        : SettlementEstimate.of(
            winningPrice: referencePrice,
            slotKind: state.slotKind,
          ).payout;

    String text(String value) => value.trim().isEmpty ? emptyValue : value;

    return AppFormScrollView(
      children: [
        ProductSummaryCard.listing(
          name: text(state.productName),
          grade: grade?.toAppGrade(),
          dDay: daysLeft == null ? null : formatDDay(daysLeft),
          tags: [
            ?state.storage?.label,
            if (quantity != null) '${formatThousands(quantity)}개',
          ],
          startPrice: startPrice == null
              ? emptyValue
              : formatThousands(startPrice),
          bidIncrement: state.bidIncrement == null
              ? null
              : formatThousands(state.bidIncrement!),
          thumbnail: resolveAppImageOrNull(
            state.photos[InventoryPhotoSlot.front],
          ),
        ),
        const SizedBox(height: _sectionBreak),
        _ReviewSection(
          title: InventoryRegistrationStep.basic.label,
          onEdit: () => controller.goTo(InventoryRegistrationStep.basic),
          children: [
            AppInfoRow(label: '상품명', value: text(state.productName)),
            AppInfoRow(label: '카테고리', value: state.category ?? emptyValue),
            AppInfoRow(
              label: '회당 공급 수량',
              value: quantity == null ? emptyValue : formatThousands(quantity),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('사진 제공', style: AppTextStyles.pretendardBody2Regular),
                const SizedBox(height: AppSpacing.s16),
                Wrap(
                  spacing: AppSpacing.s16,
                  runSpacing: AppSpacing.s8,
                  children: [
                    for (final slot in InventoryPhotoSlot.values)
                      AppCheckLabel(
                        label: slot.reviewLabel,
                        checked: state.photos.containsKey(slot),
                      ),
                  ],
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: _sectionBreak),
        _ReviewSection(
          title: InventoryRegistrationStep.condition.label,
          onEdit: () => controller.goTo(InventoryRegistrationStep.condition),
          trailingDivider: true,
          footer: GradeSummaryCard.muted(
            title: '예상 검수 등급',
            caption: gradeCaption(state, grade),
            grade: grade?.toAppGrade(),
          ),
          children: [
            AppInfoRow(
              label: '소비기한',
              value: state.expiryDate == null
                  ? emptyValue
                  : formatDotDate(state.expiryDate!),
              badge: daysLeft == null
                  ? null
                  : AppBadge.outline(formatDDay(daysLeft)),
            ),
            AppInfoRow(
              label: '재고 유형',
              value: state.stockType?.label ?? emptyValue,
            ),
            AppInfoRow(
              label: '보관 조건',
              value: state.storage?.label ?? emptyValue,
            ),
            AppInfoRow(
              label: '외관 상태',
              value: state.appearance.isEmpty
                  ? emptyValue
                  : [
                      for (final c in AppearanceCondition.values)
                        if (state.appearance.contains(c)) c.label,
                    ].join('·'),
            ),
            AppInfoRow(
              label: '포장 상태',
              value: state.packaging?.label ?? emptyValue,
            ),
          ],
        ),
        const SizedBox(height: _sectionBreak),
        _ReviewSection(
          title: InventoryRegistrationStep.pricing.label,
          onEdit: () => controller.goTo(InventoryRegistrationStep.pricing),
          children: [
            AppInfoRow(label: '방송 구분', value: state.channel.title),
            AppInfoRow(
              label: '희망 편성 슬롯',
              value: slot == null ? emptyValue : formatSlot(slot),
            ),
            AppInfoRow(
              label: '시작가',
              value: startPrice == null ? emptyValue : formatWon(startPrice),
            ),
            AppInfoRow(
              label: '호가',
              value: state.bidIncrement == null
                  ? emptyValue
                  : formatWon(state.bidIncrement!),
            ),
            AppInfoRow(
              label: '예상 정산',
              value: payout == null ? emptyValue : formatWon(payout),
            ),
          ],
        ),
        const SizedBox(height: _sectionBreak),
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
              SizedBox(width: AppSpacing.s10),
              Expanded(
                child: AppFeatureCard.stacked(
                  icon: AppIcons.featureLock,
                  title: '에스크로 정산',
                  caption: '낙찰 후 정산',
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.s25),
        AppCheckRow.consent(
          label: '검수 결과에 따라 등급·편성이 변경될 수 있음을 확인했습니다',
          checked: state.consentConfirmed,
          onChanged: (confirmed) => controller.setConsent(confirmed: confirmed),
        ),
      ],
    );
  }
}

/// "기본 정보 [수정]" 제목 줄 + 흰 카드(radius 8) 안에 구분선으로 나눈 줄들.
class _ReviewSection extends StatelessWidget {
  const _ReviewSection({
    required this.title,
    required this.onEdit,
    required this.children,
    this.trailingDivider = false,
    this.footer,
  });

  final String title;
  final VoidCallback onEdit;
  final List<Widget> children;

  /// 마지막 줄 아래에도 구분선을 둔다 (Figma 상태·검수).
  final bool trailingDivider;

  /// 줄들 아래 8 띄워 두는 상자 (예상 검수 등급).
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(child: Text(title, style: AppTextStyles.archivoH1)),
            AppButton.smallOutline(label: '수정', onPressed: onEdit),
          ],
        ),
        const SizedBox(height: AppSpacing.s16),
        AppPanel.card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (var i = 0; i < children.length; i++) ...[
                if (i > 0) ..._divider,
                children[i],
              ],
              if (trailingDivider) ..._divider,
              if (footer != null) ...[
                const SizedBox(height: AppSpacing.s8),
                footer!,
              ],
            ],
          ),
        ),
      ],
    );
  }

  static const _divider = [
    SizedBox(height: AppSpacing.s16),
    AppDivider(),
    SizedBox(height: AppSpacing.s16),
  ];
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:livion/core/formatting/number_format.dart';
import 'package:livion/design_system/design_system.dart';

import '../../domain/entities/inventory_listing.dart';
import '../../domain/usecases/inventory_rules.dart';
import '../providers/inventory_registration_controller.dart';
import '../providers/inventory_registration_dependencies.dart';
import 'inventory_option_picker.dart';
import 'inventory_registration_ui.dart';

/// 3단계 "방송·가격" (Figma 16_RegisterPricing, node 37:1937).
///
/// 방송 구분 · 희망 편성 슬롯(요일 + 시각) · 시작가 · 호가 단위 · 최저 낙찰 허용가 ·
/// 기준 낙찰가로 계산한 예상 정산.
class PricingStep extends ConsumerWidget {
  const PricingStep({super.key, required this.onMessage});

  /// 목록을 못 불러왔을 때 짧은 안내.
  final ValueChanged<String> onMessage;

  static const double _groupGap = AppSpacing.s25;
  static const _priceMaxLength = 9;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final options = ref.watch(inventoryFormOptionsProvider);
    final state = ref.watch(inventoryRegistrationControllerProvider);
    final controller = ref.read(
      inventoryRegistrationControllerProvider.notifier,
    );
    final guide = options.value?.pricingGuide;
    final priceHint = guide == null
        ? '0'
        : formatThousands(guide.recommendedStartPrice);
    final priceFormatters = [
      FilteringTextInputFormatter.digitsOnly,
      LengthLimitingTextInputFormatter(_priceMaxLength),
    ];

    return AppFormScrollView(
      children: [
        for (final channel in BroadcastChannel.values) ...[
          if (channel.index > 0) const SizedBox(height: AppSpacing.s10),
          AppOptionCard(
            title: channel.title,
            caption: channel.caption,
            selected: state.channel == channel,
            onTap: () => controller.selectChannel(channel),
          ),
        ],
        const SizedBox(height: _groupGap),
        AppFormField(
          label: '희망 편성 슬롯',
          child: _SlotPicker(
            state: state,
            hours: options.value?.slotHours ?? const [],
            onWeekday: controller.selectSlotWeekday,
            onHour: controller.selectSlotHour,
          ),
        ),
        const SizedBox(height: _groupGap),
        AppFormField(
          label: '시작가',
          isRequired: true,
          spacing: AppSpacing.s12,
          message: guide == null
              ? null
              : '권장가 ${formatWon(guide.recommendedStartPrice)} · '
                    '유사 품목 최근 낙찰 평균 '
                    '${formatMultiplier(guide.similarItemMultiplier)}배',
          child: AppTextInput(
            hint: priceHint,
            semanticLabel: '시작가',
            initialValue: state.startPrice,
            onChanged: controller.setStartPrice,
            keyboardType: TextInputType.number,
            inputFormatters: priceFormatters,
            trailing: const AppInputTrailing.unit('원'),
          ),
        ),
        const SizedBox(height: _groupGap),
        AppFormField(
          label: '호가 단위',
          isRequired: true,
          child: AppPickerField.dropdown(
            hint: '선택해주세요.',
            value: state.bidIncrement == null
                ? null
                : formatWon(state.bidIncrement!),
            semanticLabel: '호가 단위',
            onTap: () => _pickBidIncrement(context, ref, state.bidIncrement),
          ),
        ),
        const SizedBox(height: _groupGap),
        AppFormField(
          label: '최저 낙찰 허용가',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppTileGrid(
                columns: MinimumPriceMode.values.length,
                children: [
                  for (final mode in MinimumPriceMode.values)
                    AppOptionTile.radio(
                      label: switch (mode) {
                        MinimumPriceMode.none => '미설정',
                        MinimumPriceMode.custom => '직접 작성',
                      },
                      selected: state.minimumPriceMode == mode,
                      onTap: () => controller.setMinimumPriceMode(mode),
                    ),
                ],
              ),
              if (state.minimumPriceMode == MinimumPriceMode.custom) ...[
                const SizedBox(height: AppSpacing.s10),
                AppTextInput(
                  hint: priceHint,
                  semanticLabel: '최저 낙찰 허용가',
                  initialValue: state.minimumPrice,
                  onChanged: controller.setMinimumPrice,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  inputFormatters: priceFormatters,
                  trailing: const AppInputTrailing.unit('원'),
                ),
              ],
            ],
          ),
        ),
        const SizedBox(height: _groupGap),
        options.when(
          data: (o) => _SettlementPreview(
            estimate: SettlementEstimate.of(
              winningPrice: o.pricingGuide.referenceWinningPrice,
              slotKind: state.slotKind,
            ),
            slotKind: state.slotKind,
          ),
          loading: () => const SizedBox(
            height: AppControlHeight.buttonLg,
            child: AppLoadingView(),
          ),
          error: (_, _) => AppErrorView(
            message: '예상 정산을 불러오지 못했어요.',
            onRetry: () => ref.invalidate(inventoryFormOptionsProvider),
          ),
        ),
      ],
    );
  }

  Future<void> _pickBidIncrement(
    BuildContext context,
    WidgetRef ref,
    int? selected,
  ) async {
    final picked = await pickInventoryOption<int>(
      context,
      ref,
      title: '호가 단위',
      options: (o) => o.bidIncrements,
      label: formatWon,
      selected: selected,
      onMessage: onMessage,
    );
    if (picked != null) {
      ref
          .read(inventoryRegistrationControllerProvider.notifier)
          .selectBidIncrement(picked);
    }
  }
}

/// 요일 한 줄 + 회색 트레이(시각 칸 · 정기/프라임 안내 · 편성료).
class _SlotPicker extends StatelessWidget {
  const _SlotPicker({
    required this.state,
    required this.hours,
    required this.onWeekday,
    required this.onHour,
  });

  final InventoryRegistrationState state;
  final List<int> hours;
  final ValueChanged<BroadcastWeekday> onWeekday;
  final ValueChanged<int> onHour;

  static String _days(Set<BroadcastWeekday> days) => [
    for (final d in BroadcastWeekday.values)
      if (days.contains(d)) d.label,
  ].join('·');

  @override
  Widget build(BuildContext context) {
    final weekday = state.slotWeekday;
    final guideStyle = AppTextStyles.pretendardBody2.copyWith(
      color: AppColors.textSecondary,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppSegmentedChoice(
          options: [for (final d in BroadcastWeekday.values) d.label],
          selectedIndex: weekday?.index,
          onChanged: (i) => onWeekday(BroadcastWeekday.values[i]),
        ),
        const SizedBox(height: AppSpacing.s5),
        AppPanel.muted(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (hours.isNotEmpty) ...[
                AppTileGrid(
                  columns: hours.length,
                  children: [
                    for (final hour in hours) _hourTile(weekday, hour),
                  ],
                ),
                const SizedBox(height: AppSpacing.s8),
              ],
              AppPanel.translucent(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: AppSpacing.s10,
                      runSpacing: AppSpacing.s8,
                      children: [
                        _SlotGuide(
                          kind: BroadcastSlotKind.regular,
                          text:
                              '${_days(BroadcastSlotRules.regularDays)} '
                              '${formatSlotHour(BroadcastSlotRules.regularHour)}',
                          style: guideStyle,
                        ),
                        const AppVerticalDivider(
                          height: AppSpacing.s10,
                          color: AppColors.dividerOnTint,
                        ),
                        _SlotGuide(
                          kind: BroadcastSlotKind.prime,
                          text:
                              '${_days(BroadcastSlotRules.primeDays)} '
                              '${formatSlotHour(BroadcastSlotRules.primeHour)}',
                          style: guideStyle,
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.s10),
                    Text(
                      '편성료 ${BroadcastSlotRules.primeFeeMin ~/ _manwon}'
                      '~${BroadcastSlotRules.primeFeeMax ~/ _manwon}만 원',
                      style: AppTextStyles.pretendardH3,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  static const _manwon = 10000;

  Widget _hourTile(BroadcastWeekday? weekday, int hour) {
    // 요일을 골라야 그 시각이 정기·프라임인지 알 수 있다.
    final kind = weekday == null
        ? null
        : BroadcastSlotRules.kindOf(
            BroadcastSlot(weekday: weekday, hour: hour),
          );
    final badge = kind?.label;
    return AppOptionTile.plain(
      label: formatSlotHour(hour),
      selected: state.slotHour == hour,
      badge: badge == null ? null : AppBadge.filled(badge),
      onTap: () => onHour(hour),
    );
  }
}

/// "[정기] 화·목 20:00"
class _SlotGuide extends StatelessWidget {
  const _SlotGuide({
    required this.kind,
    required this.text,
    required this.style,
  });

  final BroadcastSlotKind kind;
  final String text;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppBadge.tag(kind.label!),
        const SizedBox(width: AppSpacing.s5),
        Text(text, style: style),
      ],
    );
  }
}

/// "예상 정산 [낙찰가 7,900원 기준]" + 낙찰가 · 수수료 · 편성료 · 합계.
class _SettlementPreview extends StatelessWidget {
  const _SettlementPreview({required this.estimate, required this.slotKind});

  final SettlementEstimate estimate;
  final BroadcastSlotKind? slotKind;

  @override
  Widget build(BuildContext context) {
    final kindLabel = slotKind?.label;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(child: Text('예상 정산', style: AppTextStyles.pretendardH3)),
            AppBadge.tag('낙찰가 ${formatWon(estimate.winningPrice)} 기준'),
          ],
        ),
        const SizedBox(height: AppSpacing.s16),
        AppPanel.card(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.s10,
            vertical: AppSpacing.s16,
          ),
          child: Column(
            children: [
              AppInfoRow.regular(
                label: '낙찰가',
                value: formatWon(estimate.winningPrice),
              ),
              ..._divided(
                AppInfoRow.regular(
                  label: '수수료 ${SettlementEstimate.commissionPercent}%',
                  value: formatWon(-estimate.commission),
                ),
              ),
              ..._divided(
                AppInfoRow.regular(
                  label: kindLabel == null ? '편성료' : '편성료 ($kindLabel)',
                  value: formatWon(-estimate.slotFee),
                ),
              ),
              ..._divided(
                AppInfoRow.emphasis(
                  label: '예상 정산',
                  value: formatWon(estimate.payout),
                ),
                bold: true,
              ),
            ],
          ),
        ),
      ],
    );
  }

  static List<Widget> _divided(Widget row, {bool bold = false}) => [
    const SizedBox(height: AppSpacing.s16),
    bold ? const AppDivider.bold() : const AppDivider(),
    const SizedBox(height: AppSpacing.s16),
    row,
  ];
}

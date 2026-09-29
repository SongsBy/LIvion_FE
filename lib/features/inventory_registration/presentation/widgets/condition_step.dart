import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:livion/core/formatting/date_format.dart';
import 'package:livion/design_system/design_system.dart';
import 'package:livion/shared/presentation/inspection_grade_ui.dart';

import '../../domain/entities/inventory_listing.dart';
import '../providers/inventory_registration_controller.dart';
import '../providers/inventory_registration_dependencies.dart';
import 'inventory_registration_ui.dart';

/// 2단계 "상태·검수" (Figma 15_RegisterCondition, node 37:1745).
///
/// 소비기한(D-day) · 보관 조건 · 재고 유형 · 외관 상태(여러 개) · 포장 상태를 고르면
/// 아래 기준표에서 해당 칸이 강조되고 예상 검수 등급이 보인다.
class ConditionStep extends ConsumerWidget {
  const ConditionStep({super.key});

  static const double _fieldGap = AppSpacing.s25;

  /// 소비기한은 오늘부터 3년 뒤까지 고른다.
  static const int _expiryPickerYears = 3;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(inventoryRegistrationControllerProvider);
    final controller = ref.read(
      inventoryRegistrationControllerProvider.notifier,
    );
    final today = ref.watch(inventoryRegistrationClockProvider)();
    final daysLeft = state.daysLeft(today);
    final grade = state.estimatedGrade(today);

    return AppFormScrollView(
      children: [
        AppFormField(
          label: '소비기한',
          isRequired: true,
          child: AppPickerField(
            hint: '선택해주세요.',
            value: state.expiryDate == null
                ? null
                : formatDotDate(state.expiryDate!),
            semanticLabel: '소비기한',
            trailing: daysLeft == null
                ? null
                : AppBadge.outline(formatDDay(daysLeft)),
            onTap: () => _pickExpiry(context, ref, today),
          ),
        ),
        const SizedBox(height: _fieldGap),
        AppFormField(
          label: '보관 조건',
          isRequired: true,
          child: AppTileGrid(
            columns: StorageCondition.values.length,
            children: [
              for (final value in StorageCondition.values)
                AppOptionTile.radio(
                  label: value.label,
                  selected: state.storage == value,
                  onTap: () => controller.selectStorage(value),
                ),
            ],
          ),
        ),
        const SizedBox(height: _fieldGap),
        AppFormField(
          label: '재고 유형',
          isRequired: true,
          child: AppTileGrid(
            columns: InventoryStockType.values.length,
            children: [
              for (final value in InventoryStockType.values)
                AppOptionTile.radio(
                  label: value.label,
                  selected: state.stockType == value,
                  onTap: () => controller.selectStockType(value),
                ),
            ],
          ),
        ),
        const SizedBox(height: _fieldGap),
        AppFormField(
          label: '외관 상태',
          isRequired: true,
          child: AppTileGrid(
            columns: 2,
            children: [
              for (final value in AppearanceCondition.values)
                AppOptionTile.checkbox(
                  label: value.label,
                  selected: state.appearance.contains(value),
                  onTap: () => controller.toggleAppearance(value),
                ),
            ],
          ),
        ),
        const SizedBox(height: _fieldGap),
        AppFormField(
          label: '포장 상태',
          isRequired: true,
          child: AppTileGrid(
            columns: PackagingCondition.values.length,
            children: [
              for (final value in PackagingCondition.values)
                AppOptionTile.radio(
                  label: value.label,
                  selected: state.packaging == value,
                  onTap: () => controller.selectPackaging(value),
                ),
            ],
          ),
        ),
        const SizedBox(height: _fieldGap),
        GradeSummaryCard(
          title: '예상 검수 등급',
          caption: gradeCaption(state, grade),
          grade: grade?.toAppGrade(),
        ),
        const SizedBox(height: AppSpacing.s5),
        AppCriteriaTable(
          columns: gradeColumns,
          rows: gradeCriteriaRows(state, today),
        ),
        const SizedBox(height: AppSpacing.s24),
        const AppTooltipCard(
          title: '주의사항',
          message: '검수 완료 후 소비기한·수량·사진을 수정하면 재 검수가 필요합니다',
        ),
      ],
    );
  }

  Future<void> _pickExpiry(
    BuildContext context,
    WidgetRef ref,
    DateTime today,
  ) async {
    final first = DateTime(today.year, today.month, today.day);
    final last = DateTime(
      first.year + _expiryPickerYears,
      first.month,
      first.day,
    );
    final current = ref
        .read(inventoryRegistrationControllerProvider)
        .expiryDate;
    final picked = await showDatePicker(
      context: context,
      initialDate: current == null || current.isBefore(first) ? first : current,
      firstDate: first,
      lastDate: last,
      helpText: '소비기한',
    );
    if (picked == null || !context.mounted) return;
    ref
        .read(inventoryRegistrationControllerProvider.notifier)
        .setExpiryDate(picked);
  }
}

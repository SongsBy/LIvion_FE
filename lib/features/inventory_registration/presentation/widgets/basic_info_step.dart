import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:livion/design_system/design_system.dart';

import '../../domain/entities/inventory_listing.dart';
import '../providers/inventory_registration_controller.dart';
import '../providers/inventory_registration_dependencies.dart';
import 'inventory_option_picker.dart';
import 'inventory_registration_ui.dart';

/// 1단계 "기본 정보" (Figma 14_RegisterBasic, node 37:1640).
///
/// 사진 4칸(정면·소비기한 라벨 필수) · 상품명 · 카테고리 · 규격 · 회당 공급 수량 · 브랜드.
class BasicInfoStep extends ConsumerWidget {
  const BasicInfoStep({super.key, required this.onMessage});

  /// 사진을 못 고르거나 목록을 못 불러왔을 때 짧은 안내.
  final ValueChanged<String> onMessage;

  /// Figma: 사진 칸 묶음과 입력칸 묶음 사이 32, 입력칸 사이 25.
  static const double _photosGap = AppSpacing.s32;
  static const double _fieldGap = AppSpacing.s25;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 선택지를 미리 받아 둔다. 재고 등록 화면이 떠 있는 동안 살아 있다.
    ref.watch(inventoryFormOptionsProvider);
    final state = ref.watch(inventoryRegistrationControllerProvider);
    final controller = ref.read(
      inventoryRegistrationControllerProvider.notifier,
    );

    return AppFormScrollView(
      children: [
        AppFormField(
          label: '사진',
          note: '소비기한 라벨 필수',
          noteHighlighted: true,
          isRequired: true,
          child: AppTileGrid(
            columns: 2,
            spacing: AppSpacing.s12,
            children: [
              for (final slot in InventoryPhotoSlot.values)
                AppPhotoTile(
                  label: slot.label,
                  image: resolveAppImageOrNull(state.photos[slot]),
                  onAdd: () => _pickPhoto(context, ref, slot),
                  onRemove: () => controller.removePhoto(slot),
                ),
            ],
          ),
        ),
        const SizedBox(height: _photosGap),
        AppFormField(
          label: '상품명',
          isRequired: true,
          child: AppTextInput(
            hint: '상품의 바코드를 스캔해주세요.',
            semanticLabel: '상품명',
            initialValue: state.productName,
            onChanged: controller.setProductName,
            textInputAction: TextInputAction.next,
          ),
        ),
        const SizedBox(height: _fieldGap),
        AppFormField(
          label: '카테고리',
          isRequired: true,
          child: AppPickerField.dropdown(
            hint: '선택해주세요.',
            value: state.category,
            semanticLabel: '카테고리',
            onTap: () => _pick(
              context,
              ref,
              title: '카테고리',
              options: (o) => o.categories,
              selected: state.category,
              onPicked: controller.selectCategory,
            ),
          ),
        ),
        const SizedBox(height: _fieldGap),
        AppFormField(
          label: '규격',
          isRequired: true,
          child: AppTextInput(
            hint: '상품의 규격을 선택해주세요.',
            semanticLabel: '규격',
            initialValue: state.size,
            onChanged: controller.setSize,
            textInputAction: TextInputAction.next,
          ),
        ),
        const SizedBox(height: _fieldGap),
        AppFormField(
          label: '회당 공급 수량',
          isRequired: true,
          child: AppTextInput(
            hint: '회당 공급수량을 입력해주세요.',
            semanticLabel: '회당 공급 수량',
            initialValue: state.supplyQuantity,
            onChanged: controller.setSupplyQuantity,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(_quantityMaxLength),
            ],
          ),
        ),
        const SizedBox(height: _fieldGap),
        AppFormField(
          label: '브랜드·제조사',
          child: AppPickerField.dropdown(
            hint: '선택해주세요.',
            value: state.brand,
            semanticLabel: '브랜드·제조사',
            onTap: () => _pick(
              context,
              ref,
              title: '브랜드·제조사',
              options: (o) => o.brands,
              selected: state.brand,
              onPicked: controller.selectBrand,
            ),
          ),
        ),
      ],
    );
  }

  static const _quantityMaxLength = 6;

  Future<void> _pickPhoto(
    BuildContext context,
    WidgetRef ref,
    InventoryPhotoSlot slot,
  ) async {
    final path = await ref.read(inventoryPhotoSourceProvider).pick(slot);
    if (!context.mounted) return;
    if (path == null) {
      onMessage('사진 촬영은 준비 중입니다.');
      return;
    }
    ref
        .read(inventoryRegistrationControllerProvider.notifier)
        .attachPhoto(slot, path);
  }

  Future<void> _pick(
    BuildContext context,
    WidgetRef ref, {
    required String title,
    required List<String> Function(InventoryFormOptions) options,
    required String? selected,
    required ValueChanged<String> onPicked,
  }) async {
    final picked = await pickInventoryOption<String>(
      context,
      ref,
      title: title,
      options: options,
      label: (v) => v,
      selected: selected,
      onMessage: onMessage,
    );
    if (picked != null) onPicked(picked);
  }
}

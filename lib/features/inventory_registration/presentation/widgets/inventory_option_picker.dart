import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:livion/design_system/design_system.dart';

import '../../domain/entities/inventory_listing.dart';
import '../providers/inventory_registration_dependencies.dart';

/// 폼 선택지를 받아(이미 받았으면 그대로) 아래 시트로 하나를 고르게 한다.
///
/// 목록을 못 받으면 [onMessage]로 알리고 다음에 다시 받도록 비운다. 닫으면 null.
Future<T?> pickInventoryOption<T>(
  BuildContext context,
  WidgetRef ref, {
  required String title,
  required List<T> Function(InventoryFormOptions options) options,
  required String Function(T value) label,
  required T? selected,
  required ValueChanged<String> onMessage,
}) async {
  final InventoryFormOptions loaded;
  try {
    loaded = await ref.read(inventoryFormOptionsProvider.future);
  } catch (_) {
    if (!context.mounted) return null;
    ref.invalidate(inventoryFormOptionsProvider);
    onMessage('목록을 불러오지 못했어요. 다시 시도해 주세요.');
    return null;
  }
  if (!context.mounted) return null;
  final values = options(loaded);
  final picked = await showAppSelectSheet(
    context,
    title: title,
    options: [for (final v in values) label(v)],
    selected: selected == null ? null : label(selected),
  );
  if (picked == null) return null;
  for (final v in values) {
    if (label(v) == picked) return v;
  }
  return null;
}

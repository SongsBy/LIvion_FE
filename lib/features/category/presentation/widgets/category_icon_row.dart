import 'package:flutter/material.dart';

import 'package:livion/design_system/design_system.dart';

import '../../domain/entities/product_category.dart';

/// 상단 대분류 아이콘 가로 목록 (Figma `Frame 2147238612`, 높이 76).
class CategoryIconRow extends StatelessWidget {
  const CategoryIconRow({
    super.key,
    required this.categories,
    required this.selectedId,
    required this.onChanged,
  });

  final List<ProductCategory> categories;
  final String selectedId;
  final ValueChanged<ProductCategory> onChanged;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i = 0; i < categories.length; i++) ...[
            if (i > 0) const SizedBox(width: AppSpacing.s12),
            _CategoryItem(
              category: categories[i],
              selected: categories[i].id == selectedId,
              onTap: () => onChanged(categories[i]),
            ),
          ],
        ],
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  const _CategoryItem({
    required this.category,
    required this.selected,
    required this.onTap,
  });

  final ProductCategory category;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final image = resolveAppImageOrNull(category.icon);
    if (image != null) {
      return AppCategoryIcon(
        label: category.name,
        image: image,
        selected: selected,
        onTap: onTap,
      );
    }
    return AppCategoryIcon.mark(
      label: category.name,
      mark: category.mark ?? category.name,
      selected: selected,
      onTap: onTap,
    );
  }
}

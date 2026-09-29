import 'package:flutter/material.dart';

import '../tokens/tokens.dart';
import 'app_check_label.dart';
import 'app_divider.dart';

/// 기준표의 한 줄. [highlightedIndex] 칸은 "✓ 오렌지 글자"로 보인다.
class AppCriteriaRow {
  const AppCriteriaRow({required this.cells, this.highlightedIndex});

  final List<String> cells;

  /// 지금 값이 해당하는 칸. null이면 강조 없이 모두 흐린 글자.
  final int? highlightedIndex;
}

/// 열 제목이 있는 작은 기준표. 옅은 테두리(radius 4) 안에 회색 제목 줄,
/// 줄 사이는 점선이다.
///
/// Figma 재고 등록 상태·검수: "A B C / D-30 이상 ✓D-8~29 D-7 / …".
class AppCriteriaTable extends StatelessWidget {
  const AppCriteriaTable({
    super.key,
    required this.columns,
    required this.rows,
  });

  final List<String> columns;
  final List<AppCriteriaRow> rows;

  static const _cellPadding = EdgeInsets.symmetric(
    horizontal: AppSpacing.s10,
    vertical: AppSpacing.s8,
  );

  @override
  Widget build(BuildContext context) {
    final muted = AppTextStyles.pretendardH3.copyWith(
      color: AppColors.opacityBlack65,
    );
    final plain = AppTextStyles.pretendardBody2Regular.copyWith(
      color: AppColors.opacityBlack65,
    );

    Widget cell(Widget child) => Expanded(
      child: Padding(
        padding: _cellPadding,
        child: Center(child: child),
      ),
    );

    return Container(
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.backgroundDefault,
        borderRadius: AppRadius.r4All,
        border: Border.all(
          color: AppColors.borderSubtle,
          width: AppBorderWidth.thin,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ColoredBox(
            color: AppColors.opacityBlack5,
            child: Row(
              children: [
                for (final title in columns)
                  cell(Text(title, style: muted, maxLines: 1)),
              ],
            ),
          ),
          const AppDivider(color: AppColors.borderSubtle),
          for (var r = 0; r < rows.length; r++) ...[
            if (r > 0) const AppDashedDivider(),
            Row(
              children: [
                for (var c = 0; c < columns.length; c++)
                  cell(
                    c == rows[r].highlightedIndex
                        ? AppCheckLabel(
                            label: _cellText(rows[r], c),
                            checked: true,
                          )
                        : Text(
                            _cellText(rows[r], c),
                            style: plain,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                  ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  static String _cellText(AppCriteriaRow row, int column) =>
      column < row.cells.length ? row.cells[column] : '';
}

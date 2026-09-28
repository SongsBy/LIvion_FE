import 'package:flutter/material.dart';

import '../text_sheet_spec.dart';
import 'typography_entry.dart';

/// Text Sheet 한 행: 이름(100) · Pretendard 열(300) · Archivo 열(300), 열 간격 60.
class TypographyRow extends StatelessWidget {
  const TypographyRow({super.key, required this.spec});

  static const double _nameWidth = 100;
  static const double _columnWidth = 300;
  static const double _columnGap = 60;

  /// 같은 열에 항목이 여러 개일 때의 세로 간격.
  static const double _entryGap = 14;

  final TypographyRowSpec spec;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: _columnGap,
      runSpacing: _entryGap,
      crossAxisAlignment: WrapCrossAlignment.start,
      children: [
        SizedBox(
          width: _nameWidth,
          child: Text(spec.name, style: spec.nameStyle),
        ),
        _EntryColumn(entries: spec.pretendard),
        if (spec.archivo.isNotEmpty) _EntryColumn(entries: spec.archivo),
      ],
    );
  }
}

class _EntryColumn extends StatelessWidget {
  const _EntryColumn({required this.entries});

  final List<TypographyEntrySpec> entries;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: TypographyRow._columnWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var i = 0; i < entries.length; i++) ...[
            if (i > 0) const SizedBox(height: TypographyRow._entryGap),
            TypographyEntry(spec: entries[i]),
          ],
        ],
      ),
    );
  }
}

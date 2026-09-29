import 'package:flutter/material.dart';

import '../tokens/tokens.dart';
import 'app_button.dart';

/// 알약 칩 한 줄에서 하나를 고른다. 선택은 오렌지 채움, 나머지는 외곽선.
///
/// 홈 "전체 라이브" 카테고리, 카테고리 화면의 하위 분류·방송 상태 칩이 같이 쓴다.
/// 넘치면 가로로 스크롤된다.
class AppChoiceChips extends StatelessWidget {
  const AppChoiceChips({
    super.key,
    required this.options,
    required this.selected,
    required this.onChanged,
  });

  final List<String> options;
  final String selected;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s16),
      child: Row(
        children: [
          for (var i = 0; i < options.length; i++) ...[
            if (i > 0) const SizedBox(width: AppSpacing.s6),
            Semantics(
              selected: options[i] == selected,
              child: options[i] == selected
                  ? AppButton.primary(
                      label: options[i],
                      onPressed: () => onChanged(options[i]),
                    )
                  : AppButton.outline(
                      label: options[i],
                      onPressed: () => onChanged(options[i]),
                    ),
            ),
          ],
        ],
      ),
    );
  }
}

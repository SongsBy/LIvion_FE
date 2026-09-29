import 'package:flutter/material.dart';

import '../tokens/tokens.dart';

/// 굵은 제목 + 보조 값 한 줄. "우리집 홍길동", "국민카드 ****1234".
class AppTitlePair extends StatelessWidget {
  const AppTitlePair({super.key, required this.title, this.value});

  /// Pretendard Bold 18.
  final String title;

  /// Pretendard Regular 16. null이면 제목만 보인다.
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Flexible(
          child: Text(
            title,
            style: AppTextStyles.pretendardH1,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (value != null) ...[
          const SizedBox(width: AppSpacing.s8),
          Flexible(
            child: Text(
              value!,
              style: AppTextStyles.pretendardBody1Regular,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ],
    );
  }
}

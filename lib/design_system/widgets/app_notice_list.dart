import 'package:flutter/material.dart';

import '../tokens/tokens.dart';
import 'app_divider.dart';

/// 안내 항목 하나 (굵은 제목 + 설명).
class AppNotice {
  const AppNotice({required this.title, required this.body});

  final String title;
  final String body;
}

/// 옅은 선으로 나눈 안내 목록 (Figma 판매자 페이지 "배송·반품·교환·A/S").
///
/// 맨 위·항목 사이·맨 아래에 선이 있고, 선과 글 사이는 16, 제목과 설명 사이는 10.
class AppNoticeList extends StatelessWidget {
  const AppNoticeList({super.key, required this.items});

  final List<AppNotice> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        const AppDivider(),
        for (final item in items) ...[
          const SizedBox(height: AppSpacing.s16),
          Semantics(
            container: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.title, style: AppTextStyles.pretendardH3),
                const SizedBox(height: AppSpacing.s10),
                Text(
                  item.body,
                  style: AppTextStyles.pretendardCaption1RegularRelaxed,
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.s16),
          const AppDivider(),
        ],
      ],
    );
  }
}

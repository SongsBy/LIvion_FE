import 'package:flutter/material.dart';

import '../tokens/tokens.dart';
import 'app_svg_icon.dart';

/// 회색 글머리 점(3) + 작은 회색 글씨 목록. 유의사항·안내 문구에 쓴다.
///
/// 흰 상자에 담을 때는 `AppPanel`로 감싼다.
class AppBulletList extends StatelessWidget {
  const AppBulletList({super.key, required this.items});

  final List<String> items;

  /// 글씨(12) 한 줄 가운데에 점을 맞춘다.
  static const double _dotTop = (12 - AppIconSize.bullet) / 2;

  @override
  Widget build(BuildContext context) {
    final style = AppTextStyles.pretendardCaption1Medium.copyWith(
      color: AppColors.textSecondary,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (var i = 0; i < items.length; i++) ...[
          if (i > 0) const SizedBox(height: AppSpacing.s8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: _dotTop),
                child: AppSvgIcon(AppIcons.bulletDot, size: AppIconSize.bullet),
              ),
              const SizedBox(width: AppSpacing.s6),
              Expanded(child: Text(items[i], style: style)),
            ],
          ),
        ],
      ],
    );
  }
}

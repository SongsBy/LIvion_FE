import 'package:flutter/material.dart';

import '../tokens/tokens.dart';
import 'app_avatar.dart';
import 'app_badge.dart';
import 'app_svg_icon.dart';

/// 댓글 한 개 (Figma 판매자 페이지_댓글 37:2441).
///
/// 위 줄: 아바타(24) · 이름 · [isSeller]면 "판매자" 뱃지 · 오른쪽 끝 시각.
/// 아래 줄: 본문 Regular 14 / 1.4. [isReply]면 왼쪽에 꺾쇠가 붙고, 아바타 테두리가
/// 오렌지가 되며 본문이 좌우 24 들여 쓰인다. 라이브 채팅처럼 한 줄에 이어 쓰는
/// 행은 [ChatMessageRow]를 쓴다.
class CommentRow extends StatelessWidget {
  const CommentRow({
    super.key,
    required this.name,
    required this.message,
    required this.time,
    this.avatarImage,
    this.isReply = false,
    this.isSeller = false,
  });

  final String name;
  final String message;

  /// 예: "오후 8:14", "2026.09.28"
  final String time;
  final ImageProvider? avatarImage;
  final bool isReply;
  final bool isSeller;

  static const Size _replyCorner = Size(10, 12);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      label: [
        if (isReply) '답글',
        name,
        if (isSeller) '판매자',
        message,
        time,
      ].join(', '),
      excludeSemantics: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              if (isReply) ...[
                const SizedBox(width: AppSpacing.s10),
                Padding(
                  // Figma: 꺾쇠는 줄 위쪽에 붙는다.
                  padding: const EdgeInsets.only(bottom: AppSpacing.s8),
                  child: AppSvgIcon.sized(
                    AppIcons.replyCorner,
                    size: _replyCorner,
                  ),
                ),
                const SizedBox(width: AppSpacing.s4),
              ],
              AppAvatar(
                size: AppAvatarSize.xs,
                image: avatarImage,
                silhouette: true,
                borderColor: isReply
                    ? AppColors.borderBrand
                    : AppColors.borderStrong,
              ),
              const SizedBox(width: AppSpacing.s8),
              Expanded(
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        name,
                        style: AppTextStyles.pretendardCaption1Regular.copyWith(
                          color: AppColors.textTertiary,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (isSeller) ...[
                      const SizedBox(width: AppSpacing.s4),
                      const AppBadge.seller(),
                    ],
                  ],
                ),
              ),
              const SizedBox(width: AppSpacing.s8),
              Text(
                time,
                style: AppTextStyles.pretendardCaption1Regular.copyWith(
                  color: AppColors.textDisabled,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.s8),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isReply ? AppSpacing.s24 : 0,
            ),
            child: Text(
              message,
              style: AppTextStyles.pretendardBody2RegularRelaxed,
            ),
          ),
        ],
      ),
    );
  }
}

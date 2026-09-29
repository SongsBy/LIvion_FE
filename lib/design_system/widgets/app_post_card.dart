import 'package:flutter/material.dart';

import '../tokens/tokens.dart';
import 'app_avatar.dart';
import 'app_expandable_text.dart';
import 'app_icon_button.dart';
import 'app_svg_icon.dart';
import 'app_thumbnail.dart';

/// 판매자 게시글 카드 (Figma 판매자 페이지 "콘텐츠").
///
/// 작성자 줄(아바타 40 · 이름 · 날짜 · 공유) · 정사각 사진(radius 10) ·
/// 두 줄 본문과 "전체보기" · 좋아요 / "댓글 N". 폭은 감싸는 쪽이 정한다.
/// 좋아요를 누른 상태면 오렌지 하트 옆에 "좋아요 N"이 붙는다.
class AppPostCard extends StatelessWidget {
  const AppPostCard({
    super.key,
    required this.authorName,
    required this.dateLabel,
    required this.body,
    required this.likeCount,
    required this.commentCount,
    this.authorAvatar,
    this.image,
    this.liked = false,
    this.onLike,
    this.onComment,
    this.onShare,
  });

  final String authorName;

  /// 예: "2026.09.28"
  final String dateLabel;
  final String body;
  final int likeCount;
  final int commentCount;
  final ImageProvider? authorAvatar;
  final ImageProvider? image;
  final bool liked;
  final VoidCallback? onLike;
  final VoidCallback? onComment;
  final VoidCallback? onShare;

  @override
  Widget build(BuildContext context) {
    final metaStyle = AppTextStyles.pretendardBody2.copyWith(
      color: AppColors.textSecondary,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppAvatar(
              size: AppAvatarSize.post,
              image: authorAvatar,
              silhouette: true,
              borderColor: AppColors.borderInverse,
              borderWidth: AppBorderWidth.thick,
            ),
            const SizedBox(width: AppSpacing.s10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: AppSpacing.s4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      authorName,
                      style: AppTextStyles.archivoCaption1Bold,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: AppSpacing.s8),
                    Text(
                      dateLabel,
                      style: AppTextStyles.pretendardCaption1Regular.copyWith(
                        color: AppColors.textDisabled,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox.square(
              dimension: AppIconSize.xl,
              child: OverflowBox(
                maxWidth: AppIconSize.touch,
                maxHeight: AppIconSize.touch,
                child: AppIconButton(
                  icon: AppIcons.share,
                  onPressed: onShare,
                  semanticLabel: '공유',
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.s10),
        AspectRatio(
          aspectRatio: 1,
          child: AppThumbnail(image: image, borderRadius: AppRadius.r10All),
        ),
        const SizedBox(height: AppSpacing.s10),
        AppExpandableText(body),
        const SizedBox(height: AppSpacing.s5),
        Row(
          children: [
            Semantics(
              button: true,
              toggled: liked,
              label: '좋아요 $likeCount',
              onTap: onLike,
              excludeSemantics: true,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: onLike,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppSvgIcon(
                      liked ? AppIcons.heartFilled : AppIcons.heartOutline,
                    ),
                    if (liked) ...[
                      const SizedBox(width: AppSpacing.s5),
                      Text('좋아요 $likeCount', style: metaStyle),
                    ],
                  ],
                ),
              ),
            ),
            const SizedBox(width: AppSpacing.s10),
            Semantics(
              button: true,
              label: '댓글 $commentCount',
              onTap: onComment,
              excludeSemantics: true,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: onComment,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const AppSvgIcon(
                      AppIcons.chatOutline,
                      color: AppColors.textPrimary,
                    ),
                    const SizedBox(width: AppSpacing.s5),
                    Text('댓글 $commentCount', style: metaStyle),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

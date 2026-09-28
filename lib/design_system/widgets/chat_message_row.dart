import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../tokens/tokens.dart';
import 'app_avatar.dart';
import 'app_badge.dart';

/// Figma `Row/Frame 2147238708` 둘째 변형: 채팅 메시지 행.
///
/// [isReply]면 왼쪽에 꺾쇠가 붙고 아바타 테두리가 오렌지가 된다.
/// [onDark]면 라이브 영상 위 오버레이용으로 글자가 흰색이고, 아바타가 없을 때
/// 실루엣을 그린다. [time]이 null이면 시각을 표시하지 않는다.
/// [maxLines]는 메시지 줄 수 제한이며 영상 위 오버레이는 1줄, 채팅 패널은 null(제한 없음)이다.
class ChatMessageRow extends StatelessWidget {
  const ChatMessageRow({
    super.key,
    required this.name,
    required this.message,
    this.time,
    this.avatarImage,
    this.isReply = false,
    this.isSeller = false,
    this.onDark = false,
    this.maxLines = 1,
  });

  final String name;
  final String message;
  final String? time;
  final ImageProvider? avatarImage;
  final bool isReply;
  final bool isSeller;
  final bool onDark;
  final int? maxLines;

  static const double _replyIconWidth = 10;
  static const double _replyIconHeight = 12;

  @override
  Widget build(BuildContext context) {
    final Color avatarBorder;
    if (isReply) {
      avatarBorder = AppColors.borderBrand;
    } else if (onDark && avatarImage == null) {
      avatarBorder = AppColors.borderInverse;
    } else {
      avatarBorder = AppColors.borderStrong;
    }
    final nameStyle = AppTextStyles.pretendardCaption1Regular.copyWith(
      color: onDark ? AppColors.textInverse : AppColors.textTertiary,
    );
    final messageStyle = onDark
        ? AppTextStyles.pretendardBody2.copyWith(color: AppColors.textInverse)
        : maxLines == 1
        ? AppTextStyles.pretendardBody2
        : AppTextStyles.pretendardBody2Relaxed;

    return Padding(
      padding: EdgeInsets.only(left: isReply ? AppSpacing.s10 : 0),
      child: Row(
        children: [
          if (isReply) ...[
            SvgPicture.asset(
              AppIcons.replyCorner,
              width: _replyIconWidth,
              height: _replyIconHeight,
              excludeFromSemantics: true,
            ),
            const SizedBox(width: AppSpacing.s4),
          ],
          AppAvatar(
            size: AppAvatarSize.xs,
            image: avatarImage,
            silhouette: onDark,
            borderColor: avatarBorder,
          ),
          const SizedBox(width: AppSpacing.s8),
          Text(
            name,
            style: nameStyle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          if (isSeller) ...[
            const SizedBox(width: AppSpacing.s4),
            const AppBadge.seller(),
          ],
          const SizedBox(width: AppSpacing.s10),
          Expanded(
            child: Text(
              message,
              style: messageStyle,
              maxLines: maxLines,
              overflow: maxLines == null ? null : TextOverflow.ellipsis,
            ),
          ),
          if (time != null) ...[
            const SizedBox(width: AppSpacing.s10),
            Text(
              time!,
              style: AppTextStyles.pretendardCaption1Regular.copyWith(
                color: AppColors.textDisabled,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

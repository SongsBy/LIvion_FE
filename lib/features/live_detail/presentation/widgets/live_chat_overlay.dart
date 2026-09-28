import 'package:flutter/material.dart';

import 'package:livion/design_system/design_system.dart';

import '../../domain/entities/live_detail.dart';

/// 영상 위 왼쪽 아래에 흐르는 채팅 (폭 216, 최근 4줄 높이).
///
/// 최신 메시지가 아래에 붙고, 위로 스크롤하면 이전 메시지가 보인다.
/// 위쪽 한 줄은 서서히 투명해져 더 있음을 알린다 (Figma의 흐린 첫 줄).
class LiveChatOverlay extends StatelessWidget {
  const LiveChatOverlay({super.key, required this.messages});

  /// 오래된 것이 앞, 최신이 뒤.
  final List<LiveChatMessage> messages;

  static const double width = 216;

  /// 한 번에 보이는 줄 수 (Figma 4줄).
  static const int visibleRows = 4;

  /// 줄 높이는 아바타(24)와 같다.
  static const double _rowHeight = AppAvatarSize.xs;
  static const double _rowGap = AppSpacing.s8;
  static const double height =
      visibleRows * _rowHeight + (visibleRows - 1) * _rowGap;

  /// 위쪽에서 투명해지는 길이 (한 줄).
  static const double _fadeExtent = _rowHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: AppEdgeFade(
        edge: AppFadeEdge.top,
        extent: _fadeExtent,
        child: ListView.separated(
          // reverse: 최신이 아래, 시작 위치가 맨 아래. 위로 끌면 이전 채팅.
          reverse: true,
          padding: EdgeInsets.zero,
          physics: const ClampingScrollPhysics(),
          itemCount: messages.length,
          separatorBuilder: (_, _) => const SizedBox(height: _rowGap),
          itemBuilder: (_, i) {
            final message = messages[messages.length - 1 - i];
            return ChatMessageRow(
              name: message.senderName,
              message: message.message,
              avatarImage: resolveAppImageOrNull(message.senderAvatar),
              isReply: message.isReply,
              isSeller: message.isSeller,
              onDark: true,
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:livion/design_system/design_system.dart';

import '../../domain/entities/live_detail.dart';
import 'live_detail_ui.dart';

/// 채팅·입찰현황 패널의 "채팅" 탭 (Figma 26:366).
///
/// 최신 메시지가 아래에 붙고 위로 스크롤하면 이전 메시지가 보인다.
/// 목록 아래에 입력줄이 고정된다. [onSend]가 null이면 입력줄을 비활성으로 둔다.
class LiveChatPage extends StatelessWidget {
  const LiveChatPage({super.key, required this.messages, this.onSend});

  /// 오래된 것이 앞, 최신이 뒤.
  final List<LiveChatMessage> messages;
  final ValueChanged<String>? onSend;

  static const double _rowGap = AppSpacing.s10;

  /// 위쪽에서 투명해지는 길이 (한 줄).
  static const double _fadeExtent = AppAvatarSize.xs;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: messages.isEmpty
              ? const AppEmptyView(message: '아직 채팅이 없어요.\n첫 메시지를 남겨 보세요.')
              : AppEdgeFade(
                  edge: AppFadeEdge.top,
                  extent: _fadeExtent,
                  child: ListView.separated(
                    // reverse: 최신이 아래, 시작 위치가 맨 아래. 위로 끌면 이전 채팅.
                    reverse: true,
                    padding: const EdgeInsets.fromLTRB(
                      AppSpacing.s16,
                      AppSpacing.s20,
                      AppSpacing.s16,
                      AppSpacing.s8,
                    ),
                    physics: const ClampingScrollPhysics(),
                    itemCount: messages.length,
                    separatorBuilder: (_, _) => const SizedBox(height: _rowGap),
                    itemBuilder: (_, i) {
                      final message = messages[messages.length - 1 - i];
                      return ChatMessageRow(
                        name: message.senderName,
                        message: message.message,
                        time: message.timeLabel,
                        avatarImage: resolveAppImageOrNull(
                          message.senderAvatar,
                        ),
                        isReply: message.isReply,
                        isSeller: message.isSeller,
                        maxLines: null,
                      );
                    },
                  ),
                ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.s16,
            AppSpacing.s8,
            AppSpacing.s16,
            AppSpacing.s12,
          ),
          child: AppMessageField(
            onSend: onSend ?? (_) {},
            enabled: onSend != null,
          ),
        ),
      ],
    );
  }
}

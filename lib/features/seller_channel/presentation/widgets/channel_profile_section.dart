import 'package:flutter/material.dart';

import 'package:livion/design_system/design_system.dart';

import '../../domain/entities/seller_channel.dart';
import 'seller_channel_ui.dart';

/// 판매자 페이지 윗부분: 커버·프로필 · 소개(두 줄, 전체보기) · 문의 + 팔로우 버튼.
class ChannelProfileSection extends StatelessWidget {
  const ChannelProfileSection({
    super.key,
    required this.channel,
    required this.onToggleFollow,
    required this.onMessage,
  });

  final SellerChannel channel;
  final VoidCallback onToggleFollow;
  final VoidCallback onMessage;

  /// Figma: 프로필 줄 → 소개 20, 소개 → 버튼 줄 20 (버튼 줄 위아래 여백 10 포함 전).
  static const double _gap = AppSpacing.s20;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppChannelHeader(
          name: channel.name,
          meta: channel.followerLabel,
          cover: resolveAppImageOrNull(channel.cover),
          avatar: resolveAppImageOrNull(channel.avatar),
        ),
        const SizedBox(height: _gap),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s16),
          child: AppExpandableText(channel.intro),
        ),
        const SizedBox(height: _gap),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.s16,
            vertical: AppSpacing.s10,
          ),
          child: Row(
            children: [
              AppIconButton(
                icon: AppIcons.messageBox,
                onPressed: onMessage,
                semanticLabel: '판매자 문의',
                size: AppControlHeight.buttonSm,
                iconSize: AppControlHeight.buttonSm,
                iconColor: null,
              ),
              const SizedBox(width: AppSpacing.s5),
              Expanded(
                child: Semantics(
                  toggled: channel.isFollowing,
                  child: AppButton.compact(
                    icon: AppIcons.heartOutlineSmall,
                    label: channel.followButtonLabel,
                    outlined: channel.isFollowing,
                    onPressed: onToggleFollow,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

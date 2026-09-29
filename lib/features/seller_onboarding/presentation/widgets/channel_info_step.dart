import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:livion/design_system/design_system.dart';

import '../../domain/entities/seller_application.dart';
import '../providers/seller_application_controller.dart';
import 'seller_application_ui.dart';

/// 3단계 "채널" (Figma 판매자 전환_03, node 37:3093).
///
/// 프로필 사진 · 채널명 중복확인 · 채널 소개 · 대표 카테고리 · 방송 방식.
class ChannelInfoStep extends ConsumerWidget {
  const ChannelInfoStep({super.key, required this.onPickProfilePhoto});

  /// 프로필 사진 자리를 눌렀을 때. 사진 고르기는 아직 준비 중이다.
  final VoidCallback onPickProfilePhoto;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(sellerApplicationControllerProvider);
    final controller = ref.read(sellerApplicationControllerProvider.notifier);

    final nameMessage = checkFailureMessage(
      state.channelNameCheck,
      rejected: '이미 사용 중인 채널명이에요.',
    );

    return AppFormScrollView(
      children: [
        AppFormField(
          label: '프로필',
          isRequired: true,
          child: Align(
            alignment: Alignment.centerLeft,
            child: AppPhotoSlot(
              semanticLabel: '채널 프로필 사진 추가',
              onTap: onPickProfilePhoto,
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.s25),
        AppFormField(
          label: '채널명',
          isRequired: true,
          message: nameMessage,
          isError: nameMessage != null,
          child: AppTextInput(
            hint: '채널명을 입력해주세요.',
            semanticLabel: '채널명',
            initialValue: state.channelName,
            onChanged: controller.setChannelName,
            inputFormatters: [
              LengthLimitingTextInputFormatter(
                SellerApplicationRules.channelNameMaxLength,
              ),
            ],
            trailing: checkTrailing(
              status: state.channelNameCheck,
              actionLabel: '중복확인',
              passedLabel: '사용가능',
              onAction: SellerApplicationRules.isChannelName(state.channelName)
                  ? controller.checkChannelName
                  : null,
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.s25),
        AppFormField(
          label: '채널소개',
          isRequired: true,
          child: AppTextInput(
            hint: '주로 취급하는 상품 혹은 정기 방송일 등\n채널 소개를 작성해주세요.',
            semanticLabel: '채널 소개',
            initialValue: state.channelIntro,
            onChanged: controller.setChannelIntro,
            maxLines: 5,
            inputFormatters: [
              LengthLimitingTextInputFormatter(
                SellerApplicationRules.channelIntroMaxLength,
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.s25),
        AppFormField(
          label: '대표 카테고리',
          isRequired: true,
          child: AppTileGrid(
            columns: 2,
            children: [
              for (final category in ChannelCategory.values)
                AppOptionTile.radio(
                  label: category.label,
                  selected: state.category == category,
                  onTap: () => controller.selectCategory(category),
                ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.s25),
        AppFormField(
          label: '방송 방식',
          isRequired: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppOptionCard(
                title: 'Livion 공식 방송 위탁',
                caption: '검수·진행·CS 대행',
                badge: const AppBadge.outline('권장'),
                selected: state.broadcastMode == BroadcastMode.official,
                onTap: () =>
                    controller.selectBroadcastMode(BroadcastMode.official),
              ),
              const SizedBox(height: AppSpacing.s10),
              AppOptionCard(
                title: '자체 채널 방송',
                caption: '방송 툴 제공 · 사전 신청',
                selected: state.broadcastMode == BroadcastMode.own,
                onTap: () => controller.selectBroadcastMode(BroadcastMode.own),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

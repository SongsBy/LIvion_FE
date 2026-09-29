import 'package:flutter/material.dart';

import '../tokens/tokens.dart';
import 'app_avatar.dart';
import 'app_badge.dart';
import 'app_bottom_sheet.dart';
import 'app_svg_icon.dart';

/// 상단 바 프로필 자리의 계정 전환 토글.
///
/// 어두운 알약(36) 안에 흰 테두리 아바타(32) + 아래 화살표. 누르면 보통
/// [showAppProfileSwitchSheet]로 계정 목록을 연다. [isBusy]면 화살표 자리에
/// 진행 표시를 두고 누를 수 없다.
class AppProfileSwitch extends StatelessWidget {
  const AppProfileSwitch({
    super.key,
    required this.semanticLabel,
    this.image,
    this.onTap,
    this.onLongPress,
    this.isBusy = false,
  });

  /// 읽어 줄 설명 ("현재 계정 홍길동, 계정 전환").
  final String semanticLabel;
  final ImageProvider? image;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final bool isBusy;

  static const double height = AppControlHeight.pillSm;
  static const double _avatarInset = (height - AppAvatarSize.sm) / 2;

  @override
  Widget build(BuildContext context) {
    final enabled = !isBusy;
    return Semantics(
      button: true,
      enabled: enabled && onTap != null,
      label: semanticLabel,
      excludeSemantics: true,
      child: Material(
        color: AppColors.backgroundDark,
        shape: const StadiumBorder(),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: enabled ? onTap : null,
          onLongPress: enabled ? onLongPress : null,
          child: SizedBox(
            height: height,
            child: Padding(
              padding: const EdgeInsets.only(
                left: _avatarInset,
                right: AppSpacing.s12,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppAvatar(
                    size: AppAvatarSize.sm,
                    image: image,
                    silhouette: true,
                    borderColor: AppColors.borderInverse,
                    borderWidth: AppBorderWidth.thick,
                  ),
                  const SizedBox(width: AppSpacing.s10),
                  SizedBox.square(
                    dimension: AppIconSize.lg,
                    child: isBusy
                        ? const Padding(
                            padding: EdgeInsets.all(AppSpacing.s2),
                            child: CircularProgressIndicator(
                              strokeWidth: AppBorderWidth.thick,
                              color: AppColors.textInverse,
                            ),
                          )
                        : const AppSvgIcon(
                            AppIcons.chevronDown,
                            size: AppIconSize.lg,
                            color: AppColors.textInverse,
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// [showAppProfileSwitchSheet]의 계정 한 줄.
class AppProfileOption {
  const AppProfileOption({
    required this.name,
    required this.caption,
    this.image,
    this.badge,
  });

  final String name;

  /// 이름 아래 설명 ("구매자 계정").
  final String caption;
  final ImageProvider? image;

  /// 이름 옆 오렌지 작은 뱃지 ("판매자"). null이면 없음.
  final String? badge;
}

/// 계정 목록 아래 한 줄짜리 동작 ("판매자로 전환하기 ›").
class AppProfileAction {
  const AppProfileAction({required this.label, required this.caption});

  final String label;
  final String caption;
}

/// [showAppProfileSwitchSheet]에서 고른 것.
sealed class AppProfileSheetResult {
  const AppProfileSheetResult();
}

/// [index]번 계정을 골랐다.
final class AppProfileSheetSelected extends AppProfileSheetResult {
  const AppProfileSheetSelected(this.index);

  final int index;
}

/// 아래 [AppProfileAction]을 눌렀다.
final class AppProfileSheetActionTapped extends AppProfileSheetResult {
  const AppProfileSheetActionTapped();
}

/// 계정 목록 시트를 띄우고 고른 결과를 돌려준다. 닫으면 null.
///
/// [action]이 있으면 목록 아래에 동작 한 줄을 더 둔다 (판매자 전환 안내 등).
Future<AppProfileSheetResult?> showAppProfileSwitchSheet(
  BuildContext context, {
  required List<AppProfileOption> options,
  required int selectedIndex,
  String title = '계정 전환',
  AppProfileAction? action,
}) {
  return showAppBottomSheet<AppProfileSheetResult>(
    context,
    title: title,
    builder: (context) => [
      for (var i = 0; i < options.length; i++)
        _ProfileOptionRow(
          option: options[i],
          selected: i == selectedIndex,
          onTap: () => Navigator.of(context).pop(AppProfileSheetSelected(i)),
        ),
      if (action != null)
        _ProfileActionRow(
          action: action,
          onTap: () =>
              Navigator.of(context).pop(const AppProfileSheetActionTapped()),
        ),
    ],
  );
}

class _ProfileOptionRow extends StatelessWidget {
  const _ProfileOptionRow({
    required this.option,
    required this.selected,
    required this.onTap,
  });

  final AppProfileOption option;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      selected: selected,
      label: '${option.name}, ${option.caption}',
      excludeSemantics: true,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.s16,
            vertical: AppSpacing.s10,
          ),
          child: Row(
            children: [
              AppAvatar(
                size: AppAvatarSize.md,
                image: option.image,
                silhouette: true,
                borderColor: selected ? AppColors.borderBrand : null,
                borderWidth: AppBorderWidth.thick,
              ),
              const SizedBox(width: AppSpacing.s12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            option.name,
                            style: AppTextStyles.pretendardH3,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (option.badge != null) ...[
                          const SizedBox(width: AppSpacing.s4),
                          AppBadge.seller(text: option.badge!),
                        ],
                      ],
                    ),
                    const SizedBox(height: AppSpacing.s6),
                    Text(
                      option.caption,
                      style: AppTextStyles.pretendardCaption1Regular.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              if (selected)
                const AppSvgIcon(
                  AppIcons.checkSmall,
                  size: AppIconSize.md,
                  color: AppColors.textBrand,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileActionRow extends StatelessWidget {
  const _ProfileActionRow({required this.action, required this.onTap});

  final AppProfileAction action;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: '${action.label}, ${action.caption}',
      excludeSemantics: true,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.s16,
            vertical: AppSpacing.s10,
          ),
          child: Row(
            children: [
              Container(
                width: AppAvatarSize.md,
                height: AppAvatarSize.md,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: AppColors.backgroundBrandWeak,
                  shape: BoxShape.circle,
                ),
                child: const AppSvgIcon(
                  AppIcons.navUser,
                  size: AppIconSize.lg,
                  color: AppColors.textBrand,
                ),
              ),
              const SizedBox(width: AppSpacing.s12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      action.label,
                      style: AppTextStyles.pretendardH3.copyWith(
                        color: AppColors.textBrand,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.s6),
                    Text(
                      action.caption,
                      style: AppTextStyles.pretendardCaption1Regular.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              // 섹션 제목 "전체 보기 ›"와 같은 오른쪽 화살표.
              const RotatedBox(
                quarterTurns: 2,
                child: AppSvgIcon(
                  AppIcons.chevronLeft,
                  size: AppIconSize.md,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

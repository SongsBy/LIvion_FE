import 'package:flutter/material.dart';

import '../tokens/tokens.dart';
import 'app_avatar.dart';
import 'app_icon_button.dart';
import 'app_logo.dart';

enum _AppTopBarKind { steps, home }

/// Figma `Sysbar` 세트.
///
/// - [AppTopBar.steps] 뒤로가기 + 제목 + "1/4" + 단계 진행선 (58)
/// - [AppTopBar.home]  Livion 로고 + 검색 + 알림 + 아바타 (56)
class AppTopBar extends StatelessWidget implements PreferredSizeWidget {
  const AppTopBar.steps({
    super.key,
    required String this.title,
    required int this.step,
    required int this.totalSteps,
    this.onBack,
  }) : _kind = _AppTopBarKind.steps,
       onSearch = null,
       onNotification = null,
       hasNotification = false,
       avatarImage = null,
       onAvatarTap = null;

  const AppTopBar.home({
    super.key,
    this.onSearch,
    this.onNotification,
    this.hasNotification = false,
    this.avatarImage,
    this.onAvatarTap,
  }) : _kind = _AppTopBarKind.home,
       title = null,
       step = null,
       totalSteps = null,
       onBack = null;

  final _AppTopBarKind _kind;

  final String? title;
  final int? step;
  final int? totalSteps;
  final VoidCallback? onBack;

  final VoidCallback? onSearch;
  final VoidCallback? onNotification;
  final bool hasNotification;
  final ImageProvider? avatarImage;
  final VoidCallback? onAvatarTap;

  /// "1/4" 표기 영역 폭.
  static const double _counterWidth = 24;

  /// 44 아이콘 버튼 안에서 24 아이콘이 16 여백에 맞도록 줄인 좌측 여백.
  static const double _leadingInset = AppSpacing.s16 - AppSpacing.s10;

  @override
  Size get preferredSize => Size.fromHeight(
    _kind == _AppTopBarKind.steps
        ? AppControlHeight.topBar + AppBorderWidth.thick
        : AppControlHeight.topBar,
  );

  @override
  Widget build(BuildContext context) {
    // Scaffold은 상태 바 높이만큼 여유를 주고 그 처리를 appBar에 맡긴다.
    return Material(
      color: AppColors.backgroundDefault,
      child: SafeArea(
        bottom: false,
        child: switch (_kind) {
          _AppTopBarKind.steps => _buildSteps(),
          _AppTopBarKind.home => _buildHome(),
        },
      ),
    );
  }

  Widget _buildSteps() {
    final completed = (step! - 1).clamp(0, totalSteps!);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: AppControlHeight.topBar,
          child: Padding(
            padding: const EdgeInsets.only(
              left: _leadingInset,
              right: AppSpacing.s16,
            ),
            child: Row(
              children: [
                AppIconButton(
                  icon: AppIcons.arrowLeft,
                  onPressed: onBack,
                  semanticLabel: '뒤로',
                ),
                Expanded(
                  child: Text(
                    title!,
                    style: AppTextStyles.archivoH1,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: _counterWidth),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('$step', style: AppTextStyles.pretendardH3),
                      Opacity(
                        opacity: AppOpacity.muted,
                        child: Text(
                          '/$totalSteps',
                          style: AppTextStyles.pretendardBody2Regular,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Row(
          children: [
            for (var i = 0; i < totalSteps!; i++)
              Expanded(
                child: Container(
                  height: AppBorderWidth.thick,
                  color: i < completed
                      ? AppColors.backgroundBrand
                      : AppColors.opacityBlack10,
                ),
              ),
          ],
        ),
      ],
    );
  }

  Widget _buildHome() {
    return SizedBox(
      height: AppControlHeight.topBar,
      child: Padding(
        padding: const EdgeInsets.only(
          left: AppSpacing.s16,
          right: AppSpacing.s4,
        ),
        child: Row(
          children: [
            const AppLogo(),
            const Spacer(),
            AppIconButton(
              icon: AppIcons.search,
              onPressed: onSearch,
              semanticLabel: '검색',
            ),
            AppIconButton(
              icon: AppIcons.bell,
              onPressed: onNotification,
              semanticLabel: '알림',
              showDot: hasNotification,
            ),
            Semantics(
              button: true,
              label: '내 프로필',
              child: InkWell(
                onTap: onAvatarTap,
                child: SizedBox.square(
                  dimension: AppIconSize.touch,
                  child: Center(
                    child: AppAvatar(
                      size: AppAvatarSize.xs,
                      image: avatarImage,
                      silhouette: true,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../tokens/tokens.dart';
import 'app_icon_button.dart';
import 'app_logo.dart';

enum _AppTopBarKind { steps, title, home, back }

/// Figma `Sysbar` 세트.
///
/// - [AppTopBar.steps] 뒤로가기 + 제목 + "1/4"(또는 글자 버튼 "임시저장") + 단계 진행선 (58)
/// - [AppTopBar.home]  Livion 로고 + 검색 + 알림 + 프로필 자리 (56)
/// - [AppTopBar.title] 뒤로가기 + 가운데 제목 (56). 흰 바탕.
/// - [AppTopBar.back]  뒤로가기만 (56). 바탕 없이 화면 배경이 비친다.
class AppTopBar extends StatelessWidget implements PreferredSizeWidget {
  const AppTopBar.steps({
    super.key,
    required String this.title,
    required int this.step,
    required int this.totalSteps,
    this.onBack,
    this.actionLabel,
    this.onAction,
  }) : _kind = _AppTopBarKind.steps,
       onSearch = null,
       onNotification = null,
       hasNotification = false,
       profile = null;

  /// Figma 회원가입(37:4082): [steps]에서 "1/4"와 진행선을 뺀 줄.
  const AppTopBar.title({super.key, required String this.title, this.onBack})
    : _kind = _AppTopBarKind.title,
      step = null,
      totalSteps = null,
      actionLabel = null,
      onAction = null,
      onSearch = null,
      onNotification = null,
      hasNotification = false,
      profile = null;

  /// Figma 판매자 전환(37:4011): 왼쪽 뒤로가기만 있는 투명 줄.
  const AppTopBar.back({super.key, this.onBack})
    : _kind = _AppTopBarKind.back,
      actionLabel = null,
      onAction = null,
      title = null,
      step = null,
      totalSteps = null,
      onSearch = null,
      onNotification = null,
      hasNotification = false,
      profile = null;

  const AppTopBar.home({
    super.key,
    this.onSearch,
    this.onNotification,
    this.hasNotification = false,
    this.profile,
  }) : _kind = _AppTopBarKind.home,
       actionLabel = null,
       onAction = null,
       title = null,
       step = null,
       totalSteps = null,
       onBack = null;

  final _AppTopBarKind _kind;

  final String? title;
  final int? step;
  final int? totalSteps;
  final VoidCallback? onBack;

  /// steps 전용. 있으면 "1/4" 대신 오른쪽 끝에 진한 오렌지 글자 버튼을 둔다
  /// (Figma 재고 등록 "임시저장").
  final String? actionLabel;
  final VoidCallback? onAction;

  final VoidCallback? onSearch;
  final VoidCallback? onNotification;
  final bool hasNotification;

  /// 오른쪽 끝 프로필 자리. 보통 계정 전환 토글([AppProfileSwitch])을 넣는다.
  final Widget? profile;

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
      color: _kind == _AppTopBarKind.back
          ? AppColors.backgroundTransparent
          : AppColors.backgroundDefault,
      child: SafeArea(
        bottom: false,
        child: switch (_kind) {
          _AppTopBarKind.steps => _buildSteps(),
          _AppTopBarKind.title => _buildTitleRow(
            // Figma는 제목이 가운데에 오도록 "1/4" 자리를 투명하게 남긴다.
            const SizedBox(width: _counterWidth),
          ),
          _AppTopBarKind.home => _buildHome(),
          _AppTopBarKind.back => _buildBack(),
        },
      ),
    );
  }

  Widget _buildSteps() {
    // Figma 판매자 전환 1/4 ~ 4/4: 지금 단계까지 진행선이 채워진다.
    final filled = step!.clamp(0, totalSteps!);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildTitleRow(
          actionLabel != null
              ? _TextAction(label: actionLabel!, onTap: onAction)
              : ConstrainedBox(
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
        ),
        Row(
          children: [
            for (var i = 0; i < totalSteps!; i++)
              Expanded(
                child: Container(
                  height: AppBorderWidth.thick,
                  color: i < filled
                      ? AppColors.backgroundBrand
                      : AppColors.opacityBlack10,
                ),
              ),
          ],
        ),
      ],
    );
  }

  /// 뒤로가기 + 가운데 제목 + 오른쪽 [trailing] (56).
  Widget _buildTitleRow(Widget trailing) {
    return SizedBox(
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
              child: Semantics(
                header: true,
                child: Text(
                  title!,
                  style: AppTextStyles.archivoH1,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            trailing,
          ],
        ),
      ),
    );
  }

  Widget _buildBack() {
    return SizedBox(
      height: AppControlHeight.topBar,
      child: Padding(
        padding: const EdgeInsets.only(left: _leadingInset),
        child: Align(
          alignment: Alignment.centerLeft,
          child: AppIconButton(
            icon: AppIcons.arrowLeft,
            onPressed: onBack,
            semanticLabel: '뒤로',
          ),
        ),
      ),
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
            if (profile != null) ...[
              const SizedBox(width: AppSpacing.s4),
              profile!,
              const SizedBox(width: AppSpacing.s12),
            ],
          ],
        ),
      ),
    );
  }
}

/// 상단 바 오른쪽 글자 버튼. 누를 자리는 바 높이만큼 넓힌다.
class _TextAction extends StatelessWidget {
  const _TextAction({required this.label, required this.onTap});

  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      enabled: onTap != null,
      label: label,
      onTap: onTap,
      excludeSemantics: true,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: SizedBox(
          height: AppControlHeight.topBar,
          child: Center(
            widthFactor: 1,
            child: Opacity(
              opacity: onTap == null ? AppOpacity.disabled : 1,
              child: Text(
                label,
                style: AppTextStyles.pretendardH3.copyWith(
                  color: AppColors.textPoint,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

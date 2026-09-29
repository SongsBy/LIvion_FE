import 'package:flutter/material.dart';

import '../tokens/tokens.dart';
import 'app_svg_icon.dart';

enum _SocialProvider { kakao, naver }

/// 외부 계정 로그인 버튼 (46, radius 4). Figma 로그인 (37:4067, 37:4070).
///
/// - [AppSocialLoginButton.kakao]: 카카오가 주는 버튼 그림(358×46)을 가운데에 둔다.
///   바탕을 같은 노란색으로 채워 화면이 넓어도 이어져 보이고, 좁으면 그림을 줄인다.
/// - [AppSocialLoginButton.naver]: 초록 바탕 위 흰 N + "네이버 로그인" 글자 그림.
class AppSocialLoginButton extends StatelessWidget {
  const AppSocialLoginButton.kakao({super.key, required this.onPressed})
    : _provider = _SocialProvider.kakao;

  const AppSocialLoginButton.naver({super.key, required this.onPressed})
    : _provider = _SocialProvider.naver;

  final VoidCallback? onPressed;
  final _SocialProvider _provider;

  @override
  Widget build(BuildContext context) {
    final (label, background, content) = switch (_provider) {
      _SocialProvider.kakao => (
        '카카오 로그인',
        AppColors.kakaoYellow,
        FittedBox(
          fit: BoxFit.scaleDown,
          child: AppSvgIcon.sized(
            AppIcons.kakaoLogin,
            size: AppIconSize.kakaoLogin,
          ),
        ),
      ),
      _SocialProvider.naver => (
        '네이버 로그인',
        AppColors.naverGreen,
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const AppSvgIcon(AppIcons.naverLogo, size: AppIconSize.naverLogo),
            const SizedBox(width: AppSpacing.s11),
            AppSvgIcon.sized(
              AppIcons.naverLoginText,
              size: AppIconSize.naverLoginText,
            ),
          ],
        ),
      ),
    };

    return Semantics(
      button: true,
      enabled: onPressed != null,
      label: label,
      excludeSemantics: true,
      child: Material(
        color: background,
        borderRadius: AppRadius.r4All,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onPressed,
          child: SizedBox(
            width: double.infinity,
            height: AppControlHeight.socialLogin,
            child: Center(child: content),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:livion/design_system/design_system.dart';

import 'auth_heading.dart';
import 'auth_text_action.dart';

/// 로그인 머리: Livion 로고 + 제목 + 안내 (Figma 37:4050).
class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AppLogo(width: AppLogo.mediumWidth),
        SizedBox(height: AppSpacing.s24),
        AuthHeading(
          title: '취향을 만나는 라이브 쇼핑',
          message: '로그인하고 라비온을 만나보세요.',
          centered: true,
        ),
      ],
    );
  }
}

/// "아이디 찾기 | 비밀번호 찾기" (Figma 37:4035).
class LoginHelpLinks extends StatelessWidget {
  const LoginHelpLinks({
    super.key,
    required this.onFindUsername,
    required this.onFindPassword,
  });

  final VoidCallback? onFindUsername;
  final VoidCallback? onFindPassword;

  @override
  Widget build(BuildContext context) {
    final style = AppTextStyles.pretendardCaption1MediumRelaxed.copyWith(
      color: AppColors.opacityBlack65,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AuthTextAction(label: '아이디 찾기', style: style, onTap: onFindUsername),
        const SizedBox(width: AppSpacing.s12),
        ExcludeSemantics(
          child: Text(
            '|',
            style: AppTextStyles.pretendardCaption1MediumRelaxed.copyWith(
              color: AppColors.opacityBlack10,
            ),
          ),
        ),
        const SizedBox(width: AppSpacing.s12),
        AuthTextAction(label: '비밀번호 찾기', style: style, onTap: onFindPassword),
      ],
    );
  }
}

/// "── SNS 로그인 ──" + 카카오·네이버 로그인 버튼 (Figma 37:4061).
class SocialLoginSection extends StatelessWidget {
  const SocialLoginSection({
    super.key,
    required this.onKakao,
    required this.onNaver,
  });

  final VoidCallback? onKakao;
  final VoidCallback? onNaver;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const AppLabeledDivider(label: 'SNS 로그인'),
        const SizedBox(height: AppSpacing.s14),
        AppSocialLoginButton.kakao(onPressed: onKakao),
        const SizedBox(height: AppSpacing.s10),
        AppSocialLoginButton.naver(onPressed: onNaver),
      ],
    );
  }
}

/// "아직 회원이 아니신가요? 회원가입" (Figma 37:4039).
class SignUpPrompt extends StatelessWidget {
  const SignUpPrompt({super.key, required this.onSignUp});

  final VoidCallback onSignUp;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '아직 회원이 아니신가요?',
          style: AppTextStyles.pretendardCaption1MediumRelaxed.copyWith(
            color: AppColors.opacityBlack65,
          ),
        ),
        const SizedBox(width: AppSpacing.s6),
        AuthTextAction(
          label: '회원가입',
          style: AppTextStyles.pretendardCaption1BoldRelaxed.copyWith(
            color: AppColors.textBrand,
          ),
          onTap: onSignUp,
        ),
      ],
    );
  }
}

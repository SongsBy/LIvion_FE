import 'package:flutter/material.dart';

import 'package:livion/design_system/design_system.dart';

/// 홈 하단 사업자 정보. 회색 배경, 링크 3개, 로고, 정보 표, 저작권.
class HomeFooter extends StatelessWidget {
  const HomeFooter({
    super.key,
    this.onCustomerCenter,
    this.onTerms,
    this.onPrivacy,
  });

  final VoidCallback? onCustomerCenter;
  final VoidCallback? onTerms;
  final VoidCallback? onPrivacy;

  static const double _labelWidth = 106;
  static const double _linkDividerHeight = 12;

  static const _info = <(String, List<String>)>[
    ('대표이사', ['이경석']),
    ('주소', ['서울특별시 관악구 관악로 1']),
    ('사업자등록번호', ['000-00-00000']),
    ('이메일', ['Livion@gmail.com']),
    ('고객센터', ['1544-0000', '운영시간 : 평일 09:00 ~ 18:00']),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.backgroundSubtle,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.s16,
        vertical: AppSpacing.s40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _FooterLink(label: '고객센터', onTap: onCustomerCenter),
              const _LinkDivider(),
              _FooterLink(label: '이용약관', onTap: onTerms),
              const _LinkDivider(),
              _FooterLink(
                label: '개인정보취급방침',
                onTap: onPrivacy,
                emphasized: true,
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.s24),
          const AppLogo(),
          const SizedBox(height: AppSpacing.s24),
          Opacity(
            opacity: AppOpacity.secondary,
            child: Column(
              children: [
                for (var i = 0; i < _info.length; i++) ...[
                  if (i > 0) const SizedBox(height: AppSpacing.s2),
                  _InfoRow(label: _info[i].$1, values: _info[i].$2),
                ],
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.s24),
          Opacity(
            opacity: AppOpacity.muted,
            child: Text(
              'Copyright 2026 Livion. Co., Ltd. All rights reserved',
              style: AppTextStyles.pretendardCaption1MediumRelaxed,
            ),
          ),
        ],
      ),
    );
  }
}

class _FooterLink extends StatelessWidget {
  const _FooterLink({
    required this.label,
    required this.onTap,
    this.emphasized = false,
  });

  final String label;
  final VoidCallback? onTap;

  /// 개인정보취급방침: 밑줄 + 100% 불투명.
  final bool emphasized;

  @override
  Widget build(BuildContext context) {
    final style = emphasized
        ? AppTextStyles.pretendardCaption1Medium.copyWith(
            decoration: TextDecoration.underline,
          )
        : AppTextStyles.pretendardCaption1Medium;
    return Semantics(
      link: true,
      label: label,
      child: InkWell(
        onTap: onTap,
        child: Opacity(
          opacity: emphasized ? 1 : AppOpacity.secondary,
          child: ExcludeSemantics(child: Text(label, style: style)),
        ),
      ),
    );
  }
}

class _LinkDivider extends StatelessWidget {
  const _LinkDivider();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s8),
      child: Container(
        width: AppBorderWidth.thin,
        height: HomeFooter._linkDividerHeight,
        color: AppColors.borderStrong,
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, required this.values});

  final String label;
  final List<String> values;

  @override
  Widget build(BuildContext context) {
    final style = AppTextStyles.pretendardCaption1MediumRelaxed;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: HomeFooter._labelWidth,
          child: Text(label, style: style),
        ),
        const SizedBox(width: AppSpacing.s8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var i = 0; i < values.length; i++) ...[
                if (i > 0) const SizedBox(height: AppSpacing.s2),
                Text(values[i], style: style),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

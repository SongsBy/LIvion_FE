import 'package:flutter/material.dart';

import '../tokens/tokens.dart';
import 'app_svg_icon.dart';

/// 몇 줄만 보이다가 "전체보기 ⌄"를 누르면 펼쳐지는 글.
///
/// Figma 판매자 페이지 소개·게시글: Medium 14 / 1.4 회색 두 줄, 아래 5 띄워
/// 65% 흐린 "전체보기 ⌄". 펼치면 "접기 ⌃"로 바뀐다. 글이 [maxLines] 안에 들어가면
/// 버튼을 숨긴다.
class AppExpandableText extends StatefulWidget {
  const AppExpandableText(
    this.text, {
    super.key,
    this.maxLines = 2,
    this.style,
  });

  final String text;
  final int maxLines;

  /// 기본은 Pretendard Medium 14 / 1.4 회색.
  final TextStyle? style;

  @override
  State<AppExpandableText> createState() => _AppExpandableTextState();
}

class _AppExpandableTextState extends State<AppExpandableText> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final style =
        widget.style ??
        AppTextStyles.pretendardBody2Relaxed.copyWith(
          color: AppColors.textSecondary,
        );
    return LayoutBuilder(
      builder: (context, constraints) {
        final painter = TextPainter(
          text: TextSpan(text: widget.text, style: style),
          maxLines: widget.maxLines,
          textDirection: Directionality.of(context),
          textScaler: MediaQuery.textScalerOf(context),
        )..layout(maxWidth: constraints.maxWidth);
        final overflows = painter.didExceedMaxLines;
        painter.dispose();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.text,
              style: style,
              maxLines: _expanded ? null : widget.maxLines,
              overflow: _expanded ? null : TextOverflow.ellipsis,
            ),
            if (overflows || _expanded) ...[
              const SizedBox(height: AppSpacing.s5),
              _Toggle(
                expanded: _expanded,
                onTap: () => setState(() => _expanded = !_expanded),
              ),
            ],
          ],
        );
      },
    );
  }
}

class _Toggle extends StatelessWidget {
  const _Toggle({required this.expanded, required this.onTap});

  final bool expanded;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final label = expanded ? '접기' : '전체보기';
    return Semantics(
      button: true,
      label: label,
      onTap: onTap,
      excludeSemantics: true,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Opacity(
          opacity: AppOpacity.expandToggle,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(label, style: AppTextStyles.pretendardCaption1Medium),
              // Figma는 오른쪽 화살표를 90° 돌려 아래 화살표로 쓴다.
              RotatedBox(
                quarterTurns: expanded ? 3 : 1,
                child: const AppSvgIcon(
                  AppIcons.chevronRight,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

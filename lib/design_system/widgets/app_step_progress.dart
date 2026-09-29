import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show OverflowBoxFit;
import 'package:flutter_svg/flutter_svg.dart';

import '../tokens/tokens.dart';
import 'app_svg_icon.dart';

/// 흰 상자 안 가로 진행 단계 "✓접수 ‒ ‒ ②서류확인 ‒ ‒ ③채널 개설 ‒ ‒ ④첫 편성".
///
/// Figma 판매자 심사 접수 완료 (37:3530). 앞에서부터 [completedCount]개는
/// 오렌지 체크 + 오렌지 굵은 이름, 나머지는 회색 번호 원 + 회색 이름이다.
/// 단계 사이는 점선으로 잇고 남는 폭을 점선이 나눠 가진다.
class AppStepProgress extends StatelessWidget {
  const AppStepProgress({
    super.key,
    required this.labels,
    required this.completedCount,
  });

  final List<String> labels;
  final int completedCount;

  static const double _marker = 20;

  /// 점선 칸 높이. 가운데(11.5)가 번호 원 가운데와 맞는다.
  static const double _connectorHeight = 24;

  /// 이름이 번호 원(20)보다 길면 양옆 점선 쪽으로 넘쳐 보인다.
  static const double _labelMaxWidth = 80;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label:
          '${labels.length}단계 중 $completedCount단계 완료, '
          '${labels.take(completedCount).join(', ')}',
      excludeSemantics: true,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.s24,
          vertical: AppSpacing.s8,
        ),
        decoration: const BoxDecoration(
          color: AppColors.backgroundDefault,
          borderRadius: AppRadius.r4All,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var i = 0; i < labels.length; i++) ...[
              if (i > 0) ...[
                const SizedBox(width: AppSpacing.s8),
                Expanded(
                  child: SvgPicture.asset(
                    AppIcons.dashedConnector,
                    height: _connectorHeight,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(width: AppSpacing.s8),
              ],
              _step(i),
            ],
          ],
        ),
      ),
    );
  }

  Widget _step(int index) {
    final done = index < completedCount;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.s2),
      child: SizedBox(
        width: _marker,
        child: Column(
          children: [
            done
                ? const AppSvgIcon(
                    AppIcons.checkCircleFilled,
                    size: AppIconSize.lg,
                  )
                : Container(
                    width: _marker,
                    height: _marker,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: AppColors.backgroundPlaceholder,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${index + 1}',
                      style: AppTextStyles.pretendardCaption1Bold.copyWith(
                        color: AppColors.textInverse,
                      ),
                    ),
                  ),
            const SizedBox(height: AppSpacing.s8),
            OverflowBox(
              maxWidth: _labelMaxWidth,
              fit: OverflowBoxFit.deferToChild,
              child: Text(
                labels[index],
                style: done
                    ? AppTextStyles.pretendardCaption1Bold.copyWith(
                        color: AppColors.textBrand,
                      )
                    : AppTextStyles.pretendardCaption1Regular.copyWith(
                        color: AppColors.textSecondary,
                      ),
                maxLines: 1,
                softWrap: false,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show OverflowBoxFit;
import 'package:flutter_svg/flutter_svg.dart';

import '../tokens/tokens.dart';

/// 로고 격자 선택지 한 칸.
class AppLogoOption<T> {
  const AppLogoOption({required this.value, required this.label, this.logo});

  final T value;
  final String label;

  /// 80 로고 타일 SVG (예: [AppBankLogos.kakao]). 없으면 이름 첫 글자 타일을 보인다.
  final String? logo;
}

/// 로고 타일을 4열로 늘어놓은 아래 시트를 띄우고 고른 값을 돌려준다. 닫으면 null.
///
/// Figma 판매자 전환_05 (37:3324) 은행 선택: 위 모서리 20, 손잡이, 어두운 막 65%.
/// 선택지가 많아 화면을 넘으면 격자가 스크롤된다.
Future<T?> showAppLogoGridSheet<T>(
  BuildContext context, {
  required String semanticLabel,
  required List<AppLogoOption<T>> options,
  T? selected,
}) {
  return showModalBottomSheet<T>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    backgroundColor: AppColors.backgroundDefault,
    barrierColor: AppColors.backgroundOverlay,
    shape: const RoundedRectangleBorder(borderRadius: AppRadius.r20Top),
    builder: (context) => Semantics(
      scopesRoute: true,
      namesRoute: true,
      explicitChildNodes: true,
      label: semanticLabel,
      child: SafeArea(
        top: false,
        minimum: const EdgeInsets.only(bottom: AppSpacing.s40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: AppSpacing.s8),
            const _SheetHandle(),
            const SizedBox(height: AppSpacing.s20),
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s16),
                child: _LogoGrid<T>(
                  options: options,
                  selected: selected,
                  onPick: (value) => Navigator.of(context).pop(value),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class _SheetHandle extends StatelessWidget {
  const _SheetHandle();

  /// Figma 손잡이 폭.
  static const double _width = 120;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _width,
      height: AppControlHeight.sheetHandle,
      decoration: BoxDecoration(
        color: AppColors.fillHandle,
        borderRadius: BorderRadius.circular(AppControlHeight.sheetHandle / 2),
      ),
    );
  }
}

class _LogoGrid<T> extends StatelessWidget {
  const _LogoGrid({
    required this.options,
    required this.selected,
    required this.onPick,
  });

  final List<AppLogoOption<T>> options;
  final T? selected;
  final ValueChanged<T> onPick;

  static const int _columns = 4;
  static const double _minGap = AppSpacing.s12;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // 390 폭에서 80 타일 4개 + 사이 12. 좁으면 타일을 줄이고 넓어도 80을 넘지 않는다.
        final tile =
            ((constraints.maxWidth - _minGap * (_columns - 1)) / _columns)
                .clamp(0.0, AppIconSize.logo);
        final gap = (constraints.maxWidth - tile * _columns) / (_columns - 1);
        final rows = <Widget>[];
        for (var start = 0; start < options.length; start += _columns) {
          if (rows.isNotEmpty) rows.add(const SizedBox(height: AppSpacing.s20));
          rows.add(
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var i = 0; i < _columns; i++) ...[
                  if (i > 0) SizedBox(width: gap),
                  SizedBox(
                    width: tile,
                    child: start + i < options.length
                        ? AppLogoTile(
                            label: options[start + i].label,
                            logo: options[start + i].logo,
                            size: tile,
                            labelOverflow: gap,
                            selected: options[start + i].value == selected,
                            onTap: () => onPick(options[start + i].value),
                          )
                        : null,
                  ),
                ],
              ],
            ),
          );
        }
        return Column(mainAxisSize: MainAxisSize.min, children: rows);
      },
    );
  }
}

/// 로고 타일(80) + 아래 이름. 고른 칸은 오렌지 테두리로 둘러싼다.
class AppLogoTile extends StatelessWidget {
  const AppLogoTile({
    super.key,
    required this.label,
    required this.onTap,
    this.logo,
    this.size = AppIconSize.logo,
    this.labelOverflow = 0,
    this.selected = false,
  });

  final String label;
  final String? logo;
  final VoidCallback? onTap;
  final double size;

  /// 이름이 타일보다 길 때 양옆으로 넘쳐도 되는 폭 (보통 칸 사이 간격).
  /// Figma "MG새마을금고"처럼 이름이 칸 사이로 조금 걸친다.
  final double labelOverflow;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final image = logo == null
        ? Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: AppColors.backgroundSubtle,
              borderRadius: AppRadius.r20All,
            ),
            child: Text(
              label.characters.first,
              style: AppTextStyles.pretendardH1.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          )
        : SvgPicture.asset(logo!, width: size, height: size);

    return Semantics(
      button: true,
      selected: selected,
      label: label,
      onTap: onTap,
      excludeSemantics: true,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox.square(
              dimension: size,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  image,
                  if (selected)
                    const DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: AppRadius.r20All,
                        border: Border.fromBorderSide(
                          BorderSide(
                            color: AppColors.borderBrand,
                            width: AppBorderWidth.thick,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.s10),
            OverflowBox(
              maxWidth: size + labelOverflow,
              fit: OverflowBoxFit.deferToChild,
              child: Text(
                label,
                style: AppTextStyles.pretendardBody2,
                textAlign: TextAlign.center,
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

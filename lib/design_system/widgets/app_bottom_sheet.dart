import 'package:flutter/material.dart';

import '../tokens/tokens.dart';

/// 제목 + 선택지 목록 형태의 아래 시트 공통 틀. 위 모서리 radius 12, 흰 배경.
///
/// [builder]는 제목 아래에 들어갈 행들을 만든다. 행이 넘치면 스크롤된다. 시트를 닫을 때는
/// 그 context로 `Navigator.of(context).pop(value)`를 부른다.
Future<T?> showAppBottomSheet<T>(
  BuildContext context, {
  required String title,
  required List<Widget> Function(BuildContext context) builder,
}) {
  return showModalBottomSheet<T>(
    context: context,
    backgroundColor: AppColors.backgroundDefault,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.r12)),
    ),
    builder: (context) => SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.only(
          top: AppSpacing.s20,
          bottom: AppSpacing.s12,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s16),
              child: Text(title, style: AppTextStyles.pretendardH2),
            ),
            const SizedBox(height: AppSpacing.s8),
            // 행이 많아 시트 최대 높이를 넘으면 행 부분만 스크롤한다 (은행 목록 등).
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: builder(context),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

/// Figma 댓글 시트 높이 비율 (화면 815 중 567).
const double _panelSheetHeightFactor = 567 / 815;

/// 옅은 회색 바탕에 얇은 손잡이가 달린 큰 아래 시트 (Figma 판매자 페이지_댓글).
///
/// 위 모서리 radius 12, 화면 높이의 약 70%. 손잡이 아래 [builder]가 남는 높이를 채운다.
/// 키보드가 올라오면 시트가 키보드 위로 밀려 올라가고 높이는 화면에 맞춰 줄어든다.
Future<T?> showAppPanelSheet<T>(
  BuildContext context, {
  required WidgetBuilder builder,
  double heightFactor = _panelSheetHeightFactor,
}) {
  return showModalBottomSheet<T>(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColors.backgroundSubtle,
    clipBehavior: Clip.antiAlias,
    shape: const RoundedRectangleBorder(borderRadius: AppRadius.r12Top),
    builder: (context) {
      final media = MediaQuery.of(context);
      final keyboard = media.viewInsets.bottom;
      final available = media.size.height - keyboard - media.padding.top;
      final height = (media.size.height * heightFactor).clamp(0.0, available);
      return Padding(
        padding: EdgeInsets.only(bottom: keyboard),
        child: SizedBox(
          height: height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: AppSpacing.s10),
              Center(
                child: Container(
                  width: AppControlHeight.sheetHandleWidth,
                  height: AppControlHeight.sheetHandleThin,
                  decoration: const BoxDecoration(
                    color: AppColors.backgroundPlaceholder,
                    borderRadius: AppRadius.r4All,
                  ),
                ),
              ),
              Expanded(child: builder(context)),
            ],
          ),
        ),
      );
    },
  );
}

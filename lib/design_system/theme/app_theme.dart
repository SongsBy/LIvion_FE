import 'package:flutter/material.dart';

import '../tokens/tokens.dart';

/// 앱 전역 ThemeData. 값은 모두 tokens에서 가져온다.
abstract final class AppTheme {
  static ThemeData get light {
    const colorScheme = ColorScheme.light(
      primary: AppColors.mainOrange,
      onPrimary: AppColors.neutral0,
      primaryContainer: AppColors.mainOrange10,
      onPrimaryContainer: AppColors.mainOrangeDark,
      secondary: AppColors.mainOrangeDark,
      onSecondary: AppColors.neutral0,
      surface: AppColors.backgroundDefault,
      onSurface: AppColors.textPrimary,
      onSurfaceVariant: AppColors.textSecondary,
      outline: AppColors.borderStrong,
      outlineVariant: AppColors.borderDefault,
      inverseSurface: AppColors.backgroundDark,
      onInverseSurface: AppColors.neutral0,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      fontFamily: AppFonts.pretendard,
      scaffoldBackgroundColor: AppColors.backgroundDefault,
      dividerColor: AppColors.borderStrong,
      textTheme: TextTheme(
        titleLarge: AppTextStyles.pretendardH1,
        titleMedium: AppTextStyles.pretendardH2,
        titleSmall: AppTextStyles.pretendardH3,
        bodyLarge: AppTextStyles.pretendardBody1,
        bodyMedium: AppTextStyles.pretendardBody2,
        bodySmall: AppTextStyles.pretendardCaption1Regular,
        labelLarge: AppTextStyles.pretendardLabel,
        labelMedium: AppTextStyles.pretendardCaption1Medium,
        labelSmall: AppTextStyles.pretendardCaption2,
      ),
    );
  }
}

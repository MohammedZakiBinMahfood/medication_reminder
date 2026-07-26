import 'package:flutter/material.dart';

import '../../../features/settings/models/settings_enums.dart';
import '../colors/app_colors.dart';
import '../spacing/app_spacing.dart';
import '../radius/app_radius.dart';
import '../typography/app_typography.dart';
import '../constants/app_constants.dart';

class AppTheme {
  AppTheme._();

  static Color getPrimaryColor(AppAccentColor accent) {
    switch (accent) {
      case AppAccentColor.indigo:
        return const Color(0xFF4F46E5);
      case AppAccentColor.emerald:
        return const Color(0xFF059669);
      case AppAccentColor.ocean:
        return const Color(0xFF0284C7);
      case AppAccentColor.sunset:
        return const Color(0xFFEA580C);
      case AppAccentColor.violet:
        return const Color(0xFF7C3AED);
    }
  }

  static ThemeData get darkTheme => buildDarkTheme(AppAccentColor.indigo);
  static ThemeData get lightTheme => buildLightTheme(AppAccentColor.indigo);

  static ThemeData buildDarkTheme([AppAccentColor accent = AppAccentColor.indigo]) {
    final primary = getPrimaryColor(accent);
    final colorScheme = ColorScheme.fromSeed(
      seedColor: primary,
      brightness: Brightness.dark,
      surface: AppColors.surfaceDark,
      onSurface: AppColors.textPrimaryDark,
      onSurfaceVariant: AppColors.textSecondaryDark,
      outline: AppColors.borderDark,
      outlineVariant: AppColors.dividerDark,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.backgroundDark,
      textTheme: const TextTheme(
        displayLarge: AppTypography.displayLarge,
        displayMedium: AppTypography.displayMedium,
        displaySmall: AppTypography.displaySmall,
        headlineLarge: AppTypography.headlineLarge,
        headlineMedium: AppTypography.headlineMedium,
        headlineSmall: AppTypography.headlineSmall,
        titleLarge: AppTypography.titleLarge,
        titleMedium: AppTypography.titleMedium,
        titleSmall: AppTypography.titleSmall,
        bodyLarge: AppTypography.bodyLarge,
        bodyMedium: AppTypography.bodyMedium,
        bodySmall: AppTypography.bodySmall,
        labelLarge: AppTypography.labelLarge,
        labelMedium: AppTypography.labelMedium,
        labelSmall: AppTypography.labelSmall,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surfaceDark,
        contentPadding: const EdgeInsets.all(AppSpacing.l),
        border: OutlineInputBorder(
          borderRadius: AppRadius.borderM,
          borderSide: const BorderSide(color: AppColors.borderDark),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppRadius.borderM,
          borderSide: const BorderSide(color: AppColors.borderDark),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppRadius.borderM,
          borderSide: BorderSide(color: primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: AppRadius.borderM,
          borderSide: const BorderSide(color: AppColors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: AppRadius.borderM,
          borderSide: const BorderSide(color: AppColors.error, width: 2),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: AppColors.surface,
          elevation: AppElevation.zero,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.xl,
            vertical: AppSpacing.m,
          ),
          shape: RoundedRectangleBorder(borderRadius: AppRadius.borderM),
          textStyle: AppTypography.labelLarge,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primary,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.l,
            vertical: AppSpacing.m,
          ),
          shape: RoundedRectangleBorder(borderRadius: AppRadius.borderM),
          textStyle: AppTypography.labelLarge,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primary,
          side: BorderSide(color: primary),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.xl,
            vertical: AppSpacing.m,
          ),
          shape: RoundedRectangleBorder(borderRadius: AppRadius.borderM),
          textStyle: AppTypography.labelLarge,
        ),
      ),
      cardTheme: const CardThemeData(
        color: AppColors.surfaceDark,
        elevation: AppElevation.low,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: AppRadius.borderM),
        clipBehavior: Clip.antiAlias,
      ),
      dialogTheme: const DialogThemeData(
        backgroundColor: AppColors.surfaceDark,
        elevation: AppElevation.high,
        shape: RoundedRectangleBorder(borderRadius: AppRadius.borderL),
      ),
      snackBarTheme: const SnackBarThemeData(
        backgroundColor: AppColors.textPrimaryDark,
        contentTextStyle: TextStyle(color: AppColors.surfaceDark),
        shape: RoundedRectangleBorder(borderRadius: AppRadius.borderS),
        behavior: SnackBarBehavior.floating,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.backgroundDark,
        foregroundColor: AppColors.textPrimaryDark,
        elevation: AppElevation.zero,
        centerTitle: true,
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.dividerDark,
        space: AppSpacing.l,
        thickness: 1,
      ),
    );
  }

  static ThemeData buildLightTheme([AppAccentColor accent = AppAccentColor.indigo]) {
    final primary = getPrimaryColor(accent);
    final colorScheme = ColorScheme.fromSeed(
      seedColor: primary,
      brightness: Brightness.light,
      surface: AppColors.surface,
      onSurface: AppColors.textPrimary,
      onSurfaceVariant: AppColors.textSecondary,
      outline: AppColors.border,
      outlineVariant: AppColors.divider,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.background,
      textTheme: const TextTheme(
        displayLarge: AppTypography.displayLarge,
        displayMedium: AppTypography.displayMedium,
        displaySmall: AppTypography.displaySmall,
        headlineLarge: AppTypography.headlineLarge,
        headlineMedium: AppTypography.headlineMedium,
        headlineSmall: AppTypography.headlineSmall,
        titleLarge: AppTypography.titleLarge,
        titleMedium: AppTypography.titleMedium,
        titleSmall: AppTypography.titleSmall,
        bodyLarge: AppTypography.bodyLarge,
        bodyMedium: AppTypography.bodyMedium,
        bodySmall: AppTypography.bodySmall,
        labelLarge: AppTypography.labelLarge,
        labelMedium: AppTypography.labelMedium,
        labelSmall: AppTypography.labelSmall,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface,
        contentPadding: const EdgeInsets.all(AppSpacing.l),
        border: OutlineInputBorder(
          borderRadius: AppRadius.borderM,
          borderSide: const BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppRadius.borderM,
          borderSide: const BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppRadius.borderM,
          borderSide: BorderSide(color: primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: AppRadius.borderM,
          borderSide: const BorderSide(color: AppColors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: AppRadius.borderM,
          borderSide: const BorderSide(color: AppColors.error, width: 2),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: AppColors.surface,
          elevation: AppElevation.zero,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.xl,
            vertical: AppSpacing.m,
          ),
          shape: RoundedRectangleBorder(borderRadius: AppRadius.borderM),
          textStyle: AppTypography.labelLarge,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primary,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.l,
            vertical: AppSpacing.m,
          ),
          shape: RoundedRectangleBorder(borderRadius: AppRadius.borderM),
          textStyle: AppTypography.labelLarge,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primary,
          side: BorderSide(color: primary),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.xl,
            vertical: AppSpacing.m,
          ),
          shape: RoundedRectangleBorder(borderRadius: AppRadius.borderM),
          textStyle: AppTypography.labelLarge,
        ),
      ),
      cardTheme: const CardThemeData(
        color: AppColors.surface,
        elevation: AppElevation.low,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: AppRadius.borderM),
        clipBehavior: Clip.antiAlias,
      ),
      dialogTheme: const DialogThemeData(
        backgroundColor: AppColors.surface,
        elevation: AppElevation.high,
        shape: RoundedRectangleBorder(borderRadius: AppRadius.borderL),
      ),
      snackBarTheme: const SnackBarThemeData(
        backgroundColor: AppColors.textPrimary,
        contentTextStyle: TextStyle(color: AppColors.surface),
        shape: RoundedRectangleBorder(borderRadius: AppRadius.borderS),
        behavior: SnackBarBehavior.floating,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.textPrimary,
        elevation: AppElevation.zero,
        centerTitle: true,
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.divider,
        space: AppSpacing.l,
        thickness: 1,
      ),
    );
  }
}

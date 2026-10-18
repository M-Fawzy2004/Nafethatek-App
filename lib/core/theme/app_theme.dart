import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';
import 'app_dimensions.dart';
import 'app_typography.dart';

/// Central theme configuration for Nafethatek application.
abstract class AppTheme {
  /// Light Theme Configuration
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.backgroundLight,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        onPrimary: Colors.white,
        secondary: AppColors.secondary,
        onSecondary: Colors.white,
        surface: AppColors.surfaceLight,
        onSurface: AppColors.textPrimaryLight,
        error: AppColors.error,
        onError: Colors.white,
      ),
      textTheme: AppTypography.buildTextTheme(AppColors.textPrimaryLight),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.surfaceLight,
        foregroundColor: AppColors.textPrimaryLight,
        elevation: 0,
        centerTitle: true,
        scrolledUnderElevation: 1,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        titleTextStyle: AppTypography.titleLarge.copyWith(
          color: AppColors.textPrimaryLight,
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.cardLight,
        elevation: 1,
        shadowColor: Colors.black.withValues(alpha: 0.04),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.r16),
          side: const BorderSide(color: AppColors.borderLight),
        ),
        margin: EdgeInsets.zero,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          minimumSize: Size(double.infinity, AppDimensions.buttonHeight),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.r12),
          ),
          textStyle: AppTypography.labelLarge,
          elevation: 0,
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: AppDimensions.p24,
            vertical: AppDimensions.p12,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          minimumSize: Size(double.infinity, AppDimensions.buttonHeight),
          side: const BorderSide(color: AppColors.primary, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.r12),
          ),
          textStyle: AppTypography.labelLarge,
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: AppDimensions.p24,
            vertical: AppDimensions.p12,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsetsDirectional.symmetric(
          horizontal: AppDimensions.p16,
          vertical: AppDimensions.p16,
        ),
        hintStyle: AppTypography.bodyMedium.copyWith(
          color: AppColors.textMutedLight,
        ),
        labelStyle: AppTypography.bodyMedium.copyWith(
          color: AppColors.textSecondaryLight,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.r12),
          borderSide: const BorderSide(color: AppColors.borderLight),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.r12),
          borderSide: const BorderSide(color: AppColors.borderLight),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.r12),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.r12),
          borderSide: const BorderSide(color: AppColors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.r12),
          borderSide: const BorderSide(color: AppColors.error, width: 1.5),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.dividerLight,
        thickness: 1,
        space: 1,
      ),
    );
  }

  /// Dark Theme Configuration
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: AppColors.primaryLight,
      scaffoldBackgroundColor: AppColors.backgroundDark,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primaryLight,
        onPrimary: Colors.white,
        secondary: AppColors.secondaryLight,
        onSecondary: Colors.black,
        surface: AppColors.surfaceDark,
        onSurface: AppColors.textPrimaryDark,
        error: AppColors.error,
        onError: Colors.white,
      ),
      textTheme: AppTypography.buildTextTheme(AppColors.textPrimaryDark),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.surfaceDark,
        foregroundColor: AppColors.textPrimaryDark,
        elevation: 0,
        centerTitle: true,
        scrolledUnderElevation: 1,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
        titleTextStyle: AppTypography.titleLarge.copyWith(
          color: AppColors.textPrimaryDark,
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.cardDark,
        elevation: 1,
        shadowColor: Colors.black.withValues(alpha: 0.2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.r16),
          side: const BorderSide(color: AppColors.borderDark),
        ),
        margin: EdgeInsets.zero,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryLight,
          foregroundColor: Colors.white,
          minimumSize: Size(double.infinity, AppDimensions.buttonHeight),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.r12),
          ),
          textStyle: AppTypography.labelLarge,
          elevation: 0,
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: AppDimensions.p24,
            vertical: AppDimensions.p12,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surfaceDark,
        contentPadding: EdgeInsetsDirectional.symmetric(
          horizontal: AppDimensions.p16,
          vertical: AppDimensions.p16,
        ),
        hintStyle: AppTypography.bodyMedium.copyWith(
          color: AppColors.textMutedDark,
        ),
        labelStyle: AppTypography.bodyMedium.copyWith(
          color: AppColors.textSecondaryDark,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.r12),
          borderSide: const BorderSide(color: AppColors.borderDark),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.r12),
          borderSide: const BorderSide(color: AppColors.borderDark),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.r12),
          borderSide: const BorderSide(color: AppColors.primaryLight, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.r12),
          borderSide: const BorderSide(color: AppColors.error),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.dividerDark,
        thickness: 1,
        space: 1,
      ),
    );
  }
}

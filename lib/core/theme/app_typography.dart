import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Centralized typography rules and text styles using flutter_screenutil.
abstract class AppTypography {
  // Primary Font Family - Works gracefully with system Arabic and Latin typefaces
  static const String? fontFamily = null;

  // Headings
  static TextStyle get displayLarge => TextStyle(
        fontFamily: fontFamily,
        fontSize: 32.sp,
        fontWeight: FontWeight.w700,
        height: 1.25,
        letterSpacing: -0.5,
      );

  static TextStyle get displayMedium => TextStyle(
        fontFamily: fontFamily,
        fontSize: 28.sp,
        fontWeight: FontWeight.w700,
        height: 1.25,
        letterSpacing: -0.25,
      );

  static TextStyle get headlineLarge => TextStyle(
        fontFamily: fontFamily,
        fontSize: 24.sp,
        fontWeight: FontWeight.w700,
        height: 1.3,
      );

  static TextStyle get headlineMedium => TextStyle(
        fontFamily: fontFamily,
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        height: 1.35,
      );

  static TextStyle get headlineSmall => TextStyle(
        fontFamily: fontFamily,
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        height: 1.4,
      );

  // Titles
  static TextStyle get titleLarge => TextStyle(
        fontFamily: fontFamily,
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        height: 1.4,
      );

  static TextStyle get titleMedium => TextStyle(
        fontFamily: fontFamily,
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        height: 1.4,
      );

  static TextStyle get titleSmall => TextStyle(
        fontFamily: fontFamily,
        fontSize: 12.sp,
        fontWeight: FontWeight.w600,
        height: 1.45,
      );

  // Body
  static TextStyle get bodyLarge => TextStyle(
        fontFamily: fontFamily,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        height: 1.5,
      );

  static TextStyle get bodyMedium => TextStyle(
        fontFamily: fontFamily,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        height: 1.5,
      );

  static TextStyle get bodySmall => TextStyle(
        fontFamily: fontFamily,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        height: 1.5,
      );

  // Labels & Buttons
  static TextStyle get labelLarge => TextStyle(
        fontFamily: fontFamily,
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        height: 1.4,
      );

  static TextStyle get labelMedium => TextStyle(
        fontFamily: fontFamily,
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        height: 1.4,
      );

  static TextStyle get labelSmall => TextStyle(
        fontFamily: fontFamily,
        fontSize: 10.sp,
        fontWeight: FontWeight.w500,
        height: 1.4,
      );

  /// Builds a complete Flutter TextTheme for light theme.
  static TextTheme buildTextTheme(Color defaultTextColor) {
    return TextTheme(
      displayLarge: displayLarge.copyWith(color: defaultTextColor),
      displayMedium: displayMedium.copyWith(color: defaultTextColor),
      headlineLarge: headlineLarge.copyWith(color: defaultTextColor),
      headlineMedium: headlineMedium.copyWith(color: defaultTextColor),
      headlineSmall: headlineSmall.copyWith(color: defaultTextColor),
      titleLarge: titleLarge.copyWith(color: defaultTextColor),
      titleMedium: titleMedium.copyWith(color: defaultTextColor),
      titleSmall: titleSmall.copyWith(color: defaultTextColor),
      bodyLarge: bodyLarge.copyWith(color: defaultTextColor),
      bodyMedium: bodyMedium.copyWith(color: defaultTextColor),
      bodySmall: bodySmall.copyWith(color: defaultTextColor),
      labelLarge: labelLarge.copyWith(color: defaultTextColor),
      labelMedium: labelMedium.copyWith(color: defaultTextColor),
      labelSmall: labelSmall.copyWith(color: defaultTextColor),
    );
  }
}

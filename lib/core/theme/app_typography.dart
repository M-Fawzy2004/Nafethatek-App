import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

/// Centralized typography rules and text styles using flutter_screenutil & GoogleFonts (Tajawal).
abstract class AppTypography {
  // Primary Font Family - Tajawal Arabic typeface
  static String? get fontFamily => GoogleFonts.tajawal().fontFamily;

  // Headings
  static TextStyle get displayLarge => GoogleFonts.tajawal(
        fontSize: 32.sp,
        fontWeight: FontWeight.w700,
        height: 1.25,
        letterSpacing: -0.5,
      );

  static TextStyle get displayMedium => GoogleFonts.tajawal(
        fontSize: 28.sp,
        fontWeight: FontWeight.w700,
        height: 1.25,
        letterSpacing: -0.25,
      );

  static TextStyle get headlineLarge => GoogleFonts.tajawal(
        fontSize: 24.sp,
        fontWeight: FontWeight.w700,
        height: 1.3,
      );

  static TextStyle get headlineMedium => GoogleFonts.tajawal(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        height: 1.35,
      );

  static TextStyle get headlineSmall => GoogleFonts.tajawal(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        height: 1.4,
      );

  // Titles
  static TextStyle get titleLarge => GoogleFonts.tajawal(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        height: 1.4,
      );

  static TextStyle get titleMedium => GoogleFonts.tajawal(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        height: 1.4,
      );

  static TextStyle get titleSmall => GoogleFonts.tajawal(
        fontSize: 12.sp,
        fontWeight: FontWeight.w600,
        height: 1.45,
      );

  // Body
  static TextStyle get bodyLarge => GoogleFonts.tajawal(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        height: 1.5,
      );

  static TextStyle get bodyMedium => GoogleFonts.tajawal(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        height: 1.5,
      );

  static TextStyle get bodySmall => GoogleFonts.tajawal(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        height: 1.5,
      );

  // Labels & Buttons
  static TextStyle get labelLarge => GoogleFonts.tajawal(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        height: 1.4,
      );

  static TextStyle get labelMedium => GoogleFonts.tajawal(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        height: 1.4,
      );

  static TextStyle get labelSmall => GoogleFonts.tajawal(
        fontSize: 10.sp,
        fontWeight: FontWeight.w500,
        height: 1.4,
      );

  /// Builds a complete Flutter TextTheme using GoogleFonts.tajawalTextTheme.
  static TextTheme buildTextTheme(Color defaultTextColor) {
    return GoogleFonts.tajawalTextTheme(
      TextTheme(
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
      ),
    );
  }
}

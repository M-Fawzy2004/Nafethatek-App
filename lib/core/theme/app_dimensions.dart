import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Centralized dimensions, paddings, and border radius tokens.
abstract class AppDimensions {
  // Padding & Spacing Values
  static double get p4 => 4.w;
  static double get p8 => 8.w;
  static double get p12 => 12.w;
  static double get p16 => 16.w;
  static double get p20 => 20.w;
  static double get p24 => 24.w;
  static double get p32 => 32.w;
  static double get p40 => 40.w;
  static double get p48 => 48.w;

  // Border Radii Values
  static double get r4 => 4.r;
  static double get r8 => 8.r;
  static double get r12 => 12.r;
  static double get r16 => 16.r;
  static double get r20 => 20.r;
  static double get r24 => 24.r;
  static double get r32 => 32.r;
  static double get rCircle => 999.r;

  // Component Heights
  static double get buttonHeight => 50.h;
  static double get inputHeight => 54.h;
  static double get appBarHeight => 56.h;
  static double get bottomNavBarHeight => 64.h;

  // Icon Sizes
  static double get iconSm => 18.r;
  static double get iconMd => 24.r;
  static double get iconLg => 32.r;
}

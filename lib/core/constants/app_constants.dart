import 'package:flutter/material.dart';

/// Application-wide non-sensitive constants and configurations.
abstract class AppConstants {
  // App Info
  static const String appName = 'Nafethatek';
  static const String appVersion = '1.0.0';

  // Responsive Screen Design Reference (Figma standard mobile viewport)
  static const Size designScreenSize = Size(375, 812);

  // Localization
  static const String translationsPath = 'assets/translations';
  static const Locale arabicLocale = Locale('ar');
  static const Locale englishLocale = Locale('en');
  static const List<Locale> supportedLocales = [
    arabicLocale,
    englishLocale,
  ];

  // Pagination & Lists
  static const int defaultPageSize = 20;

  // Cache & Storage keys
  static const String cachedUserTokenKey = 'CACHED_USER_TOKEN';
  static const String cachedAppLanguageKey = 'CACHED_APP_LANGUAGE';
}

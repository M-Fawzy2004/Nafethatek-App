import 'package:flutter/material.dart';

/// Centralized design token palette for the Nafethatek application.
abstract class AppColors {
  // Brand & Primary
  static const Color primary = Color(0xFF0E3A53); // Deep Architectural Blue
  static const Color primaryLight = Color(0xFF1E5B7E);
  static const Color primaryDark = Color(0xFF082232);

  // Secondary & Accents
  static const Color secondary = Color(0xFFD97706); // Warm Amber / Anodized Gold
  static const Color secondaryLight = Color(0xFFFBBF24);
  static const Color secondaryDark = Color(0xFFB45309);

  static const Color accent = Color(0xFF0284C7); // Precision Cyan

  // Neutral & Surfaces (Light)
  static const Color backgroundLight = Color(0xFFF8FAFC);
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color cardLight = Color(0xFFFFFFFF);
  static const Color borderLight = Color(0xFFE2E8F0);
  static const Color dividerLight = Color(0xFFEDF2F7);

  // Neutral & Surfaces (Dark)
  static const Color backgroundDark = Color(0xFF0B131E);
  static const Color surfaceDark = Color(0xFF152232);
  static const Color cardDark = Color(0xFF1C2D42);
  static const Color borderDark = Color(0xFF2D4059);
  static const Color dividerDark = Color(0xFF243347);

  // Typography Colors (Light)
  static const Color textPrimaryLight = Color(0xFF0F172A);
  static const Color textSecondaryLight = Color(0xFF64748B);
  static const Color textMutedLight = Color(0xFF94A3B8);

  // Typography Colors (Dark)
  static const Color textPrimaryDark = Color(0xFFF8FAFC);
  static const Color textSecondaryDark = Color(0xFF94A3B8);
  static const Color textMutedDark = Color(0xFF64748B);

  // Status & Feedback
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);

  // Shimmer & Skeletons
  static const Color shimmerBaseLight = Color(0xFFE2E8F0);
  static const Color shimmerHighlightLight = Color(0xFFF1F5F9);
  static const Color shimmerBaseDark = Color(0xFF1E293B);
  static const Color shimmerHighlightDark = Color(0xFF334155);
}

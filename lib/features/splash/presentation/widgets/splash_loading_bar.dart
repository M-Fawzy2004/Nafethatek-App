import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_typography.dart';

/// Ultra-refined, futuristic glowing loading bar with dynamic shimmer sweep,
/// glowing neon gradient, and breathing status indicator.
class SplashLoadingBar extends StatefulWidget {
  final double progress;
  final bool showPercentage;

  const SplashLoadingBar({
    super.key,
    required this.progress,
    this.showPercentage = true,
  });

  @override
  State<SplashLoadingBar> createState() => _SplashLoadingBarState();
}

class _SplashLoadingBarState extends State<SplashLoadingBar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _shimmerController;
  late final Animation<double> _shimmerAnimation;

  @override
  void initState() {
    super.initState();
    _shimmerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat();

    _shimmerAnimation = Tween<double>(begin: -1.0, end: 2.0).animate(
      CurvedAnimation(parent: _shimmerController, curve: Curves.easeInOutSine),
    );
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final clampedProgress = widget.progress.clamp(0.0, 1.0);
    final totalWidth = 180.w;
    final totalHeight = 6.h;

    return Semantics(
      label: 'Loading progress',
      value: '${(clampedProgress * 100).toInt()}%',
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Luminous Glass Progress Capsule
          Container(
            width: totalWidth,
            height: totalHeight,
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.35),
              borderRadius: BorderRadius.circular(AppDimensions.rCircle),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.22),
                width: 0.8,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.4),
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppDimensions.rCircle),
              child: Stack(
                children: [
                  // Base Track Glow
                  Container(
                    width: totalWidth,
                    height: totalHeight,
                    color: Colors.white.withValues(alpha: 0.08),
                  ),

                  // Active Filled Gradient Bar
                  AnimatedFractionallySizedBox(
                    duration: const Duration(milliseconds: 180),
                    curve: Curves.easeOutQuad,
                    alignment: AlignmentDirectional.centerStart,
                    widthFactor: clampedProgress,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          AppDimensions.rCircle,
                        ),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF0284C7),
                            Color(0xFF38BDF8),
                            Color(0xFF7DD3FC),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.accent.withValues(alpha: 0.95),
                            blurRadius: 10,
                            spreadRadius: 1,
                          ),
                          BoxShadow(
                            color: const Color(0xFF38BDF8)
                                .withValues(alpha: 0.5),
                            blurRadius: 20,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Continuous Shimmer Light Beam
                  AnimatedBuilder(
                    animation: _shimmerAnimation,
                    builder: (context, child) {
                      return FractionalTranslation(
                        translation: Offset(_shimmerAnimation.value, 0),
                        child: Container(
                          width: totalWidth * 0.4,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.white.withValues(alpha: 0.0),
                                Colors.white.withValues(alpha: 0.65),
                                Colors.white.withValues(alpha: 0.0),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: AppDimensions.p12),

          // Breathing Text & Percentage Label
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'splash.loading'.tr(),
                style: AppTypography.bodySmall.copyWith(
                  color: Colors.white.withValues(alpha: 0.85),
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0.5,
                ),
              ),
              if (widget.showPercentage) ...[
                SizedBox(width: AppDimensions.p8),
                Text(
                  '${(clampedProgress * 100).toInt()}%',
                  style: AppTypography.labelSmall.copyWith(
                    color: const Color(0xFF38BDF8),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

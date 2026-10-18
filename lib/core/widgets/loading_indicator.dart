import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_dimensions.dart';

/// Standard centered loading indicator.
class AppLoadingIndicator extends StatelessWidget {
  final double? size;
  final Color? color;

  const AppLoadingIndicator({
    super.key,
    this.size,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size ?? AppDimensions.iconMd,
        height: size ?? AppDimensions.iconMd,
        child: CircularProgressIndicator(
          strokeWidth: 2.5,
          valueColor: AlwaysStoppedAnimation<Color>(
            color ?? AppColors.primary,
          ),
        ),
      ),
    );
  }
}

/// Shimmer placeholder container for skeleton loaders.
class ShimmerPlaceholder extends StatelessWidget {
  final double? width;
  final double? height;
  final double? borderRadius;

  const ShimmerPlaceholder({
    super.key,
    this.width,
    this.height,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.shimmerBaseLight,
        borderRadius: BorderRadius.circular(
          borderRadius ?? AppDimensions.r8,
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_dimensions.dart';
import 'loading_indicator.dart';

/// Reusable cached network image with shimmer placeholder and error widget.
class CustomCachedImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final double? borderRadius;

  const CustomCachedImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final imageWidget = CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, url) => ShimmerPlaceholder(
        width: width,
        height: height,
        borderRadius: borderRadius,
      ),
      errorWidget: (context, url, error) => Container(
        width: width,
        height: height,
        color: AppColors.shimmerBaseLight,
        child: Icon(
          Icons.broken_image_outlined,
          color: AppColors.textMutedLight,
          size: AppDimensions.iconMd,
        ),
      ),
    );

    if (borderRadius != null && borderRadius! > 0) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius!),
        child: imageWidget,
      );
    }

    return imageWidget;
  }
}

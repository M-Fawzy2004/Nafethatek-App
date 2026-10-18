import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_dimensions.dart';
import 'loading_indicator.dart';

/// Reusable primary and outlined action button.
class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isOutlined;
  final Widget? icon;
  final double? width;
  final double? height;

  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.isOutlined = false,
    this.icon,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveHeight = height ?? AppDimensions.buttonHeight;

    if (isOutlined) {
      return SizedBox(
        width: width ?? double.infinity,
        height: effectiveHeight,
        child: OutlinedButton(
          onPressed: isLoading ? null : onPressed,
          child: _buildChild(context, AppColors.primary),
        ),
      );
    }

    return SizedBox(
      width: width ?? double.infinity,
      height: effectiveHeight,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        child: _buildChild(context, Colors.white),
      ),
    );
  }

  Widget _buildChild(BuildContext context, Color contentColor) {
    if (isLoading) {
      return AppLoadingIndicator(
        size: AppDimensions.iconSm,
        color: contentColor,
      );
    }

    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon!,
          SizedBox(width: AppDimensions.p8),
          Text(text),
        ],
      );
    }

    return Text(text);
  }
}

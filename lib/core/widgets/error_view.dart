import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_dimensions.dart';
import '../theme/app_typography.dart';
import 'app_button.dart';

/// Reusable full-view or inline error display widget.
class ErrorView extends StatelessWidget {
  final String? message;
  final VoidCallback? onRetry;
  final IconData icon;

  const ErrorView({
    super.key,
    this.message,
    this.onRetry,
    this.icon = Icons.error_outline_rounded,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsetsDirectional.all(AppDimensions.p24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 48,
              color: AppColors.error,
            ),
            SizedBox(height: AppDimensions.p16),
            Text(
              message ?? 'errors.general'.tr(),
              textAlign: TextAlign.center,
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textSecondaryLight,
              ),
            ),
            if (onRetry != null) ...[
              SizedBox(height: AppDimensions.p24),
              AppButton(
                text: 'common.retry'.tr(),
                onPressed: onRetry,
                width: 160,
                isOutlined: true,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

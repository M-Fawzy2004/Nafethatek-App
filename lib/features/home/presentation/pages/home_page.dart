import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/extensions/context_extensions.dart';

/// Main Landing / Home screen demonstrating the bootstrap architecture.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'app_name'.tr(),
          style: AppTypography.titleLarge.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            tooltip: 'Language',
            icon: const Icon(Icons.language_rounded, color: AppColors.primary),
            onPressed: () {
              final newLocale = context.isArabic
                  ? const Locale('en')
                  : const Locale('ar');
              context.setLocale(newLocale);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsetsDirectional.all(AppDimensions.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildHeroCard(context),
              SizedBox(height: AppDimensions.p20),
              _buildSectionTitle(context, 'home.categories'.tr()),
              SizedBox(height: AppDimensions.p12),
              _buildCategoriesGrid(context),
              SizedBox(height: AppDimensions.p20),
              _buildSectionTitle(context, 'home.featured_workshops'.tr()),
              SizedBox(height: AppDimensions.p12),
              _buildPlaceholderWorkshopCard(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeroCard(BuildContext context) {
    return Card(
      color: AppColors.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.r16),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.all(AppDimensions.p20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.window_rounded,
                  color: AppColors.secondary,
                  size: 28,
                ),
                SizedBox(width: AppDimensions.p8),
                Text(
                  'app_name'.tr(),
                  style: AppTypography.headlineSmall.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: AppDimensions.p8),
            Text(
              'home.search_hint'.tr(),
              style: AppTypography.bodyMedium.copyWith(
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTypography.titleMedium.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimaryLight,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'common.see_all'.tr(),
            style: AppTypography.labelMedium.copyWith(
              color: AppColors.secondary,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoriesGrid(BuildContext context) {
    final categories = [
      ('workshop.categories.windows'.tr(), Icons.window_outlined),
      ('workshop.categories.doors'.tr(), Icons.door_front_door_outlined),
      ('workshop.categories.kitchens'.tr(), Icons.countertops_outlined),
      ('workshop.categories.facades'.tr(), Icons.apartment_outlined),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: categories.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 2.2,
      ),
      itemBuilder: (context, index) {
        final item = categories[index];
        return Card(
          elevation: 0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.r12),
            side: const BorderSide(color: AppColors.borderLight),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(AppDimensions.r12),
            onTap: () {},
            child: Padding(
              padding: EdgeInsetsDirectional.all(AppDimensions.p12),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: AppColors.primaryLight.withValues(alpha: 0.12),
                    child: Icon(item.$2, color: AppColors.primary, size: 20),
                  ),
                  SizedBox(width: AppDimensions.p12),
                  Expanded(
                    child: Text(
                      item.$1,
                      style: AppTypography.titleSmall.copyWith(
                        color: AppColors.textPrimaryLight,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildPlaceholderWorkshopCard(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.r12),
        side: const BorderSide(color: AppColors.borderLight),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.all(AppDimensions.p16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundColor: AppColors.primary,
                  child: const Icon(Icons.handyman_rounded, color: Colors.white),
                ),
                SizedBox(width: AppDimensions.p12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'workshop.profile'.tr(),
                        style: AppTypography.titleMedium.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: AppDimensions.p4),
                      Text(
                        'workshop.subscription_active'.tr(),
                        style: AppTypography.bodySmall.copyWith(
                          color: AppColors.success,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

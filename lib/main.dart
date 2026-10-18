import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/constants/app_constants.dart';
import 'core/di/injection_container.dart';
import 'core/routes/app_router.dart';
import 'core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await initDependencies();

  runApp(
    EasyLocalization(
      supportedLocales: AppConstants.supportedLocales,
      path: AppConstants.translationsPath,
      fallbackLocale: AppConstants.arabicLocale,
      startLocale: AppConstants.arabicLocale,
      child: const MyApp(),
    ),
  );
}

/// Root Application Widget configuring ScreenUtil, Theming, and Routing.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: AppConstants.designScreenSize,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: AppConstants.appName,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.light,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/theme/app_colors.dart';
import '../controllers/splash_cubit.dart';
import '../controllers/splash_state.dart';
import '../widgets/splash_loading_bar.dart';

/// Fullscreen immersive Splash & Welcome screen.
/// Displays the full artwork edge-to-edge with a futuristic glowing loading indicator.
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashCubit>(
      create: (_) => sl<SplashCubit>()..startInitialization(),
      child: const _SplashPageView(),
    );
  }
}

class _SplashPageView extends StatelessWidget {
  const _SplashPageView();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarDividerColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: AppColors.backgroundDark,
        body: Stack(
          fit: StackFit.expand,
          children: [
            // Fullscreen Background Artwork
            Image.asset(
              'assets/images/splash.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.center,
            ),

            // Bottom Glowing Loading Indicator
            PositionedDirectional(
              start: 0,
              end: 0,
              bottom: 60.h,
              child: SafeArea(
                top: false,
                child: BlocBuilder<SplashCubit, SplashState>(
                  builder: (context, state) {
                    final progress = state is SplashLoading
                        ? state.progress
                        : (state is SplashReady ? 1.0 : 0.05);

                    return SplashLoadingBar(
                      key: const ValueKey('splash_loading_bar'),
                      progress: progress,
                      showPercentage: true,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

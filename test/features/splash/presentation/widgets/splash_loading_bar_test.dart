import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nafethatek_app/features/splash/presentation/widgets/splash_loading_bar.dart';

void main() {
  testWidgets('SplashLoadingBar renders with progress', (WidgetTester tester) async {
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => const MaterialApp(
          home: Scaffold(
            body: SplashLoadingBar(progress: 0.5),
          ),
        ),
      ),
    );

    expect(find.byType(SplashLoadingBar), findsOneWidget);
    expect(find.text('50%'), findsOneWidget);
  });
}

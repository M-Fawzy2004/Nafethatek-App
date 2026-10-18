import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/splash/presentation/pages/splash_page.dart';

/// Global application routing table using GoRouter.
abstract class AppRouter {
  static const String initialRoute = '/';
  static const String splash = '/';
  static const String home = '/home';
  static const String login = '/login';
  static const String workshopDetails = '/workshop/:id';
  static const String portfolio = '/portfolio';

  static final GoRouter router = GoRouter(
    initialLocation: initialRoute,
    routes: [
      GoRoute(
        path: initialRoute,
        name: 'splash',
        builder: (BuildContext context, GoRouterState state) => const SplashPage(),
      ),
      GoRoute(
        path: home,
        name: 'home',
        builder: (BuildContext context, GoRouterState state) => const HomePage(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Route not found: ${state.uri}'),
      ),
    ),
  );
}

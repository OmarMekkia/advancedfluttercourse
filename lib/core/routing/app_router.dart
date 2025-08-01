import 'package:advancedfluttercourse/core/routing/routes.dart';
import 'package:advancedfluttercourse/features/login/ui/widgets/login_screen.dart';
import 'package:advancedfluttercourse/features/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: Routes.onBoardingScreen,
    routes: [
      GoRoute(
        path: Routes.onBoardingScreen,
        builder: (context, state) {
          return  const OnboardingScreen();
        },
      ),
      GoRoute(
        path: Routes.loginScreen,
        builder: (context, state) {
          return const LoginScreen();
        },
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(title: Text('404')),
      body: Center(
        child: Text('No route defined for ${state.uri}'),
      ),
    ),
  
  );
}

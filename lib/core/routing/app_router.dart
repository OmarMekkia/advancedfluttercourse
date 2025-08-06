import 'package:advancedfluttercourse/core/routing/routes.dart';
import 'package:advancedfluttercourse/features/home/home_screen.dart';
import 'package:advancedfluttercourse/features/login/logic/cubit/login_cubit.dart';
import 'package:advancedfluttercourse/features/login/ui/login_screen.dart';
import 'package:advancedfluttercourse/features/onboarding/ui/onboarding_screen.dart';
import 'package:advancedfluttercourse/core/di/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: Routes.onBoardingScreen,
    routes: [
      GoRoute(
        path: Routes.onBoardingScreen,
        builder: (context, state) {
          return const OnboardingScreen();
        },
      ),
      GoRoute(
        path: Routes.loginScreen,
        builder: (context, state) {
          return BlocProvider(
            //fix this

            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          );
        },
      ),
      GoRoute(
        path: Routes.homeScreen,
        builder: (context, state) {
          return const HomeScreen();
        },
      )
    ],
    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(title: Text('404')),
      body: Center(child: Text('No route defined for ${state.uri}')),
    ),
  );
}

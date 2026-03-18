import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:k_rehab/features/auth/presentation/views/login_view.dart';
import 'package:k_rehab/features/auth/presentation/views/signup_view.dart';
import 'package:k_rehab/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:k_rehab/features/onboarding/presentation/views/medical_disclaimer_view.dart';
import 'package:k_rehab/features/onboarding/presentation/views/onboarding_view.dart';

abstract class AppRouter {
  static const String disclaimer = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String signup = '/signup';

  static final GoRouter router = GoRouter(
    initialLocation: disclaimer,
    routes: [
      GoRoute(
        path: disclaimer,
        pageBuilder: (context, state) => _slidePage(
          state: state,
          child: const MedicalDisclaimerView(),
        ),
      ),
      GoRoute(
        path: onboarding,
        pageBuilder: (context, state) => _slidePage(
          state: state,
          child: BlocProvider(
            create: (_) => OnboardingCubit(),
            child: const OnboardingView(),
          ),
        ),
      ),
      GoRoute(
        path: login,
        pageBuilder: (context, state) => _slidePage(
          state: state,
          child: const LoginView(),
        ),
      ),
      GoRoute(
        path: signup,
        pageBuilder: (context, state) => _slidePage(
          state: state,
          child: const SignupView(),
        ),
      ),
    ],
  );

  static CustomTransitionPage _slidePage({
    required GoRouterState state,
    required Widget child,
  }) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionDuration: const Duration(milliseconds: 400),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end).chain(
          CurveTween(curve: Curves.ease),
        );
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}

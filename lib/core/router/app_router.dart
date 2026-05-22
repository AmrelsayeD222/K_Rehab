import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:k_rehab/core/di/service_locator.dart';
import 'package:k_rehab/core/router/go_router_refresh_stream.dart';
import 'package:k_rehab/core/router/main_view.dart';
import 'package:k_rehab/core/services/cache_helper.dart';
import 'package:k_rehab/features/auth/data/repositories/auth_repo.dart';
import 'package:k_rehab/features/auth/presentation/manager/login/login_cubit.dart';
import 'package:k_rehab/features/auth/presentation/manager/register/register_cubit.dart';
import 'package:k_rehab/features/auth/presentation/views/login_view.dart';
import 'package:k_rehab/features/auth/presentation/views/signup_view.dart';
import 'package:k_rehab/features/exercises/data/models/exercise_model.dart';
import 'package:k_rehab/features/exercises/presentation/views/exercise_details_view.dart';
import 'package:k_rehab/features/onboarding/presentation/manager/onboarding/onboarding_cubit.dart';
import 'package:k_rehab/features/onboarding/presentation/views/medical_disclaimer_view.dart';
import 'package:k_rehab/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:k_rehab/features/payment/presentation/views/paywall_view.dart';
import 'package:k_rehab/features/protocols/data/models/protocol_model.dart';
import 'package:k_rehab/features/protocols/presentation/views/protocol_details_view.dart';

abstract class AppRouter {
  static const String disclaimer = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String mainView = '/mainView';
  static const String exerciseDetails = '/exerciseDetails';
  static const String protocolDetails = '/protocolDetails';
  static const String paywall = '/paywall';

  static GoRouter? _instance;

  static GoRouter router() {
    if (_instance != null) return _instance!;
    final authRepo = getIt<AuthRepo>();

    return _instance = GoRouter(
      initialLocation: disclaimer, 
      refreshListenable: GoRouterRefreshStream(authRepo.authStateStream),
      redirect: (context, state) {
        final isLoggedIn = authRepo.isLoggedIn;
        final isOnboardingVisited =
            CacheHelper.getData(key: 'isOnboardingVisited') ?? false;

        final isAuthRoute = state.matchedLocation == login ||
            state.matchedLocation == signup ||
            state.matchedLocation == disclaimer ||
            state.matchedLocation == onboarding;

        // If not logged in and trying to access a protected route
        if (!isLoggedIn && !isAuthRoute) {
          return isOnboardingVisited ? login : disclaimer;
        }

        // If logged in and trying to access auth routes (Onboarding, Login, etc.)
        if (isLoggedIn && isAuthRoute) {
          return mainView;
        }

        // Not logged in + on disclaimer (an auth route, so skipped above)
        // → redirect to login if onboarding was already visited
        if (state.matchedLocation == disclaimer && isOnboardingVisited) {
          return login;
        }

        return null;
      },
      routes: [
        GoRoute(
          path: disclaimer,
          builder: (context, state) => BlocProvider(
            create: (_) => getIt<OnboardingCubit>(),
            child: const MedicalDisclaimerView(),
          ),
        ),
        GoRoute(
          path: onboarding,
          builder: (context, state) => BlocProvider(
            create: (_) => getIt<OnboardingCubit>(),
            child: const OnboardingView(),
          ),
        ),
        GoRoute(
          path: login,
          builder: (context, state) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginView(),
          ),
        ),
        GoRoute(
          path: signup,
          builder: (context, state) => BlocProvider(
            create: (_) => getIt<RegisterCubit>(),
            child: const SignupView(),
          ),
        ),
        GoRoute(path: mainView, builder: (context, state) => const MainView()),
        GoRoute(
          path: exerciseDetails,
          builder: (context, state) {
            final args = state.extra;
            if (args is! Map<String, dynamic>) {
              return const Scaffold(
                body: Center(child: Text('Invalid navigation data')),
              );
            }
            final exercise = args['exercise'] as ExerciseModel;
            final heroTag = args['heroTag'] as String;
            return ExerciseDetailsView(exercise: exercise, heroTag: heroTag);
          },
        ),
        GoRoute(
          path: protocolDetails,
          builder: (context, state) {
            final args = state.extra;
            if (args is! Map<String, dynamic>) {
              return const Scaffold(
                body: Center(child: Text('Invalid navigation data')),
              );
            }
            final protocol = args['protocol'] as ProtocolModel;
            final heroTag = args['heroTag'] as String;
            return ProtocolDetailsView(protocol: protocol, heroTag: heroTag);
          },
        ),
        GoRoute(
          path: paywall,
          builder: (context, state) => const PaywallView(),
        ),
      ],
    );
  }
}

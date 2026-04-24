import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:k_rehab/features/auth/presentation/manager/login/login_cubit.dart';
import 'package:k_rehab/features/auth/presentation/views/login_view.dart';
import 'package:k_rehab/features/auth/presentation/views/signup_view.dart';
import 'package:k_rehab/core/di/service_locator.dart';
import 'package:k_rehab/features/auth/presentation/manager/create_user/create_user_cubit.dart';
import 'package:k_rehab/features/auth/presentation/manager/register/register_cubit.dart';

import 'package:k_rehab/features/onboarding/presentation/manager/onboarding/onboarding_cubit.dart';
import 'package:k_rehab/features/onboarding/presentation/views/medical_disclaimer_view.dart';
import 'package:k_rehab/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:k_rehab/core/router/main_view.dart';
import 'package:k_rehab/features/exercises/data/models/exercise_model.dart';
import 'package:k_rehab/features/exercises/presentation/views/exercise_details_view.dart';
import 'package:k_rehab/features/protocols/data/models/protocol_model.dart';
import 'package:k_rehab/features/protocols/presentation/views/protocol_details_view.dart';

import 'package:k_rehab/core/services/cache_helper.dart';

abstract class AppRouter {
  static const String disclaimer = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String mainView = '/mainView';
  static const String exerciseDetails = '/exerciseDetails';
  static const String protocolDetails = '/protocolDetails';

  static GoRouter router() => GoRouter(
    initialLocation: CacheHelper.getData(key: 'isLoggedIn') == true
        ? mainView
        : disclaimer,
    redirect: (context, state) {
      final isLoggedIn = CacheHelper.getData(key: 'isLoggedIn') ?? false;

      final isAuthRoute =
          state.matchedLocation == login ||
          state.matchedLocation == signup ||
          state.matchedLocation == disclaimer ||
          state.matchedLocation == onboarding;

      if (!isLoggedIn && !isAuthRoute) {
        return disclaimer;
      }

      if (isLoggedIn && isAuthRoute) {
        return mainView;
      }

      return null;
    },
    routes: [
      GoRoute(
        path: disclaimer,
        builder: (context, state) => const MedicalDisclaimerView(),
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
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => getIt<RegisterCubit>()),
            BlocProvider(create: (_) => getIt<CreateUserCubit>()),
          ],
          child: const SignupView(),
        ),
      ),
      GoRoute(path: mainView, builder: (context, state) => const MainView()),
      GoRoute(
        path: exerciseDetails,
        builder: (context, state) {
          final args = state.extra as Map<String, dynamic>;
          final exercise = args['exercise'] as ExerciseModel;
          final heroTag = args['heroTag'] as String;
          return ExerciseDetailsView(
            exercise: exercise,
            heroTag: heroTag,
          );
        },
      ),
      GoRoute(
        path: protocolDetails,
        builder: (context, state) {
          final args = state.extra as Map<String, dynamic>;
          final protocol = args['protocol'] as ProtocolModel;
          final heroTag = args['heroTag'] as String;
          return ProtocolDetailsView(
            protocol: protocol,
            heroTag: heroTag,
          );
        },
      ),
    ],
  );
}

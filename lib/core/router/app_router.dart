import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:k_rehab/core/di/service_locator.dart';
import 'package:k_rehab/core/services/cache_helper.dart';
import 'package:k_rehab/features/auth/data/repositories/auth_repo.dart';
import 'package:k_rehab/features/auth/presentation/manager/login/login_cubit.dart';
import 'package:k_rehab/features/auth/presentation/views/login_view.dart';
import 'package:k_rehab/features/auth/presentation/views/signup_view.dart';
import 'package:k_rehab/features/auth/presentation/manager/register/register_cubit.dart';
import 'package:k_rehab/features/onboarding/presentation/manager/onboarding/onboarding_cubit.dart';
import 'package:k_rehab/features/onboarding/presentation/views/medical_disclaimer_view.dart';
import 'package:k_rehab/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:k_rehab/core/router/main_view.dart';
import 'package:k_rehab/features/exercises/data/models/exercise_model.dart';
import 'package:k_rehab/features/exercises/presentation/views/exercise_details_view.dart';
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

  static GoRouter router() {
    final authRepo = getIt<AuthRepo>();
    
    return GoRouter(
      initialLocation: disclaimer,
      redirect: (context, state) {
        final isLoggedIn = authRepo.isLoggedIn;
        final isOnboardingVisited =
            CacheHelper.getData(key: 'isOnboardingVisited') ?? false;

        final isAuthRoute =
            state.matchedLocation == login ||
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

        // Handle initial landing logic if at root
        if (state.matchedLocation == disclaimer) {
           if (isLoggedIn) return mainView;
           if (isOnboardingVisited) return login;
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
            final args = state.extra as Map<String, dynamic>;
            final exercise = args['exercise'] as ExerciseModel;
            final heroTag = args['heroTag'] as String;
            return ExerciseDetailsView(exercise: exercise, heroTag: heroTag);
          },
        ),
        GoRoute(
          path: protocolDetails,
          builder: (context, state) {
            final args = state.extra as Map<String, dynamic>;
            final protocol = args['protocol'] as ProtocolModel;
            final heroTag = args['heroTag'] as String;
            return ProtocolDetailsView(protocol: protocol, heroTag: heroTag);
          },
        ),
      ],
    );
  }
}

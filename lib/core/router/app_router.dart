import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:k_rehab/features/auth/logic/login/login_cubit.dart';
import 'package:k_rehab/features/auth/presentation/views/login_view.dart';
import 'package:k_rehab/features/auth/presentation/views/signup_view.dart';
import 'package:k_rehab/core/di/service_locator.dart';
import 'package:k_rehab/features/auth/logic/create_user/create_user_cubit.dart';
import 'package:k_rehab/features/auth/logic/register/register_cubit.dart';

import 'package:k_rehab/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:k_rehab/features/onboarding/presentation/views/medical_disclaimer_view.dart';
import 'package:k_rehab/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:k_rehab/core/router/main_view.dart';



abstract class AppRouter {
  static const String disclaimer = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';
  static String initialLocation = disclaimer;

  static GoRouter router() => GoRouter(
    initialLocation: initialLocation,
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
      GoRoute(
        path: home,
        builder: (context, state) => const MainView(),
      ),
    ],
  );
}

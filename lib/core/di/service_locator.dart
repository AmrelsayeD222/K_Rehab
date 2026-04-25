import 'package:get_it/get_it.dart';
import 'package:k_rehab/core/manager/navigation_cubit.dart';
import 'package:k_rehab/features/auth/data/repositories/auth_repo.dart';
import 'package:k_rehab/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:k_rehab/features/auth/presentation/manager/login/login_cubit.dart';
import 'package:k_rehab/features/auth/presentation/manager/register/register_cubit.dart';
import 'package:k_rehab/features/home/data/repo/home_repo.dart';
import 'package:k_rehab/features/home/data/repo/home_repo_impl.dart';
import 'package:k_rehab/features/home/presentation/manager/featuredExercises/featured_exercises_cubit.dart';
import 'package:k_rehab/features/home/presentation/manager/featuredProtocol/featured_protocol_cubit.dart';
import 'package:k_rehab/features/onboarding/presentation/manager/onboarding/onboarding_cubit.dart';
import 'package:k_rehab/features/profile/data/repo/profile_repo.dart';
import 'package:k_rehab/features/profile/data/repo/repo_impl.dart';
import 'package:k_rehab/features/profile/presentation/manager/logout/log_out_cubit.dart';
import 'package:k_rehab/features/profile/presentation/manager/profile_image/profile_image_cubit.dart';
import 'package:k_rehab/features/profile/presentation/manager/user_info/user_info_cubit.dart';

import 'package:supabase_flutter/supabase_flutter.dart';


import 'package:k_rehab/features/exercises/data/repo/exercise_repo.dart';
import 'package:k_rehab/features/exercises/data/repo/exercise_repo_impl.dart';
import 'package:k_rehab/features/exercises/presentation/manager/exercise_cubit.dart';

import 'package:k_rehab/features/protocols/data/repo/protocol_repo.dart';
import 'package:k_rehab/features/protocols/data/repo/protocol_repo_impl.dart';
import 'package:k_rehab/features/protocols/presentation/manager/protocol_cubit.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);
  getIt.registerFactory<NavigationCubit>(() => NavigationCubit());



  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(client: getIt<SupabaseClient>()),
  );

  getIt.registerLazySingleton<ProfileRepo>(
    () => ProfileRepoImpl(client: getIt<SupabaseClient>()),
  );

  getIt.registerFactory<OnboardingCubit>(() => OnboardingCubit());

  getIt.registerFactory<RegisterCubit>(
    () => RegisterCubit(authRepo: getIt<AuthRepo>()),
  );

  getIt.registerFactory<LoginCubit>(
    () => LoginCubit(authRepo: getIt<AuthRepo>()),
  );

  getIt.registerFactory<LogOutCubit>(
    () => LogOutCubit(profileRepo: getIt<ProfileRepo>()),
  );

  getIt.registerFactory<ProfileImageCubit>(
    () => ProfileImageCubit(profileRepo: getIt<ProfileRepo>()),
  );

  getIt.registerFactory<UserInfoCubit>(
    () => UserInfoCubit(profileRepo: getIt<ProfileRepo>()),
  );

  // Home Feature Registrations
  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(supabaseClient: getIt<SupabaseClient>()),
  );

  getIt.registerFactory<FeaturedProtocolCubit>(
    () => FeaturedProtocolCubit(getIt<HomeRepo>()),
  );

  getIt.registerFactory<FeaturedExercisesCubit>(
    () => FeaturedExercisesCubit(getIt<HomeRepo>()),
  );

  // Exercises Feature Registrations
  getIt.registerLazySingleton<ExerciseRepo>(
    () => ExerciseRepoImpl(supabaseClient: getIt<SupabaseClient>()),
  );

  getIt.registerFactory<ExerciseCubit>(
    () => ExerciseCubit(getIt<ExerciseRepo>()),
  );

  // Protocols Feature Registrations
  getIt.registerLazySingleton<ProtocolRepo>(
    () => ProtocolRepoImpl(supabaseClient: getIt<SupabaseClient>()),
  );

  getIt.registerFactory<ProtocolCubit>(
    () => ProtocolCubit(getIt<ProtocolRepo>()),
  );
}

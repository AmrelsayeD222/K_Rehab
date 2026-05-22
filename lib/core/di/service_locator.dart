// External Packages
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// Core
import 'package:k_rehab/core/router/navigation_cubit.dart';
import 'package:k_rehab/core/services/api_service.dart';

// Data Sources
import 'package:k_rehab/features/auth/data/data_sources/auth_local_data_source.dart';
import 'package:k_rehab/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:k_rehab/features/exercises/data/data_sources/exercise_local_data_source.dart';
import 'package:k_rehab/features/exercises/data/data_sources/exercise_remote_data_source.dart';
import 'package:k_rehab/features/home/data/data_sources/home_local_data_source.dart';
import 'package:k_rehab/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:k_rehab/features/payment/data/dataSource/payment_remote_data_source.dart';
import 'package:k_rehab/features/payment/data/dataSource/paymob_sdk_service.dart';
import 'package:k_rehab/features/profile/data/data_sources/profile_local_data_source.dart';
import 'package:k_rehab/features/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:k_rehab/features/protocols/data/data_sources/protocol_local_data_source.dart';
import 'package:k_rehab/features/protocols/data/data_sources/protocol_remote_data_source.dart';

// Repositories
import 'package:k_rehab/features/auth/data/repositories/auth_repo.dart';
import 'package:k_rehab/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:k_rehab/features/exercises/data/repo/exercise_repo.dart';
import 'package:k_rehab/features/exercises/data/repo/exercise_repo_impl.dart';
import 'package:k_rehab/features/home/data/repo/home_repo.dart';
import 'package:k_rehab/features/home/data/repo/home_repo_impl.dart';
import 'package:k_rehab/features/payment/data/repositories/payment_repo.dart';
import 'package:k_rehab/features/payment/data/repositories/payment_repo_impl.dart';
import 'package:k_rehab/features/profile/data/repo/profile_repo.dart';
import 'package:k_rehab/features/profile/data/repo/repo_impl.dart';
import 'package:k_rehab/features/protocols/data/repo/protocol_repo.dart';
import 'package:k_rehab/features/protocols/data/repo/protocol_repo_impl.dart';
import 'package:k_rehab/features/recoveryCoach/data/repo/recovery_coach_repo.dart';
import 'package:k_rehab/features/recoveryCoach/data/repo/recovery_coach_repo_impl.dart';

// Cubits
import 'package:k_rehab/features/auth/presentation/manager/login/login_cubit.dart';
import 'package:k_rehab/features/auth/presentation/manager/register/register_cubit.dart';
import 'package:k_rehab/features/exercises/presentation/manager/exercise_cubit.dart';
import 'package:k_rehab/features/home/presentation/manager/featuredExercises/featured_exercises_cubit.dart';
import 'package:k_rehab/features/home/presentation/manager/featuredProtocol/featured_protocol_cubit.dart';
import 'package:k_rehab/features/onboarding/presentation/manager/onboarding/onboarding_cubit.dart';
import 'package:k_rehab/features/payment/presentation/manager/payment_cubit.dart';
import 'package:k_rehab/features/profile/presentation/manager/profile_cubit.dart';
import 'package:k_rehab/features/protocols/presentation/manager/protocol_cubit.dart';
import 'package:k_rehab/features/protocols/presentation/manager/protocol_details_cubit.dart';
import 'package:k_rehab/features/recoveryCoach/presentation/manager/recovery_coach_cubit.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // ==========================================
  // 1. Core Services & External Clients
  // ==========================================
  getIt.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<ApiService>(
    () => ApiService(dio: getIt<Dio>()),
  );
  getIt.registerLazySingleton<PaymobSdkService>(
    () => PaymobSdkServiceImpl(),
  );

  // ==========================================
  // 2. Data Sources (Local & Remote)
  // ==========================================
  // Local Data Sources
  getIt.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(),
  );
  getIt.registerLazySingleton<ProfileLocalDataSource>(
    () => ProfileLocalDataSourceImpl(),
  );
  getIt.registerLazySingleton<HomeLocalDataSource>(
    () => HomeLocalDataSourceImpl(),
  );
  getIt.registerLazySingleton<ExerciseLocalDataSource>(
    () => ExerciseLocalDataSourceImpl(),
  );
  getIt.registerLazySingleton<ProtocolLocalDataSource>(
    () => ProtocolLocalDataSourceImpl(),
  );

  // Remote Data Sources
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(client: getIt<SupabaseClient>()),
  );
  getIt.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(client: getIt<SupabaseClient>()),
  );
  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(supabaseClient: getIt<SupabaseClient>()),
  );
  getIt.registerLazySingleton<ExerciseRemoteDataSource>(
    () => ExerciseRemoteDataSourceImpl(supabaseClient: getIt<SupabaseClient>()),
  );
  getIt.registerLazySingleton<ProtocolRemoteDataSource>(
    () => ProtocolRemoteDataSourceImpl(supabaseClient: getIt<SupabaseClient>()),
  );
  getIt.registerLazySingleton<PaymentRemoteDataSource>(
    () => PaymentRemoteDataSourceImpl(apiService: getIt<ApiService>()),
  );

  // ==========================================
  // 3. Repositories
  // ==========================================
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(
      remoteDataSource: getIt<AuthRemoteDataSource>(),
      localDataSource: getIt<AuthLocalDataSource>(),
    ),
  );
  getIt.registerLazySingleton<ProfileRepo>(
    () => ProfileRepoImpl(
      remoteDataSource: getIt<ProfileRemoteDataSource>(),
      localDataSource: getIt<ProfileLocalDataSource>(),
      supabaseClient: getIt<SupabaseClient>(),
    ),
  );
  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(
      remoteDataSource: getIt<HomeRemoteDataSource>(),
      localDataSource: getIt<HomeLocalDataSource>(),
    ),
  );
  getIt.registerLazySingleton<ExerciseRepo>(
    () => ExerciseRepoImpl(
      remoteDataSource: getIt<ExerciseRemoteDataSource>(),
      localDataSource: getIt<ExerciseLocalDataSource>(),
    ),
  );
  getIt.registerLazySingleton<ProtocolRepo>(
    () => ProtocolRepoImpl(
      remoteDataSource: getIt<ProtocolRemoteDataSource>(),
      localDataSource: getIt<ProtocolLocalDataSource>(),
    ),
  );
  getIt.registerLazySingleton<RecoveryCoachRepo>(
    () => RecoveryCoachRepoImpl(apiService: getIt<ApiService>()),
  );
  getIt.registerLazySingleton<PaymentRepository>(
    () => PaymentRepositoryImpl(
      remoteDataSource: getIt<PaymentRemoteDataSource>(),
      sdkService: getIt<PaymobSdkService>(),
    ),
  );

  // ==========================================
  // 4. Cubits (State Management)
  // ==========================================
  getIt.registerFactory<NavigationCubit>(() => NavigationCubit());
  getIt.registerFactory<OnboardingCubit>(() => OnboardingCubit());
  getIt.registerFactory<RegisterCubit>(
    () => RegisterCubit(authRepo: getIt<AuthRepo>()),
  );
  getIt.registerFactory<LoginCubit>(
    () => LoginCubit(authRepo: getIt<AuthRepo>()),
  );
  getIt.registerFactory<ProfileCubit>(
    () => ProfileCubit(
      profileRepo: getIt<ProfileRepo>(),
      authRepo: getIt<AuthRepo>(),
    ),
  );
  getIt.registerFactory<FeaturedProtocolCubit>(
    () => FeaturedProtocolCubit(getIt<HomeRepo>()),
  );
  getIt.registerFactory<FeaturedExercisesCubit>(
    () => FeaturedExercisesCubit(getIt<HomeRepo>()),
  );
  getIt.registerFactory<ExerciseCubit>(
    () => ExerciseCubit(getIt<ExerciseRepo>()),
  );
  getIt.registerFactory<ProtocolCubit>(
    () => ProtocolCubit(getIt<ProtocolRepo>()),
  );
  getIt.registerFactory<ProtocolDetailsCubit>(
    () => ProtocolDetailsCubit(getIt<ProtocolRepo>()),
  );
  getIt.registerFactory<RecoveryCoachCubit>(
    () => RecoveryCoachCubit(getIt<RecoveryCoachRepo>()),
  );
  getIt.registerFactory<PaymentCubit>(
    () => PaymentCubit(
      paymentRepository: getIt<PaymentRepository>(),
      profileRepo: getIt<ProfileRepo>(),
    ),
  );
}

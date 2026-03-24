import 'package:get_it/get_it.dart';
import 'package:k_rehab/features/auth/data/repositories/auth_repo.dart';
import 'package:k_rehab/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:k_rehab/features/auth/logic/create_user/create_user_cubit.dart';
import 'package:k_rehab/features/auth/logic/register/register_cubit.dart';
import 'package:k_rehab/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);

  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(client: getIt<SupabaseClient>()),
  );

  getIt.registerFactory<OnboardingCubit>(() => OnboardingCubit());
  
  getIt.registerFactory<RegisterCubit>(
    () => RegisterCubit(authRepo: getIt<AuthRepo>()),
  );
  
  getIt.registerFactory<CreateUserCubit>(
    () => CreateUserCubit(authRepo: getIt<AuthRepo>()),
  );
}

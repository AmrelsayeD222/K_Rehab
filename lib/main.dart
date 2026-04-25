import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:k_rehab/core/di/service_locator.dart';
import 'package:k_rehab/core/manager/theme_cubit.dart';
import 'package:k_rehab/core/router/app_router.dart';
import 'package:k_rehab/core/services/cache_helper.dart';
import 'package:k_rehab/core/services/supabase_config.dart';
import 'package:k_rehab/core/theme/app_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseConfig.init();
  await CacheHelper.init();
  setupServiceLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return MaterialApp.router(
                title: 'KRehab',
                debugShowCheckedModeBanner: false,
                theme: AppThemes.getLightTheme(),
                darkTheme: AppThemes.getDarkTheme(),
                themeMode: themeMode,
                themeAnimationCurve: Curves.easeInOut,
                themeAnimationDuration: const Duration(milliseconds: 500),
                routerConfig: AppRouter.router(),
              );
            },
          );
        },
      ),
    );
  }
}

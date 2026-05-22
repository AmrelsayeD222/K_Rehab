import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k_rehab/core/router/app_router.dart';
import 'package:k_rehab/core/theme/app_themes.dart';
import 'package:k_rehab/core/theme/theme_cubit.dart';

class KRehabApp extends StatefulWidget {
  const KRehabApp({super.key});

  @override
  State<KRehabApp> createState() => _KRehabAppState();
}

class _KRehabAppState extends State<KRehabApp> {
  late final _router = AppRouter.router();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp.router(
            title: 'KRehab',
            debugShowCheckedModeBanner: false,
            theme: AppThemes.getLightTheme(),
            darkTheme: AppThemes.getDarkTheme(),
            themeMode: themeMode,
            themeAnimationCurve: Curves.easeInOut,
            themeAnimationDuration: const Duration(milliseconds: 500),
            routerConfig: _router,
          );
        },
      ),
    );
  }
}

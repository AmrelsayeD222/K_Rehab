import 'package:flutter/material.dart';
import 'package:k_rehab/core/di/service_locator.dart';
import 'package:k_rehab/core/router/app_router.dart';
import 'package:k_rehab/core/services/secure_storage_service.dart';

import 'package:k_rehab/core/services/supabase_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseConfig.init();
  setupServiceLocator();

  final token = await getIt<SecureStorageService>().getToken();
  AppRouter.initialLocation = token != null ? AppRouter.home : AppRouter.disclaimer;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'KRehab',
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router(),
    );
  }
}

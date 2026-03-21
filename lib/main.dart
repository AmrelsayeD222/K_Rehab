import 'package:flutter/material.dart';
import 'package:k_rehab/core/constants/app_secrets.dart';
import 'package:k_rehab/core/router/app_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnonKey,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'KRehab',
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}

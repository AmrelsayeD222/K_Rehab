import 'package:flutter/material.dart';
import 'package:k_rehab/core/router/app_router.dart';

void main() {
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

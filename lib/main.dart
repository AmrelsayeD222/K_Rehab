import 'package:flutter/material.dart';
import 'package:k_rehab/features/onboarding/presentation/views/medical_disclaimer_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'KRehab',
      debugShowCheckedModeBanner: false,
      home: MedicalDisclaimerView(),
    );
  }
}

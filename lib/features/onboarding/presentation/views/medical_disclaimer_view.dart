import 'package:flutter/material.dart';
import 'package:k_rehab/core/theme/app_colors.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';
import 'package:k_rehab/features/onboarding/presentation/views/onboarding_view.dart';

import 'package:k_rehab/features/onboarding/presentation/widgets/disclaimer_button.dart';
import 'package:k_rehab/features/onboarding/presentation/widgets/disclaimer_card.dart';
import 'package:k_rehab/features/onboarding/presentation/widgets/disclaimer_checkbox.dart';
import 'package:k_rehab/features/onboarding/presentation/widgets/disclaimer_image_section.dart';
import 'package:k_rehab/features/onboarding/presentation/widgets/disclaimer_logo_header.dart';

class MedicalDisclaimerView extends StatefulWidget {
  const MedicalDisclaimerView({super.key});

  @override
  State<MedicalDisclaimerView> createState() => _MedicalDisclaimerViewState();
}

class _MedicalDisclaimerViewState extends State<MedicalDisclaimerView> {
  bool _agreed = false;

  void _onCheckboxChanged(bool? value) {
    setState(() => _agreed = value ?? false);
  }

  void _onContinue() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const OnboardingView(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 24),
              const DisclaimerLogoHeader(),
              const SizedBox(height: 32),
              const Text(
                'Before You Begin',
                style: AppTextStyles.heading1,
              ),
              const SizedBox(height: 24),
              const DisclaimerImageSection(),
              const SizedBox(height: 24),
              const DisclaimerCard(),
              const SizedBox(height: 20),
              DisclaimerCheckbox(value: _agreed, onChanged: _onCheckboxChanged),
              const Spacer(),
              DisclaimerButton(enabled: _agreed, onPressed: _onContinue),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:k_rehab/core/router/app_router.dart';
import 'package:k_rehab/features/onboarding/presentation/manager/onboarding/onboarding_cubit.dart';

import 'package:k_rehab/core/theme/app_text_styles.dart';

import 'package:k_rehab/features/onboarding/presentation/widgets/disclaimer_button.dart';
import 'package:k_rehab/features/onboarding/presentation/widgets/disclaimer_card.dart';
import 'package:k_rehab/features/onboarding/presentation/widgets/disclaimer_checkbox.dart';
import 'package:k_rehab/features/onboarding/presentation/widgets/disclaimer_image_section.dart';
import 'package:k_rehab/features/onboarding/presentation/widgets/disclaimer_logo_header.dart';

class MedicalDisclaimerView extends StatelessWidget {
  const MedicalDisclaimerView({super.key});

  @override
  Widget build(BuildContext context) {
    final onboardingCubit = context.read<OnboardingCubit>();
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        final isAgreed = onboardingCubit.isAgreed;
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 24),
                    const DisclaimerLogoHeader(),
                    const SizedBox(height: 32),
                    Text(
                      'Before You Begin',
                      style: AppTextStyles.heading1.copyWith(color: Theme.of(context).colorScheme.onSurface),
                    ),
                    const SizedBox(height: 24),
                    const DisclaimerImageSection(),
                    const SizedBox(height: 24),
                    const DisclaimerCard(),
                    const SizedBox(height: 20),
                    DisclaimerCheckbox(
                      value: isAgreed,
                      onChanged: (value) => onboardingCubit.toggleAgreed(value),
                    ),
                    const SizedBox(height: 30),
                    DisclaimerButton(
                      enabled: isAgreed,
                      onPressed: () => context.go(AppRouter.onboarding),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

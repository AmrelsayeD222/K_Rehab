import 'package:flutter/material.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';

class RecoveryTextSection extends StatelessWidget {
  const RecoveryTextSection({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: AppTextStyles.onboardingTitle,
        ),
        const SizedBox(height: 10),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: AppTextStyles.onboardingSubtitle,
        ),
      ],
    );
  }
}

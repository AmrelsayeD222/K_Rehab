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
    final colors = Theme.of(context).colorScheme;
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: AppTextStyles.onboardingTitle.copyWith(color: colors.onSurface),
        ),
        const SizedBox(height: 10),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: AppTextStyles.onboardingSubtitle.copyWith(color: colors.onSurfaceVariant),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:k_rehab/core/theme/app_colors.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';

class TechniqueStepItem extends StatelessWidget {
  final int stepNumber;
  final String description;

  const TechniqueStepItem({
    super.key,
    required this.stepNumber,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: colors.primary.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.center,
          child: Text(
            stepNumber.toString(),
            style: AppTextStyles.cardTitle.copyWith(
              color: colors.primary,
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            description,
            style: AppTextStyles.bodyText2.copyWith(
              color: colors.textSecondary,
            ),
          ),
        ),
      ],
    );
  }
}

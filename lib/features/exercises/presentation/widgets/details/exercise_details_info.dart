import 'package:flutter/material.dart';
import 'package:k_rehab/core/theme/app_colors.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';
import 'package:k_rehab/features/exercises/data/models/exercise_model.dart';

class ExerciseDetailsInfo extends StatelessWidget {
  final ExerciseModel exercise;

  const ExerciseDetailsInfo({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          exercise.title,
          style: AppTextStyles.mainHeading.copyWith(fontSize: 22, color: colors.textPrimary),
        ),
        Text(
          exercise.subtitle,
          style: AppTextStyles.cardSubtitle.copyWith(color: colors.textSecondary),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: colors.primary.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(9999),
              ),
              child: Text(
                exercise.category.toUpperCase(),
                style: AppTextStyles.tag.copyWith(
                  color: colors.primary,
                  letterSpacing: 0.55,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: colors.primary.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(9999),
              ),
              child: Text(
                exercise.difficulty.toUpperCase(),
                style: AppTextStyles.tag.copyWith(
                  color: colors.textSecondary,
                  letterSpacing: 0.55,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

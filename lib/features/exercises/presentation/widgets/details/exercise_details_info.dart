import 'package:flutter/material.dart';
import 'package:k_rehab/core/theme/app_colors.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';
import 'package:k_rehab/features/exercises/data/models/exercise_model.dart';

class ExerciseDetailsInfo extends StatelessWidget {
  final ExerciseModel exercise;

  const ExerciseDetailsInfo({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          exercise.title,
          style: AppTextStyles.mainHeading.copyWith(fontSize: 22),
        ),
        Text(exercise.subtitle, style: AppTextStyles.cardSubtitle),
        const SizedBox(height: 16),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(9999),
              ),
              child: Text(
                exercise.category.toUpperCase(),
                style: AppTextStyles.tag.copyWith(
                  color: const Color(0xFF26DEC2),
                  letterSpacing: 0.55,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: const Color(0x33005DC3).withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(9999),
              ),
              child: Text(
                exercise.difficulty.toUpperCase(),
                style: AppTextStyles.tag.copyWith(
                  color: const Color(0xFFACC7FF),
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

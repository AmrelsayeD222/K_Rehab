import 'package:flutter/material.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';
import 'package:k_rehab/features/exercises/data/models/exercise_model.dart';
import 'package:k_rehab/features/exercises/presentation/widgets/technique_step_item.dart';

class ExerciseTechniqueGuide extends StatelessWidget {
  final ExerciseModel exercise;

  const ExerciseTechniqueGuide({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    if (exercise.steps.isEmpty) return const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Technique Guide',
          style: AppTextStyles.sectionHeader.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 16),
        ...exercise.steps.map((step) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: TechniqueStepItem(
              stepNumber: step.step,
              description: step.description,
            ),
          );
        }),
      ],
    );
  }
}

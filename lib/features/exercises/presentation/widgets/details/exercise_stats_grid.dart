import 'package:flutter/material.dart';
import 'package:k_rehab/features/exercises/data/models/exercise_model.dart';
import 'package:k_rehab/features/exercises/presentation/widgets/stat_card.dart';

class ExerciseStatsGrid extends StatelessWidget {
  final ExerciseModel exercise;

  const ExerciseStatsGrid({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: StatCard(
            label: 'SETS',
            value: exercise.sets?.toString() ?? '-',
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: StatCard(
            label: 'REPS',
            value: exercise.reps?.toString() ?? '-',
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: StatCard(
            label: 'HOLD',
            value: exercise.holdSeconds != null
                ? '${exercise.holdSeconds}s'
                : '-',
          ),
        ),
      ],
    );
  }
}

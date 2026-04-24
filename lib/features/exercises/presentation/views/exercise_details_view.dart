import 'package:flutter/material.dart';
import 'package:k_rehab/core/theme/app_colors.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';
import 'package:k_rehab/features/exercises/data/models/exercise_model.dart';
import 'package:k_rehab/features/exercises/presentation/widgets/exercise_warning_box.dart';
import 'package:k_rehab/features/exercises/presentation/widgets/details/exercise_details_header.dart';
import 'package:k_rehab/features/exercises/presentation/widgets/details/exercise_details_info.dart';
import 'package:k_rehab/features/exercises/presentation/widgets/details/exercise_stats_grid.dart';
import 'package:k_rehab/features/exercises/presentation/widgets/details/exercise_technique_guide.dart';

class ExerciseDetailsView extends StatelessWidget {
  final ExerciseModel exercise;
  final String heroTag;

  const ExerciseDetailsView({
    super.key,
    required this.exercise,
    required this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.background.withValues(alpha: 0.7),
        elevation: 0,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: CircleAvatar(
            backgroundColor: const Color(0xFF33353A).withValues(alpha: 0.5),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new,
                size: 16,
                color: Colors.white,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        title: const Text('EXERCISE', style: AppTextStyles.navLabel),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ExerciseDetailsHeader(
              exercise: exercise,
              heroTag: heroTag,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 16.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ExerciseDetailsInfo(exercise: exercise),
                  const SizedBox(height: 24),
                  ExerciseStatsGrid(exercise: exercise),
                  const SizedBox(height: 24),
                  const ExerciseWarningBox(),
                  const SizedBox(height: 32),
                  ExerciseTechniqueGuide(exercise: exercise),
                  const SizedBox(height: 48),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

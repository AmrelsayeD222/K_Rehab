import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:k_rehab/core/theme/app_colors.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';
import 'package:k_rehab/features/exercises/data/models/exercise_model.dart';
import 'package:k_rehab/features/exercises/presentation/widgets/stat_card.dart';
import 'package:k_rehab/features/exercises/presentation/widgets/technique_step_item.dart';
import 'package:k_rehab/features/exercises/presentation/widgets/exercise_warning_box.dart';
import 'package:k_rehab/core/widgets/k_loading_widget.dart';

class ExerciseDetailsView extends StatelessWidget {
  final ExerciseModel exercise;
  const ExerciseDetailsView({super.key, required this.exercise});

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
            // Hero Media
            Hero(
              tag: exercise.id,
              child: Container(
                width: double.infinity,
                height: 250,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                clipBehavior: Clip.antiAlias,
                child: exercise.gifUrl.isNotEmpty
                    ? CachedNetworkImage(
                        imageUrl: exercise.gifUrl,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => CachedNetworkImage(
                          imageUrl: exercise.imageUrl,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => const KLoadingWidget(),
                        ),
                        errorWidget: (context, url, error) => CachedNetworkImage(
                          imageUrl: exercise.imageUrl,
                          fit: BoxFit.cover,
                          errorWidget: (context, url, error) => const Icon(
                            Icons.fitness_center,
                            color: Colors.grey,
                            size: 64,
                          ),
                        ),
                      )
                    : exercise.imageUrl.isNotEmpty
                    ? CachedNetworkImage(
                        imageUrl: exercise.imageUrl,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => const KLoadingWidget(),
                        errorWidget: (context, url, error) => const Icon(
                          Icons.fitness_center,
                          color: Colors.grey,
                          size: 64,
                        ),
                      )
                    : const Icon(
                        Icons.fitness_center,
                        color: Colors.grey,
                        size: 64,
                      ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 16.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and tags
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
                  const SizedBox(height: 24),
                  // Stats Grid
                  Row(
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
                  ),
                  const SizedBox(height: 24),
                  // Warning Box
                  const ExerciseWarningBox(),
                  const SizedBox(height: 32),
                  // Technique Guide
                  if (exercise.steps.isNotEmpty) ...[
                    const Text(
                      'Technique Guide',
                      style: AppTextStyles.sectionHeader,
                    ),
                    const SizedBox(height: 24),
                    ...exercise.steps.map(
                      (step) => Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: TechniqueStepItem(
                          stepNumber: step.step,
                          description: step.description,
                        ),
                      ),
                    ),
                  ],
                  const SizedBox(height: 48), // Padding at the bottom
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

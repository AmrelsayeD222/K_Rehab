import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:k_rehab/core/theme/app_colors.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';
import 'package:k_rehab/features/exercises/data/models/exercise_model.dart';

class ExerciseCard extends StatelessWidget {
  final ExerciseModel exercise;
  final VoidCallback? onTap;

  const ExerciseCard({
    super.key,
    required this.exercise,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          border: Border.all(color: const Color(0xFF3B4A46)),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          children: [
            // Image
            Hero(
              tag: exercise.id,
              child: Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(12),
                ),
                clipBehavior: Clip.antiAlias,
                child: Opacity(
                  opacity: 0.8,
                  child: CachedNetworkImage(
                    imageUrl: exercise.imageUrl,
                    fit: BoxFit.cover,
                    errorWidget: (context, error, stackTrace) =>
                        const Icon(Icons.fitness_center, color: Colors.grey),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            // Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tag
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0x33005DC3),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      exercise.tag.toUpperCase(),
                      style: AppTextStyles.tag.copyWith(
                        color: const Color(0xFFACC7FF),
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Title
                  Text(exercise.title, style: AppTextStyles.cardTitle),
                  const SizedBox(height: 4),
                  // Subtitle
                  Text(
                    exercise.subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.cardSubtitle.copyWith(
                      fontSize: 12,
                      color: const Color(0xFFBACAC5),
                    ),
                  ),
                ],
              ),
            ),
            // Arrow/Icon
            const Icon(Icons.chevron_right, color: Colors.white54),
          ],
        ),
      ),
    );
  }
}

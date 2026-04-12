import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:k_rehab/core/constants/asset_paths.dart';
import 'package:k_rehab/core/theme/app_colors.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';
import 'package:k_rehab/features/home/presentation/models/exercise_card_mode.dart';

class ExercisesGrid extends StatelessWidget {
  const ExercisesGrid({super.key});

  final List<ExerciseCardModel> exercises = const [
    ExerciseCardModel(
      title: 'Straight Leg Raise',
      imagePath: AssetPaths.straightLegRaise,
    ),
    ExerciseCardModel(
      title: 'Knee Extension',
      imagePath: AssetPaths.kneeExtention,
    ),
    ExerciseCardModel(title: 'Calf Raise', imagePath: AssetPaths.calfRaise),
    ExerciseCardModel(title: 'Bird Dog', imagePath: AssetPaths.birdDog),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recommended Exercises',
              style: AppTextStyles.heading2,
            ).animate().fadeIn(duration: 400.ms, delay: 700.ms),
            TextButton(
              onPressed: () {},
              child: const Text(
                'See All',
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ).animate().fadeIn(duration: 400.ms, delay: 750.ms),
          ],
        ),
        const SizedBox(height: 8),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.82,
          ),
          itemCount: 4,
          itemBuilder: (context, index) {
            return Container(
                  decoration: BoxDecoration(
                    color: AppColors.cardBackground,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: .05),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(exercises[index].imagePath),
                              fit: BoxFit.fill,
                            ),
                            color: AppColors.primary.withValues(alpha: .05),
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(24),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              exercises[index].title,
                              style: AppTextStyles.bodyText2.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.textLight,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                Text(
                                  '3 sets of 10 reps',
                                  style: AppTextStyles.caption.copyWith(
                                    fontSize: 11,
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.orangeAccent.withValues(
                                      alpha: .1,
                                    ),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    'Easy',
                                    style: AppTextStyles.caption.copyWith(
                                      color: Colors.orangeAccent,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
                .animate()
                .fadeIn(
                  duration: 400.ms,
                  delay: Duration(milliseconds: 800 + (index * 120)),
                )
                .scale(begin: const Offset(0.95, 0.95), curve: Curves.easeOut);
          },
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:k_rehab/core/manager/navigation_cubit.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';
import 'package:k_rehab/core/widgets/k_loading_widget.dart';
import 'package:k_rehab/core/widgets/k_error_widget.dart';
import 'package:k_rehab/features/home/presentation/manager/featuredExercises/featured_exercises_cubit.dart';

import 'package:k_rehab/features/home/presentation/widgets/exercise_grid_item.dart';

class ExercisesGrid extends StatelessWidget {
  const ExercisesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                'Featured Exercises',
                style: AppTextStyles.heading2,
                overflow: TextOverflow.ellipsis,
              ).animate().fadeIn(duration: 400.ms, delay: 700.ms),
            ),
            TextButton(
              onPressed: () {
                context.read<NavigationCubit>().changeTab(1);
              },
              child: const Text('See All', style: AppTextStyles.cardTitle),
            ).animate().fadeIn(duration: 400.ms, delay: 750.ms),
          ],
        ),
        const SizedBox(height: 8),
        BlocBuilder<FeaturedExercisesCubit, FeaturedExercisesState>(
          builder: (context, state) {
            if (state is FeaturedExercisesLoading) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 40.0),
                child: KLoadingWidget(),
              );
            } else if (state is FeaturedExercisesSuccess) {
              final exercises = state.featuredExercises;

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.82,
                ),
                itemCount: exercises.length,
                itemBuilder: (context, index) {
                  return ExerciseGridItem(exercise: exercises[index])
                      .animate()
                      .fadeIn(
                        duration: 400.ms,
                        delay: Duration(milliseconds: 200 + (index * 100)),
                      )
                      .scale(
                        begin: const Offset(0.95, 0.95),
                        curve: Curves.easeOut,
                      );
                },
              );
            } else if (state is FeaturedExercisesFailure) {
              return KErrorWidget(
                error: state.error,
                onRetry: () => context
                    .read<FeaturedExercisesCubit>()
                    .getFeaturedExercises(),
              );
            }
            return const SizedBox();
          },
        ),
      ],
    );
  }
}

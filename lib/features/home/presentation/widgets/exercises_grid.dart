import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:k_rehab/core/manager/navigation_cubit.dart';

import 'package:k_rehab/core/theme/app_colors.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';

import 'package:k_rehab/features/home/presentation/manager/featuredExercises/featured_exercises_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import 'package:k_rehab/core/router/app_router.dart';
import 'package:k_rehab/core/widgets/k_loading_widget.dart';
import 'package:k_rehab/core/widgets/k_error_widget.dart';

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
                  return GestureDetector(
                        onTap: () {
                          GoRouter.of(context).push(
                            AppRouter.exerciseDetails,
                            extra: exercises[index],
                          );
                        },
                        child: Container(
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
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(24),
                                  ),
                                  child: exercises[index].imageUrl.isNotEmpty
                                      ? CachedNetworkImage(
                                          imageUrl: exercises[index].imageUrl,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                          placeholder: (context, url) =>
                                              Container(
                                                color: AppColors.primary
                                                    .withValues(alpha: .05),
                                                child: const Center(
                                                  child: SizedBox(
                                                    width: 24,
                                                    height: 24,
                                                    child:
                                                        CircularProgressIndicator(
                                                          strokeWidth: 2,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                          errorWidget: (context, url, error) =>
                                              Container(
                                                color: AppColors.primary
                                                    .withValues(alpha: .05),
                                                child: const Center(
                                                  child: Icon(
                                                    Icons
                                                        .image_not_supported_outlined,
                                                    color: Colors.white24,
                                                    size: 40,
                                                  ),
                                                ),
                                              ),
                                        )
                                      : Container(
                                          width: double.infinity,
                                          color: AppColors.primary.withValues(
                                            alpha: .05,
                                          ),
                                          child: const Center(
                                            child: Icon(
                                              Icons
                                                  .image_not_supported_outlined,
                                              color: Colors.white24,
                                              size: 40,
                                            ),
                                          ),
                                        ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                  vertical: 8,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      exercises[index].title,
                                      style: AppTextStyles.cardTitle.copyWith(
                                        color: AppColors.textLight,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),

                                    Text(
                                      "${exercises[index].sets} sets × ${exercises[index].reps} reps",
                                      style: AppTextStyles.cardSubtitle,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 8),
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
                                        maxLines: 1,
                                        overflow: TextOverflow.fade,

                                        exercises[index].difficulty
                                            .toUpperCase(),
                                        style: AppTextStyles.tag.copyWith(
                                          color: Colors.orangeAccent,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
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
              log(state.error.toString());
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
        const SizedBox(height: 30),
      ],
    );
  }
}

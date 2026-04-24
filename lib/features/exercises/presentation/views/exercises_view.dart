import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:k_rehab/core/di/service_locator.dart';
import 'package:k_rehab/core/theme/app_colors.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';
import 'package:go_router/go_router.dart';
import 'package:k_rehab/core/router/app_router.dart';

import 'package:k_rehab/features/exercises/presentation/manager/exercise_cubit.dart';
import 'package:k_rehab/features/exercises/presentation/widgets/exercise_card.dart';
import 'package:k_rehab/features/exercises/presentation/widgets/exercise_filter_chip.dart';
import 'package:k_rehab/core/widgets/k_loading_widget.dart';
import 'package:k_rehab/core/widgets/k_error_widget.dart';
import 'package:k_rehab/core/widgets/k_empty_state_widget.dart';

class ExercisesView extends StatelessWidget {
  const ExercisesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ExerciseCubit>()..getExercises(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('EXERCISES', style: AppTextStyles.mainHeading),
                const SizedBox(height: 24),
                // Filters
                BlocSelector<ExerciseCubit, ExerciseState, int>(
                  selector: (state) {
                    if (state is ExerciseSuccess) {
                      return state.filterIndex;
                    }
                    return 0;
                  },
                  builder: (context, selectedIndex) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      child: Row(
                        children: List.generate(ExerciseCubit.filters.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: ExercisesCategoryChip(
                              label: ExerciseCubit.filters[index],
                              isSelected: selectedIndex == index,
                              onTap: () {
                                context.read<ExerciseCubit>().changeFilter(index);
                              },
                            ),
                          );
                        }),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 24),
                // List
                Expanded(
                  child: BlocBuilder<ExerciseCubit, ExerciseState>(
                    builder: (context, state) {
                      if (state is ExerciseLoading) {
                        return const KLoadingWidget();
                      } else if (state is ExerciseSuccess) {
                        final exercises = state.filteredExercises;

                        if (exercises.isEmpty) {
                          return KEmptyStateWidget(
                            title: 'No Exercises Found',
                            subtitle:
                                'Try selecting a different category or check back later.',
                            icon: Icons.fitness_center_rounded,
                          );
                        }

                        return ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemCount: exercises.length,
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 16),
                          itemBuilder: (context, index) {
                            final exercise = exercises[index];
                            return ExerciseCard(
                              exercise: exercise,
                              onTap: () {
                                context.push(
                                  AppRouter.exerciseDetails,
                                  extra: {
                                    'exercise': exercise,
                                    'heroTag': exercise.id,
                                  },
                                );
                              },
                            );
                          },
                        );
                      } else if (state is ExerciseFailure) {
                        return KErrorWidget(
                          error: state.error,
                          onRetry: () =>
                              context.read<ExerciseCubit>().getExercises(),
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


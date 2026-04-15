import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k_rehab/core/di/service_locator.dart';
import 'package:k_rehab/core/theme/app_colors.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';
import 'package:k_rehab/features/exercises/data/models/exercise_model.dart';
import 'package:k_rehab/features/exercises/presentation/manager/exercise_cubit.dart';
import 'package:k_rehab/features/exercises/presentation/widgets/exercise_card.dart';
import 'package:k_rehab/features/exercises/presentation/widgets/exercise_filter_chip.dart';
import 'package:k_rehab/features/exercises/presentation/views/exercise_details_view.dart';

class ExercisesView extends StatelessWidget {
  const ExercisesView({super.key});

  static const List<String> _filters = [
    'All',
    'Knee',
    'Back',
    'Shoulder',
    'Hip',
    'Ankle',
  ];

  List<ExerciseModel> _filteredExercises(
    List<ExerciseModel> allExercises,
    int selectedFilterIndex,
  ) {
    if (selectedFilterIndex == 0) return allExercises;
    final selectedFilter = _filters[selectedFilterIndex];
    return allExercises.where((e) => e.tag.contains(selectedFilter)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ExerciseCubit>()..getExercises(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'EXERCISES',
                  style: AppTextStyles.heading1.copyWith(
                    fontFamily: 'Manrope',
                    fontSize: 24,
                    letterSpacing: -0.6,
                  ),
                ),
                const SizedBox(height: 24),
                // Filters
                BlocBuilder<ExerciseCubit, ExerciseState>(
                  buildWhen: (previous, current) =>
                      current is ExerciseSuccess || current is ExerciseLoading,
                  builder: (context, state) {
                    final selectedIndex = state is ExerciseSuccess
                        ? state.filterIndex
                        : 0;
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      child: Row(
                        children: List.generate(_filters.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: ExercisesCategoryChip(
                              label: _filters[index],
                              isSelected: selectedIndex == index,
                              onTap: () {
                                context.read<ExerciseCubit>().changeFilter(
                                  index,
                                );
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
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is ExerciseSuccess) {
                        final exercises = _filteredExercises(
                          state.exercises,
                          state.filterIndex,
                        );

                        if (exercises.isEmpty) {
                          return const Center(
                            child: Text(
                              'No exercises found for this category',
                              style: TextStyle(color: Colors.white70),
                            ),
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
                              imagePath: exercise.imageUrl,
                              tag: exercise.tag,
                              title: exercise.title,
                              subtitle: exercise.subtitle,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ExerciseDetailsView(exercise: exercise),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      } else if (state is ExerciseFailure) {
                        return Center(
                          child: Text(
                            state.error,
                            style: const TextStyle(color: Colors.red),
                          ),
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

import 'package:flutter/material.dart';
import 'package:k_rehab/core/constants/asset_paths.dart';
import 'package:k_rehab/core/theme/app_colors.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';
import '../widgets/exercise_card.dart';
import '../widgets/exercise_filter_chip.dart';
import 'exercise_details_view.dart';

class ExercisesView extends StatefulWidget {
  const ExercisesView({super.key});

  @override
  State<ExercisesView> createState() => _ExercisesViewState();
}

class _ExercisesViewState extends State<ExercisesView> {
  int _selectedFilterIndex = 0;
  final List<String> _filters = [
    'All',
    'Knee',
    'Back',
    'Shoulder',
    'Hip',
    'Ankle',
  ];

  final List<Map<String, String>> _exercises = [
    {
      'imagePath': AssetPaths.straightLegRaise,
      'tag': 'Knee',
      'title': 'Straight Leg Raise',
      'subtitle': '3 Sets • 12 Reps • 0.5kg',
    },
    {
      'imagePath': AssetPaths.hipIcon, // using hipIcon as placeholder
      'tag': 'Hip',
      'title': 'Glute Bridge',
      'subtitle': '3 Sets • 15 Reps • Bodyweight',
    },
    {
      'imagePath': AssetPaths.kneeExtention,
      'tag': 'Hip / Knee',
      'title': 'Clamshell',
      'subtitle': '2 Sets • 20 Reps • Resistance Band',
    },
    {
      'imagePath': AssetPaths.shoulder,
      'tag': 'Shoulder',
      'title': 'Shoulder Pendulum',
      'subtitle': '2 Mins • Continuous • Gravity',
    },
    {
      'imagePath': AssetPaths.back,
      'tag': 'Back',
      'title': 'Cat-Cow Stretch',
      'subtitle': '10 Cycles • 5 Sec Hold • Mobility',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: List.generate(_filters.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ExerciseFilterChip(
                        label: _filters[index],
                        isSelected: _selectedFilterIndex == index,
                        onTap: () {
                          setState(() {
                            _selectedFilterIndex = index;
                          });
                        },
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 24),
              // List
              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: _exercises.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final exercise = _exercises[index];
                    return ExerciseCard(
                      imagePath: exercise['imagePath']!,
                      tag: exercise['tag']!,
                      title: exercise['title']!,
                      subtitle: exercise['subtitle']!,
                      onTap: () {
                        // Navigate to detail view
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ExerciseDetailsView(),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

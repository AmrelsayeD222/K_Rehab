import 'package:flutter/material.dart';
import 'package:k_rehab/core/theme/app_colors.dart';
import '../widgets/stat_card.dart';
import '../widgets/technique_step_item.dart';

class ExerciseDetailsView extends StatelessWidget {
  const ExerciseDetailsView({super.key});

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
        title: const Text(
          'EXERCISE',
          style: TextStyle(
            fontFamily: 'Manrope',
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.white,
            letterSpacing: -0.4,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Media
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 250,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Icon(Icons.fitness_center, color: Colors.grey),
                ),
                Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        AppColors.background,
                        AppColors.background.withValues(alpha: 0),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 24,
                  bottom: 24,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: const Text(
                      'GIF',
                      style: TextStyle(
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF00382F),
                        fontSize: 10,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ),
              ],
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
                  const Text(
                    'Straight Leg Raise',
                    style: TextStyle(
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w800,
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
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
                        child: const Text(
                          'KNEE REHAB',
                          style: TextStyle(
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF26DEC2),
                            fontSize: 11,
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
                          color: const Color(
                            0x33005DC3,
                          ).withValues(alpha: 0.2), // rgba(0,93,195,0.2)
                          borderRadius: BorderRadius.circular(9999),
                        ),
                        child: const Text(
                          'MODERATE DIFFICULTY',
                          style: TextStyle(
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFACC7FF),
                            fontSize: 11,
                            letterSpacing: 0.55,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Stats Grid
                  const Row(
                    children: [
                      Expanded(
                        child: StatCard(label: 'SETS', value: '3'),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: StatCard(label: 'REPS', value: '12'),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: StatCard(label: 'HOLD', value: '5s'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Warning Box
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF59E0B).withValues(alpha: 0.1),
                      border: const Border(
                        left: BorderSide(color: Color(0xFFF59E0B), width: 4),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.warning_amber_rounded,
                          color: Color(0xFFF59E0B),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            'Stop immediately if you feel sharp or worsening pain in the lower back or surgical site.',
                            style: TextStyle(
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFF59E0B),
                              fontSize: 14,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Technique Guide
                  const Text(
                    'Technique Guide',
                    style: TextStyle(
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const TechniqueStepItem(
                    stepNumber: 1,
                    description:
                        'Lie flat on your back on a firm surface. Bend the knee of your non-operative leg to 90 degrees, keeping that foot flat on the floor.',
                  ),
                  const SizedBox(height: 16),
                  const TechniqueStepItem(
                    stepNumber: 2,
                    description:
                        'Tighten the thigh muscle (quadriceps) of your straight leg by pushing the back of your knee down into the surface.',
                  ),
                  const SizedBox(height: 16),
                  const TechniqueStepItem(
                    stepNumber: 3,
                    description:
                        'Slowly lift the straight leg about 12 inches off the floor. Keep the knee locked completely straight throughout the motion.',
                  ),
                  const SizedBox(height: 16),
                  const TechniqueStepItem(
                    stepNumber: 4,
                    description:
                        'Pause for 5 seconds at the top, then slowly lower the leg back to the starting position with control.',
                  ),
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

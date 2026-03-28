import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:k_rehab/core/theme/app_colors.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  final List<Map<String, dynamic>> categories = const [
    {'name': 'Shoulder', 'icon': Icons.accessibility_new_rounded},
    {'name': 'Knee', 'icon': Icons.directions_run_rounded},
    {'name': 'Back', 'icon': Icons.airline_seat_recline_extra_rounded},
    {'name': 'Neck', 'icon': Icons.person_rounded},
    {'name': 'Ankle', 'icon': Icons.bolt_rounded},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24.0, bottom: 16.0),
          child: Text(
            'Categories',
            style: AppTextStyles.heading2,
          ).animate().fadeIn(duration: 400.ms, delay: 300.ms),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.13,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            color: AppColors.cardBackground,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: AppColors.primary.withValues(alpha: .08),
                            ),
                          ),
                          child: Icon(
                            category['icon'] as IconData,
                            color: AppColors.primary,
                            size: 30,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          category['name'] as String,
                          style: AppTextStyles.caption.copyWith(
                            color: AppColors.textLight,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  )
                  .animate()
                  .fadeIn(
                    duration: 400.ms,
                    delay: Duration(milliseconds: 400 + (index * 80)),
                  )
                  .slideY(begin: 0.1, curve: Curves.easeOut);
            },
          ),
        ),
      ],
    );
  }
}

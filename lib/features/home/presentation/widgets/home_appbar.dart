import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:k_rehab/core/theme/app_colors.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Amrelsayed 👋',
            style: AppTextStyles.heading2.copyWith(fontSize: 22),
          ).animate().fadeIn(duration: 400.ms).slideX(begin: -0.1),
          CircleAvatar(
            radius: 24,
            backgroundColor: AppColors.primary.withValues(alpha: .3),
            child: CircleAvatar(
              radius: 22,
              backgroundColor: AppColors.cardBackground,
              child:
                  const Icon(
                        Icons.person_2_rounded,
                        color: AppColors.textPrimary,
                        size: 26,
                      )
                      .animate()
                      .fadeIn(duration: 400.ms)
                      .scale(begin: const Offset(0.8, 0.8)),
            ),
          ),
        ],
      ),
    );
  }
}

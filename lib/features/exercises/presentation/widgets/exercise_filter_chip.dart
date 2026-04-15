import 'package:flutter/material.dart';
import 'package:k_rehab/core/theme/app_colors.dart';

class ExercisesCategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const ExercisesCategoryChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 9),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary.withValues(alpha: 0.15)
              : AppColors.cardBackground,
          border: Border.all(
            color: isSelected ? AppColors.primary : const Color(0xFF3B4A46),
          ),
          borderRadius: BorderRadius.circular(9999),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? AppColors.primary : const Color(0xFFBACAC5),
            fontSize: 14,
            fontWeight: FontWeight.w600,
            fontFamily: 'Manrope',
          ),
        ),
      ),
    );
  }
}

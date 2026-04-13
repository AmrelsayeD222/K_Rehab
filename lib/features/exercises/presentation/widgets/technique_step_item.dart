import 'package:flutter/material.dart';
import 'package:k_rehab/core/theme/app_colors.dart';

class TechniqueStepItem extends StatelessWidget {
  final int stepNumber;
  final String description;

  const TechniqueStepItem({
    super.key,
    required this.stepNumber,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(
              alpha: 0.2,
            ), // rgba(70,241,211,0.2)
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.center,
          child: Text(
            stepNumber.toString(),
            style: const TextStyle(
              fontFamily: 'Manrope',
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            description,
            style: const TextStyle(
              fontFamily: 'Manrope',
              color: Color(0xFFBACAC5),
              fontSize: 14,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}

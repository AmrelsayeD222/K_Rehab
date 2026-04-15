import 'package:flutter/material.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';

class ExerciseWarningBox extends StatelessWidget {
  const ExerciseWarningBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF59E0B).withValues(alpha: 0.1),
        border: const Border(
          left: BorderSide(color: Color(0xFFF59E0B), width: 4),
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.warning_amber_rounded, color: Color(0xFFF59E0B)),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              'Stop immediately if you feel sharp or worsening pain at the exercise site or surgical area.',
              style: AppTextStyles.bodyText2.copyWith(
                fontWeight: FontWeight.w500,
                color: Color(0xFFF59E0B),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

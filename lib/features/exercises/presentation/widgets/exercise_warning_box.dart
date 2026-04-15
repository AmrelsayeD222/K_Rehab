import 'package:flutter/material.dart';

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
              'Stop immediately if you feel sharp or worsening pain at the exercise site or surgical area.',
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
    );
  }
}

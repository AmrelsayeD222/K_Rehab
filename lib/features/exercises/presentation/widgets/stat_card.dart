import 'package:flutter/material.dart';
import 'package:k_rehab/core/theme/app_colors.dart';

class StatCard extends StatelessWidget {
  final String label;
  final String value;

  const StatCard({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label.toUpperCase(),
            style: const TextStyle(
              fontFamily: 'Manrope',
              fontWeight: FontWeight.bold,
              color: Color(0xFFBACAC5),
              fontSize: 10,
              letterSpacing: 1.0,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w800,
              color: AppColors.primary,
              fontSize: 30,
            ),
          ),
        ],
      ),
    );
  }
}

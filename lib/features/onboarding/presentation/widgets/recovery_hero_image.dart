import 'package:flutter/material.dart';
import 'package:k_rehab/core/theme/app_colors.dart';

class RecoveryHeroImage extends StatelessWidget {
  const RecoveryHeroImage({super.key, required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return SizedBox(
      height: size.height * 0.40,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: size.height * 0.26,
            width: size.height * 0.26,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  blurRadius: 40,
                  spreadRadius: 20,
                ),
              ],
            ),
          ),
          Image.asset(
            imagePath,
            height: size.height * 0.30,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}

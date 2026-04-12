import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:k_rehab/core/constants/asset_paths.dart';
import 'package:k_rehab/core/theme/app_colors.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  final List categories = const [
    {'name': 'Shoulder', 'image': AssetPaths.shoulderIcon},
    {'name': 'Knee', 'image': AssetPaths.kneeIcon},
    {'name': 'Back', 'image': AssetPaths.backIcon},
    {'name': 'Neck', 'image': AssetPaths.neckIcon},
    {'name': 'Ankle', 'image': AssetPaths.ankleIcon},
    {'name': 'Hip', 'image': AssetPaths.hipIcon},
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
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(
                            category['image'] as String,
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

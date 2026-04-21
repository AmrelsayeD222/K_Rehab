import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:k_rehab/features/onboarding/data/models/onboarding_page_model.dart';
import 'package:k_rehab/features/onboarding/presentation/widgets/recovery_feature_item.dart';
import 'package:k_rehab/features/onboarding/presentation/widgets/recovery_hero_image.dart';
import 'package:k_rehab/features/onboarding/presentation/widgets/recovery_text_section.dart';

class OnboardingPageContent extends StatelessWidget {
  const OnboardingPageContent({super.key, required this.page});

  final OnboardingPageModel page;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          RecoveryHeroImage(imagePath: page.imagePath)
              .animate()
              .fadeIn(duration: 400.ms)
              .slideY(begin: 0.1, curve: Curves.easeOut),
          RecoveryTextSection(title: page.title, subtitle: page.subtitle)
              .animate()
              .fadeIn(duration: 400.ms, delay: 100.ms)
              .slideY(begin: 0.1, curve: Curves.easeOut),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              children: [
                for (int i = 0; i < page.features.length; i++) ...[
                  if (i > 0) const SizedBox(height: 5),
                  RecoveryFeatureItem(
                    padding: page.features[i].padding,
                    iconPath: page.features[i].iconPath,
                    title: page.features[i].title,
                  )
                      .animate()
                      .fadeIn(
                        duration: 350.ms,
                        delay: Duration(milliseconds: 150 + (i * 80)),
                      )
                      .slideX(begin: 0.15, curve: Curves.easeOut),
                ],
              ],
            ),
          ),
          const SizedBox(height: 20), // Bottom breathing room
        ],
      ),
    );
  }
}

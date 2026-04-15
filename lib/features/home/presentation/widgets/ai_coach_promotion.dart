import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:k_rehab/core/constants/asset_paths.dart';
import 'package:k_rehab/core/theme/app_colors.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';

class AiCoachPromotion extends StatelessWidget {
  const AiCoachPromotion({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 24),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF1E232E),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: .1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'AI Recovery Coach',
                    style: AppTextStyles.tag.copyWith(
                      color: AppColors.primary,
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Get personalized guidance\nfor your recovery journey',
                  style: AppTextStyles.sectionHeader.copyWith(fontSize: 16),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      Text(
                        'Start Chatting',
                        style: AppTextStyles.cardTitle.copyWith(
                          color: AppColors.primary,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: AppColors.primary,
                        size: 14,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: .05),
                      shape: BoxShape.circle,
                    ),
                  )
                  .animate(onPlay: (controller) => controller.repeat())
                  .scale(
                    duration: 2.seconds,
                    begin: const Offset(1, 1),
                    end: const Offset(1.1, 1.1),
                    curve: Curves.easeInOut,
                  )
                  .then()
                  .scale(
                    duration: 2.seconds,
                    begin: const Offset(1.1, 1.1),
                    end: const Offset(1, 1),
                    curve: Curves.easeInOut,
                  ),
              SvgPicture.asset(AssetPaths.aiCoachIcon, width: 55, height: 55),
            ],
          ),
        ],
      ),
    ).animate().fadeIn(duration: 500.ms, delay: 600.ms).slideY(begin: 0.1);
  }
}

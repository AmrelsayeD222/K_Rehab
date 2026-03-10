import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:k_rehab/core/constants/asset_paths.dart';
import 'package:k_rehab/core/theme/app_colors.dart';

class DisclaimerCard extends StatelessWidget {
  const DisclaimerCard({super.key});

  static const String _disclaimerText =
      'KRehab provides educational physiotherapy guidance only. '
      'It does not replace professional medical diagnosis, advice, or treatment. '
      'Always seek the advice of your physician or other qualified health provider '
      'with any questions you may have regarding a medical condition.';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: SvgPicture.asset(
              AssetPaths.exclamationIcon,
              width: 16,
              height: 16,
              colorFilter: const ColorFilter.mode(
                AppColors.primary,
                BlendMode.srcIn,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              _disclaimerText,
              style: const TextStyle(
                color: AppColors.textPrimary,
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

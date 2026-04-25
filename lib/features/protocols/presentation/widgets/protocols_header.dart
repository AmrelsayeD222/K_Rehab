import 'package:flutter/material.dart';
import 'package:k_rehab/core/theme/app_colors.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';

class ProtocolsHeader extends StatelessWidget {
  const ProtocolsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'REHAB PROTOCOLS',
          style: AppTextStyles.mainHeading.copyWith(color: colors.textPrimary),
        ),
        const SizedBox(height: 8),
        Text(
          'Evidence-based rehabilitation programs',
          style: AppTextStyles.cardSubtitle.copyWith(
            fontSize: 14,
            color: colors.textSecondary,
          ),
        ),
      ],
    );
  }
}

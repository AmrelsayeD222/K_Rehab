import 'package:flutter/material.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';

class ProtocolsHeader extends StatelessWidget {
  const ProtocolsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'REHAB PROTOCOLS',
          style: AppTextStyles.mainHeading.copyWith(color: colors.onSurface),
        ),
        const SizedBox(height: 8),
        Text(
          'Evidence-based rehabilitation programs',
          style: AppTextStyles.cardSubtitle.copyWith(
            fontSize: 14,
            color: colors.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}

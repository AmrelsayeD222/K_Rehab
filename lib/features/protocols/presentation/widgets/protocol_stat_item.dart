import 'package:flutter/material.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';

class ProtocolStatItem extends StatelessWidget {
  const ProtocolStatItem({super.key, required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Row(
      children: [
        Icon(icon, color: colors.onSurfaceVariant, size: 16),
        const SizedBox(width: 6),
        Flexible(
          child: Text(
            text,
            style: AppTextStyles.cardSubtitle.copyWith(
              color: colors.onSurfaceVariant,
              fontWeight: FontWeight.w600,
              fontSize: 12,
              letterSpacing: 0.5,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

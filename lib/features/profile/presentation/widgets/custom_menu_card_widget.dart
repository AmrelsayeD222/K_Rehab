import 'package:flutter/material.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';

class CustomMenuCardWidget extends StatelessWidget {
  const CustomMenuCardWidget({
    super.key,
    required this.icon,
    required this.title,
    this.trailing,
    this.iconColor,
  });

  final IconData icon;
  final String title;
  final Widget? trailing;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final color = iconColor ?? colors.primary;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              title,
              style: AppTextStyles.cardTitle.copyWith(
                color: colors.onSurface,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          trailing ??
              Icon(
                Icons.chevron_right_rounded,
                color: colors.onSurfaceVariant,
                size: 20,
              ),
        ],
      ),
    );
  }
}

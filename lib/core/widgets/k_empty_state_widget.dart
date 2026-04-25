import 'package:flutter/material.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';

class KEmptyStateWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  const KEmptyStateWidget({
    super.key,
    required this.title,
    required this.subtitle,
    this.icon = Icons.inbox_rounded,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: colors.onSurfaceVariant.withValues(alpha: 0.5), size: 64),
            const SizedBox(height: 16),
            Text(
              title,
              style: AppTextStyles.heading2.copyWith(color: colors.onSurface),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: AppTextStyles.caption.copyWith(color: colors.onSurfaceVariant),
            ),
          ],
        ),
      ),
    );
  }
}

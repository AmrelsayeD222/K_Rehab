import 'package:flutter/material.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';

class BulletPoint extends StatelessWidget {
  const BulletPoint({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 6.0, right: 8.0),
          child: Icon(
            Icons.circle,
            size: 6,
            color: colors.primary,
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: AppTextStyles.bodyText2.copyWith(
              color: colors.onSurfaceVariant,
            ),
          ),
        ),
      ],
    );
  }
}

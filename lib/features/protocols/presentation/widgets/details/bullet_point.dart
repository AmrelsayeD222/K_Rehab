import 'package:flutter/material.dart';
import 'package:k_rehab/core/theme/app_colors.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';

class BulletPoint extends StatelessWidget {
  const BulletPoint({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 6.0, right: 8.0),
          child: Icon(
            Icons.circle,
            size: 6,
            color: AppColors.primary,
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: AppTextStyles.bodyText2.copyWith(
              color: AppColors.textLight,
            ),
          ),
        ),
      ],
    );
  }
}

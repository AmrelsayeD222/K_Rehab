import 'package:flutter/material.dart';
import 'package:k_rehab/core/theme/app_colors.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';

class AuthToggleRow extends StatelessWidget {
  const AuthToggleRow({
    super.key,
    required this.label,
    required this.actionText,
    required this.onActionTap,
  });

  final String label;
  final String actionText;
  final VoidCallback onActionTap;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(
          label,
          style: AppTextStyles.bodyText2,
        ),
        GestureDetector(
          onTap: onActionTap,
          child: Text(
            actionText,
            style: AppTextStyles.bodyText2.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}


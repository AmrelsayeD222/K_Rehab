import 'package:flutter/material.dart';
import 'package:k_rehab/core/theme/app_colors.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';

class KLoadingWidget extends StatelessWidget {
  final String? message;
  final bool isSmall;
  final Color? color;

  const KLoadingWidget({
    super.key,
    this.message,
    this.isSmall = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final loader = CircularProgressIndicator(
      color: color ?? (isSmall ? Colors.white : AppColors.primary),
      strokeWidth: isSmall ? 2 : 4,
    );

    if (isSmall) {
      return SizedBox(
        height: 24,
        width: 24,
        child: loader,
      );
    }

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          loader,
          if (message != null) ...[
            const SizedBox(height: 16),
            Text(message!, style: AppTextStyles.bodyText2),
          ],
        ],
      ),
    );
  }
}

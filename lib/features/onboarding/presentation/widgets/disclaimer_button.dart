import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:k_rehab/core/constants/asset_paths.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';

class DisclaimerButton extends StatelessWidget {
  const DisclaimerButton({
    super.key,
    required this.enabled,
    required this.onPressed,
  });

  final bool enabled;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: ElevatedButton(
          onPressed: enabled ? onPressed : null,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            backgroundColor: colors.primary,
            disabledBackgroundColor: colors.primary.withValues(alpha: 0.4),
            elevation: 0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Next", style: AppTextStyles.buttonText.copyWith(color: colors.onSurface)),
              const SizedBox(width: 8),
              SvgPicture.asset(
                AssetPaths.arrowIcon,
                colorFilter: ColorFilter.mode(colors.onSurface, BlendMode.srcIn),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

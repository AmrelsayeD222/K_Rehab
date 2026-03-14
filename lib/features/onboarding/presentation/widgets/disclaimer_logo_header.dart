import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:k_rehab/core/constants/asset_paths.dart';

import 'package:k_rehab/core/theme/app_text_styles.dart';

class DisclaimerLogoHeader extends StatelessWidget {
  const DisclaimerLogoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(AssetPaths.disclaimerLogo, width: 44, height: 44),
        const SizedBox(width: 10),
        const Text(
          'KRehab',
          style: AppTextStyles.heading2,
        ),
      ],
    );
  }
}

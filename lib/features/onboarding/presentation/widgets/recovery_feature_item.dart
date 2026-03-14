import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';

class RecoveryFeatureItem extends StatelessWidget {
  const RecoveryFeatureItem({
    super.key,
    required this.iconPath,
    required this.title,
    required this.padding,
  });

  final String iconPath;
  final String title;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: EdgeInsets.all(padding),
        width: 40,
        height: 40,
        child: SvgPicture.asset(iconPath),
      ),
      title: Text(title, style: AppTextStyles.featureItemTitle),
    );
  }
}

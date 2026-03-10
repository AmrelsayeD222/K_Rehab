import 'package:flutter/material.dart';
import 'package:k_rehab/core/constants/asset_paths.dart';

class DisclaimerImageSection extends StatelessWidget {
  const DisclaimerImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        AssetPaths.disclaimerImage,
        width: double.infinity,
        height: 180,
        fit: BoxFit.cover,
      ),
    );
  }
}

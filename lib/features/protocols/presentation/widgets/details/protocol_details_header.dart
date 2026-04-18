import 'package:flutter/material.dart';
import 'package:k_rehab/core/theme/app_colors.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';
import 'package:k_rehab/features/protocols/data/models/dummy_protocol_details.dart';

class ProtocolDetailsHeader extends StatelessWidget {
  const ProtocolDetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final details = dummyProtocolDetailsData;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Rehabilitation Protocol', style: AppTextStyles.heading1),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: details.tags.map((tag) => _buildTag(tag)).toList(),
        ),
      ],
    );
  }

  Widget _buildTag(String tag) {
    Color bgColor;
    if (tag.toLowerCase().contains('rehab')) {
      bgColor = AppColors.primary.withValues(alpha: 0.2);
    } else if (tag.toLowerCase().contains('sessions')) {
      bgColor = Colors.blue.withValues(alpha: 0.2);
    } else if (tag.toLowerCase().contains('intermediate')) {
      bgColor = Colors.orange.withValues(alpha: 0.2);
    } else {
      bgColor = Colors.purple.withValues(alpha: 0.2);
    }

    Color textColor;
    if (tag.toLowerCase().contains('rehab')) {
      textColor = AppColors.primary;
    } else if (tag.toLowerCase().contains('sessions')) {
      textColor = Colors.blueAccent;
    } else if (tag.toLowerCase().contains('intermediate')) {
      textColor = Colors.orangeAccent;
    } else {
      textColor = Colors.purpleAccent;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(tag, style: AppTextStyles.tag.copyWith(color: textColor)),
    );
  }
}

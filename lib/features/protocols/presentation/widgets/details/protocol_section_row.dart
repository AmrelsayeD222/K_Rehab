import 'package:flutter/material.dart';
import 'package:k_rehab/core/theme/app_colors.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';
import 'package:k_rehab/features/protocols/presentation/widgets/details/bullet_point.dart';

class ProtocolSectionRow extends StatelessWidget {
  const ProtocolSectionRow({
    super.key,
    required this.title,
    required this.items,
  });

  final String title;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              title,
              style: AppTextStyles.bodyText2.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: items
                  .map(
                    (item) => Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: BulletPoint(text: item),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

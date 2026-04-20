import 'package:flutter/material.dart';
import 'package:k_rehab/core/theme/app_colors.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';
import 'package:k_rehab/features/protocols/data/models/dummy_protocol_details.dart';

class ProtocolDetailsTabs extends StatelessWidget {
  const ProtocolDetailsTabs({
    super.key,
    required this.phases,
    required this.selectedIndex,
    required this.onTabChanged,
  });

  final List<DummyProtocolPhase> phases;
  final int selectedIndex;
  final ValueChanged<int> onTabChanged;

  @override
  Widget build(BuildContext context) {
    final tabs = ['All', ...phases.map((p) => p.phaseName)];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(tabs.length, (index) {
          final isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () => onTabChanged(index),
            child: Container(
              margin: const EdgeInsets.only(right: 24),
              padding: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: isSelected ? AppColors.primary : Colors.transparent,
                    width: 2,
                  ),
                ),
              ),
              child: Text(
                tabs[index],
                style: AppTextStyles.bodyText1.copyWith(
                  color: isSelected
                      ? AppColors.primary
                      : AppColors.textSecondary,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

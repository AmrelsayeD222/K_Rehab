import 'package:flutter/material.dart';
import 'package:k_rehab/core/theme/app_colors.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';

class ProfileSegmentedToggle extends StatefulWidget {
  const ProfileSegmentedToggle({
    super.key,
    required this.options,
    this.initialIndex = 0,
  });

  final List<String> options;
  final int initialIndex;

  @override
  State<ProfileSegmentedToggle> createState() => _ProfileSegmentedToggleState();
}

class _ProfileSegmentedToggleState extends State<ProfileSegmentedToggle> {
  late int _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: const Color(0xFF13161E),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(widget.options.length, _buildOption),
      ),
    );
  }

  Widget _buildOption(int index) {
    final isSelected = _selected == index;
    return GestureDetector(
      onTap: () => setState(() => _selected = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
        ),
        alignment: Alignment.center,
        child: Text(
          widget.options[index],
          style: AppTextStyles.tag.copyWith(
            color: isSelected
                ? const Color(0xFF111111)
                : AppColors.textSecondary,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

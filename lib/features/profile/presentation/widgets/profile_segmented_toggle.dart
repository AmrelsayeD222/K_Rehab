import 'package:flutter/material.dart';
import 'package:k_rehab/core/theme/app_colors.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';

class ProfileSegmentedToggle extends StatefulWidget {
  const ProfileSegmentedToggle({
    super.key,
    required this.options,
    this.initialIndex = 0,
    this.onChanged,
  });

  final List<String> options;
  final int initialIndex;
  final ValueChanged<int>? onChanged;

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
    final colors = context.appColors;
    return Container(
      height: 30,
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: colors.background,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: colors.textMuted.withValues(alpha: 0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(widget.options.length, (index) => _buildOption(index, colors)),
      ),
    );
  }

  Widget _buildOption(int index, AppColorsExtension colors) {
    final isSelected = _selected == index;
    return GestureDetector(
      onTap: () {
        setState(() => _selected = index);
        widget.onChanged?.call(index);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: isSelected ? colors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
        ),
        alignment: Alignment.center,
        child: Text(
          widget.options[index],
          style: AppTextStyles.tag.copyWith(
            color: isSelected ? colors.textDark : colors.textSecondary,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

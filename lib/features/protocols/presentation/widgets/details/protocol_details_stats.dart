import 'package:flutter/material.dart';
import 'package:k_rehab/core/theme/app_colors.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';
import 'package:k_rehab/features/protocols/data/models/dummy_protocol_details.dart';

class ProtocolDetailsStats extends StatelessWidget {
  const ProtocolDetailsStats({super.key});

  @override
  Widget build(BuildContext context) {
    final details = dummyProtocolDetailsData;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildStatColumn('${details.durationWeeks} Weeks', 'Weeks'),
          _buildDivider(),
          _buildStatColumn('${details.totalSessions} Sessions', 'Sessions'),
          _buildDivider(),
          _buildStatColumn(details.sessionDuration, 'Per session'),
        ],
      ),
    );
  }

  Widget _buildStatColumn(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: AppTextStyles.heading2.copyWith(
            color: AppColors.primary,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: AppTextStyles.caption,
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 40,
      width: 1,
      color: Colors.white24,
    );
  }
}

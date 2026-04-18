import 'package:flutter/material.dart';
import 'package:k_rehab/core/theme/app_colors.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';
import 'package:k_rehab/features/protocols/data/models/dummy_protocol_details.dart';

class ProtocolPhaseContent extends StatelessWidget {
  const ProtocolPhaseContent({super.key, required this.phase});

  final DummyProtocolPhase phase;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.circle, size: 12, color: AppColors.primary),
            const SizedBox(width: 8),
            Text(
              '${phase.phaseName.toUpperCase()} ${phase.phaseTitle}',
              style: AppTextStyles.heading2.copyWith(color: AppColors.primary),
            ),
          ],
        ),
        const SizedBox(height: 16),
        _buildSection('Rehab Goals', phase.rehabGoals),
        _buildSection('Criteria to Progress', phase.criteriaToProgress),
        _buildSection('Impairments', phase.impairments),
        _buildInterventionsSection(phase.interventions),
        _buildSection('Goals', phase.goals),
        const SizedBox(height: 16),
        Text(
          'Rationale',
          style: AppTextStyles.sectionHeader.copyWith(color: AppColors.primary),
        ),
        const SizedBox(height: 8),
        Text(
          phase.rationale,
          style: AppTextStyles.bodyText2.copyWith(color: AppColors.textSecondary),
        ),
        const SizedBox(height: 24),
        Divider(color: Colors.white.withOpacity(0.1)),
      ],
    );
  }

  Widget _buildSection(String title, List<String> items) {
    if (items.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.bodyText1.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          ...items.map((item) => Padding(
                padding: const EdgeInsets.only(bottom: 6.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 6.0, right: 8.0),
                      child: Icon(Icons.circle, size: 6, color: AppColors.primary),
                    ),
                    Expanded(
                      child: Text(
                        item,
                        style: AppTextStyles.bodyText2.copyWith(color: AppColors.textLight),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildInterventionsSection(List<DummyIntervention> interventions) {
    if (interventions.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Interventions',
            style: AppTextStyles.bodyText1.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          ...interventions.map((intervention) => Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      intervention.name,
                      style: AppTextStyles.bodyText2.copyWith(
                        color: AppColors.textLight,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    ...intervention.items.map((item) => Padding(
                          padding: const EdgeInsets.only(bottom: 4.0, left: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 6.0, right: 6.0),
                                child: Icon(Icons.remove, size: 10, color: AppColors.textSecondary),
                              ),
                              Expanded(
                                child: Text(
                                  item,
                                  style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

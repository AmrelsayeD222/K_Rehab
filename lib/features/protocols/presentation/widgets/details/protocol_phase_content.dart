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
            Expanded(
              child: Text(
                '${phase.phaseName.toUpperCase()} ${phase.phaseTitle}',
                style: AppTextStyles.heading2.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        _buildSectionRow('Rehab Goals', phase.rehabGoals),
        _buildSectionRow('Criteria to Progress', phase.criteriaToProgress),
        _buildSectionRow('Impairments', phase.impairments),
        _buildInterventionsRow(phase.interventions),
        _buildSectionRow('Goals', phase.goals),
        _buildRationaleRow('Rationale', phase.rationale),
        const SizedBox(height: 24),
        Divider(color: Colors.white.withValues(alpha: 0.1)),
      ],
    );
  }

  Widget _buildSectionRow(String title, List<String> items) {
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
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 6.0, right: 8.0),
                            child: Icon(
                              Icons.circle,
                              size: 6,
                              color: AppColors.primary,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              item,
                              style: AppTextStyles.bodyText2.copyWith(
                                color: AppColors.textLight,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInterventionsRow(List<DummyIntervention> interventions) {
    if (interventions.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              'Interventions',
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
              children: interventions
                  .map(
                    (intervention) => Padding(
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
                          ...intervention.items.map(
                            (item) => Padding(
                              padding: const EdgeInsets.only(
                                bottom: 4.0,
                                left: 8.0,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      top: 6.0,
                                      right: 6.0,
                                    ),
                                    child: Icon(
                                      Icons.remove,
                                      size: 10,
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      item,
                                      style: AppTextStyles.caption.copyWith(
                                        color: AppColors.textSecondary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRationaleRow(String title, String text) {
    if (text.isEmpty) return const SizedBox.shrink();

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
            child: Text(
              text,
              style: AppTextStyles.bodyText2.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

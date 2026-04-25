import 'package:flutter/material.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';
import 'package:k_rehab/features/protocols/data/models/protocol_details_model.dart';
import 'package:k_rehab/features/protocols/presentation/widgets/details/protocol_section_row.dart';
import 'package:k_rehab/features/protocols/presentation/widgets/details/protocol_interventions_row.dart';
import 'package:k_rehab/features/protocols/presentation/widgets/details/protocol_rationale_row.dart';

class ProtocolPhaseContent extends StatelessWidget {
  const ProtocolPhaseContent({super.key, required this.phase});

  final ProtocolPhaseModel phase;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.circle, size: 12, color: colors.primary),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                '${phase.phaseName.toUpperCase()} ${phase.phaseTitle}',
                style: AppTextStyles.heading2.copyWith(color: colors.primary),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        ProtocolSectionRow(title: 'Rehab Goals', items: phase.rehabGoals),
        ProtocolSectionRow(
          title: 'Criteria to Progress',
          items: phase.criteriaToProgress,
        ),
        ProtocolSectionRow(title: 'Impairments', items: phase.impairments),
        ProtocolInterventionsRow(interventions: phase.interventions),
        ProtocolSectionRow(title: 'Goals', items: phase.goals),
        ProtocolRationaleRow(title: 'Rationale', text: phase.rationale),
        const SizedBox(height: 24),
        Divider(color: colors.onSurfaceVariant.withValues(alpha: 0.2)),
      ],
    );
  }
}

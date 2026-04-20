import 'package:flutter/material.dart';
import 'package:k_rehab/core/theme/app_colors.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';
import 'package:k_rehab/features/protocols/data/models/dummy_protocol_details.dart';
import 'package:k_rehab/features/protocols/presentation/widgets/details/protocol_section_row.dart';
import 'package:k_rehab/features/protocols/presentation/widgets/details/protocol_interventions_row.dart';
import 'package:k_rehab/features/protocols/presentation/widgets/details/protocol_rationale_row.dart';

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
        Divider(color: Colors.white.withValues(alpha: 0.1)),
      ],
    );
  }
}


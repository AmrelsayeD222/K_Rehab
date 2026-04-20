import 'package:flutter/material.dart';
import 'package:k_rehab/features/protocols/data/models/protocol_details_model.dart';
import 'package:k_rehab/features/protocols/presentation/widgets/details/protocol_phase_content.dart';

class ProtocolDetailsContent extends StatelessWidget {
  const ProtocolDetailsContent({
    super.key,
    required this.selectedTabIndex,
    required this.details,
  });

  final int selectedTabIndex;
  final ProtocolDetailsModel details;

  @override
  Widget build(BuildContext context) {
    if (selectedTabIndex == 0) {
      // All
      return Column(
        children: details.phases
            .map(
              (phase) => Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: ProtocolPhaseContent(phase: phase),
              ),
            )
            .toList(),
      );
    } else {
      // Specific Phase
      final phaseIndex = selectedTabIndex - 1;
      if (phaseIndex >= 0 && phaseIndex < details.phases.length) {
        return ProtocolPhaseContent(phase: details.phases[phaseIndex]);
      }
      return const SizedBox.shrink();
    }
  }
}

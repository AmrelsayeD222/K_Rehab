import 'package:flutter/material.dart';
import 'package:k_rehab/core/theme/app_colors.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';
import 'package:k_rehab/features/protocols/data/models/dummy_protocol_details.dart';
import 'package:k_rehab/features/protocols/presentation/widgets/details/protocol_details_header.dart';
import 'package:k_rehab/features/protocols/presentation/widgets/details/protocol_details_stats.dart';
import 'package:k_rehab/features/protocols/presentation/widgets/details/protocol_details_tabs.dart';
import 'package:k_rehab/features/protocols/presentation/widgets/details/protocol_phase_content.dart';

class ProtocolDetailsView extends StatefulWidget {
  const ProtocolDetailsView({super.key});

  @override
  State<ProtocolDetailsView> createState() => _ProtocolDetailsViewState();
}

class _ProtocolDetailsViewState extends State<ProtocolDetailsView> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final details = dummyProtocolDetailsData;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Column(
          children: [
            Text(
              details.title,
              style: AppTextStyles.heading2,
            ),
            Text(
              details.subtitle,
              style: AppTextStyles.caption,
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProtocolDetailsHeader(),
              const SizedBox(height: 24),
              const ProtocolDetailsStats(),
              const SizedBox(height: 24),
              ProtocolDetailsTabs(
                phases: details.phases,
                selectedIndex: _selectedTabIndex,
                onTabChanged: (index) {
                  setState(() {
                    _selectedTabIndex = index;
                  });
                },
              ),
              const SizedBox(height: 24),
              _buildContent(details),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent(DummyProtocolDetails details) {
    if (_selectedTabIndex == 0) {
      // All
      return Column(
        children: details.phases
            .map((phase) => Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: ProtocolPhaseContent(phase: phase),
                ))
            .toList(),
      );
    } else {
      // Specific Phase
      final phaseIndex = _selectedTabIndex - 1;
      if (phaseIndex >= 0 && phaseIndex < details.phases.length) {
        return ProtocolPhaseContent(phase: details.phases[phaseIndex]);
      }
      return const SizedBox.shrink();
    }
  }
}

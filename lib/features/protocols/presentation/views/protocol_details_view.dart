import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:k_rehab/core/theme/app_colors.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';
import 'package:k_rehab/features/protocols/data/models/protocol_model.dart';
import 'package:k_rehab/features/protocols/data/models/dummy_protocol_details.dart';

import 'package:k_rehab/features/protocols/presentation/widgets/details/protocol_details_tabs.dart';
import 'package:k_rehab/features/protocols/presentation/widgets/details/protocol_details_content.dart';

class ProtocolDetailsView extends StatefulWidget {
  final ProtocolModel protocol;

  const ProtocolDetailsView({super.key, required this.protocol});

  @override
  State<ProtocolDetailsView> createState() => _ProtocolDetailsViewState();
}

class _ProtocolDetailsViewState extends State<ProtocolDetailsView> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Protocol details data will be fetched from Supabase in a future task.
    // For now, using dummy details data.
    final details = dummyProtocolDetailsData;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.pop(),
        ),
        title: Text(widget.protocol.title, style: AppTextStyles.heading2),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              ProtocolDetailsContent(
                selectedTabIndex: _selectedTabIndex,
                details: details,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

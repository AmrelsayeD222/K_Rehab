import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:k_rehab/core/theme/app_colors.dart';
import 'package:k_rehab/features/protocols/data/models/dummy_protocol.dart';
import 'package:k_rehab/features/protocols/presentation/widgets/protocol_card_item.dart';
import 'package:k_rehab/features/protocols/presentation/widgets/protocols_header.dart';
import 'package:go_router/go_router.dart';
import 'package:k_rehab/core/router/app_router.dart';

class ProtocolsView extends StatelessWidget {
  const ProtocolsView({super.key});

  static final List<DummyProtocol> _protocols = [
    DummyProtocol(
      title: 'ACL Reconstruction',
      subtitle:
          'Post-operative rehabilitation protocol for ACL reconstruction.',
      phase: 'Clinically previewed',
      imagePath: 'assets/home/knee_icon.jpg',
      duration: '4 WEEKS',
      sessions: '12 SESSIONS',
    ),
    DummyProtocol(
      title: 'Lumbar Disc Herniation',
      subtitle: 'Conservative management for lower back pain and sciatica.',
      phase: 'Clinically previewed',
      imagePath: 'assets/home/back_icon.jpg',
      duration: '6 WEEKS',
      sessions: '18 SESSIONS',
    ),
    DummyProtocol(
      title: 'Rotator Cuff Repair',
      subtitle: 'Gradual mobility and strengthening post shoulder surgery.',
      phase: 'Clinically previewed',
      imagePath: 'assets/home/shoulder_icon.jpg',
      duration: '8 WEEKS',
      sessions: '24 SESSIONS',
    ),
    DummyProtocol(
      title: 'Ankle Sprain (Grade II)',
      subtitle: 'Sports recovery protocol for lateral ankle sprains.',
      phase: 'Clinically previewed',
      imagePath: 'assets/home/ankle_icon.jpg',
      duration: '3 WEEKS',
      sessions: '9 SESSIONS',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProtocolsHeader(),
              const SizedBox(height: 32),
              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: _protocols.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 24),
                  itemBuilder: (context, index) {
                    final protocol = _protocols[index];
                    return ProtocolCardItem(
                          protocol: protocol,
                          onTap: () => context.push(AppRouter.protocolDetails),
                        )
                        .animate()
                        .fadeIn(
                          duration: 500.ms,
                          delay: Duration(milliseconds: 150 * index),
                        )
                        .slideY(begin: 0.15, curve: Curves.easeOutCubic);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:k_rehab/core/constants/asset_paths.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';
import 'package:k_rehab/features/home/models/protocol_card_model.dart';
import 'package:k_rehab/features/home/widgets/protocol_card.dart';

class FeaturedProtocolsCarousel extends StatelessWidget {
  const FeaturedProtocolsCarousel({super.key});

  static const List<ProtocolCardModel> _protocols = [
    ProtocolCardModel(
      title: 'Knee Post-Surgery\nRehab Phase 2',
      imagePath: AssetPaths.acl,
    ),
    ProtocolCardModel(
      title: 'Shoulder Recovery\nMobility Pack',
      imagePath: AssetPaths.shoulder,
    ),
    ProtocolCardModel(
      title: 'Lower Back\nStrengthening Plan',
      imagePath: AssetPaths.back,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24.0, bottom: 12.0),
          child: Text(
            'Featured Protocols',
            style: AppTextStyles.heading2,
          ).animate().fadeIn(duration: 400.ms, delay: 100.ms),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.23,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: _protocols.length,
            itemBuilder: (context, index) =>
                ProtocolCard(model: _protocols[index], index: index),
          ),
        ),
      ],
    );
  }
}

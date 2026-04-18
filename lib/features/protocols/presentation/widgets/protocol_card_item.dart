import 'package:flutter/material.dart';
import 'package:k_rehab/core/theme/app_colors.dart';
import 'package:k_rehab/features/protocols/data/models/dummy_protocol.dart';
import 'package:k_rehab/features/protocols/presentation/widgets/protocol_card_content.dart';
import 'package:k_rehab/features/protocols/presentation/widgets/protocol_card_image_header.dart';

class ProtocolCardItem extends StatelessWidget {
  final DummyProtocol protocol;
  final VoidCallback onTap;

  const ProtocolCardItem({
    super.key,
    required this.protocol,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProtocolCardImageHeader(protocol: protocol),
            ProtocolCardContent(protocol: protocol),
          ],
        ),
      ),
    );
  }
}


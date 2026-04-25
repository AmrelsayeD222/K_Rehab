import 'package:flutter/material.dart';
import 'package:k_rehab/core/theme/app_colors.dart';
import 'package:k_rehab/features/protocols/data/models/protocol_model.dart';
import 'package:k_rehab/features/protocols/presentation/widgets/protocol_card_content.dart';
import 'package:k_rehab/features/protocols/presentation/widgets/protocol_card_image_header.dart';

class ProtocolCardItem extends StatelessWidget {
  final ProtocolModel protocol;
  final VoidCallback onTap;

  const ProtocolCardItem({
    super.key,
    required this.protocol,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: colors.cardBackground,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: colors.textMuted.withValues(alpha: 0.1)),
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

import 'package:flutter/material.dart';
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
    final colors = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: colors.onSurfaceVariant.withValues(alpha: 0.1)),
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

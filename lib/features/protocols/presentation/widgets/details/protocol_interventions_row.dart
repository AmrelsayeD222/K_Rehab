import 'package:flutter/material.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';
import 'package:k_rehab/features/protocols/data/models/protocol_details_model.dart';

class ProtocolInterventionsRow extends StatelessWidget {
  const ProtocolInterventionsRow({
    super.key,
    required this.interventions,
  });

  final List<ProtocolInterventionModel> interventions;

  @override
  Widget build(BuildContext context) {
    if (interventions.isEmpty) return const SizedBox.shrink();

    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              'Interventions',
              style: AppTextStyles.bodyText2.copyWith(
                color: colors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: interventions
                  .map(
                    (intervention) => Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            intervention.name,
                            style: AppTextStyles.bodyText2.copyWith(
                              color: colors.onSurfaceVariant,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          ...intervention.items.map(
                            (item) => Padding(
                              padding: const EdgeInsets.only(
                                bottom: 4.0,
                                left: 8.0,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 6.0,
                                      right: 6.0,
                                    ),
                                    child: Icon(
                                      Icons.remove,
                                      size: 10,
                                      color: colors.onSurfaceVariant,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      item,
                                      style: AppTextStyles.caption.copyWith(
                                        color: colors.onSurfaceVariant,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

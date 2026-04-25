import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';
import 'package:k_rehab/features/protocols/data/models/protocol_model.dart';

class ProtocolCardImageHeader extends StatelessWidget {
  const ProtocolCardImageHeader({super.key, required this.protocol});

  final ProtocolModel protocol;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Hero(
      tag: protocol.id,
      child: Material(
        type: MaterialType.transparency,
        child: SizedBox(
          height: 180,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned.fill(
                child: CachedNetworkImage(
                  imageUrl: protocol.imagePath,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    color: Theme.of(context).cardColor,
                    child: const Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: Theme.of(context).cardColor,
                    child: const Icon(
                      Icons.broken_image_rounded,
                      color: Colors.grey,
                      size: 48,
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.5),
                  ),
                ),
              ),
              Positioned(
                top: 16,
                left: 16,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.4),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      if (protocol.isClinicallyReviewed) ...[
                        SvgPicture.asset(
                          'assets/protocol/clinically_previewed.svg',
                          width: 14,
                          height: 14,
                          colorFilter: ColorFilter.mode(
                            colors.primary,
                            BlendMode.srcIn,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Clinically Reviewed',
                          style: AppTextStyles.tag.copyWith(
                            color: colors.primary,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ] else ...[
                        const Icon(
                          Icons.history_edu_rounded,
                          color: Colors.white60,
                          size: 14,
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          'Pending Review',
                          style: TextStyle(
                            color: Colors.white60,
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 20,
                right: 20,
                child: Text(
                  protocol.title,
                  style: AppTextStyles.cardTitle.copyWith(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.5,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

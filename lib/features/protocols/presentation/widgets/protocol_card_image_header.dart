import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:k_rehab/core/theme/app_colors.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';
import 'package:k_rehab/features/protocols/data/models/dummy_protocol.dart';

class ProtocolCardImageHeader extends StatelessWidget {
  const ProtocolCardImageHeader({super.key, required this.protocol});

  final DummyProtocol protocol;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(protocol.imagePath, fit: BoxFit.cover),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.5),
              ),
            ),
          ),
          // Glassmorphism Phase Tag
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
                  SvgPicture.asset(
                    'assets/protocol/clinically_previewed.svg',
                    width: 14,
                    height: 14,
                    colorFilter: ColorFilter.mode(
                      AppColors.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    protocol.phase,
                    style: AppTextStyles.tag.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Title Overlay
          Positioned(
            bottom: 0,
            left: 20,
            right: 20,
            child: Text(
              protocol.title,
              style: AppTextStyles.cardTitle.copyWith(
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
    );
  }
}

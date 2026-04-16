import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:k_rehab/core/theme/app_colors.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';
import 'package:k_rehab/features/home/data/models/featured_protocol_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProtocolCard extends StatelessWidget {
  final FeaturedProtocolModel model;
  final int index;

  const ProtocolCard({super.key, required this.model, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
          width: 300,
          height: MediaQuery.of(context).size.height * 0.22,
          margin: const EdgeInsets.only(right: 16, bottom: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            image: DecorationImage(
              image: CachedNetworkImageProvider(model.imagePath),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [_buildTitle(), _buildActionButton()],
            ),
          ),
        )
        .animate()
        .fadeIn(
          duration: 400.ms,
          delay: Duration(milliseconds: 200 + (index * 100)),
        )
        .slideX(begin: 0.1, curve: Curves.easeOut);
  }

  Widget _buildTitle() {
    return Text(
      model.title,
      style: AppTextStyles.heading2.copyWith(
        color: AppColors.featuredCardBackground,
        height: 1.2,
        fontSize: 20,
      ),
    );
  }

  Widget _buildActionButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: const Icon(
            Icons.arrow_forward_rounded,
            color: AppColors.featuredCardBackground,
            size: 20,
          ),
        ),
      ],
    );
  }
}

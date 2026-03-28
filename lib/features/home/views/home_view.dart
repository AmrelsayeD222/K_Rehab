import 'package:flutter/material.dart';
import 'package:k_rehab/features/home/widgets/home_appbar.dart';
import 'package:k_rehab/features/home/widgets/featured_protocols_carousel.dart';
import 'package:k_rehab/features/home/widgets/categories_list.dart';
import 'package:k_rehab/features/home/widgets/ai_coach_promotion.dart';
import 'package:k_rehab/features/home/widgets/exercises_grid.dart';

import 'package:k_rehab/core/theme/app_colors.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 10),
                const HomeAppBar(),
                const FeaturedProtocolsCarousel(),
                const CategoriesList(),
                const AiCoachPromotion(),
                const ExercisesGrid(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:k_rehab/features/home/presentation/widgets/exercises_grid.dart';

import 'package:k_rehab/features/home/presentation/widgets/home_appbar.dart';
import 'package:k_rehab/features/home/presentation/widgets/featured_protocols_carousel.dart';
import 'package:k_rehab/features/home/presentation/widgets/categories_list.dart';
import 'package:k_rehab/features/home/presentation/widgets/ai_coach_promotion.dart';


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

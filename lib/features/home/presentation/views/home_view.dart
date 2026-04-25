import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:k_rehab/core/di/service_locator.dart';
import 'package:k_rehab/core/theme/app_colors.dart';
import 'package:k_rehab/features/home/presentation/manager/featuredExercises/featured_exercises_cubit.dart';
import 'package:k_rehab/features/home/presentation/manager/featuredProtocol/featured_protocol_cubit.dart';
import 'package:k_rehab/features/home/presentation/widgets/exercises_grid.dart';
import 'package:k_rehab/features/home/presentation/widgets/home_appbar.dart';
import 'package:k_rehab/features/home/presentation/widgets/featured_protocols_carousel.dart';
import 'package:k_rehab/features/home/presentation/widgets/categories_list.dart';
import 'package:k_rehab/features/home/presentation/widgets/ai_coach_promotion.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<FeaturedProtocolCubit>()..getFeaturedProtocols(),
        ),
        BlocProvider(
          create: (_) => getIt<FeaturedExercisesCubit>()..getFeaturedExercises(),
        ),
      ],
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: const [
                  SizedBox(height: 10),
                  HomeAppBar(),
                  FeaturedProtocolsCarousel(),
                  CategoriesList(),
                  AiCoachPromotion(),
                  ExercisesGrid(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

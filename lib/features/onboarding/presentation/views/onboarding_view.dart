import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:k_rehab/core/constants/asset_paths.dart';
import 'package:k_rehab/core/router/app_router.dart';
import 'package:k_rehab/core/theme/app_colors.dart';
import 'package:k_rehab/features/onboarding/data/onboarding_pages_data.dart';
import 'package:k_rehab/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:k_rehab/features/onboarding/presentation/widgets/onboarding_button.dart';
import 'package:k_rehab/features/onboarding/presentation/widgets/onboarding_page_content.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OnboardingCubit, OnboardingState>(
      listener: (context, state) {
        if (state is OnboardingCompleted) {
          context.go(AppRouter.login);
        } else if (state is OnboardingPageUpdated) {
          _pageController.animateToPage(
            state.currentIndex,
            duration: const Duration(milliseconds: 400),
            curve: Curves.ease,
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: BlocBuilder<OnboardingCubit, OnboardingState>(
            builder: (context, state) {
              final currentIndex = context.read<OnboardingCubit>().currentIndex;
              final isLastPage = currentIndex == kOnboardingPages.length - 1;

              return Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: PageView.builder(
                          controller: _pageController,
                          onPageChanged: (index) {
                            context
                                .read<OnboardingCubit>()
                                .onPageChanged(index);
                          },
                          itemCount: kOnboardingPages.length,
                          itemBuilder: (_, index) => OnboardingPageContent(
                            page: kOnboardingPages[index],
                          ),
                        ),
                      ),
                      SmoothPageIndicator(
                        controller: _pageController,
                        count: kOnboardingPages.length,
                        effect: ExpandingDotsEffect(
                          activeDotColor: AppColors.primary,
                          dotColor: AppColors.primary.withValues(alpha: 0.25),
                          dotHeight: 8,
                          dotWidth: 8,
                          expansionFactor: 3,
                        ),
                      ),
                      const SizedBox(height: 32),
                      OnboardingButton(
                        imagePath: isLastPage ? null : AssetPaths.arrowIcon,
                        text: isLastPage ? 'Get Started' : 'Next',
                        onPressed: () =>
                            context.read<OnboardingCubit>().nextPage(),
                      ).animate().scale(
                            duration: 300.ms,
                            curve: Curves.easeOut,
                          ),
                      const SizedBox(height: 24),
                    ],
                  ),
                  if (currentIndex > 0)
                    Positioned(
                      top: 8,
                      left: 8,
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          color: AppColors.primary,
                          size: 20,
                        ),
                        onPressed: () =>
                            context.read<OnboardingCubit>().previousPage(),
                      )
                          .animate()
                          .fadeIn(duration: 250.ms)
                          .slideX(begin: -0.3, curve: Curves.easeOut),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

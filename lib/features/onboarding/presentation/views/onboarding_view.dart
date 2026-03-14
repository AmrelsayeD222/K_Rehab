import 'package:flutter/material.dart';
import 'package:k_rehab/core/constants/asset_paths.dart';
import 'package:k_rehab/core/theme/app_colors.dart';
import 'package:k_rehab/features/onboarding/data/onboarding_pages_data.dart';
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
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_onPageChanged);
  }

  void _onPageChanged() {
    final page = _pageController.page?.round() ?? 0;
    if (page != _currentPage) {
      setState(() => _currentPage = page);
    }
  }

  @override
  void dispose() {
    _pageController.removeListener(_onPageChanged);
    _pageController.dispose();
    super.dispose();
  }

  void _handleButtonPress() {
    if (_currentPage < kOnboardingPages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    final isLastPage = _currentPage == kOnboardingPages.length - 1;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: kOnboardingPages.length,
                itemBuilder: (_, index) =>
                    OnboardingPageContent(page: kOnboardingPages[index]),
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
              onPressed: _handleButtonPress,
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

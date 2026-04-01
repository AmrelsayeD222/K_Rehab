import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:k_rehab/core/constants/asset_paths.dart';
import 'package:k_rehab/core/theme/app_colors.dart';
import 'package:k_rehab/features/aiCoach/ai_coach_view.dart';
import 'package:k_rehab/features/exercises/exercises_view.dart';
import 'package:k_rehab/features/home/views/home_view.dart';
import 'package:k_rehab/features/profile/views/profile_view.dart';
import 'package:k_rehab/features/protocols/protocols_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  MainViewState createState() => MainViewState();
}

class MainViewState extends State<MainView> {
  final PageController _pageController = PageController();
  final List<Widget> views = [
    const HomeView(),
    const ExercisesView(),
    const ProtocolsView(),
    const AiCoachView(),
    const ProfileView(),
  ];

  int currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        children: views,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 350),
              curve: Curves.easeOutCubic,
            );
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.cardBackground,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.textSecondary.withValues(alpha: 0.5),
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              activeIcon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AssetPaths.exercisesIcon,
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(
                  currentIndex == 1
                      ? AppColors.primary
                      : AppColors.textSecondary.withValues(alpha: 0.5),
                  BlendMode.srcIn,
                ),
              ),
              label: 'Exercises',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AssetPaths.protocolsIcon,
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(
                  currentIndex == 2
                      ? AppColors.primary
                      : AppColors.textSecondary.withValues(alpha: 0.5),
                  BlendMode.srcIn,
                ),
              ),
              label: 'Protocols',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AssetPaths.aiCoachIcon,
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(
                  currentIndex == 3
                      ? AppColors.primary
                      : AppColors.textSecondary.withValues(alpha: 0.5),
                  BlendMode.srcIn,
                ),
              ),
              label: 'AI Coach',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              activeIcon: Icon(Icons.person_rounded),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

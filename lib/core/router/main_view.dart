import 'package:k_rehab/core/widgets/double_back_exit_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:k_rehab/core/constants/asset_paths.dart';
import 'package:k_rehab/core/di/service_locator.dart';
import 'package:k_rehab/core/manager/navigation_cubit.dart';
import 'package:k_rehab/features/aiCoach/ai_coach_view.dart';
import 'package:k_rehab/features/exercises/presentation/views/exercises_view.dart';
import 'package:k_rehab/features/home/presentation/views/home_view.dart';
import 'package:k_rehab/features/profile/presentation/manager/profile_cubit.dart';
import 'package:k_rehab/features/profile/presentation/views/profile_view.dart';
import 'package:k_rehab/features/protocols/presentation/views/protocols_view.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<NavigationCubit>()),
        BlocProvider(
          create: (_) => getIt<ProfileCubit>()..getUserData(),
        ),
      ],
      child: const _MainViewContent(),
    );
  }
}

class _MainViewContent extends StatelessWidget {
  const _MainViewContent();

  static const List<Widget> _views = [
    HomeView(),
    ExercisesView(),
    ProtocolsView(),
    AiCoachView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, int>(
      builder: (context, currentIndex) {
        return DoubleBackExitWrapper(
          currentIndex: currentIndex,
          onBackToHome: () => context.read<NavigationCubit>().changeTab(0),
          child: Scaffold(
            body: IndexedStack(
              index: currentIndex,
              children: _views,
            ),
            bottomNavigationBar: _MainBottomNavBar(
              currentIndex: currentIndex,
            ),
          ),
        );
      },
    );
  }
}

class _MainBottomNavBar extends StatelessWidget {
  final int currentIndex;

  const _MainBottomNavBar({required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          context.read<NavigationCubit>().changeTab(index);
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).cardColor,
        selectedItemColor: colors.primary,
        unselectedItemColor: colors.onSurfaceVariant.withValues(alpha: 0.5),
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
                    ? colors.primary
                    : colors.onSurfaceVariant.withValues(alpha: 0.5),
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
                    ? colors.primary
                    : colors.onSurfaceVariant.withValues(alpha: 0.5),
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
                    ? colors.primary
                    : colors.onSurfaceVariant.withValues(alpha: 0.5),
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
    );
  }
}

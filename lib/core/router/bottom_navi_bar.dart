import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:k_rehab/core/constants/asset_paths.dart';
import 'package:k_rehab/core/router/navigation_cubit.dart';

class BottomNaviBar extends StatelessWidget {
  final int currentIndex;

  const BottomNaviBar({required this.currentIndex, super.key});

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
            label: 'Recovery Coach',
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

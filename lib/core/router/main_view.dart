import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:k_rehab/core/di/service_locator.dart';
import 'package:k_rehab/core/router/bottom_navi_bar.dart';
import 'package:k_rehab/core/router/navigation_cubit.dart';
import 'package:k_rehab/core/widgets/double_back_exit_wrapper.dart';
import 'package:k_rehab/features/exercises/presentation/views/exercises_view.dart';
import 'package:k_rehab/features/home/presentation/views/home_view.dart';
import 'package:k_rehab/features/profile/presentation/manager/profile_cubit.dart';
import 'package:k_rehab/features/profile/presentation/views/profile_view.dart';
import 'package:k_rehab/features/protocols/presentation/views/protocols_view.dart';
import 'package:k_rehab/features/recoveryCoach/presentation/views/recovery_coach_view.dart';

class MainView extends StatelessWidget {
  final int initialIndex;
  const MainView({super.key, this.initialIndex = 0});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<NavigationCubit>()..changeTab(initialIndex)),
        BlocProvider.value(value: getIt<ProfileCubit>()..getUserData()),
      ],
      child: const MainViewBody(),
    );
  }
}

class MainViewBody extends StatelessWidget {
  const MainViewBody({super.key});

  static const List<Widget> _views = [
    HomeView(),
    ExercisesView(),
    ProtocolsView(),
    RecoveryCoachView(),
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
            body: IndexedStack(index: currentIndex, children: _views),
            bottomNavigationBar: BottomNaviBar(currentIndex: currentIndex),
          ),
        );
      },
    );
  }
}

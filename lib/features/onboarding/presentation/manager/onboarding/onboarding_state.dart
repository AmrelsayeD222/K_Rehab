part of 'onboarding_cubit.dart';

abstract class OnboardingState {
  const OnboardingState();
}

class OnboardingInitial extends OnboardingState {
  final bool isAgreed;
  const OnboardingInitial({this.isAgreed = false});
}

class OnboardingPageUpdated extends OnboardingState {
  const OnboardingPageUpdated(this.currentIndex);
  final int currentIndex;
}

class OnboardingCompleted extends OnboardingState {
  const OnboardingCompleted();
}

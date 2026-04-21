part of 'onboarding_cubit.dart';

abstract class OnboardingState {
  const OnboardingState();
}

class OnboardingPageUpdated extends OnboardingState {
  const OnboardingPageUpdated(this.currentIndex);

  final int currentIndex;
}

class OnboardingCompleted extends OnboardingState {
  const OnboardingCompleted();
}

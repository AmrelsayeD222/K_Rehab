import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k_rehab/core/services/cache_helper.dart';
import 'package:k_rehab/features/onboarding/data/onboarding_pages_data.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(const OnboardingInitial());

  bool _isAgreed = false;
  bool get isAgreed => _isAgreed;

  void toggleAgreed(bool? value) {
    if (isClosed) return;
    _isAgreed = value ?? false;
    emit(OnboardingInitial(isAgreed: _isAgreed));
  }

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void onPageChanged(int index) {
    if (isClosed) return;
    _currentIndex = index;
    emit(OnboardingPageUpdated(_currentIndex));
  }

  void nextPage() {
    if (isClosed) return;
    if (_currentIndex < kOnboardingPages.length - 1) {
      _currentIndex++;
      emit(OnboardingPageUpdated(_currentIndex));
    } else {
      CacheHelper.saveData(key: 'isOnboardingVisited', value: true);
      emit(const OnboardingCompleted());
    }
  }

  void previousPage() {
    if (isClosed) return;
    if (_currentIndex > 0) {
      _currentIndex--;
      emit(OnboardingPageUpdated(_currentIndex));
    }
  }
}

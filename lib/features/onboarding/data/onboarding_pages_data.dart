import 'package:k_rehab/core/constants/asset_paths.dart';
import 'package:k_rehab/features/onboarding/domain/entities/onboarding_page_model.dart';

const List<OnboardingPageModel> kOnboardingPages = [
  OnboardingPageModel(
    imagePath: AssetPaths.recoveryProtocolImage,
    title: 'Structured Recovery\nProtocols',
    subtitle:
        'Follow clinically reviewed physiotherapy\nprograms designed for your specific\ninjury — phase by phase, session by\nsession.',
    features: [
      OnboardingFeatureItem(
        padding: 2,
        iconPath: AssetPaths.multiPhaseRehabIcon,
        title: 'Multi-phase rehabilitation plans',
      ),
      OnboardingFeatureItem(
        padding: 2,
        iconPath: AssetPaths.clinicalReviewedIcon,
        title: 'Clinically reviewed by certified therapists',
      ),
      OnboardingFeatureItem(
        padding: 2,
        iconPath: AssetPaths.trackProgressIcon,
        title: 'Track progress phase by phase',
      ),
    ],
  ),
  OnboardingPageModel(
    imagePath: AssetPaths.therapeuticExerciseImage,
    title: '500+ Therapeutic\nExercises',
    subtitle:
        'Step-by-step guided exercises with video\ndemonstrations, rep counters, and built-in\ntimers to ensure correct form and\nrecovery.',
    features: [
      OnboardingFeatureItem(
        padding: 10,
        iconPath: AssetPaths.videoGuidedIcon,
        title: 'Video-guided exercise demonstrations',
      ),
      OnboardingFeatureItem(
        padding: 10,
        iconPath: AssetPaths.repCounterIcon,
        title: 'Built-in rep counter and rest timer',
      ),
      OnboardingFeatureItem(
        padding: 10,
        iconPath: AssetPaths.safetyNotesIcon,
        title: 'Safety notes for every exercise',
      ),
    ],
  ),
  OnboardingPageModel(
    imagePath: AssetPaths.aiPhysioImage,
    title: 'Your Personal\nAI Recovery Physio',
    subtitle:
        'Ask anything about your recovery. Get\npersonalized tips, exercise guidance, and\ndaily reminders — powered by AI.',
    features: [
      OnboardingFeatureItem(
        padding: 8,
        iconPath: AssetPaths.askIcon,
        title: 'Ask physiotherapy questions anytime',
      ),
      OnboardingFeatureItem(
        padding: 8,
        iconPath: AssetPaths.recoveryTipsIcon,
        title: 'Daily personalized recovery tips',
      ),
      OnboardingFeatureItem(
        padding: 8,
        iconPath: AssetPaths.adaptivePlanIcon,
        title: 'Adaptive plan suggestions based on progress',
      ),
    ],
  ),
];

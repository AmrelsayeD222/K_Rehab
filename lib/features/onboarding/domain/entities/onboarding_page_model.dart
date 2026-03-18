class OnboardingPageModel {
  const OnboardingPageModel({
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.features,
  });

  final String imagePath;
  final String title;
  final String subtitle;
  final List<OnboardingFeatureItem> features;
}

class OnboardingFeatureItem {
  const OnboardingFeatureItem({
    required this.iconPath,
    required this.title,
    required this.padding,
  });

  final String iconPath;
  final String title;
  final double padding;
}

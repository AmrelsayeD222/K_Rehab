enum AppEnvironment { dev, production }

class EnvironmentConfig {
  static late final AppEnvironment environment;

  static bool get isDev => environment == AppEnvironment.dev;
}

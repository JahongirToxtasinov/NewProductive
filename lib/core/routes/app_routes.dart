import 'package:flutter/material.dart';


import '../../constants/routes.dart';
import '../../features/home/presentation/home_screen.dart';
import '../functions/app_functions.dart';
import '../pages/error.dart';
import '../pages/onboarding.dart';
import '../pages/splash.dart';

class AppRouter {
  static Route<dynamic> router(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return fade(const HomeScreen());
      case AppRoutes.home:
        return fade(const HomeScreen());
      case AppRoutes.onboarding:
        return fade(const OnboardingScreen());
      default:
        return fade(const ErrorScreen());
    }
  }
}

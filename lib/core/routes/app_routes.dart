import 'package:flutter/material.dart';
import 'package:new_productive/features/login/presentation/forgon_password/forgot_password.dart';
import 'package:new_productive/features/login/presentation/login_screen.dart';
import 'package:new_productive/features/login/presentation/verification/verification_page.dart';


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
        return fade(const SplashScreen());
      case AppRoutes.home:
        return fade(const HomeScreen());
      case AppRoutes.onboarding:
        return fade(const OnboardingScreen());
      case AppRoutes.loginScreen:
        return fade(const LoginScreen());
      case AppRoutes.forgotPassword:
        return fade(const ForgotPasswordPage());
      case AppRoutes.verificationPage:
        return fade(const VerificationPage());      
      default:
        return fade(const ErrorScreen());
    }
  }
}

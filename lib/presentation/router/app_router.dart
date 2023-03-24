import 'package:flutter/material.dart';
import 'package:seminar/presentation/screens/home_screen/home_screen.dart';
import 'package:seminar/presentation/screens/onboarding_screen/onboarding_screen.dart';

class AppRouter {
  static Route? onGeneratedRoutes(RouteSettings settings) {
    switch (settings.name) {
      case "/home":
        return MaterialPageRoute(
          builder: (context) {
            return const HomeScreen();
          },
        );
      case "/onboarding":
        return MaterialPageRoute(
          builder: (context) {
            return const OnboardingScreen();
          },
        );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seminar/logic/cubits/auth_cubit.dart';
import 'package:seminar/presentation/screens/home_screen/home_screen.dart';
import 'package:seminar/presentation/screens/onboarding_screen/onboarding_screen.dart';

class AppRouter {
  static Route? onGeneratedRoutes(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (context) {
            return BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                if (state is AuthFirstLaunch) {
                  print("donboarding");
                  return const OnboardingScreen();
                } else if (state is AuthProgress) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                print("not");
                return const HomeScreen();
              },
            );
          },
        );
    }
    return null;
  }
}

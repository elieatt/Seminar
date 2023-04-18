import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seminar/logic/cubits/auth_cubit.dart';
import 'package:seminar/presentation/screens/auth_screen/auth_screen.dart';
import 'package:seminar/presentation/screens/main_screen/main_screen.dart';
import 'package:seminar/presentation/screens/onboarding_screen/onboarding_screen.dart';

class AppRouter {
  static Route? onGeneratedRoutes(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (context) {
            return BlocBuilder<AuthCubit, AuthState>(
              buildWhen: (previous, current) {
                return current is! AuthProgress;
              },
              builder: (context, state) {
                print("state is " + state.toString() + "built");
                if (state is AuthFirstLaunch) {
                  print("donboarding");
                  return const OnboardingScreen();
                } else if (state is AuthLoginedIn) {
                  return const HomeScreen();
                }

                return const AuthScreen();
              },
            );
          },
        );
    }
    return null;
  }
}

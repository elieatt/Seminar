import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seminar/data/network_services/auth_ns.dart';
import 'package:seminar/data/repositories/auth_repository.dart';
import 'package:seminar/logic/cubits/auth_cubit.dart';
import 'package:seminar/presentation/router/app_router.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  final AuthRepository repo = AuthRepository(AuthNS());

  runApp(MyApp(
    repo: repo,
  ));
}

class MyApp extends StatelessWidget {
  final AuthRepository repo;
  const MyApp({super.key, required this.repo});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (context) => AuthCubit(repo),
      child: MaterialApp(
        title: 'Seminar',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.lightBlue,
          ).copyWith(
            secondary: Colors.amber.shade500,
          ),
        ),
        onGenerateRoute: AppRouter.onGeneratedRoutes,
      ),
    );
  }
}

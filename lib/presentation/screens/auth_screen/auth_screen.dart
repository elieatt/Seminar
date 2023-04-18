import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/svg.dart';
import 'package:seminar/logic/cubits/auth_cubit.dart';
import 'package:seminar/presentation/screens/auth_screen/auth_form.dart';
import 'package:seminar/presentation/utlis/awesome_alert.dart';

import '../../../constants/enums.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with TickerProviderStateMixin {
  late AuthMode _authMode = AuthMode.login;

  late AnimationController _animationController;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _animationController.forward();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);

    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    _animationController.dispose();
    super.dispose();
  }

  void _changeAuthMode() {
    _animationController.reverse();
    setState(() {
      _authMode =
          _authMode == AuthMode.login ? AuthMode.siginup : AuthMode.login;
    });
    Timer(const Duration(milliseconds: 200), () {
      _animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthFailed) {
          Alert.showAlert(context, "Login Failed", state.failureMessage, "OK",
              DialogType.error);
        }
      },
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: SvgPicture.asset(
              "assets/auth_screen_backgound.svg",
              fit: BoxFit.fill,
            ),
          ),
          Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 25.0),
                  child: Text(
                    "Seminar",
                    style: TextStyle(
                        fontSize: 70.0,
                        fontFamily: "Pacifico",
                        color: Colors.lightBlue),
                  ),
                ),
                const SizedBox(
                  height: 50.0,
                ),
                ScaleTransition(
                  scale: CurvedAnimation(
                      parent: _animationController,
                      curve: const Interval(0.0, 1.0, curve: Curves.easeIn)),
                  child: Text(
                    _authMode == AuthMode.login ? "LOGIN" : "SIGNUP",
                    style: TextStyle(
                      color: Colors.amber.shade300,
                      fontSize: 45.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                AuthForm(authMode: _authMode),
                TextButton(
                    onPressed: _changeAuthMode,
                    child: Text(_authMode == AuthMode.siginup
                        ? "Change to Login"
                        : "Change to Sgin up"))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

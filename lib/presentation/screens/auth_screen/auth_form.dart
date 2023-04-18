import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seminar/logic/cubits/auth_cubit.dart';

import '../../../constants/enums.dart';
import 'custom_form_field.dart';

class AuthForm extends StatefulWidget {
  final AuthMode authMode;
  const AuthForm({super.key, required this.authMode});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController _IDController, _paswwordController;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _IDController = TextEditingController();
    _paswwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  String? IDFieldValidator(String? input) {
    if (input == null ||
        input.isEmpty ||
        input.length < 2 ||
        input.length > 5) {
      /*   _scrollController.animateTo(2.0,
          duration: Duration(seconds: 1), curve: Curves.easeIn); */
      return "ID number must be of length between 2 and 5";
    }
    return null;
  }

  String? passwordFieldValidator(String? input) {
    if (input == null || input.length < 5 || input.length > 30) {
      return "Password must be +5 chars";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: ListView(
            children: [
              CustomFormField(
                controller: _IDController,
                hintText: "ID number",
                validator: IDFieldValidator,
                inputType: TextInputType.number,
              ),
              const SizedBox(
                height: 20.0,
              ),
              CustomFormField(
                controller: _paswwordController,
                inputType: TextInputType.visiblePassword,
                obscureText: true,
                hintText: "Password",
                validator: passwordFieldValidator,
              ),
              const SizedBox(
                height: 25.0,
              ),
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  if (state is AuthProgress) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.amber.shade400,
                      ),
                    );
                  }
                  return ElevatedButton(
                    onPressed: () {
                      _formKey.currentState!.validate();
                      print(_IDController.text +
                          "  is " +
                          _paswwordController.text);
                      BlocProvider.of<AuthCubit>(context)
                          .login(_IDController.text, _paswwordController.text);
                    },
                    child: Text(widget.authMode == AuthMode.siginup
                        ? "Sign up"
                        : "Login"),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

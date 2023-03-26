import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seminar/logic/cubits/auth_cubit.dart';

class ScreenContent extends StatelessWidget {
  const ScreenContent(
      {super.key,
      required this.color,
      required this.urlImage,
      required this.title,
      required this.subtitle,
      required this.lastScreen});
  final Color color;
  final String urlImage;
  final String title;
  final String subtitle;
  final bool lastScreen;
  void getStarted(BuildContext context) async {
    await BlocProvider.of<AuthCubit>(context).tutroialPassed();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(top: 60.0),
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                urlImage,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 64,
              ),
              Text(
                title,
                style: const TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Text(subtitle),
              ),
              lastScreen
                  ? const SizedBox(
                      height: 20.0,
                    )
                  : Container(),
              lastScreen
                  ? ElevatedButton(
                      onPressed: () => {getStarted(context)},
                      child: const Text("Get Started"),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}

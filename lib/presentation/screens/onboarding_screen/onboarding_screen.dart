import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import './widgets.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return OnboardingScreenState();
  }
}

class OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _controller;
  @override
  void initState() {
    _controller = PageController();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        SizedBox(
          width: double.infinity,
          child:
              /*  SvgPicture.asset("assets/background.svg", width: double.infinity), */
              SvgPicture.asset(
            "assets/background.svg",
            fit: BoxFit.fill,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: PageView(
                  controller: _controller,
                  children: const [
                    ScreenContent(
                      color: Colors.white,
                      subtitle: "ewsdasdasdsadasdasdad",
                      title: "dasd",
                      urlImage: "assets/first.png",
                      lastScreen: false,
                    ),
                    ScreenContent(
                      color: Colors.white,
                      subtitle: "ewsdasdasdsadasdasdad",
                      title: "dasd",
                      urlImage: "assets/second.png",
                      lastScreen: false,
                    ),
                    ScreenContent(
                      color: Colors.white,
                      subtitle: "ewsdasdasdsadasdasdad",
                      title: "dasd",
                      urlImage: "assets/third.png",
                      lastScreen: true,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 80.0,
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: const WormEffect(
                    dotColor: Color.fromRGBO(255, 199, 0, 1),
                    activeDotColor: Color.fromRGBO(151, 189, 245, 1),
                  ),
                  onDotClicked: (index) => _controller.animateToPage(index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

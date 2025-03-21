import 'package:expensify/helper/app_route.dart';
import 'package:expensify/widget/app_name.dart';
import 'package:flutter/material.dart';

class StartupView extends StatefulWidget {
  const StartupView({super.key});

  @override
  State<StartupView> createState() => _StartupViewState();
}

class _StartupViewState extends State<StartupView>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..forward();
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceOut);
    goToWelcomePage();
  }

  void goToWelcomePage() async {
    await Future.delayed(const Duration(seconds: 4));
    welcomePage();
  }

  void welcomePage() {
    Navigator.pushReplacementNamed(context, AppRoute.ON_BOARDING_SCREEN);
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/img/splash_bg.png',
            width: media.width,
            height: media.height,
            fit: BoxFit.cover,
          ),
          ScaleTransition(
            scale: animation,
            child: Image.asset(
              'assets/img/coins.png',
              width: media.width * 0.7,
              height: media.height * 0.7,
              fit: BoxFit.contain,
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 300.0), child: AppName()),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';

import 'taps_screens.dart';


class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.fadeIn(
      backgroundImage: Image.asset("assets/images/splash.png"),
        backgroundColor:  const Color(0xffFECE52) ,
        onInit: () {
          debugPrint("On Init");
        },
        onEnd: () {
          debugPrint("On End");
        },
        childWidget:  Image.asset("assets/images/splash.png"),
        onAnimationEnd: () => debugPrint("On Fade In End"),
        nextScreen:  const TapsViews(),
      );
  }
}
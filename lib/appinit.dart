import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:example/page_operator.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:lottie/lottie.dart';

import 'login_screen.dart';

class AppInit extends StatefulWidget {
  const AppInit({super.key});

  @override
  State<AppInit> createState() => _AppInitState();
}

class _AppInitState extends State<AppInit> {
  String audioasset = "sounds/magical_light.wav";

  @override
  void initState() {
    super.initState();
    openAudio();
  }

  Future openAudio() async {
    await AudioPlayer.global.changeLogLevel(LogLevel.info);
    var player = AudioPlayer();
    await player.play(AssetSource(audioasset));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Container(
        //   height: 40,
        //   child: Padding(
        //     padding: const EdgeInsets.only(top: 200.0),
        //     child: Image(image: AssetImage('assets/png/sofito.png')),
        //   ),
        // ),
        AnimatedSplashScreen.withScreenFunction(
          splash: "assets/png/kalorien.png",
          backgroundColor: Colors.white,
          screenFunction: () async {
            await openAudio();
            // await player.dispose();
            return const LoginScreen();
          },
          curve: Curves.ease,
          splashIconSize: 60,
          duration: 3000,
          splashTransition: SplashTransition.fadeTransition,
          pageTransitionType: PageTransitionType.rightToLeft,
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: 25,
            right: 25,
          ),
          child: Center(
            child: Lottie.asset(
              'assets/json/fruit_beat_3.json',
              width: 300,
              height: 300,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}

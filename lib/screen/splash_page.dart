import 'dart:async';

import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:submission_dicoding/screen/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ShowUpAnimation(
            delayStart: const Duration(seconds: 0),
            animationDuration: const Duration(seconds: 3),
            curve: Curves.elasticInOut,
            direction: Direction.vertical,
            offset: 0.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/image/pokeball.png',
                  scale: 15,
                ),
                const SizedBox(width: 5),
                Image.asset(
                  'assets/image/pokemon.png',
                  scale: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

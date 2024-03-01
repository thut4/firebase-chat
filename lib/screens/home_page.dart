import 'package:barry_allan/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../widgets/roudn_btn.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Hero(
                tag: 'logo',
                child: SizedBox(
                  height: 60,
                  child: Image.asset('image/logo.png'),
                ),
              ),
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Flash Chat',
                    textStyle: const TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
                totalRepeatCount: 4,
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RoundButton(
                onTap: () {
                  Get.toNamed('/login');
                },
                text: 'Login',
                color: AppColor.lightBlue),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RoundButton(
                onTap: () {
                  Get.toNamed('/register');
                },
                text: 'Register',
                color: AppColor.darkBlue),
          ),
        ],
      ),
    )));
  }
}

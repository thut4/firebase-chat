import 'package:barry_allan/routes/app_routes.dart';
import 'package:barry_allan/screens/auth/login.dart';
import 'package:barry_allan/screens/auth/register.dart';
import 'package:barry_allan/screens/chat.dart';
import 'package:barry_allan/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.HOME,
        page: () => const HomePage(),
        transition: Transition.fade,
        curve: Curves.fastLinearToSlowEaseIn),
    GetPage(
        name: Routes.CHAT,
        page: () => const ChatScreen(),
        transition: Transition.fadeIn,
        curve: Curves.bounceInOut),
    GetPage(
        name: Routes.LOGIN,
        page: () => const LoginPage(),
        transition: Transition.cupertino,
        curve: Curves.easeInCirc),
    GetPage(
        name: Routes.REGISTER,
        page: () => const RegisterPage(),
        transition: Transition.cupertino,
        curve: Curves.easeIn),
  ];
}

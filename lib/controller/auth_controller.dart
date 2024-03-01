import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final _auth = FirebaseAuth.instance;
  String? email;
  String? password;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  TextEditingController get userNameController => _usernameController;
  TextEditingController get passwordController => _passwordController;
  FirebaseAuth get auth => _auth;

  void loginWithEmail() async {
    try {
      final user = await auth.signInWithEmailAndPassword(
          email: email!, password: password!);
      print(user);
      Get.toNamed('/chat');
      userNameController.clear();
      passwordController.clear();
    } catch (e) {
      print(e.toString());
      showLoginErrorSnackbar();
    }
  }

  void registerWithEmail() async {
    try {
      if (password!.length < 6) {
        showPasswordLengthErrorSnackbar();
        return;
      }
      final user = await auth.createUserWithEmailAndPassword(
          email: email!, password: password!);
      print(user);
      // Get.to(() => const ChatScreen());
      Get.toNamed('/chat');
      userNameController.clear();
      passwordController.clear();
    } on Exception catch (e) {
      print(
        e.toString(),
      );
      showLoginErrorSnackbar();
    }
  }

  void logOut() async {
    auth.signOut();
    Get.back();
  }

  void showLoginErrorSnackbar() {
    Get.snackbar(
      'Login Error',
      'Invalid email or password. Please try again.',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
      animationDuration: const Duration(milliseconds: 500),
    );
  }

  void showPasswordLengthErrorSnackbar() {
    Get.snackbar(
      'Password Error',
      'Password must be at least 6 characters long.',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
      animationDuration: Duration(milliseconds: 500),
    );
  }
}

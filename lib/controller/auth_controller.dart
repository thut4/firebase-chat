import 'package:barry_allan/constant/app_color.dart';
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
  // Rx<User?> user = Rx<User?>(null);
  @override
  void onInit() {
    super.onInit();
    // user.bindStream(_auth.authStateChanges());
  }

  void loginWithEmail() async {
    try {
      final user = await auth.signInWithEmailAndPassword(
          email: email!, password: password!);
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
      if (!isPasswordValid(password!)) {
        showPasswordErrorSnackbar();
        return;
      }
      final userCredential = await auth.createUserWithEmailAndPassword(
          email: email!, password: password!);
      if (userCredential.user != null) {
        Get.toNamed('/chat');
        userNameController.clear();
        passwordController.clear();
      } else {
        showRegistrationErrorSnackbar();
      }
      // await user.user!.sendEmailVerification();
      // showVerificationEmailSentSnackbar();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        showEmailAlreadyInUseSnackbar();
      } else {
        print('FirebaseAuthException: ${e.code}');
        showRegistrationErrorSnackbar();
      }
    } on Exception catch (e) {
      print('Exception $e');
      showRegistrationErrorSnackbar();
    }
  }

  void showEmailAlreadyInUseSnackbar() {
    Get.snackbar(
      'Registeration Error',
      'Email is already in use. Please choose a different email.',
      snackPosition: SnackPosition.TOP,
      backgroundColor: AppColor.redColor,
      colorText: AppColor.whiteColor,
      duration: const Duration(seconds: 3),
      animationDuration: const Duration(milliseconds: 500),
    );
  }

  void logOut() {
    auth.signOut();
    Get.back();
    userNameController.clear();
    passwordController.clear();
  }

  void showLoginErrorSnackbar() {
    Get.snackbar(
      'Login Error',
      'Invalid email or password. Please try again.',
      snackPosition: SnackPosition.TOP,
      backgroundColor: AppColor.redColor,
      colorText: AppColor.whiteColor,
      duration: const Duration(seconds: 3),
      animationDuration: const Duration(milliseconds: 500),
    );
  }

  void showPasswordErrorSnackbar() {
    Get.snackbar(
      'Password Error',
      'Password must be at least 6 characters long and contain at least one uppercase letter.',
      snackPosition: SnackPosition.TOP,
      backgroundColor: AppColor.redColor,
      colorText: AppColor.whiteColor,
      duration: const Duration(seconds: 3),
      animationDuration: const Duration(milliseconds: 500),
    );
  }

  bool isPasswordValid(String value) {
    return value.length >= 6 && value.contains(RegExp(r'[A-Z]'));
  }

  void showVerificationEmailSentSnackbar() {
    Get.snackbar(
      'Registration Successful',
      'A verification email has been sent. Please check your inbox to complete the registration process.',
      snackPosition: SnackPosition.TOP,
      backgroundColor: AppColor.mintGreen,
      colorText: AppColor.whiteColor,
      duration: const Duration(seconds: 5),
      animationDuration: const Duration(milliseconds: 500),
    );
  }

  void showRegistrationErrorSnackbar() {
    Get.snackbar(
      'Registration Error',
      'An error occurred during registration. Please try again.',
      snackPosition: SnackPosition.TOP,
      backgroundColor: AppColor.redColor,
      colorText: AppColor.whiteColor,
      duration: const Duration(seconds: 3),
      animationDuration: const Duration(milliseconds: 500),
    );
  }

  bool get isEmailVerified {
    return auth.currentUser?.emailVerified ?? false;
  }

  void handleAccess() {
    if (isEmailVerified) {
      Get.toNamed('/chat');
    } else {
      Get.defaultDialog(
        title: 'Email Verification',
        content: Center(
          child: Column(
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 10),
              Text('Waiting for email verification...'),
            ],
          ),
        ),
      );
    }
  }
}

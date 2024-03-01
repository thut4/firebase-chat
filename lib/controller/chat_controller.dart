import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;
  final TextEditingController _messageTextController = TextEditingController();
  User? loggedUser;
  String? messageText;
  FirebaseAuth get auth => _auth;
  FirebaseFirestore get fireStore => _fireStore;
  TextEditingController get messageTextController => _messageTextController;
  @override
  void onInit() {
    super.onInit();
    getCurrenUser();
  }

  void getCurrenUser() async {
    try {
      final user = auth.currentUser;
      if (user != null) {
        loggedUser = user;
        print("this is the login ---> ${loggedUser!.email}");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void sendMessage() {
    messageTextController.clear();
    fireStore
        .collection('message')
        .add({'text': messageText, 'sender': loggedUser!.email});
  }
}

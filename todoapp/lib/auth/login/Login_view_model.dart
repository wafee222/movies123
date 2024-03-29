import 'package:flutter/cupertino.dart';

import 'Login_Navigator.dart';

class LoginScreenViewModel extends ChangeNotifier {
  late LoginNavigator navigator;

  void login(String email, String password) async {
    navigator.showMyLoading();

    try {
      // Simulate login process
      await Future.delayed(Duration(seconds: 2));

      // Here you can perform actual login using FirebaseAuth or any other method
      // For demonstration purposes, I'm just printing the email
      print('Logged in with email: $email');

      navigator.hideMyLoading();
      navigator.showMyMessage('Login Successful');
    } catch (e) {
      navigator.hideMyLoading();
      navigator.showMyMessage('Error: $e');
    }
  }
}
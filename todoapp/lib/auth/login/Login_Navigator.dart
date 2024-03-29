import 'package:flutter/cupertino.dart';
import 'package:todoapp/DialogUtls.dart';

abstract class LoginNavigator {
  void showMyLoading();
  void hideMyLoading();
  void showMyMessage(String message);
}

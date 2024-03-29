import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:todoapp/auth/registration/Register_navigator.dart';

class RegisterScreenViewModel  extends ChangeNotifier{
 late RegisterNavigator navigator ;

  void register(String email , String password)async{
   navigator.showMyLoading();

    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

     navigator.hideMyLoading();
     navigator.showMyMessage('Register Successfully');
      print(credential.user?.uid ?? '');
    } on FirebaseAuthException catch (e) {
      String errorMessage = '';
      String title = 'Error';
      String? errorCode = e.code;
      switch (errorCode) {
        case 'weak-password':
          navigator.hideMyLoading();
          navigator.showMyMessage('The password provided is too weak');
          break;
        case 'email-already-in-use':
          navigator.hideMyLoading();
          navigator.showMyMessage('The account already exists for that email.');
          break;
        default:
          navigator.hideMyLoading();
          navigator.showMyMessage('Register Successfully');
      }
      print(errorMessage);
    } catch (e) {
      navigator.hideMyLoading();
      navigator.showMyMessage('${e.toString()}');
      print(e);
    }
  }
}
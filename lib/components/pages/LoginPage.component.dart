import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
// Store
import 'package:newrock/models/root.model.dart';


class LoginPage extends StatelessWidget {

  Future<String> _authUser(LoginData data) async {
    print('Name: ${data.name}, Password: ${data.password}');
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: data.name, // "admin@i.ua",
          password: data.password // "121314"
      );
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      }
    }
  }

  Future<String> _recoverPassword(String name) {
    print('Name: $name');
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'Welcome',
      logo: 'assets/images/rock_orange.png',
      onLogin: _authUser,
      onSignup: _authUser,
      onSubmitAnimationCompleted: () {
        print('onSubmitAnimationCompleted!');
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
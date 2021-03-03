import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthModel {

  var isAuth = false.obs;

  void logIn(user) {
    isAuth.value = true;
  }

  void logOut() async {
    await FirebaseAuth.instance.signOut();
    isAuth.value = false;
  }
}


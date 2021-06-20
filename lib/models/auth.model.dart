import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthModel {

    RxBool isAuth = false.obs;
    RxMap<dynamic, dynamic> users = {}.obs;

    void logIn(User firebaseUser) {
        users.assignAll({ "user": firebaseUser });
        isAuth.value = true;
    }

    void logOut() async {
      await FirebaseAuth.instance.signOut();
      isAuth.value = false;
    }
}


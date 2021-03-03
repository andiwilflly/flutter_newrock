import 'package:get/get.dart';


class RootModel {

  var user = 0.obs;
  var count = 0.obs;

  void increment() {
    count++;
  }

  void logIn() {
    user.value = 1;
  }
}


final rootModel = RootModel();


import 'package:get/get.dart';


class RootModel {

  var count = 0.obs;

  void increment() {
    count++;
  }
}


final rootModel = RootModel();


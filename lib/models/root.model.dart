import 'package:get/get.dart';
// Models
import 'package:newrock/models/auth.model.dart';


class RootModel {

  final auth = AuthModel();

  var count = 0.obs;

  void increment() {
    count++;
  }
}


final store = RootModel();


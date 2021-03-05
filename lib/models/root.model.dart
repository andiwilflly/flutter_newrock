import 'package:get/get.dart';
// Models
import 'package:newrock/models/auth.model.dart';
import 'package:newrock/models/router.model.dart';


class RootModel {

  final auth = AuthModel();
  final router = RouterModel();
}


final store = RootModel();

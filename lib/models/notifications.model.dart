import 'package:get/get.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
// Models
import 'package:newrock/models/root.model.dart';


class NotificationsModel {

  RxList<dynamic> all = [].obs;
  // (`${store.serverEndpoint}/mongo/get/notifications/${store.user.uid}`

  void fetchAll() async {

    var uid = store.auth.users["user"].uid;
    var response = await http.get(Uri.http('167.71.12.148', '/mongo/get/notifications/$uid'));
    var jsonResponse = convert.jsonDecode(response.body);
    print(jsonResponse.runtimeType);
    print(all);
    all.addAll(jsonResponse);

    //print(all);
    print('er');
  }
}


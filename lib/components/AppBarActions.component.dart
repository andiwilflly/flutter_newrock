import 'package:flutter/material.dart';
import 'package:get/get.dart';
// Models
import 'package:newrock/models/root.model.dart';


class AppBarActions extends StatelessWidget {



  @override
  Widget build(BuildContext context) {

    return Obx(()=> Text(store.router.currentPage.toString()));
  }
}



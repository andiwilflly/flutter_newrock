import 'package:flutter/material.dart';
import 'package:get/get.dart';
// Models
import 'package:newrock/models/root.model.dart';


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Obx(() => Text("${store.count}!", style: Theme.of(context).textTheme.bodyText1))
      ),
    );
  }
}
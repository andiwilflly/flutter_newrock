import 'package:flutter/material.dart';
import 'package:get/get.dart';
// Store
import 'package:newrock/models/root.model.dart';
// Screens
import 'package:newrock/components/Artist.component.dart';
import 'package:newrock/components/parts/SearchInput.component.dart';


class HomePage extends StatelessWidget {

  renderScreens() {
    switch(store.router.currentHomeScreen.toString()) {
      case "/artists/search":
        return SearchInput();
        break;

      case "/artists/:id":
        return Artist();
        break;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(() => renderScreens()),
    );
  }
}
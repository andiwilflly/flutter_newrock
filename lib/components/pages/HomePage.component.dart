import 'package:flutter/material.dart';
import 'package:get/get.dart';
// Store
import 'package:newrock/models/root.model.dart';
// Screens
import 'package:newrock/components/Artist.component.dart';
import 'package:newrock/components/parts/SearchInput.component.dart';


class HomePage extends StatelessWidget {

  renderScreens() {
    var screens = Map<String, dynamic>.from(store.router.navigator["Home"]["screens"]);
    StatelessWidget CurrentScreen;

    screens.keys.toList().forEach((screenName) {
      if(screenName == store.router.currentPageScreen["Home"].toString()) CurrentScreen = screens[screenName]["child"];
    });

    return CurrentScreen;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(() => renderScreens()),
    );
  }
}
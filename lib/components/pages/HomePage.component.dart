import 'package:flutter/material.dart';
import 'package:get/get.dart';
// Store
import 'package:newrock/models/root.model.dart';
// Screens
import 'package:newrock/components/Artist.component.dart';
import 'package:newrock/components/parts/SearchInput.component.dart';


class HomePage extends StatelessWidget {

  renderScreens() {
    StatelessWidget CurrentScreen;

    store.screens.keys.toList().forEach((screenName) {
      if(screenName == store.router.currentPageScreen["Home"].toString()) CurrentScreen = store.screens[screenName]["child"];
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
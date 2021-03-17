import 'package:flutter/material.dart';
import 'package:get/get.dart';
// Store
import 'package:newrock/models/root.model.dart';


class NotificationsPage extends StatelessWidget {

  renderScreens() {
    StatelessWidget CurrentScreen;

    store.screens.keys.toList().forEach((screenName) {
      if(screenName == store.router.currentPageScreen["Notifications"].toString()) CurrentScreen = store.screens[screenName]["child"];
    });

    if(CurrentScreen == null) return Text('Empty');
    return CurrentScreen;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(() => renderScreens()),
    );
  }
}
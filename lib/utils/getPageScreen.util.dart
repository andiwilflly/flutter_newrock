import 'package:flutter/material.dart';
// Models
import 'package:newrock/models/root.model.dart';


StatelessWidget getPageScreen(String pageName) {
  StatelessWidget currentScreen;

  var screens = Map<String, dynamic>.from(store.router.navigator[pageName]["screens"]);
  screens.keys.toList().forEach((screenName) {
    if(screenName == store.router.currentPageScreen[pageName].toString()) currentScreen = screens[screenName]["child"];
  });

  return currentScreen;
}
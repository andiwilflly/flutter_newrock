import 'package:get/get.dart';
import 'package:flutter/material.dart';
// Pages
import 'package:newrock/components/pages/HomePage.component.dart';
import 'package:newrock/components/pages/TestPage.component.dart';
import 'package:newrock/components/pages/ProfilePage.component.dart';
import 'package:newrock/components/Artist.component.dart';
import 'package:newrock/components/parts/SearchInput.component.dart';


class RouterModel {

  var navigator = {
    "Home": {
      "child": HomePage(),
      "icon": Icons.home,
      "screens": {
        "/artists/search": {
          "child": SearchInput(),
          "params": {}
        },
        "/artists/:id": {
          "onBack": "/artists/search",
          "child": Artist(),
          "params": {
            "artist": null
          }
        }
      }
    },
    "Notifications": {
      "child": TestPage(),
      "icon": Icons.notifications
    },
    "Profile": {
      "child": ProfilePage(),
      "icon": Icons.person
    }
  };



  RxString currentPage = "Home".obs;


  RxMap currentPageScreen = {
    "Home": "/artists/search",
    "Notifications": "",
    "Profile": ""
  }.obs;

  void setCurrentPage(String page) {
    currentPage.value = page;
  }


  void setCurrentPageScreen(String screen, params) {
    var screens = Map<String, dynamic>.from(navigator[currentPage.toString()]["screens"]);
    print(screens[screen]);
    screens[screen]["params"] = params;
    currentPageScreen[currentPage.toString()] = screen;
  }

  // Home page screens logic
  RxString currentHomeScreen = "/artists/search".obs;
}


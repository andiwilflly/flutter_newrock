import 'package:get/get.dart';
import 'package:flutter/material.dart';
// Models
import 'package:newrock/models/root.model.dart';
// Utils
import "package:newrock/utils/getPageScreen.util.dart";
// Pages
import 'package:newrock/components/Artist.component.dart';
import 'package:newrock/components/parts/SearchInput.component.dart';


class RouterModel {

  var navigator = {
    "Home": {
      "child": Container(child: Obx(() => getPageScreen('Home'))),
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
      "child": Container(child: Obx(() => getPageScreen('Notifications'))),
      "icon": Icons.notifications,
      "screens": {
        "/notifications": {
          "child": Text('Notifications'),
          "params": {}
        },
      }
    },
    "Profile": {
      "child": Container(child: Obx(() => getPageScreen('Profile'))),
      "icon": Icons.person,
      "screens": {
        "/profile": {
          "child": Text('Profile'),
          "params": {}
        },
      }
    }
  };


  RxString currentPage = "Home".obs;


  RxMap currentPageScreen = {
    "Home": "/artists/search",
    "Notifications": "/notifications",
    "Profile": "/profile"
  }.obs;

  void setCurrentPage(String page) {
    currentPage.value = page;
  }


  void setCurrentPageScreen(String screen, params) {
    store.screens[screen]["params"] = params;
    currentPageScreen[currentPage.toString()] = screen;
  }
}


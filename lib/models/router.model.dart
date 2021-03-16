import 'package:get/get.dart';
import 'package:flutter/material.dart';
// Pages
import 'package:newrock/components/pages/HomePage.component.dart';
import 'package:newrock/components/pages/TestPage.component.dart';
import 'package:newrock/components/pages/ProfilePage.component.dart';
import 'package:newrock/components/Artist.component.dart';
import 'package:newrock/components/parts/SearchInput.component.dart';


class RouterModel {

  var pages2 = {
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
    }
  };

  var pages = {
    'Home': HomePage(),
    "Notifications": TestPage(),
    "Profile": ProfilePage()
  };

  var icons = {
    'Home': Icons.home,
    "Notifications": Icons.notifications,
    "Profile": Icons.person
  };

  RxString currentPage = "Home".obs;
  RxString backScreen = "".obs;


  void setCurrentPage(String page) {
    currentPage.value = page;
  }


  // Home page screens logic
  RxString currentHomeScreen = "/artists/search".obs;
  var selectedArtist;

  void setCurrentHomeScreen(String screen, artist, String backScreenName) {
    currentHomeScreen.value = screen;
    selectedArtist = artist;
    backScreen.value = backScreenName;
  }
}


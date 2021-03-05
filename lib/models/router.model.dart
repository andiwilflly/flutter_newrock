import 'package:get/get.dart';
import 'package:flutter/material.dart';
// Pages
// Pages
import 'package:newrock/components/pages/HomePage.component.dart';
import 'package:newrock/components/pages/TestPage.component.dart';
import 'package:newrock/components/pages/ProfilePage.component.dart';


class RouterModel {

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


  void setCurrentPage(String page) {
    currentPage.value = page;
  }
}


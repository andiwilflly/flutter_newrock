import 'package:flutter/material.dart';
import 'package:get/get.dart';
// Models
import 'package:newrock/models/auth.model.dart';
import 'package:newrock/models/router.model.dart';
import 'package:newrock/models/searchArtists.model.dart';


class RootModel {

  RxBool isProjectReady = false.obs;

  final auth = AuthModel();
  final router = RouterModel();
  final searchArtists = SearchArtists();


  // Getters
  get screens { return Map<String, dynamic>.from(store.router.navigator[store.router.currentPage.toString()]["screens"]); }
  get currentScreen { return store.screens[store.router.currentPageScreen[store.router.currentPage.toString()]]; }
  get navBarItems { return store.router.navigator.keys.map((pageName) => Icon(store.router.navigator[pageName]["icon"], size: 25, color: Colors.white)).toList(); }


  void setProjectReady() {
    isProjectReady.value = true;
  }
}


final store = RootModel();
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// Components
import 'package:newrock/components/parts/SearchInput.component.dart';
// Screens
import 'package:newrock/components/pages/homeScreens/ArtistScreen.component.dart';
import 'package:newrock/components/pages/homeScreens/SearchArtistsScreen.component.dart';


class HomePage extends StatelessWidget {


//  @override
//  Widget build(BuildContext context) {
//    return GetMaterialApp(
//      initialRoute: '/',
//      getPages: [
//        GetPage(name: '/', page: () => SearchArtistsScreen(), transition: Transition.rightToLeft),
//        GetPage(name: '/artist', page: () => ArtistScreen(), transition: Transition.leftToRight),
//      ],
//    );
//  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SearchInput(),
    );
  }
}
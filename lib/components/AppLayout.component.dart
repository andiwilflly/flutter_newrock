import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
// Pages
import 'package:newrock/components/pages/HomePage.component.dart';
import 'package:newrock/components/pages/TestPage.component.dart';
import 'package:newrock/components/pages/ProfilePage.component.dart';
// Components
import 'package:newrock/components/Header.component.dart';
// Models
import 'package:newrock/models/root.model.dart';


class AppLayout extends StatefulWidget {
  @override
  _AppLayoutState createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    super.initState();
  }

  void onSwipePage(index, reason) {
    setState(() {
      _page = index;
    });
    store.router.setCurrentPage(store.router.pages.keys.toList()[index]);
  }

  void onChangePage(index) {
    _controller.animateToPage(index);
    setState(() {
      _page = index;
    });
    store.router.setCurrentPage(store.router.pages.keys.toList()[index]);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Obx(() => Text(store.router.currentPage.toString())),
          // leading: Image.asset('assets/images/rock_orange.png', width: 50),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Icon(
                      Icons.settings
                  ),
                )
            ),
          ],
        ),

        body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                CarouselSlider(
                  items: store.router.pages.values.toList(),
                  options: CarouselOptions(
                      enableInfiniteScroll: false,
                      viewportFraction: 1.0,
                      enlargeCenterPage: false,
                      height: MediaQuery.of(context).size.height - 90,
                      onPageChanged: onSwipePage
                  ),
                  carouselController: _controller,
                ),
              ],
            )
        ),

        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: _page,
          height: 50.0,
          items: store.router.pages.keys.map((pageName) => Icon(store.router.icons[pageName], size: 25, color: Colors.white)).toList(),
          color: Theme.of(context).accentColor,
          buttonBackgroundColor: Theme.of(context).accentColor,
          backgroundColor: Theme.of(context).primaryColor,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 400),
          onTap: onChangePage,
          letIndexChange: (index) => true,
        )
    );
  }
}



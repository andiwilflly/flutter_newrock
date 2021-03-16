import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_offline/flutter_offline.dart';
// Pages
import 'package:newrock/components/pages/HomePage.component.dart';
import 'package:newrock/components/pages/TestPage.component.dart';
import 'package:newrock/components/pages/ProfilePage.component.dart';
// Components
import 'package:newrock/components/AppBarActions.component.dart';
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
    store.router.setCurrentPage(store.router.navigator.keys.toList()[index]);
  }

  void onChangePage(index) {
    _controller.animateToPage(index);
    setState(() {
      _page = index;
    });
    store.router.setCurrentPage(store.router.navigator.keys.toList()[index]);
  }


  @override
  Widget build(BuildContext context) {

    final navigator = store.router.navigator;
    final screens = Map<String, dynamic>.from(store.router.navigator[store.router.currentPage.toString()]["screens"]);
    var routes = <StatelessWidget>[];
    navigator.values.forEach((route)=> routes.add(route["child"]));

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: Obx(()=> screens[store.router.currentPageScreen[store.router.currentPage.toString()].toString()]["onBack"] == '' ?
            Text('')
            :
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                print('back');
                var screens = Map<String, dynamic>.from(store.router.navigator[store.router.currentPage.toString()]["screens"]);
                print(screens.keys.first);

              },
            )
          ),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          title: Obx(()=> Text(store.router.currentPage.toString())),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
              },
            ),
          ]
        ),
        body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                CarouselSlider(
                  items: routes.toList(),
                  options: CarouselOptions(
                      enableInfiniteScroll: false,
                      viewportFraction: 1.0,
                      enlargeCenterPage: false,
                      height: MediaQuery.of(context).size.height - 50,
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
          items: store.router.navigator.keys.map((pageName) => Icon(store.router.navigator[pageName]["icon"], size: 25, color: Colors.white)).toList(),
          color: Theme.of(context).accentColor,
          buttonBackgroundColor: Theme.of(context).accentColor,
          backgroundColor: Theme.of(context).primaryColor,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 300),
          onTap: onChangePage,
          letIndexChange: (index) => true,
        )
    );
  }
}



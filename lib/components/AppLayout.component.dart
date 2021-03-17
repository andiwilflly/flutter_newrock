import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
    var routes = <StatelessWidget>[];
    store.router.navigator.values.forEach((route)=> routes.add(route["child"]));

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: Obx(()=> store.currentScreen["onBack"].runtimeType == String ?
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                store.router.setCurrentPageScreen(store.currentScreen["onBack"], {});
              },
            )
            :
            Text('')
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
        body: OfflineBuilder(
          connectivityBuilder: (
                BuildContext context,
                ConnectivityResult connectivity,
                Widget child,
                ) {
            final bool connected = connectivity != ConnectivityResult.none;
            return new Stack(
                fit: StackFit.expand,
                children: [
                Positioned(
                    height: 24.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      color: connected ? Color(0xFF00EE44) : Color(0xFFEE4400),
                      child: Center(
                        child: Text("${connected ? 'ONLINE' : 'OFFLINE'}"),
                      ),
                    ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 24),
                    child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            CarouselSlider(
                                items: routes.toList(),
                                options: CarouselOptions(
                                    enableInfiniteScroll: false,
                                    viewportFraction: 1.0,
                                    enlargeCenterPage: false,
                                    height: MediaQuery
                                        .of(context)
                                        .size
                                        .height - 150,
                                    onPageChanged: onSwipePage
                                ),
                                carouselController: _controller,
                            ),
                          ],
                        )
                    ),
                ),
              ],
            );
          },
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                  new Text(
                    'There are no bottons to push :)',
                  ),
                  new Text(
                    'Just turn off your internet.',
                  ),
              ],
          ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
            key: _bottomNavigationKey,
            index: _page,
            height: 50.0,
            items: store.navBarItems,
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



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

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                CarouselSlider(
                  items: [
                    HomePage(),
                    TestPage(),
                    ProfilePage()
                  ],
                  options: CarouselOptions(
                      enableInfiniteScroll: false,
                      viewportFraction: 1.0,
                      enlargeCenterPage: false,
                      height: MediaQuery.of(context).size.height - 90,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _page = index;
                        });
                      }
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
          items: <Widget>[
            Icon(Icons.home, size: 25, color: Colors.white),
            Icon(Icons.notifications, size: 25, color: Colors.white),
            Icon(Icons.perm_identity, size: 25, color: Colors.white),
          ],
          color: Theme.of(context).accentColor,
          buttonBackgroundColor: Theme.of(context).accentColor,
          backgroundColor: Theme.of(context).primaryColor,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 400),
          onTap: (index) {
            _controller.animateToPage(index);
            setState(() {
              _page = index;
            });
          },
          letIndexChange: (index) => true,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => {
            rootModel.increment()
          },
        )
    );
  }
}



import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';



final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];


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
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: _page,
          height: 50.0,
          items: <Widget>[
            Icon(Icons.add, size: 20),
            Icon(Icons.list, size: 20),
            Icon(Icons.compare_arrows, size: 20),
            Icon(Icons.call_split, size: 20),
            Icon(Icons.perm_identity, size: 20),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.blueAccent,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 300),
          onTap: (index) {
            _controller.animateToPage(index);
            setState(() {
              _page = index;
            });
          },
          letIndexChange: (index) => true,
        ),
        body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                CarouselSlider(
                  items: imgList.map((item) => Container(
                    child: Center(
                        child: Image.network(item, fit: BoxFit.cover, height: MediaQuery.of(context).size.height)
                    ),
                  )).toList(),
                  options: CarouselOptions(
                      enlargeCenterPage: true,
                      height: 200,
                      onPageChanged: (index, reason) {
                        print('wqer');
                        setState(() {
                          _page = index;
                        });
                      }
                  ),
                  carouselController: _controller,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: RaisedButton(
                        onPressed: () => _controller.previousPage(),
                        child: Text('←'),
                      ),
                    ),
                  ],
                )
              ],
            )
        )
    );
  }
}



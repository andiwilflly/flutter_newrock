import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Second extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: () { Get.toNamed("/"); },
        child: Hero(
          tag: 'imageHero',
          child: Image.network(
            'https://picsum.photos/250?image=9',
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: 'imageHero',
          child: Image.network(
            'https://picsum.photos/250?image=9',
          ),
        ),
        RaisedButton(
          onPressed: () { Get.toNamed("/second"); },
          child: Text('MyHomePage!', style: Theme.of(context).textTheme.bodyText1),
        )
      ],
    );
  }
}


// https://github.com/jonataslaw/getx/blob/master/documentation/en_US/route_management.md#navigation-with-named-routes
class TestPage extends StatelessWidget {
  const TestPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => MyHomePage(), transition: Transition.rightToLeft  ),
        GetPage(name: '/second', page: () => Second(), transition: Transition.leftToRight  ),
      ],
    );
  }
}
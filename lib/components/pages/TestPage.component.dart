import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: RaisedButton(
            onPressed: () { Get.toNamed("/"); },
            child: Text('Second -> home', style: Theme.of(context).textTheme.bodyText1),
          )
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: RaisedButton(
            onPressed: () { Get.toNamed("/second"); },
            child: Text('Home -> second', style: Theme.of(context).textTheme.bodyText1),
          )
      ),
    );
  }
}


class UnknownRoutePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: RaisedButton(
            onPressed: () { Get.toNamed("/"); },
            child: Text('404!', style: Theme.of(context).textTheme.bodyText1),
          )
      ),
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
      unknownRoute: GetPage(name: '/notfound', page: () => UnknownRoutePage()),
      getPages: [
        GetPage(name: '/', page: () => MyHomePage(), transition: Transition.fadeIn  ),
        GetPage(name: '/second', page: () => Second(), transition: Transition.fade  ),
      ],
    );
  }
}
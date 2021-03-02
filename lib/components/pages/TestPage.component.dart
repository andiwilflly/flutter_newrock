import 'package:flutter/material.dart';


class TestPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text('TEST', style: Theme.of(context).textTheme.bodyText1)
      ),
    );
  }
}
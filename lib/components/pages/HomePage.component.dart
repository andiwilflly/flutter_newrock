import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text('HOME', style: Theme.of(context).textTheme.bodyText1)
      ),
    );
  }
}
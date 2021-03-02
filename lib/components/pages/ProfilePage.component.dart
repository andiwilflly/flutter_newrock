import 'package:flutter/material.dart';


class ProfilePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text('PROFILE', style: Theme.of(context).textTheme.bodyText1)
      ),
    );
  }
}
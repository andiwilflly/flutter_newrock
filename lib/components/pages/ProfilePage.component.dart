import 'package:flutter/material.dart';
// Store
import 'package:newrock/models/root.model.dart';


class ProfilePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: RaisedButton(
            onPressed: () { store.auth.logOut(); },
            child: Text('LogOut', style: Theme.of(context).textTheme.bodyText1),
          )
      ),
    );
  }
}
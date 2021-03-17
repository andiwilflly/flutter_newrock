import 'package:flutter/material.dart';
import 'package:get/get.dart';
// Store
import 'package:newrock/models/root.model.dart';
// Components
import 'package:newrock/components/parts/TouchableOpacity.component.dart';


class NotificationsList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Text("$index", style: TextStyle(color: Colors.orange));
          },
          itemCount: 120,
        ),
      ),
    );
  }
}
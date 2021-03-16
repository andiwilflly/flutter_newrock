import 'package:flutter/material.dart';
import 'package:get/get.dart';
// Store
import 'package:newrock/models/root.model.dart';
// Components
import 'package:newrock/components/parts/TouchableOpacity.component.dart';


class Artist extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double height = 390;
    double imgSize = height * 0.8;
    double padding = height * 0.1;

    return Container(
      height: height,
      child: TouchableOpacity(
        onTap: ()=> store.router.setCurrentHomeScreen('/artists/search', null),
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            children: [
              Text('go back')
            ],
          ),
        ),
      ),
    );
  }
}
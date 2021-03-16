import 'package:flutter/material.dart';
import 'package:get/get.dart';
// Store
import 'package:newrock/models/root.model.dart';
// Components
import 'package:newrock/components/parts/TouchableOpacity.component.dart';


class Artist extends StatelessWidget {
  final artist;
  Artist({ this.artist });

  @override
  Widget build(BuildContext context) {
    double height = 390;
    double imgSize = height * 0.8;
    double padding = height * 0.1;

    print(artist);
    return Container(
      height: height,
      child: TouchableOpacity(
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            children: [
              Text('artist')
            ],
          ),
        ),
      ),
    );
  }
}
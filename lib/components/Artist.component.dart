import 'package:flutter/material.dart';
import 'package:get/get.dart';
// Store
import 'package:newrock/models/root.model.dart';
// Components
import 'package:newrock/components/parts/TouchableOpacity.component.dart';


class Artist extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double imgSize = 250;

    print(store.currentScreen['params']);

    return Container(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.only(top: 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(imgSize),
                  child: Image.network(
                    store.currentScreen['params']['img'],
                    height: imgSize,
                    width: imgSize,
                  ),
                )),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(store.currentScreen['params']['name'], style: Theme.of(context).textTheme.bodyText1),
            ),
          ],
        ),
      ),
    );
  }
}
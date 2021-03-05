import 'package:flutter/material.dart';
import 'package:get/get.dart';
// Store
import 'package:newrock/models/root.model.dart';


class ArtistCardSmall extends StatelessWidget {
  final artist;

  ArtistCardSmall({ Key key, @required this.artist }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    double height = 80;
    double imgSize = height * 0.8;
    double padding = height * 0.1;

    return Container(
      height: height,
      child:  Padding(
        padding: EdgeInsets.all(padding),
          child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: padding),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(imgSize),
                child: Image.network(
                  artist['img'],
                  height: imgSize,
                  width: imgSize,
                ),
              )),
            Text(artist['name'], style: Theme.of(context).textTheme.bodyText1),
          ],
        ),
      ),
    );

    return Container(
      child: Center(
          child: Text('ArtistCardSmall', style: Theme.of(context).textTheme.bodyText1),
      ),
    );
  }
}
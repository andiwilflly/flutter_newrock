import 'package:flutter/material.dart';
import 'package:get/get.dart';
// Store
import 'package:newrock/models/root.model.dart';
// Components
import 'package:newrock/components/parts/TouchableOpacity.component.dart';


class ArtistCardSmall extends StatelessWidget {
  final artist;
  ArtistCardSmall({ Key key, @required this.artist }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    double height = 90;
    double imgSize = height * 0.8;
    double padding = height * 0.1;

    return Container(
      height: height,
      child: TouchableOpacity(
        onTap: ()=> store.router.setCurrentPageScreen('/artists/:id', artist),
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Row(
            children: [
              Padding(
                  padding: EdgeInsets.only(right: padding),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(imgSize),
                    child: Hero(
                      tag: artist['id'],
                      child: Image.network(
                        artist['img'],
                        height: imgSize,
                        width: imgSize,
                      ),
                    ),
                  )),
              Text(artist['name'], style: Theme.of(context).textTheme.bodyText1),
            ],
          ),
        ),
      ),
    );
  }
}
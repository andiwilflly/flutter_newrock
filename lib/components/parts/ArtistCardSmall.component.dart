import 'package:flutter/material.dart';
// Store
import 'package:newrock/models/root.model.dart';


class ArtistCardSmall extends StatelessWidget {
  final Object artist;

  ArtistCardSmall({ Key key, @required this.artist }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    print(artist);

    return Container(
      child: Center(
          child: Text('ArtistCardSmall', style: Theme.of(context).textTheme.bodyText1),
      ),
    );
  }
}
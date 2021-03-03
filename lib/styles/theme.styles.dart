import 'package:flutter/material.dart';
// Utils
import 'package:newrock/utils/HexColor.util.dart';


var themeStyles =  ThemeData(
  scaffoldBackgroundColor: HexColor.fromHex('#282a30'),
  primaryColor: HexColor.fromHex('#282a30'),
  accentColor: HexColor.fromHex('#ee4f10'),
  primarySwatch: Colors.blue,

  visualDensity: VisualDensity.adaptivePlatformDensity,

  textTheme: TextTheme(
    bodyText1: TextStyle(fontSize: 19.0, color: HexColor.fromHex('#ee4f10')),
    headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
    bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
  ),
);
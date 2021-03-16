import 'package:flutter/material.dart';
import 'package:get/get.dart';
// Store
import 'package:newrock/models/root.model.dart';
// Components
import 'package:newrock/components/parts/SearchInput.component.dart';


class SearchArtists extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double height = 390;
    double imgSize = height * 0.8;
    double padding = height * 0.1;

    return Container(
      height: height,
      child: SearchInput(),
    );
  }
}
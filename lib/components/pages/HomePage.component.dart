import 'package:flutter/material.dart';
import 'package:get/get.dart';
// Components
import 'package:newrock/components/parts/SearchInput.component.dart';


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SearchInput(),
    );
  }
}
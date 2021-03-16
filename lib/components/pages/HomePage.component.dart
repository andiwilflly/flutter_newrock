import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
// Theme
import 'package:newrock/styles/theme.styles.dart';
// Screens
import 'package:newrock/components/Artist.component.dart';
import 'package:newrock/components/parts/SearchArtists.component.dart';
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
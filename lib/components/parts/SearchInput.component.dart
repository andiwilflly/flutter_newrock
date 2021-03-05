import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
// Store
import 'package:newrock/models/root.model.dart';
// Components
import 'package:newrock/components/parts/ArtistCardSmall.component.dart';



class SearchInput extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // This is handled by the search bar itself.
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          buildFloatingSearchBar(context),
        ],
      ),
    );
  }

  Widget buildFloatingSearchBar(context) {

    return FloatingSearchBar(
      hint: 'Search artists...',
      scrollPadding: const EdgeInsets.only(top: 10, bottom: 10),
      transitionDuration: const Duration(milliseconds: 400),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: -1.0,
      openAxisAlignment: 0.0,
      maxWidth: 500,
      debounceDelay: const Duration(milliseconds: 500),
      onQueryChanged: store.searchArtists.fetch,
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
            color: Theme.of(context).primaryColor,
            elevation: 4.0,
            child: Obx(() => Column(
              mainAxisSize: MainAxisSize.min,
              children: store.searchArtists.artists.toList().map((artist) {
                return ArtistCardSmall(artist: artist);
              }).toList(),
            )),
          ),
        );
      },
    );
  }
}
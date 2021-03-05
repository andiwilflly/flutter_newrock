import 'package:get/get.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
// Models
import 'package:newrock/models/auth.model.dart';
import 'package:newrock/models/router.model.dart';


class SearchArtists {

  RxList artists = [].obs;


  void setArtist(artist) {
    artists.add({
      "id": artist['id'],
      "name": artist['name'],
      "img": artist['images'].length == 0 ?
        'https://w7.pngwing.com/pngs/204/710/png-transparent-microphone-singer-singing-microphone-electronics-hand-arm.png'
        :
        artist['images'][0]['url']
    });
  }

  void fetch(query) async {
    artists.assignAll([]);
    if(query.length == 0) return;

    var response = await http.get(Uri.http('167.71.12.148', '/spotify/token'));
    var jsonResponse = convert.jsonDecode(response.body);
    var token = jsonResponse['token'];

    var url = Uri.https('api.spotify.com', '/v1/search', {'q': query, 'type': 'artist', 'limit': '4'});
    var artistsResponse = await http.get(url, headers: { "Authorization": "Bearer $token" });
    var artistsList = convert.jsonDecode(artistsResponse.body);
    artistsList['artists']['items'].forEach(setArtist);
  }
}


import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

class Suggestions {
  final String placeID;
  final String description;

  Suggestions({this.description, this.placeID});

  @override
  String toString() {
    return 'decription: ${this.description} placeId: ${this.placeID}';
  }
}

class PlaceApiProvider {
  final client = Client();

  PlaceApiProvider(this.sessionTokken);
  final sessionTokken;

  static final String androidKey = "";
  static final String iosKey = "";
  final apiKey = Platform.isAndroid ? androidKey : iosKey;

  Future<List<Suggestions>> fetchSuggestions(String input, String lang) async {
    final request =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&types=address&language=$lang&components=country:in&key=$apiKey&sessiontoken=$sessionTokken';

    final response = await client.get(request);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);

      if (result['status'] == 'OK') {
        List<Suggestions> placeList = [];
        result['predictions'].forEach((place) {
          placeList.add(
            Suggestions(
                description: place['description'], placeID: place['place_id']),
          );
        });
        return placeList;
      } else if (result['status'] == 'ZERO_RESULTS') {
        return [];
      } else {
        throw Exception('Failed to fetch message');
      }
    }
  }
}

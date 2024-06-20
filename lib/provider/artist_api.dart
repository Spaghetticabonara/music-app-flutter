import 'dart:convert';

import 'package:flutter_config/flutter_config.dart';
// import 'package:http/http.dart' as http;
import 'package:enhanced_http/enhanced_http.dart' as http;
import 'package:music_player_app/models/artist.dart';

class ArtistApi {
  // final baseUrl = 'https://api.spotify.com';
  // final token =
  //     'Bearer BQA-YcX3g4eV8Y8xKs07kNdFKuSV7HB8FmF4TJTqCYBdJ4_1tOsELJSl8tyYBfpn_0w6oWG-R1PyTAXy9wWKVhKdMPS41yjRWWLV3l-ogNikt35Ti-w';
  // final baseUrl = FlutterConfig.get('API_URL');

  static Future<List<Artist>> getArtist() async {
    const baseUrl = 'https://api.spotify.com';
    const token =
        'Bearer BQA-YcX3g4eV8Y8xKs07kNdFKuSV7HB8FmF4TJTqCYBdJ4_1tOsELJSl8tyYBfpn_0w6oWG-R1PyTAXy9wWKVhKdMPS41yjRWWLV3l-ogNikt35Ti-w';
    final query = {
      'ids':
          '382ObEPsp2rxGrnsizN5TX,1A2GTWGtFfWp7KSQTwWOyo,2noRn2Aes5aoNVsU6iWThc',
    };

    var uri = Uri.parse('$baseUrl/v1/albums').replace(queryParameters: query);
    final response = await http.get(uri,
        headers: {'Content-Type': 'application/json', 'Authorization': token});
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['albums'] as List<dynamic>;
    final albums = results.map((e) {
      return Artist(
        name: e['name'],
        albumType: e['album_type'],
      );
    }).toList();
    return albums;
  }
}

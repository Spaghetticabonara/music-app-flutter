// import 'dart:convert';

// import 'package:http/http.dart' as http;

// Future<Song> fetchSong() async {
//   final response = await http
//       .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     return Song.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load album');
//   }
// }

class Song {
  final String songName;
  final String artistName;
  final String albumArtImagePath;
  final String audioPath;

  Song({
    required this.songName,
    required this.artistName,
    required this.albumArtImagePath,
    required this.audioPath,
  });

  // factory Song.fromJson(Map<String, dynamic> json) {
  //   return switch (json) {
  //     {
  //       'songName': String songName,
  //       'artistName': String artistName,
  //       'albumArtImagePath': String albumArtImagePath,
  //       'audioPath': String audioPath,
  //     } =>
  //       Song(
  //         songName: songName,
  //         artistName: artistName,
  //         albumArtImagePath: albumArtImagePath,
  //         audioPath: audioPath,
  //       ),
  //     _ => throw const FormatException('Failed to load'),
  //   };
  // }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:music_player_app/provider/song_api.dart';

class SongService {
  final CollectionReference songs =
      FirebaseFirestore.instance.collection('songs');

  Future<void> addSong(String song) {
    return songs.add({
      'song': song,
      'Timestamp': Timestamp.now(),
    });
  }

  // get songs
  // Future<void> getAllSong() {}
  
  // final _api = SongApi();
  // void getAllSong() async {
  //   return _api.getAllSong();
  // }
}

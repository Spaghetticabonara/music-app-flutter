import 'package:music_player_app/provider/song_api.dart';

class SongService {
  final _api = SongApi();
  void getAllSong() async {
    return _api.getAllSong();
  }
}

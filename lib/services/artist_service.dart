import 'package:music_player_app/provider/artist_api.dart';

class ArtistService {
  static getArtist() {
    return ArtistApi.getArtist();
  }
}

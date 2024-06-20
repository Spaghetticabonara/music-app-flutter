import 'package:http/http.dart' as http;

class SongApi {
  final url = 'https://restcountries.com/v3.1/all';
  void getAllSong() async {
    var uri = Uri.parse(url);
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      // return
    }
    return null;
  }
}

import 'package:music_player_app/models/user.dart';
import 'package:music_player_app/provider/user_api.dart';

class UserService {
  // final _api = UserApi();
  static fetchAllUsers() async {
    return UserApi.fetchUsers();
  }
}

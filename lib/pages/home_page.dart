import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:music_player_app/components/my_drawer.dart';
import 'package:music_player_app/models/artist.dart';
import 'package:music_player_app/models/playlist_provider.dart';
import 'package:music_player_app/models/song.dart';
import 'package:music_player_app/models/user.dart';
import 'package:music_player_app/pages/song_page.dart';
import 'package:music_player_app/provider/user_api.dart';
import 'package:music_player_app/services/artist_service.dart';
import 'package:music_player_app/services/user_service.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // get the playlist provider
  late final dynamic playlistProvider;

  List<User> users = [];
  List<Artist> artists = [];

  @override
  void initState() {
    super.initState();

    // get playlist provider
    playlistProvider = Provider.of<PlaylistProvider>(context, listen: false);
    fetchUsers();
    getArtist();
  }

  // go to song
  void goToSong(int songIndex) {
    // update current song index
    playlistProvider.currentSongIndex = songIndex;

    // navigate to song page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SongPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      appBar: AppBar(
        title: const Text("PLAYLIST"),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: const MyDrawer(),
      body: Consumer<PlaylistProvider>(
        builder: (context, value, child) {
          // // get the playlist
          // final List<Song> playlist = value.playlist;

          // // return list view UI
          // return ListView.builder(
          //   itemCount: playlist.length,
          //   itemBuilder: (context, index) {
          //     // get individual song
          //     final Song song = playlist[index];

          //     // return list tile UI
          //     return ListTile(
          //       title: Text(song.songName),
          //       subtitle: Text(song.artistName),
          //       leading: Image.asset(song.albumArtImagePath),
          //       textColor: Theme.of(context).colorScheme.inversePrimary,
          //       onTap: () => goToSong(index),
          //     );
          //   },
          // );

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: ((context, index) {
              final user = users[index];
              return ListTile(
                // leading: ClipRRect(
                //   borderRadius: BorderRadius.circular(100),
                //   child: Image.network(user['picture']['thumbnail']),
                // ),
                title: Text(user.fullName),
                subtitle: Text(user.phone),
              );
            }),
          );
        },
      ),
    );
  }

  Future<void> fetchUsers() async {
    final response = await UserService.fetchAllUsers();
    setState(() {
      users = response;
    });
  }
  Future<void> getArtist() async {
    final response = await ArtistService.getArtist();
    setState(() {
      users = response;
    });
  }
}

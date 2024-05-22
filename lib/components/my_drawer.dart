import 'package:flutter/material.dart';
import 'package:music_player_app/pages/setting_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      child: Column(
        children: [
          // logo
          DrawerHeader(
            child: Center(
              child: Icon(
                Icons.music_note,
                size: 40,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),

          // home tile
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              title: const Text("HOME"),
              leading: const Icon(Icons.home),
              textColor: Theme.of(context).colorScheme.inversePrimary,
              iconColor: Theme.of(context).colorScheme.inversePrimary,
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),

          // settings tile
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              title: const Text("SETTINGS"),
              leading: const Icon(Icons.settings),
              textColor: Theme.of(context).colorScheme.inversePrimary,
              iconColor: Theme.of(context).colorScheme.inversePrimary,
              onTap: () {
                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsPage(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

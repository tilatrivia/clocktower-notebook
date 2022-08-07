import 'package:flutter/material.dart';

import 'data/store.dart';
import 'model/game.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Game? savedGame;

  void _clearSavedGame() {
    Store.clearGame();
    _checkStore();
  }

  void _checkStore() async {
    final Game? retrievedGame = await Store.getGame();

    if (retrievedGame != null) {
      setState(() {
        savedGame = retrievedGame;
      });
    } else {
      setState(() {
        savedGame = null;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    _checkStore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: const Text("Saved Game",
                // style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              subtitle: Text((savedGame != null) ? "Script: ${savedGame?.script.name} Players: ${savedGame?.players.length}" : "No Game Saved"),
            ),
            ListTile(
              title: const Text("Delete Saved Game"),
              onTap: _clearSavedGame,
            ),
          ],
        )
    );
  }
}
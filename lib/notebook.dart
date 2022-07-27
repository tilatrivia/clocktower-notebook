import 'dart:async';
import 'dart:convert';

import 'package:clocktower_notes/players.dart';
import 'package:clocktower_notes/widgets/character_tile.dart';
import 'package:clocktower_notes/widgets/player_container.dart';
import 'package:flutter/material.dart' hide Alignment;
import 'package:shared_preferences/shared_preferences.dart';

import 'model/player.dart';
import 'model/script.dart';
import 'model/tile.dart';

class NotebookPage extends StatefulWidget {
  final Script script;
  final List<Player>? lastPlayers;

  const NotebookPage({Key? key, required this.script, this.lastPlayers}) : super(key: key);

  @override
  State<NotebookPage> createState() => _NotebookPageState();
}

class _NotebookPageState extends State<NotebookPage> {
  late List<Player> players = [];

  @override
  void initState() {
    super.initState();

    Timer.run(() {
      debugPrint(widget.lastPlayers.toString());
      if (widget.lastPlayers != null) {
        setState(() {
          players.addAll(widget.lastPlayers!);
        });
      } else {
        _awaitPlayerInfo();
      }
    });
  }
  
  void _storePlayers() async {
    String playersJSON = jsonEncode(players);
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(Player.playersKey, playersJSON);
  }

  void _clearStore() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(Player.playersKey);
    await prefs.remove(Script.scriptKey);
  }

  void addToPlayer(Player player, Tile tile) {
    setState(() {
      player.characters.add(tile);
    });
    _storePlayers();
  }

  void removeFromPlayer(Player player, Tile tile) {
    setState(() {
      player.characters.remove(tile);
    });
    _storePlayers();
  }

  void togglePlayerDead(Player player) {
    setState(() {
      player.dead = !player.dead;
    });
    _storePlayers();
  }

  int getCharacterCount(Tile tile) {
    return players.fold(0,
        (prev, player) => (player.characters.contains(tile)) ? prev + 1 : prev);
  }

  int getCategoryCount(Category category) {
    return players.fold(
        0,
        (prev, player) => player.characters.fold(
            prev,
            (playerPrev, character) => (character.category == category)
                ? playerPrev + 1
                : playerPrev));
  }

  int getAlignmentCount(Alignment alignment) {
    return players.fold(
        0,
        (prev, player) => player.characters.fold(
            prev,
            (playerPrev, character) => (character.alignment == alignment)
                ? playerPrev + 1
                : playerPrev));
  }

  void _awaitPlayerInfo() async {
    List<Player> receivedPlayers = await Navigator.push(
        context, MaterialPageRoute(builder: (_) => const PlayersPage()));
    setState(() {
      players = receivedPlayers;
    });
    _storePlayers();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _confirmExit,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Script.getScriptColor(widget.script.scriptId),
          automaticallyImplyLeading: false,
          title:
              Text("${Script.getScriptTitle(widget.script.scriptId)} Notebook"),
          actions: [
            TextButton(
              onPressed: _confirmExit,
              child: const Text(
                "END GAME",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: ListView.separated(
                    itemCount: players.length,
                    itemBuilder: (context, index) {
                      return PlayerContainer(
                          player: players.elementAt(index),
                          addCharacter: addToPlayer,
                          removeCharacter: removeFromPlayer,
                          toggleDead: togglePlayerDead,
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider()),
              ),
            ),
            Container(
                width: double.infinity,
                height: 300,
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          spacing: 8,
                          children: widget.script.tiles
                              .where((element) =>
                                  element.category == Category.unkown)
                              .map((tile) => CharacterTile(
                                  tile: tile,
                                  count: getAlignmentCount(tile.alignment)))
                              .toList(),
                        ),
                        Row(
                          children: [
                            const Text(
                              "Townsfolk",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  height: 2),
                            ),
                            Container(
                              width: 8,
                            ),
                            Text(
                              "${getCategoryCount(Category.townsfolk).toString()}/${Script.getBaseTownsfolkCount(players.length)}",
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  height: 2.5,
                                  color: Colors.black54),
                            ),
                          ],
                        ),
                        Wrap(
                          spacing: 8,
                          children: widget.script.tiles
                              .where((element) =>
                                  element.category == Category.townsfolk)
                              .map((tile) => CharacterTile(
                                  tile: tile,
                                  count: getCharacterCount(tile)))
                              .toList(),
                        ),
                        Row(
                          children: [
                            const Text(
                              "Outsiders",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  height: 2),
                            ),
                            Container(
                              width: 8,
                            ),
                            Text(
                              "${getCategoryCount(Category.outsider).toString()}/${Script.getBaseOutsiderCount(players.length)}",
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  height: 2.5,
                                  color: Colors.black54),
                            ),
                          ],
                        ),
                        Wrap(
                          spacing: 8,
                          children: widget.script.tiles
                              .where((element) =>
                                  element.category == Category.outsider)
                              .map((tile) => CharacterTile(
                                  tile: tile,
                                  count: getCharacterCount(tile)))
                              .toList(),
                        ),
                        Row(
                          children: [
                            const Text(
                              "Minions",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  height: 2),
                            ),
                            Container(
                              width: 8,
                            ),
                            Text(
                              "${getCategoryCount(Category.minion).toString()}/${Script.getBaseMinionCount(players.length)}",
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  height: 2.5,
                                  color: Colors.black54),
                            ),
                          ],
                        ),
                        Wrap(
                          spacing: 8,
                          children: widget.script.tiles
                              .where((element) =>
                                  element.category == Category.minion)
                              .map((tile) => CharacterTile(
                                  tile: tile,
                                  count: getCharacterCount(tile)))
                              .toList(),
                        ),
                        Row(
                          children: [
                            const Text(
                              "Demons",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  height: 2),
                            ),
                            Container(
                              width: 8,
                            ),
                            Text(
                              "${getCategoryCount(Category.demon).toString()}/1",
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  height: 2.5,
                                  color: Colors.black54),
                            ),
                          ],
                        ),
                        Wrap(
                          spacing: 8,
                          children: widget.script.tiles
                              .where((element) =>
                                  element.category == Category.demon)
                              .map((tile) => CharacterTile(
                                  tile: tile,
                                  count: getCharacterCount(tile)))
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Future<bool> _confirmExit() async {
    return (await showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: const Text("End Game"),
                  content: const Text(
                      "Are you sure you want to clear all of your notes and return to the script menu?"),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: const Text("CANCEL")),
                    TextButton(
                        onPressed: () {
                          _clearStore();
                          Navigator.of(context).pop(true);
                          Navigator.of(context).pop();
                        },
                        child: const Text("EXIT"))
                  ],
                ))) ??
        false;
  }
}

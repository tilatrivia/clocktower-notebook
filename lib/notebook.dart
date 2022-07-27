import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:clocktower_notes/players.dart';
import 'package:clocktower_notes/widgets/characters_list.dart';
import 'package:clocktower_notes/widgets/player_list.dart';
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

  late ScrollController playersScrollController;
  late ScrollController charactersScrollController;

  @override
  void initState() {
    super.initState();

    playersScrollController = ScrollController();
    charactersScrollController = ScrollController();

    Timer.run(() {
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

  void _addCharacter(Player player, Tile tile) {
    setState(() {
      player.characters.add(tile);
    });
    _storePlayers();
  }

  void _removeCharacter(Player player, Tile tile) {
    setState(() {
      player.characters.remove(tile);
    });
    _storePlayers();
  }

  void _toggleDead(Player player) {
    setState(() {
      player.dead = !player.dead;
    });
    _storePlayers();
  }

  int _getCharacterCount(Tile tile) {
    return players.fold(0,
        (prev, player) => (player.characters.contains(tile)) ? prev + 1 : prev);
  }

  int _getCategoryCount(Category category) {
    return players.fold(
        0,
        (prev, player) => player.characters.fold(
            prev,
            (playerPrev, character) => (character.category == category)
                ? playerPrev + 1
                : playerPrev));
  }

  int _getAlignmentCount(Alignment alignment) {
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
        body: OrientationBuilder(
          builder: (context, orientation) {
            if (orientation == Orientation.portrait) {
              return _portraitLayout();
            } else {
              return _landscapeLayout();
            }
          },
        )
      ),
    );
  }

  Widget _portraitLayout() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double paneHeight = min(300, constraints.maxHeight / 3);
        final double contentHeight = constraints.maxHeight - paneHeight;

        return Column(
          children: [
            Container(
                height: contentHeight,
                width: double.infinity,
                color: Colors.grey.shade50,
                child: PlayerList(
                  players: players,
                  addCharacter: _addCharacter,
                  removeCharacter: _removeCharacter,
                  toggleDead: _toggleDead,
                  scrollController: playersScrollController,
                )
            ),
            Container(
                height: paneHeight,
                width: double.infinity,
                color: Colors.white,
                child: CharactersList(
                  characters: widget.script.tiles,
                  totalTownsfolk: Script.getBaseTownsfolkCount(players.length),
                  totalOutsiders: Script.getBaseOutsiderCount(players.length),
                  totalMinions: Script.getBaseMinionCount(players.length),
                  getAlignmentCount: _getAlignmentCount,
                  getCategoryCount: _getCategoryCount,
                  getCharacterCount: _getCharacterCount,
                  scrollController: charactersScrollController,
                )
            ),
          ],
        );
      },
    );
  }

  Widget _landscapeLayout() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double paneWidth = min(500, constraints.maxWidth / 2);
        final double contentWidth = constraints.maxWidth - paneWidth;

        return Row(
          children: [
            Container(
                height: double.infinity,
                width: contentWidth,
                color: Colors.grey.shade50,
                child: PlayerList(
                  players: players,
                  addCharacter: _addCharacter,
                  removeCharacter: _removeCharacter,
                  toggleDead: _toggleDead,
                  scrollController: playersScrollController,
                )
            ),
            Container(
                height: double.infinity,
                width: paneWidth,
                color: Colors.white,
                child: CharactersList(
                  characters: widget.script.tiles,
                  totalTownsfolk: Script.getBaseTownsfolkCount(players.length),
                  totalOutsiders: Script.getBaseOutsiderCount(players.length),
                  totalMinions: Script.getBaseMinionCount(players.length),
                  getAlignmentCount: _getAlignmentCount,
                  getCategoryCount: _getCategoryCount,
                  getCharacterCount: _getCharacterCount,
                  scrollController: charactersScrollController,
                )
            ),
          ],
        );
      },
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

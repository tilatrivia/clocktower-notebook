import 'dart:async';
import 'dart:math';

import 'package:clocktower_notes/model/icons.dart';
import 'package:clocktower_notes/players.dart';
import 'package:clocktower_notes/widgets/characters_list.dart';
import 'package:clocktower_notes/widgets/player_list.dart';
import 'package:flutter/material.dart';

import 'data/store.dart';
import 'model/character.dart';
import 'model/game.dart';
import 'model/player.dart';
import 'model/script.dart';

class NotebookPage extends StatefulWidget {
  final Game game;

  const NotebookPage({Key? key, required this.game}) : super(key: key);

  @override
  State<NotebookPage> createState() => _NotebookPageState();
}

class _NotebookPageState extends State<NotebookPage> {
  late Game game;

  late ScrollController playersScrollController;
  late ScrollController charactersScrollController;
  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();

    game = widget.game;
    Store.updateGame(game);

    playersScrollController = ScrollController();
    charactersScrollController = ScrollController();
    textEditingController = TextEditingController();

    Timer.run(() {
      if (game.players.isEmpty) {
        _awaitPlayerInfo();
      }
    });
  }

  void _addCharacter(Player player, CharacterId characterId) {
    setState(() {
      player.characters.add(characterId);
    });
    Store.updateGame(game);
  }

  void _removeCharacter(Player player, CharacterId characterId) {
    setState(() {
      player.characters.remove(characterId);
    });
    Store.updateGame(game);
  }

  void _toggleDead(Player player) {
    setState(() {
      player.dead = !player.dead;
    });
    Store.updateGame(game);
  }

  void _updateNote(Player player, String note) {
    setState(() {
      player.note = note;
    });
    Store.updateGame(game);
  }

  int _getCharacterCount(CharacterId characterId) {
    return game.players.fold(
        0,
        (prev, player) =>
            (player.characters.contains(characterId)) ? prev + 1 : prev);
  }

  int _getCategoryCount(CharacterType type) {
    return game.players.fold(
        0,
        (prev, player) => player.characters.fold(
            prev,
            (playerPrev, characterId) =>
                (game.script.getById(characterId).type == type)
                    ? playerPrev + 1
                    : playerPrev));
  }

  int _getAlignmentCount(CharacterAlignment alignment) {
    return game.players.fold(
        0,
        (prev, player) => player.characters.fold(
            prev,
            (playerPrev, characterId) =>
                (game.script.getById(characterId).alignment == alignment)
                    ? playerPrev + 1
                    : playerPrev));
  }

  void _awaitPlayerInfo() async {
    List<Player> receivedPlayers = await Navigator.push(
        context, MaterialPageRoute(builder: (_) => const PlayersPage()));
    setState(() {
      game.players.addAll(receivedPlayers);
    });
    Store.updateGame(game);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _confirmExit,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: game.script.color.data,
            automaticallyImplyLeading: false,
            title: Text("${game.script.name} Notebook"),
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
          body: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 600) {
                return _portraitLayout();
              } else {
                return _landscapeLayout();
              }
            },
          )),
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
                    context: context,
                    players: game.players,
                    getCharacter: game.script.getById,
                    addCharacter: _addCharacter,
                    removeCharacter: _removeCharacter,
                    toggleDead: _toggleDead,
                    updateNote: _updateNote,
                    scrollController: playersScrollController,
                    textEditingController: textEditingController)),
            Container(
                height: paneHeight,
                width: double.infinity,
                color: Colors.white,
                child: CharactersList(
                  characters: game.script.characters.values.toList(),
                  totalTownsfolk: Script.getBaseTownsfolkCount(game.players.length),
                  totalOutsiders: Script.getBaseOutsiderCount(game.players.length),
                  totalMinions: Script.getBaseMinionCount(game.players.length),
                  getAlignmentCount: _getAlignmentCount,
                  getCategoryCount: _getCategoryCount,
                  getCharacterCount: _getCharacterCount,
                  scrollController: charactersScrollController,
                )),
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
                    context: context,
                    players: game.players,
                    getCharacter: game.script.getById,
                    addCharacter: _addCharacter,
                    removeCharacter: _removeCharacter,
                    toggleDead: _toggleDead,
                    updateNote: _updateNote,
                    scrollController: playersScrollController,
                    textEditingController: textEditingController)),
            Container(
                height: double.infinity,
                width: paneWidth,
                color: Colors.white,
                child: CharactersList(
                  characters: game.script.characters.values.toList(),
                  totalTownsfolk: Script.getBaseTownsfolkCount(game.players.length),
                  totalOutsiders: Script.getBaseOutsiderCount(game.players.length),
                  totalMinions: Script.getBaseMinionCount(game.players.length),
                  getAlignmentCount: _getAlignmentCount,
                  getCategoryCount: _getCategoryCount,
                  getCharacterCount: _getCharacterCount,
                  scrollController: charactersScrollController,
                )),
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
                          Store.clearGame();
                          Navigator.of(context).pop(true);
                          Navigator.of(context).pop();
                        },
                        child: const Text("EXIT"))
                  ],
                ))) ??
        false;
  }
}

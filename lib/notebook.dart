import 'dart:async';

import 'package:clocktower_notes/players.dart';
import 'package:flutter/material.dart' hide Alignment;

import 'model/player.dart';
import 'model/script.dart';
import 'model/tile.dart';

class NotebookPage extends StatefulWidget {
  final Script script;

  const NotebookPage({Key? key, required this.script}) : super(key: key);

  @override
  State<NotebookPage> createState() => _NotebookPageState();
}

class _NotebookPageState extends State<NotebookPage> {
  late List<Player> players = [];

  void addToPlayer(Player player, Tile tile) {
    setState(() {
      player.characters.add(tile);
    });
  }

  void removeFromPlayer(Player player, Tile tile) {
    setState(() {
      player.characters.remove(tile);
    });
  }

  void togglePlayerDead(Player player) {
    setState(() {
      player.dead = !player.dead;
    });
  }

  int getCharacterCount(Tile tile) {
    return players.fold(0, (prev, player) => (player.characters.contains(tile)) ? prev + 1 : prev );
  }

  int getCategoryCount(Category category) {
    return players.fold(0, (prev, player) => player.characters.fold(prev, (playerPrev, character) => (character.category == category) ? playerPrev + 1 : playerPrev ));
  }

  int getAlignmentCount(Alignment alignment) {
    return players.fold(0, (prev, player) => player.characters.fold(prev, (playerPrev, character) => (character.alignment == alignment) ? playerPrev + 1 : playerPrev ));
  }


  @override
  void initState() {
    super.initState();

    Timer.run(() {
      _awaitPlayerInfo();
    });
  }

  void _awaitPlayerInfo() async {
    List<Player> receivedPlayers = await Navigator.push(context, MaterialPageRoute(builder: (_) => const PlayersPage()));
    setState(() {
      players = receivedPlayers;
    });
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _confirmExit,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Script.getScriptColor(widget.script.scriptId),
          automaticallyImplyLeading: false,
          title: Text("${Script.getScriptTitle(widget.script.scriptId)} Notebook"),
          actions: [
            TextButton(
                onPressed: _confirmExit,
                child: const Text("END GAME",
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
                      return DragTarget<Tile>(
                          builder: (context, candidates, rejects) {
                            return _buildPlayerTile(
                              player: players.elementAt(index),
                            );
                          },
                          onAccept: (character) {
                            addToPlayer(players.elementAt(index), character);
                          }
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) => const Divider()
                ),
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
                          children: widget.script.tiles.where((element) => element.category == Category.unkown).map((tile) => _buildDraggableCharacterTile(
                              tile: tile,
                              count: getAlignmentCount(tile.alignment))
                          ).toList(),
                        ),
                        Text(
                          "Townsfolk (${getCategoryCount(Category.townsfolk).toString()}/${Script.getBaseTownsfolkCount(players.length)})",
                          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600, height: 2),
                        ),
                        Wrap(
                          spacing: 8,
                          children: widget.script.tiles.where((element) => element.category == Category.townsfolk).map((tile) => _buildDraggableCharacterTile(
                              tile: tile,
                              count: getCharacterCount(tile))
                          ).toList(),
                        ),
                        Text(
                          "Outsiders (${getCategoryCount(Category.outsider).toString()}/${Script.getBaseOutsiderCount(players.length)})",
                          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600, height: 2),
                        ),
                        Wrap(
                          spacing: 8,
                          children: widget.script.tiles.where((element) => element.category == Category.outsider).map((tile) => _buildDraggableCharacterTile(
                              tile: tile,
                              count: getCharacterCount(tile))
                          ).toList(),
                        ),
                        Text(
                          "Minions (${getCategoryCount(Category.minion).toString()}/${Script.getBaseMinionCount(players.length)})",
                          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600, height: 2),
                        ),
                        Wrap(
                          spacing: 8,
                          children: widget.script.tiles.where((element) => element.category == Category.minion).map((tile) => _buildDraggableCharacterTile(
                              tile: tile,
                              count: getCharacterCount(tile))
                          ).toList(),
                        ),
                        Text(
                          "Demons (${getCategoryCount(Category.demon).toString()}/1)",
                          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600, height: 2),
                        ),
                        Wrap(
                          spacing: 8,
                          children: widget.script.tiles.where((element) => element.category == Category.demon).map((tile) => _buildDraggableCharacterTile(
                              tile: tile,
                              count: getCharacterCount(tile))
                          ).toList(),
                        ),
                      ],
                    ),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _confirmExit() async {
    return (await showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(
              title: const Text("End Game"),
              content: const Text("Are you sure you want to clear all of your notes and return to the script menu?"),
              actions: [
                TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: const Text("CANCEL")
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                      Navigator.of(context).pop();
                    },
                    child: const Text("EXIT")
                )
              ],
            )
    )
    ) ?? false;
  }

  Widget _buildPlayerTile({required Player player}) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                player.name,
                style:const TextStyle(fontSize: 24),
              ),
              const Spacer(),
              IconButton(
                icon: Icon(
                  Icons.sentiment_very_dissatisfied_outlined,
                  color: (player.dead) ? Colors.purple.shade900 : Colors.black12,
                ),
                onPressed: () => togglePlayerDead(player),
              )
            ],
          ),
          Wrap(
            spacing: 8,
            children: player.characters.map((tile) => _buildCharacterTile(
                tile: tile, onRemove: () => removeFromPlayer(player, tile))).toList(),
          )
        ],
      ),
    );
  }

  Draggable<Tile> _buildDraggableCharacterTile({required Tile tile, int? count}) {
    return Draggable(
      data: tile,
      feedback: Material(
          color: Colors.transparent,
          child: _buildCharacterTile(tile: tile)
      ),
      child: _buildCharacterTile(tile: tile, count: count),
      onDragEnd: (details) => {
        debugPrint(details.wasAccepted.toString())
      },
    );
  }

  Widget _buildCharacterTile({required Tile tile, void Function()? onRemove, int? count}) {
    return Chip(
      padding: const EdgeInsets.all(8),
      avatar: Icon(
        tile.icon,
        color: (tile.alignment == Alignment.good) ? Colors.blue : Colors.red,
        size: 24,
      ),
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            tile.name,
            style: const TextStyle(fontSize: 20),
          ),
          if (count != null && count > 0)
            Container(
              width: 10,
            ),
          if (count != null && count > 0)
            Text(
                count.toString()
            )
        ],
      ),
      deleteIcon: const Icon(Icons.close),
      onDeleted: onRemove,
    );
  }
}
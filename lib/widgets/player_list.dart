import 'package:clocktower_notes/widgets/player_container.dart';
import 'package:flutter/material.dart';

import '../model/player.dart';
import '../model/tile.dart';

class PlayerList extends StatelessWidget {
  final List<Player> players;
  final Function(Player, Tile) addCharacter;
  final Function(Player, Tile) removeCharacter;
  final Function(Player) toggleDead;

  const PlayerList(
      {Key? key, required this.players, required this.addCharacter, required this.removeCharacter, required this.toggleDead})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: players.length,
        itemBuilder: (context, index) {
          return PlayerContainer(
            player: players.elementAt(index),
            addCharacter: addCharacter,
            removeCharacter: removeCharacter,
            toggleDead: toggleDead,
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            const Divider()
    );
  }
}
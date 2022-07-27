import 'package:clocktower_notes/widgets/player_container.dart';
import 'package:flutter/material.dart';

import '../model/player.dart';
import '../model/tile.dart';

class PlayerList extends StatelessWidget {
  final BuildContext context;
  final List<Player> players;
  final Function(Player, Tile) addCharacter;
  final Function(Player, Tile) removeCharacter;
  final Function(Player) toggleDead;
  final Function(Player, String) updateNote;
  final ScrollController scrollController;
  final TextEditingController textEditingController;

  const PlayerList(
      {Key? key,
      required this.context,
      required this.players,
      required this.addCharacter,
      required this.removeCharacter,
      required this.toggleDead,
      required this.updateNote,
      required this.scrollController,
      required this.textEditingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        controller: scrollController,
        itemCount: players.length,
        itemBuilder: (context, index) {
          return PlayerContainer(
            context: context,
            player: players.elementAt(index),
            addCharacter: addCharacter,
            removeCharacter: removeCharacter,
            toggleDead: toggleDead,
            updateNote: updateNote,
            textEditingController: textEditingController,
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(
          height: 0,
        ));
  }
}

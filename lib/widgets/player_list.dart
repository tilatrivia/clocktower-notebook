import 'package:clocktower_notes/model/character.dart';
import 'package:clocktower_notes/widgets/player_container.dart';
import 'package:flutter/material.dart';

import '../model/player.dart';

class PlayerList extends StatelessWidget {
  final BuildContext context;
  final List<Player> players;
  final Character Function(CharacterId) getCharacter;
  final void Function(Player, CharacterId) addCharacter;
  final void Function(Player, CharacterId) removeCharacter;
  final void Function(Player) toggleDead;
  final void Function(Player, String) updateNote;
  final ScrollController scrollController;
  final TextEditingController textEditingController;

  const PlayerList(
      {Key? key,
      required this.context,
      required this.players,
      required this.getCharacter,
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
            characters: players.elementAt(index).characters.map((cId) => getCharacter(cId)).toList(),
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

import 'package:clocktower_notes/widgets/character_tile.dart';
import 'package:flutter/material.dart';

import '../model/player.dart';
import '../model/tile.dart';

class PlayerContainer extends StatelessWidget {
  final BuildContext context;
  final Player player;
  final Function(Player, Tile) addCharacter;
  final Function(Player, Tile) removeCharacter;
  final Function(Player) toggleDead;
  final Function(Player, String) updateNote;
  final TextEditingController textEditingController;

  const PlayerContainer({
        Key? key,
        required this.context,
        required this.player,
        required this.addCharacter,
        required this.removeCharacter,
        required this.toggleDead,
        required this.updateNote,
        required this.textEditingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DragTarget<Tile>(
        builder: (context, candidates, rejects) {
          return Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      player.name,
                      style: const TextStyle(fontSize: 24),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: Icon(
                        Icons.sentiment_very_dissatisfied_outlined,
                        color:
                        (player.dead) ? Colors.purple.shade900 : Colors.black12,
                      ),
                      onPressed: () => toggleDead(player),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.edit,
                      ),
                      onPressed: _editNotes,
                    )
                  ],
                ),
                Wrap(
                  spacing: 8,
                  children: player.characters
                      .map((tile) =>
                      CharacterTile(
                          tile: tile,
                          onRemove: () => removeCharacter(player, tile)))
                      .toList(),
                ),
                if (player.note.isNotEmpty)
                  const SizedBox(
                  height: 8,
                ),
                if (player.note.isNotEmpty)
                  Text(
                    player.note,
                    style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          );
        },
        onWillAccept: (value) => !player.characters.contains(value),
        onAccept: (character) {
          addCharacter(player, character);
        });
  }

  void _editNotes() async {
    textEditingController.text = player.note;
    await showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(
              title: Text("Notes about ${player.name}"),
              content: TextField(
                autofocus: true,
                textCapitalization: TextCapitalization.sentences,
                controller: textEditingController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
              actions: [
                TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text("SAVE")
                ),
              ],
            )
    );
    updateNote(player, textEditingController.value.text);
  }

}
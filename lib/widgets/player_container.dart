import 'package:clocktower_notes/model/character.dart';
import 'package:clocktower_notes/widgets/character_tile.dart';
import 'package:flutter/material.dart';

import '../model/player.dart';

class PlayerContainer extends StatelessWidget {
  final BuildContext context;
  final Player player;
  final List<Character> characters;
  final void Function(Player, CharacterId) addCharacter;
  final void Function(Player, CharacterId) removeCharacter;
  final void Function(Player) toggleDead;
  final void Function(Player, String) updateNote;
  final TextEditingController textEditingController;

  const PlayerContainer({
        Key? key,
        required this.context,
        required this.player,
        required this.characters,
        required this.addCharacter,
        required this.removeCharacter,
        required this.toggleDead,
        required this.updateNote,
        required this.textEditingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DragTarget<CharacterId>(
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
                  children: characters
                      .map((c) =>
                      CharacterTile(
                          character: c,
                          onRemove: () => removeCharacter(player, c.characterId)))
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
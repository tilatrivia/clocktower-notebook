import 'package:clocktower_notes/widgets/character_tile.dart';
import 'package:flutter/material.dart';

import '../model/player.dart';
import '../model/tile.dart';

class PlayerContainer extends StatelessWidget {
  final Player player;
  final Function(Player, Tile) addCharacter;
  final Function(Player, Tile) removeCharacter;
  final Function(Player) toggleDead;

  const PlayerContainer({Key? key, required this.player, required this.addCharacter, required this.removeCharacter, required this.toggleDead}) : super(key: key);

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
                    )
                  ],
                ),
                Wrap(
                  spacing: 8,
                  children: player.characters
                      .map((tile) => CharacterTile(
                      tile: tile, onRemove: () => removeCharacter(player, tile)))
                      .toList(),
                )
              ],
            ),
          );
        },
        onWillAccept: (value) => !player.characters.contains(value),
        onAccept: (character) {
          addCharacter(player, character);
        });

  }

}
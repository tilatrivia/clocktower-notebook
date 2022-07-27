import 'package:clocktower_notes/model/characters.dart';
import 'package:flutter/material.dart' hide Alignment;
import '../model/tile.dart';

class CharacterTile extends StatelessWidget {
  final Tile tile;
  final int count;
  final Function()? onRemove;

  const CharacterTile({Key? key, required this.tile, this.count = 0, this.onRemove}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Draggable(
      data: tile,
      feedback: Material(
          color: Colors.transparent,
          child: _buildCharacterTile(context: context, tile: tile, dragging: true)
      ),
      childWhenDragging: _buildCharacterTile(context: context, tile: tile, count: count, onRemove: onRemove, behind: true),
      onDragEnd: (details) => {
        debugPrint(details.wasAccepted.toString())
      },
      onDragCompleted: onRemove,
      child: _buildCharacterTile(context: context, tile: tile, count: count, onRemove: onRemove),
    );
  }

  Widget _buildCharacterTile({required BuildContext context, required Tile tile, void Function()? onRemove, int count = 0, bool dragging = false, bool behind = false}) {
    return GestureDetector(
      onTap: () => showDialog(
          context: context,
          builder: (context) => SimpleDialog(
              title: SizedBox(
                width: double.infinity,
                child: Text(tile.name,
                  textAlign: TextAlign.center,
                ),
              ),
              children: [
                Icon(tile.character.icon,
                  size: 64,
                  color: (tile.alignment == Alignment.good) ? Colors.blue : Colors.red,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 8, left: 32, right: 32),
                  child: Text(tile.description,
                      style: const TextStyle(fontSize: 16)
                  ),
                )
              ]
          )
      ),
      child: Chip(
        elevation: (dragging) ? 4 : 0,
        backgroundColor: (behind) ? Colors.grey.shade100 : Colors.grey.shade300,
        padding: const EdgeInsets.all(8),
        avatar: Icon(
          tile.character.icon,
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
            if (count > 0)
              Container(
                width: 10,
              ),
            if (count > 0)
              Text(
                  count.toString()
              )
          ],
        ),
        deleteIcon: const Icon(Icons.close),
        onDeleted: (onRemove != null) ? () => { if (!behind) onRemove() } : null,
      ),
    );
  }
}

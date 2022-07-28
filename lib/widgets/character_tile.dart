import 'package:clocktower_notes/model/character.dart';
import 'package:clocktower_notes/model/icons.dart';
import 'package:flutter/material.dart';

class CharacterTile extends StatelessWidget {
  final Character character;
  final int count;
  final Function()? onRemove;

  const CharacterTile({Key? key, required this.character, this.count = 0, this.onRemove}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Draggable(
      data: character.characterId,
      feedback: Material(
          color: Colors.transparent,
          child: _buildCharacterTile(context: context, character: character, dragging: true)
      ),
      childWhenDragging: _buildCharacterTile(context: context, character: character, count: count, onRemove: onRemove, behind: true),
      onDragEnd: (details) => {
        debugPrint(details.wasAccepted.toString())
      },
      onDragCompleted: onRemove,
      child: _buildCharacterTile(context: context, character: character, count: count, onRemove: onRemove),
    );
  }

  Widget _buildCharacterTile({required BuildContext context, required Character character, void Function()? onRemove, int count = 0, bool dragging = false, bool behind = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 1, top: 1),
      child: GestureDetector(
        onTap: () => showDialog(
            context: context,
            builder: (context) => SimpleDialog(
                title: SizedBox(
                  width: 300,
                  child: Text(character.name,
                    textAlign: TextAlign.center,
                  ),
                ),
                children: [
                  Icon(character.icon.data,
                    size: 64,
                    color: (character.alignment == CharacterAlignment.good) ? Colors.blue : Colors.red,
                  ),
                  SizedBox(
                    width: 300,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 8, left: 32, right: 32),
                      child: Text(character.description,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 16)
                      ),
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
            character.icon.data,
            color: (character.alignment == CharacterAlignment.good)
                ? ClocktowerColors.alignmentGood.data
                : ClocktowerColors.alignmentEvil.data,
            size: 24,
          ),
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                character.name,
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
      ),
    );
  }
}

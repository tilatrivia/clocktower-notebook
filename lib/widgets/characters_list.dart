import 'package:flutter/material.dart' hide Alignment;

import '../model/character.dart';
import 'character_tile.dart';

class CharactersList extends StatelessWidget {
  final List<Character> characters;
  final int totalTownsfolk;
  final int totalOutsiders;
  final int totalMinions;
  final Function(CharacterAlignment) getAlignmentCount;
  final Function(CharacterType) getCategoryCount;
  final Function(CharacterId) getCharacterCount;
  final ScrollController scrollController;

  const CharactersList(
      {Key? key,
      required this.characters,
      required this.totalTownsfolk,
      required this.totalOutsiders,
      required this.totalMinions,
      required this.getAlignmentCount,
      required this.getCategoryCount,
      required this.getCharacterCount,
      required this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 8,
              children: characters
                  .where((char) => char.type == CharacterType.unkown)
                  .map((char) => CharacterTile(
                      character: char, count: getAlignmentCount(char.alignment)))
                  .toList(),
            ),
            Row(
              children: [
                const Text(
                  "Townsfolk",
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600, height: 2),
                ),
                Container(
                  width: 8,
                ),
                Text(
                  "${getCategoryCount(CharacterType.townsfolk).toString()}/$totalTownsfolk",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      height: 2.5,
                      color: Colors.black54),
                ),
              ],
            ),
            Wrap(
              spacing: 8,
              children: characters
                  .where((c) => c.type == CharacterType.townsfolk)
                  .map((c) =>
                      CharacterTile(character: c, count: getCharacterCount(c.characterId)))
                  .toList(),
            ),
            Row(
              children: [
                const Text(
                  "Outsiders",
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600, height: 2),
                ),
                Container(
                  width: 8,
                ),
                Text(
                  "${getCategoryCount(CharacterType.outsider).toString()}/$totalOutsiders",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      height: 2.5,
                      color: Colors.black54),
                ),
              ],
            ),
            Wrap(
              spacing: 8,
              children: characters
                  .where((c) => c.type == CharacterType.outsider)
                  .map((c) =>
                      CharacterTile(character: c, count: getCharacterCount(c.characterId)))
                  .toList(),
            ),
            Row(
              children: [
                const Text(
                  "Minions",
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600, height: 2),
                ),
                Container(
                  width: 8,
                ),
                Text(
                  "${getCategoryCount(CharacterType.minion).toString()}/$totalMinions",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      height: 2.5,
                      color: Colors.black54),
                ),
              ],
            ),
            Wrap(
              spacing: 8,
              children: characters
                  .where((c) => c.type == CharacterType.minion)
                  .map((c) =>
                      CharacterTile(character: c, count: getCharacterCount(c.characterId)))
                  .toList(),
            ),
            Row(
              children: [
                const Text(
                  "Demons",
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600, height: 2),
                ),
                Container(
                  width: 8,
                ),
                Text(
                  "${getCategoryCount(CharacterType.demon).toString()}/1",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      height: 2.5,
                      color: Colors.black54),
                ),
              ],
            ),
            Wrap(
              spacing: 8,
              children: characters
                  .where((c) => c.type == CharacterType.demon)
                  .map((c) =>
                      CharacterTile(character: c, count: getCharacterCount(c.characterId)))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

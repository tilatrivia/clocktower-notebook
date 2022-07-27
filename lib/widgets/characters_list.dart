import 'package:flutter/material.dart' hide Alignment;

import '../model/tile.dart';
import 'character_tile.dart';

class CharactersList extends StatelessWidget {
  final List<Tile> characters;
  final int totalTownsfolk;
  final int totalOutsiders;
  final int totalMinions;
  final Function(Alignment) getAlignmentCount;
  final Function(Category) getCategoryCount;
  final Function(Tile) getCharacterCount;

  const CharactersList(
      {Key? key,
      required this.characters,
      required this.totalTownsfolk,
      required this.totalOutsiders,
      required this.totalMinions,
      required this.getAlignmentCount,
      required this.getCategoryCount,
      required this.getCharacterCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 8,
              children: characters
                  .where((element) => element.category == Category.unkown)
                  .map((tile) => CharacterTile(
                      tile: tile, count: getAlignmentCount(tile.alignment)))
                  .toList(),
            ),
            Row(
              children: [
                const Text(
                  "Townsfolk",
                  style: TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w600, height: 2),
                ),
                Container(
                  width: 8,
                ),
                Text(
                  "${getCategoryCount(Category.townsfolk).toString()}/$totalTownsfolk",
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
                  .where((element) => element.category == Category.townsfolk)
                  .map((tile) =>
                      CharacterTile(tile: tile, count: getCharacterCount(tile)))
                  .toList(),
            ),
            Row(
              children: [
                const Text(
                  "Outsiders",
                  style: TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w600, height: 2),
                ),
                Container(
                  width: 8,
                ),
                Text(
                  "${getCategoryCount(Category.outsider).toString()}/$totalOutsiders",
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
                  .where((element) => element.category == Category.outsider)
                  .map((tile) =>
                      CharacterTile(tile: tile, count: getCharacterCount(tile)))
                  .toList(),
            ),
            Row(
              children: [
                const Text(
                  "Minions",
                  style: TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w600, height: 2),
                ),
                Container(
                  width: 8,
                ),
                Text(
                  "${getCategoryCount(Category.minion).toString()}/$totalMinions",
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
                  .where((element) => element.category == Category.minion)
                  .map((tile) =>
                      CharacterTile(tile: tile, count: getCharacterCount(tile)))
                  .toList(),
            ),
            Row(
              children: [
                const Text(
                  "Demons",
                  style: TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w600, height: 2),
                ),
                Container(
                  width: 8,
                ),
                Text(
                  "${getCategoryCount(Category.demon).toString()}/1",
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
                  .where((element) => element.category == Category.demon)
                  .map((tile) =>
                      CharacterTile(tile: tile, count: getCharacterCount(tile)))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

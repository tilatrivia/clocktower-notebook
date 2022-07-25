import 'package:clocktower_notes/model/tile.dart';

class Player {
  final String name;
  Set<Tile> characters;
  String note;
  bool dead;

  Player(this.name) : characters = {}, note = "", dead = false;
}
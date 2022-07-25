import 'package:flutter/material.dart';

class Tile {
  final String name;
  final IconData icon;
  final Alignment alignment;
  final Category category;

  const Tile(this.name, this.category, this.alignment, this.icon);

  bool isEqual(Tile other) {
    return name == other.name
      && alignment == other.alignment
      && category == other.category;
  }
}

enum Alignment {
  good,
  evil
}

enum Category {
  townsfolk,
  outsider,
  minion,
  demon,
  unkown
}

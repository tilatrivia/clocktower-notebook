import 'package:flutter/material.dart';

class Tile {
  final String name;
  final IconData icon;
  final Alignment alignment;
  final Category category;
  final String description;

  const Tile({required this.name, required this.category, required this.alignment, required this.icon, this.description = ""});

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

import 'package:json_annotation/json_annotation.dart';
import 'characters.dart';

part 'tile.g.dart';

@JsonSerializable()
class Tile {
  final String name;
  final Characters character;
  final Alignment alignment;
  final Category category;
  final String description;

  const Tile({required this.name, required this.character, required this.category, required this.alignment, this.description = ""});

  factory Tile.fromJson(Map<String, dynamic> json) => _$TileFromJson(json);

  Map<String, dynamic> toJson() => _$TileToJson(this);

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

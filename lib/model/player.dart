import 'package:clocktower_notes/model/tile.dart';
import 'package:json_annotation/json_annotation.dart';

part 'player.g.dart';

@JsonSerializable()
class Player {
  static const String playersKey = "players";

  final String name;
  Set<Tile> characters;
  String note;
  bool dead;

  Player(this.name) : characters = {}, note = "", dead = false;

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerToJson(this);
}
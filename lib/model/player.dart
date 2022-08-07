import 'package:clocktower_notes/model/character.dart';
import 'package:json_annotation/json_annotation.dart';

part 'player.g.dart';

@JsonSerializable()
class Player {

  final String name;
  Set<CharacterId> characters;
  String note;
  bool dead;

  Player(this.name) : characters = {}, note = "", dead = false;

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerToJson(this);
}
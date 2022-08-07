import 'package:clocktower_notes/model/player.dart';
import 'package:clocktower_notes/model/script.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game.g.dart';

@JsonSerializable()
class Game {
  static const String gameKey = "game";

  final Script script;
  final List<Player> players;

  Game(this.script, this.players);

  Game.withScript(this.script) : players = [];

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);

  Map<String, dynamic> toJson() => _$GameToJson(this);
}
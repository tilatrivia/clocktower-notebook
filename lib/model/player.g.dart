// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Player _$PlayerFromJson(Map<String, dynamic> json) => Player(
      json['name'] as String,
    )
      ..characters = (json['characters'] as List<dynamic>)
          .map((e) => Tile.fromJson(e as Map<String, dynamic>))
          .toSet()
      ..note = json['note'] as String
      ..dead = json['dead'] as bool;

Map<String, dynamic> _$PlayerToJson(Player instance) => <String, dynamic>{
      'name': instance.name,
      'characters': instance.characters.toList(),
      'note': instance.note,
      'dead': instance.dead,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'script.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Script _$ScriptFromJson(Map<String, dynamic> json) => Script()
  ..tiles = (json['tiles'] as List<dynamic>)
      .map((e) => Tile.fromJson(e as Map<String, dynamic>))
      .toList()
  ..scriptId = $enumDecode(_$ScriptsEnumMap, json['scriptId']);

Map<String, dynamic> _$ScriptToJson(Script instance) => <String, dynamic>{
      'tiles': instance.tiles,
      'scriptId': _$ScriptsEnumMap[instance.scriptId]!,
    };

const _$ScriptsEnumMap = {
  Scripts.troubleBrewing: 'troubleBrewing',
  Scripts.sectsAndViolets: 'sectsAndViolets',
  Scripts.badMoonRising: 'badMoonRising',
  Scripts.custom: 'custom',
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'script.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Script _$ScriptFromJson(Map<String, dynamic> json) => Script(
      (json['characters'] as Map<String, dynamic>).map(
        (k, e) => MapEntry($enumDecode(_$CharacterIdEnumMap, k),
            Character.fromJson(e as Map<String, dynamic>)),
      ),
      $enumDecode(_$ScriptsEnumMap, json['scriptId']),
      json['name'] as String,
      $enumDecode(_$ClocktowerColorsEnumMap, json['color']),
    );

Map<String, dynamic> _$ScriptToJson(Script instance) => <String, dynamic>{
      'characters': instance.characters
          .map((k, e) => MapEntry(_$CharacterIdEnumMap[k]!, e)),
      'scriptId': _$ScriptsEnumMap[instance.scriptId]!,
      'name': instance.name,
      'color': _$ClocktowerColorsEnumMap[instance.color]!,
    };

const _$CharacterIdEnumMap = {
  CharacterId.alignmentGood: 'alignmentGood',
  CharacterId.alignmentEvil: 'alignmentEvil',
  CharacterId.washerwoman: 'washerwoman',
  CharacterId.librarian: 'librarian',
  CharacterId.investigator: 'investigator',
  CharacterId.chef: 'chef',
  CharacterId.empath: 'empath',
  CharacterId.fortuneTeller: 'fortuneTeller',
  CharacterId.undertaker: 'undertaker',
  CharacterId.monk: 'monk',
  CharacterId.ravenkeeper: 'ravenkeeper',
  CharacterId.virgin: 'virgin',
  CharacterId.slayer: 'slayer',
  CharacterId.soldier: 'soldier',
  CharacterId.mayor: 'mayor',
  CharacterId.butler: 'butler',
  CharacterId.drunk: 'drunk',
  CharacterId.recluse: 'recluse',
  CharacterId.saint: 'saint',
  CharacterId.poisoner: 'poisoner',
  CharacterId.spy: 'spy',
  CharacterId.scarlettWoman: 'scarlettWoman',
  CharacterId.baron: 'baron',
  CharacterId.imp: 'imp',
  CharacterId.clockmaker: 'clockmaker',
  CharacterId.dreamer: 'dreamer',
  CharacterId.snakeCharmer: 'snakeCharmer',
  CharacterId.mathematician: 'mathematician',
  CharacterId.flowergirl: 'flowergirl',
  CharacterId.townCrier: 'townCrier',
  CharacterId.oracle: 'oracle',
  CharacterId.savant: 'savant',
  CharacterId.seamstress: 'seamstress',
  CharacterId.philosopher: 'philosopher',
  CharacterId.artist: 'artist',
  CharacterId.juggler: 'juggler',
  CharacterId.sage: 'sage',
  CharacterId.mutant: 'mutant',
  CharacterId.sweetheart: 'sweetheart',
  CharacterId.barber: 'barber',
  CharacterId.klutz: 'klutz',
  CharacterId.evilTwin: 'evilTwin',
  CharacterId.witch: 'witch',
  CharacterId.cerenovus: 'cerenovus',
  CharacterId.pitHag: 'pitHag',
  CharacterId.fangGu: 'fangGu',
  CharacterId.vigormortis: 'vigormortis',
  CharacterId.noDashii: 'noDashii',
  CharacterId.vortox: 'vortox',
  CharacterId.grandmother: 'grandmother',
  CharacterId.sailor: 'sailor',
  CharacterId.chambermaid: 'chambermaid',
  CharacterId.exorcist: 'exorcist',
  CharacterId.innkeeper: 'innkeeper',
  CharacterId.gambler: 'gambler',
  CharacterId.gossip: 'gossip',
  CharacterId.courtier: 'courtier',
  CharacterId.professor: 'professor',
  CharacterId.minstrel: 'minstrel',
  CharacterId.teaLady: 'teaLady',
  CharacterId.pacifist: 'pacifist',
  CharacterId.fool: 'fool',
  CharacterId.goon: 'goon',
  CharacterId.lunatic: 'lunatic',
  CharacterId.tinker: 'tinker',
  CharacterId.moonchild: 'moonchild',
  CharacterId.godfather: 'godfather',
  CharacterId.devilsAdvocate: 'devilsAdvocate',
  CharacterId.assassin: 'assassin',
  CharacterId.mastermind: 'mastermind',
  CharacterId.zombuul: 'zombuul',
  CharacterId.pukka: 'pukka',
  CharacterId.shabaloth: 'shabaloth',
  CharacterId.po: 'po',
};

const _$ScriptsEnumMap = {
  Scripts.troubleBrewing: 'troubleBrewing',
  Scripts.sectsAndViolets: 'sectsAndViolets',
  Scripts.badMoonRising: 'badMoonRising',
  Scripts.fabled: 'fabled',
  Scripts.none: 'none',
  Scripts.custom: 'custom',
};

const _$ClocktowerColorsEnumMap = {
  ClocktowerColors.alignmentGood: 'alignmentGood',
  ClocktowerColors.alignmentEvil: 'alignmentEvil',
  ClocktowerColors.scriptTroubleBrewing: 'scriptTroubleBrewing',
  ClocktowerColors.scriptSectsAndViolets: 'scriptSectsAndViolets',
  ClocktowerColors.scriptBadMoonRising: 'scriptBadMoonRising',
  ClocktowerColors.scriptCustom: 'scriptCustom',
};

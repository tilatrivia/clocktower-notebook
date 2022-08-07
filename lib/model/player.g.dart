// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Player _$PlayerFromJson(Map<String, dynamic> json) => Player(
      json['name'] as String,
    )
      ..characters = (json['characters'] as List<dynamic>)
          .map((e) => $enumDecode(_$CharacterIdEnumMap, e))
          .toSet()
      ..note = json['note'] as String
      ..dead = json['dead'] as bool;

Map<String, dynamic> _$PlayerToJson(Player instance) => <String, dynamic>{
      'name': instance.name,
      'characters':
          instance.characters.map((e) => _$CharacterIdEnumMap[e]!).toList(),
      'note': instance.note,
      'dead': instance.dead,
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

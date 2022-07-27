// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tile _$TileFromJson(Map<String, dynamic> json) => Tile(
      name: json['name'] as String,
      character: $enumDecode(_$CharactersEnumMap, json['character']),
      category: $enumDecode(_$CategoryEnumMap, json['category']),
      alignment: $enumDecode(_$AlignmentEnumMap, json['alignment']),
      description: json['description'] as String? ?? "",
    );

Map<String, dynamic> _$TileToJson(Tile instance) => <String, dynamic>{
      'name': instance.name,
      'character': _$CharactersEnumMap[instance.character]!,
      'alignment': _$AlignmentEnumMap[instance.alignment]!,
      'category': _$CategoryEnumMap[instance.category]!,
      'description': instance.description,
    };

const _$CharactersEnumMap = {
  Characters.good: 'good',
  Characters.evil: 'evil',
  Characters.washerwoman: 'washerwoman',
  Characters.librarian: 'librarian',
  Characters.investigator: 'investigator',
  Characters.chef: 'chef',
  Characters.empath: 'empath',
  Characters.fortuneTeller: 'fortuneTeller',
  Characters.undertaker: 'undertaker',
  Characters.monk: 'monk',
  Characters.ravenkeeper: 'ravenkeeper',
  Characters.virgin: 'virgin',
  Characters.slayer: 'slayer',
  Characters.soldier: 'soldier',
  Characters.mayor: 'mayor',
  Characters.butler: 'butler',
  Characters.drunk: 'drunk',
  Characters.recluse: 'recluse',
  Characters.saint: 'saint',
  Characters.poisoner: 'poisoner',
  Characters.spy: 'spy',
  Characters.scarlettWoman: 'scarlettWoman',
  Characters.baron: 'baron',
  Characters.imp: 'imp',
  Characters.clockmaker: 'clockmaker',
  Characters.dreamer: 'dreamer',
  Characters.snakeCharmer: 'snakeCharmer',
  Characters.mathematician: 'mathematician',
  Characters.flowerGirl: 'flowerGirl',
  Characters.townCrier: 'townCrier',
  Characters.oracle: 'oracle',
  Characters.savant: 'savant',
  Characters.seamstress: 'seamstress',
  Characters.philosopher: 'philosopher',
  Characters.artist: 'artist',
  Characters.juggler: 'juggler',
  Characters.sage: 'sage',
  Characters.mutant: 'mutant',
  Characters.sweetheart: 'sweetheart',
  Characters.barber: 'barber',
  Characters.klutz: 'klutz',
  Characters.evilTwin: 'evilTwin',
  Characters.witch: 'witch',
  Characters.cerenovus: 'cerenovus',
  Characters.pitHag: 'pitHag',
  Characters.fangGu: 'fangGu',
  Characters.vigimortis: 'vigimortis',
  Characters.noDashii: 'noDashii',
  Characters.vortox: 'vortox',
  Characters.grandmother: 'grandmother',
  Characters.sailor: 'sailor',
  Characters.chambermaid: 'chambermaid',
  Characters.exorcist: 'exorcist',
  Characters.innkeeper: 'innkeeper',
  Characters.gambler: 'gambler',
  Characters.gossip: 'gossip',
  Characters.courtier: 'courtier',
  Characters.professor: 'professor',
  Characters.minstrel: 'minstrel',
  Characters.teaLady: 'teaLady',
  Characters.pacifist: 'pacifist',
  Characters.fool: 'fool',
  Characters.goon: 'goon',
  Characters.lunatic: 'lunatic',
  Characters.tinker: 'tinker',
  Characters.moonchild: 'moonchild',
  Characters.godfather: 'godfather',
  Characters.devilsAdvocate: 'devilsAdvocate',
  Characters.assassin: 'assassin',
  Characters.mastermind: 'mastermind',
  Characters.zombuul: 'zombuul',
  Characters.pukka: 'pukka',
  Characters.shabaloth: 'shabaloth',
  Characters.po: 'po',
};

const _$CategoryEnumMap = {
  Category.townsfolk: 'townsfolk',
  Category.outsider: 'outsider',
  Category.minion: 'minion',
  Category.demon: 'demon',
  Category.unkown: 'unkown',
};

const _$AlignmentEnumMap = {
  Alignment.good: 'good',
  Alignment.evil: 'evil',
};

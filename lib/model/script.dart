import 'package:clocktower_notes/model/character.dart';
import 'package:clocktower_notes/model/icons.dart';
import 'package:json_annotation/json_annotation.dart';
import 'character.dart';

part 'script.g.dart';

@JsonSerializable()
class Script {
  static const String scriptKey = "script";

  final Map<CharacterId, Character> characters;
  final Scripts scriptId;
  final String name;
  final ClocktowerColors color;

  factory Script.fromJson(Map<String, dynamic> json) => _$ScriptFromJson(json);

  Map<String, dynamic> toJson() => _$ScriptToJson(this);

  Script(this.characters, this.scriptId, this.name, this.color);

  Script.custom(this.name) : characters = {}, scriptId = Scripts.custom, color = ClocktowerColors.scriptCustom;

  Script.troubleBrewing() : characters = {}, scriptId = Scripts.troubleBrewing, name = "Trouble Brewing", color = ClocktowerColors.scriptTroubleBrewing {
    // Alignments
    _addById(CharacterId.alignmentGood);
    _addById(CharacterId.alignmentEvil);

    // Townsfolk
    _addById(CharacterId.washerwoman);
    _addById(CharacterId.librarian);
    _addById(CharacterId.investigator);
    _addById(CharacterId.chef);
    _addById(CharacterId.empath);
    _addById(CharacterId.fortuneTeller);
    _addById(CharacterId.undertaker);
    _addById(CharacterId.monk);
    _addById(CharacterId.ravenkeeper);
    _addById(CharacterId.virgin);
    _addById(CharacterId.slayer);
    _addById(CharacterId.soldier);
    _addById(CharacterId.mayor);

    // Outsiders
    _addById(CharacterId.butler);
    _addById(CharacterId.recluse);
    _addById(CharacterId.drunk);
    _addById(CharacterId.saint);

    // Minions
    _addById(CharacterId.poisoner);
    _addById(CharacterId.spy);
    _addById(CharacterId.baron);
    _addById(CharacterId.scarlettWoman);

    // Demons
    _addById(CharacterId.imp);
  }

  Script.sectsAndViolets() : characters = {}, scriptId = Scripts.sectsAndViolets, name = "Sects and Violets", color = ClocktowerColors.scriptSectsAndViolets {
    // Alignments
    _addById(CharacterId.alignmentGood);
    _addById(CharacterId.alignmentEvil);

    // Townsfolk
    _addById(CharacterId.clockmaker);
    _addById(CharacterId.dreamer);
    _addById(CharacterId.snakeCharmer);
    _addById(CharacterId.mathematician);
    _addById(CharacterId.flowergirl);
    _addById(CharacterId.townCrier);
    _addById(CharacterId.oracle);
    _addById(CharacterId.savant);
    _addById(CharacterId.seamstress);
    _addById(CharacterId.philosopher);
    _addById(CharacterId.artist);
    _addById(CharacterId.juggler);
    _addById(CharacterId.sage);

    // Outsiders
    _addById(CharacterId.mutant);
    _addById(CharacterId.sweetheart);
    _addById(CharacterId.barber);
    _addById(CharacterId.klutz);

    // Minions
    _addById(CharacterId.evilTwin);
    _addById(CharacterId.witch);
    _addById(CharacterId.cerenovus);
    _addById(CharacterId.pitHag);

    // Demons
    _addById(CharacterId.fangGu);
    _addById(CharacterId.vigormortis);
    _addById(CharacterId.noDashii);
    _addById(CharacterId.vortox);
  }


  Script.badMoodRising() : characters = {}, scriptId = Scripts.badMoonRising, name = "Bad Moon Rising", color = ClocktowerColors.scriptBadMoonRising {
    // Alignments
    _addById(CharacterId.alignmentGood);
    _addById(CharacterId.alignmentEvil);

    // Townsfolk
    _addById(CharacterId.grandmother);
    _addById(CharacterId.sailor);
    _addById(CharacterId.chambermaid);
    _addById(CharacterId.exorcist);
    _addById(CharacterId.innkeeper);
    _addById(CharacterId.gambler);
    _addById(CharacterId.gossip);
    _addById(CharacterId.courtier);
    _addById(CharacterId.professor);
    _addById(CharacterId.minstrel);
    _addById(CharacterId.teaLady);
    _addById(CharacterId.pacifist);
    _addById(CharacterId.fool);

    // Outsiders
    _addById(CharacterId.goon);
    _addById(CharacterId.lunatic);
    _addById(CharacterId.tinker);
    _addById(CharacterId.moonchild);

    // Minions
    _addById(CharacterId.godfather);
    _addById(CharacterId.devilsAdvocate);
    _addById(CharacterId.assassin);
    _addById(CharacterId.mastermind);

    // Demons
    _addById(CharacterId.zombuul);
    _addById(CharacterId.pukka);
    _addById(CharacterId.shabaloth);
    _addById(CharacterId.po);
  }
  
  void _addById(CharacterId characterId) {
    characters.putIfAbsent(characterId, () => Character.byId(characterId));
  }
  
  Character getById(CharacterId characterId) {
    Character? character = characters[characterId];
    if (character == null) throw Exception("CharacterId requested from Script is not found");
    return character;
  }

  static int getBaseTownsfolkCount(int players) {
    switch (players) {
      case 0:
      case 1:
      case 2:
      case 3:
      case 4:
        return 0; // TODO: Check Teensytown rules
      case 5:
      case 6:
        return 3;
      case 7:
      case 8:
      case 9:
        return 5;
      case 10:
      case 11:
      case 12:
        return 7;
      case 13:
      case 14:
      case 15:
        return 9;
      default:
        return 9;
    }
  }

  static int getBaseOutsiderCount(int players) {
    switch (players) {
      case 0:
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
        return 0; // TODO: Check Teensytown rules
      case 6:
        return 1;
      case 7:
        return 0;
      case 8:
        return 1;
      case 9:
        return 2;
      case 10:
        return 0;
      case 11:
        return 1;
      case 12:
        return 2;
      case 13:
        return 0;
      case 14:
        return 1;
      case 15:
        return 2;
      default:
        return 2;
    }
  }

  static int getBaseMinionCount(int players) {
    switch (players) {
      case 0:
      case 1:
      case 2:
      case 3:
      case 4:
        return 0; // TODO: Check Teensytown rules
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
        return 1;
      case 10:
      case 11:
      case 12:
        return 2;
      case 13:
      case 14:
      case 15:
        return 3;
      default:
        return 3;
    }
  }
}

enum Scripts {
  troubleBrewing,
  sectsAndViolets,
  badMoonRising,
  fabled,
  none,
  custom
}

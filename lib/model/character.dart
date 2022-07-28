import 'package:clocktower_notes/model/icons.dart';
import 'package:clocktower_notes/model/script.dart';
import 'package:json_annotation/json_annotation.dart';

part 'character.g.dart';

@JsonSerializable()
class Character {
  final CharacterId characterId;
  final String name;
  final CharacterType type;
  final CharacterAlignment alignment;
  final ClocktowerIcons icon;
  final Scripts primaryScript;
  final String description;

  const Character(
      {required this.characterId,
      required this.primaryScript,
      required this.name,
      required this.type,
      required this.alignment,
      required this.icon,
      required this.description});

  factory Character.fromJson(Map<String, dynamic> json) => _$CharacterFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterToJson(this);

  factory Character.byId(CharacterId id) {
    switch (id) {
      case CharacterId.alignmentGood:
        return const Character(
            characterId: CharacterId.alignmentGood,
            primaryScript: Scripts.none,
            name: "Good",
            type: CharacterType.unkown,
            alignment: CharacterAlignment.good,
            icon: ClocktowerIcons.alignmentGood,
            description: "Could be any character on the good team.");
      case CharacterId.alignmentEvil:
        return const Character(
            characterId: CharacterId.alignmentEvil,
            primaryScript: Scripts.none,
            name: "Evil",
            type: CharacterType.unkown,
            alignment: CharacterAlignment.evil,
            icon: ClocktowerIcons.alignmentEvil,
            description: "Could be any character working for evil.");
      case CharacterId.washerwoman:
        return const Character(
            characterId: CharacterId.washerwoman,
            primaryScript: Scripts.troubleBrewing,
            name: "Washerwoman",
            type: CharacterType.townsfolk,
            alignment: CharacterAlignment.good,
            icon: ClocktowerIcons.characterWasherwoman,
            description:
                "You start knowing that 1 of 2 players is a particular Townsfolk.");
      case CharacterId.librarian:
        return const Character(
            characterId: CharacterId.librarian,
            primaryScript: Scripts.troubleBrewing,
            name: "Librarian",
            type: CharacterType.townsfolk,
            alignment: CharacterAlignment.good,
            icon: ClocktowerIcons.characterLibrarian,
            description:
                "You start knowing that 1 of 2 players is a particular Outsider. (Or that zero are in play.)");
      case CharacterId.investigator:
        return const Character(
            characterId: CharacterId.investigator,
            primaryScript: Scripts.troubleBrewing,
            name: "Investigator",
            type: CharacterType.townsfolk,
            alignment: CharacterAlignment.good,
            icon: ClocktowerIcons.characterInvestigator,
            description:
                "You start knowing that 1 of 2 players is a particular Minion.");
      case CharacterId.chef:
        return const Character(
            characterId: CharacterId.chef,
            primaryScript: Scripts.troubleBrewing,
            name: "Chef",
            type: CharacterType.townsfolk,
            alignment: CharacterAlignment.good,
            icon: ClocktowerIcons.characterChef,
            description:
                "You start knowing how many pairs of evil players there are.");
      case CharacterId.empath:
        return const Character(
            characterId: CharacterId.empath,
            primaryScript: Scripts.troubleBrewing,
            name: "Empath",
            type: CharacterType.townsfolk,
            alignment: CharacterAlignment.good,
            icon: ClocktowerIcons.characterEmpath,
            description:
                "Each night, you learn how many of your 2 alive neighbours are evil.");
      case CharacterId.fortuneTeller:
        return const Character(
            characterId: CharacterId.fortuneTeller,
            primaryScript: Scripts.troubleBrewing,
            name: "Fortune Teller",
            type: CharacterType.townsfolk,
            alignment: CharacterAlignment.good,
            icon: ClocktowerIcons.characterFortuneTeller,
            description:
                "Each night, choose 2 players: you learn if either is a Demon. There is a good player that registers as a Demon to you.");
      case CharacterId.undertaker:
        return const Character(
            characterId: CharacterId.undertaker,
            primaryScript: Scripts.troubleBrewing,
            name: "Undertaker",
            type: CharacterType.townsfolk,
            alignment: CharacterAlignment.good,
            icon: ClocktowerIcons.characterUndertaker,
            description:
                "Each night except for the first, you learn which character died by execution today.");
      case CharacterId.monk:
        return const Character(
            characterId: CharacterId.monk,
            primaryScript: Scripts.troubleBrewing,
            name: "Monk",
            type: CharacterType.townsfolk,
            alignment: CharacterAlignment.good,
            icon: ClocktowerIcons.characterMonk,
            description:
                "Each night except for the first, choose a player (not yourself): they are safe from the Demon tonight.");
      case CharacterId.ravenkeeper:
        return const Character(
            characterId: CharacterId.ravenkeeper,
            primaryScript: Scripts.troubleBrewing,
            name: "Ravenkeeper",
            type: CharacterType.townsfolk,
            alignment: CharacterAlignment.good,
            icon: ClocktowerIcons.characterRavenkeeper,
            description:
                "If you die at night, you are woken to choose a player: you learn their character.");
      case CharacterId.virgin:
        return const Character(
            characterId: CharacterId.virgin,
            primaryScript: Scripts.troubleBrewing,
            name: "Virgin",
            type: CharacterType.townsfolk,
            alignment: CharacterAlignment.good,
            icon: ClocktowerIcons.characterVirgin,
            description:
                "The 1st time you are nominated, if the nominator is a Townsfolk, they are executed immediately.");
      case CharacterId.slayer:
        return const Character(
            characterId: CharacterId.slayer,
            primaryScript: Scripts.troubleBrewing,
            name: "Slayer",
            type: CharacterType.townsfolk,
            alignment: CharacterAlignment.good,
            icon: ClocktowerIcons.characterSlayer,
            description:
                "Once per game, during the day, publicly choose a player: if they are the Demon, they die.");
      case CharacterId.soldier:
        return const Character(
            characterId: CharacterId.soldier,
            primaryScript: Scripts.troubleBrewing,
            name: "Soldier",
            type: CharacterType.townsfolk,
            alignment: CharacterAlignment.good,
            icon: ClocktowerIcons.characterSoldier,
            description: "You are safe from the Demon.");
      case CharacterId.mayor:
        return const Character(
            characterId: CharacterId.mayor,
            primaryScript: Scripts.troubleBrewing,
            name: "Mayor",
            type: CharacterType.townsfolk,
            alignment: CharacterAlignment.good,
            icon: ClocktowerIcons.characterMayor,
            description:
                "If only 3 players live & no execution occurs, your team wins. If you die at night, another player might die instead.");
      case CharacterId.butler:
        return const Character(
            characterId: CharacterId.butler,
            primaryScript: Scripts.troubleBrewing,
            name: "Butler",
            type: CharacterType.outsider,
            alignment: CharacterAlignment.good,
            icon: ClocktowerIcons.characterButler,
            description:
                "Each night, choose a player (not yourself): tomorrow, you may only vote if they are voting too.");
      case CharacterId.recluse:
        return const Character(
            characterId: CharacterId.recluse,
            primaryScript: Scripts.troubleBrewing,
            name: "Recluse",
            type: CharacterType.outsider,
            alignment: CharacterAlignment.good,
            icon: ClocktowerIcons.characterRecluse,
            description:
                "You might register as evil & as a Minion or Demon, even if dead.");
      case CharacterId.drunk:
        return const Character(
            characterId: CharacterId.drunk,
            primaryScript: Scripts.troubleBrewing,
            name: "Drunk",
            type: CharacterType.outsider,
            alignment: CharacterAlignment.good,
            icon: ClocktowerIcons.characterDrunk,
            description:
                "You do not know you are the Drunk. You think you are a Townsfolk character, but you are not.");
      case CharacterId.saint:
        return const Character(
            characterId: CharacterId.saint,
            primaryScript: Scripts.troubleBrewing,
            name: "Saint",
            type: CharacterType.outsider,
            alignment: CharacterAlignment.good,
            icon: ClocktowerIcons.characterSaint,
            description: "If you die by execution, your team loses.");
      case CharacterId.poisoner:
        return const Character(
            characterId: CharacterId.poisoner,
            primaryScript: Scripts.troubleBrewing,
            name: "Poisoner",
            type: CharacterType.minion,
            alignment: CharacterAlignment.evil,
            icon: ClocktowerIcons.characterPoisoner,
            description:
                "Each night, choose a player: they are poisoned tonight and tomorrow day.");
      case CharacterId.spy:
        return const Character(
            characterId: CharacterId.spy,
            primaryScript: Scripts.troubleBrewing,
            name: "Spy",
            type: CharacterType.minion,
            alignment: CharacterAlignment.evil,
            icon: ClocktowerIcons.characterSpy,
            description:
                "Each night, you see the Grimoire. You might register as good & as a Townsfolk or Outsider, even if dead.");
      case CharacterId.baron:
        return const Character(
            characterId: CharacterId.baron,
            primaryScript: Scripts.troubleBrewing,
            name: "Baron",
            type: CharacterType.minion,
            alignment: CharacterAlignment.evil,
            icon: ClocktowerIcons.characterBaron,
            description: "There are extra Outsiders in play. [+2 Outsiders]");
      case CharacterId.scarlettWoman:
        return const Character(
            characterId: CharacterId.scarlettWoman,
            primaryScript: Scripts.troubleBrewing,
            name: "Scarlett Woman",
            type: CharacterType.minion,
            alignment: CharacterAlignment.evil,
            icon: ClocktowerIcons.characterScarlettWoman,
            description:
                "If there are 5 or more players alive & the Demon dies, you become the Demon. (Travellers don't count)");
      case CharacterId.imp:
        return const Character(
            characterId: CharacterId.imp,
            primaryScript: Scripts.troubleBrewing,
            name: "Imp",
            type: CharacterType.demon,
            alignment: CharacterAlignment.evil,
            icon: ClocktowerIcons.characterImp,
            description:
                "Each night except for the first, choose a player: they die. If you kill yourself this way, a Minion becomes the Imp.");

      // Sects and Violets
      case CharacterId.clockmaker:
        return const Character(
            characterId: CharacterId.clockmaker,
            primaryScript: Scripts.sectsAndViolets,
            name: "Clockmaker",
            type: CharacterType.townsfolk,
            alignment: CharacterAlignment.good,
            icon: ClocktowerIcons.characterClockmaker,
            description: "Description");
      case CharacterId.dreamer:
        return const Character(
            characterId: CharacterId.dreamer,
            primaryScript: Scripts.sectsAndViolets,
            name: "Dreamer",
            type: CharacterType.townsfolk,
            alignment: CharacterAlignment.good,
            icon: ClocktowerIcons.characterDreamer,
            description: "Description");
      case CharacterId.snakeCharmer:
        return const Character(
            characterId: CharacterId.snakeCharmer,
            primaryScript: Scripts.sectsAndViolets,
            name: "Snake Charmer",
            type: CharacterType.townsfolk,
            alignment: CharacterAlignment.good,
            icon: ClocktowerIcons.characterSnakeCharmer,
            description: "Description");
      case CharacterId.mathematician:
        return const Character(
            characterId: CharacterId.mathematician,
            primaryScript: Scripts.sectsAndViolets,
            name: "Mathematician",
            type: CharacterType.townsfolk,
            alignment: CharacterAlignment.good,
            icon: ClocktowerIcons.characterMathematician,
            description: "Description");
      case CharacterId.flowergirl:
        return const Character(
            characterId: CharacterId.flowergirl,
            primaryScript: Scripts.sectsAndViolets,
            name: "Flowergirl",
            type: CharacterType.townsfolk,
            alignment: CharacterAlignment.good,
            icon: ClocktowerIcons.characterFlowergirl,
            description: "Description");
      case CharacterId.townCrier:
        return const Character(
            characterId: CharacterId.townCrier,
            primaryScript: Scripts.sectsAndViolets,
            name: "Town Crier",
            type: CharacterType.townsfolk,
            alignment: CharacterAlignment.good,
            icon: ClocktowerIcons.characterTownCrier,
            description: "Description");
      case CharacterId.oracle:
        return const Character(
            characterId: CharacterId.oracle,
            primaryScript: Scripts.sectsAndViolets,
            name: "Oracle",
            type: CharacterType.townsfolk,
            alignment: CharacterAlignment.good,
            icon: ClocktowerIcons.characterOracle,
            description: "Description");
      case CharacterId.savant:
        return const Character(
            characterId: CharacterId.savant,
            primaryScript: Scripts.sectsAndViolets,
            name: "Savant",
            type: CharacterType.townsfolk,
            alignment: CharacterAlignment.good,
            icon: ClocktowerIcons.characterSavant,
            description: "Description");
      case CharacterId.seamstress:
        return const Character(
            characterId: CharacterId.seamstress,
            primaryScript: Scripts.sectsAndViolets,
            name: "Seamstress",
            type: CharacterType.townsfolk,
            alignment: CharacterAlignment.good,
            icon: ClocktowerIcons.characterSeamstress,
            description: "Description");
      case CharacterId.philosopher:
        return const Character(
            characterId: CharacterId.philosopher,
            primaryScript: Scripts.sectsAndViolets,
            name: "Philosopher",
            type: CharacterType.townsfolk,
            alignment: CharacterAlignment.good,
            icon: ClocktowerIcons.characterPhilosopher,
            description: "Description");
      case CharacterId.artist:
        return const Character(
            characterId: CharacterId.artist,
            primaryScript: Scripts.sectsAndViolets,
            name: "Artist",
            type: CharacterType.townsfolk,
            alignment: CharacterAlignment.good,
            icon: ClocktowerIcons.characterArtist,
            description: "Description");
      case CharacterId.juggler:
        return const Character(
            characterId: CharacterId.juggler,
            primaryScript: Scripts.sectsAndViolets,
            name: "Juggler",
            type: CharacterType.townsfolk,
            alignment: CharacterAlignment.good,
            icon: ClocktowerIcons.characterJuggler,
            description: "Description");
      case CharacterId.sage:
        return const Character(
            characterId: CharacterId.sage,
            primaryScript: Scripts.sectsAndViolets,
            name: "Sage",
            type: CharacterType.townsfolk,
            alignment: CharacterAlignment.good,
            icon: ClocktowerIcons.characterSage,
            description: "Description");
      case CharacterId.mutant:
        return const Character(
            characterId: CharacterId.mutant,
            primaryScript: Scripts.sectsAndViolets,
            name: "Mutant",
            type: CharacterType.outsider,
            alignment: CharacterAlignment.good,
            icon: ClocktowerIcons.characterMutant,
            description: "Description");
      case CharacterId.sweetheart:
        return const Character(
            characterId: CharacterId.sweetheart,
            primaryScript: Scripts.sectsAndViolets,
            name: "Sweetheart",
            type: CharacterType.outsider,
            alignment: CharacterAlignment.good,
            icon: ClocktowerIcons.characterSweetheart,
            description: "Description");
      case CharacterId.barber:
        return const Character(
            characterId: CharacterId.barber,
            primaryScript: Scripts.sectsAndViolets,
            name: "Barber",
            type: CharacterType.outsider,
            alignment: CharacterAlignment.good,
            icon: ClocktowerIcons.characterBarber,
            description: "Description");
      case CharacterId.klutz:
        return const Character(
            characterId: CharacterId.klutz,
            primaryScript: Scripts.sectsAndViolets,
            name: "Klutz",
            type: CharacterType.outsider,
            alignment: CharacterAlignment.good,
            icon: ClocktowerIcons.characterKlutz,
            description: "Description");
      case CharacterId.evilTwin:
        return const Character(
            characterId: CharacterId.evilTwin,
            primaryScript: Scripts.sectsAndViolets,
            name: "Evil Twin",
            type: CharacterType.minion,
            alignment: CharacterAlignment.evil,
            icon: ClocktowerIcons.characterEvilTwin,
            description: "Description");
      case CharacterId.witch:
        return const Character(
            characterId: CharacterId.witch,
            primaryScript: Scripts.sectsAndViolets,
            name: "Witch",
            type: CharacterType.minion,
            alignment: CharacterAlignment.evil,
            icon: ClocktowerIcons.characterWitch,
            description: "Description");
      case CharacterId.cerenovus:
        return const Character(
            characterId: CharacterId.cerenovus,
            primaryScript: Scripts.sectsAndViolets,
            name: "Cerenovus",
            type: CharacterType.minion,
            alignment: CharacterAlignment.evil,
            icon: ClocktowerIcons.characterCerenovus,
            description: "Description");
      case CharacterId.pitHag:
        return const Character(
            characterId: CharacterId.pitHag,
            primaryScript: Scripts.sectsAndViolets,
            name: "Pit-Hag",
            type: CharacterType.minion,
            alignment: CharacterAlignment.evil,
            icon: ClocktowerIcons.characterPitHag,
            description: "Description");
      case CharacterId.fangGu:
        return const Character(
            characterId: CharacterId.fangGu,
            primaryScript: Scripts.sectsAndViolets,
            name: "Fang Gu",
            type: CharacterType.demon,
            alignment: CharacterAlignment.evil,
            icon: ClocktowerIcons.characterFangGu,
            description: "Description");
      case CharacterId.vigormortis:
        return const Character(
            characterId: CharacterId.vigormortis,
            primaryScript: Scripts.sectsAndViolets,
            name: "Vigormortis",
            type: CharacterType.demon,
            alignment: CharacterAlignment.evil,
            icon: ClocktowerIcons.characterVigormortis,
            description: "Description");
      case CharacterId.noDashii:
        return const Character(
            characterId: CharacterId.noDashii,
            primaryScript: Scripts.sectsAndViolets,
            name: "No Dashii",
            type: CharacterType.demon,
            alignment: CharacterAlignment.evil,
            icon: ClocktowerIcons.characterNoDashii,
            description: "Description");
      case CharacterId.vortox:
        return const Character(
            characterId: CharacterId.vortox,
            primaryScript: Scripts.sectsAndViolets,
            name: "Vortox",
            type: CharacterType.demon,
            alignment: CharacterAlignment.evil,
            icon: ClocktowerIcons.characterVortox,
            description: "Description");

      // Bad Moon Rising
      // case CharacterId.replace:
      //   return const Character(
      //       characterId: CharacterId.replace,
      //       primaryScript: Scripts.sectsAndViolets,
      //       name: "Replace",
      //       type: CharacterType.townsfolk,
      //       alignment: CharacterAlignment.good,
      //       icon: ClocktowerIcons.characterReplace,
      //       description: "Description");


      default:
        throw Exception("Invalid CharacterId given to Character factory");
    }
  }
}

enum CharacterAlignment { good, evil, either }

enum CharacterType {
  townsfolk,
  outsider,
  minion,
  demon,
  traveller,
  fabled,
  unkown
}

enum CharacterId {
  alignmentGood,
  alignmentEvil,
  washerwoman,
  librarian,
  investigator,
  chef,
  empath,
  fortuneTeller,
  undertaker,
  monk,
  ravenkeeper,
  virgin,
  slayer,
  soldier,
  mayor,
  butler,
  drunk,
  recluse,
  saint,
  poisoner,
  spy,
  scarlettWoman,
  baron,
  imp,
  clockmaker,
  dreamer,
  snakeCharmer,
  mathematician,
  flowergirl,
  townCrier,
  oracle,
  savant,
  seamstress,
  philosopher,
  artist,
  juggler,
  sage,
  mutant,
  sweetheart,
  barber,
  klutz,
  evilTwin,
  witch,
  cerenovus,
  pitHag,
  fangGu,
  vigormortis,
  noDashii,
  vortox,
  grandmother,
  sailor,
  chambermaid,
  exorcist,
  innkeeper,
  gambler,
  gossip,
  courtier,
  professor,
  minstrel,
  teaLady,
  pacifist,
  fool,
  goon,
  lunatic,
  tinker,
  moonchild,
  godfather,
  devilsAdvocate,
  assassin,
  mastermind,
  zombuul,
  pukka,
  shabaloth,
  po
}

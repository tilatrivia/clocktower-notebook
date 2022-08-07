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
            description: "You start knowing how many steps from the Demon to its nearest Minion.");
      case CharacterId.dreamer:
        return const Character(
            characterId: CharacterId.dreamer,
            primaryScript: Scripts.sectsAndViolets,
            name: "Dreamer",
            type: CharacterType.townsfolk,
            alignment: CharacterAlignment.good,
            icon: ClocktowerIcons.characterDreamer,
            description: "Each night, choose a player (not yourself or Travellers): you learn 1 good & 1 evil character, 1 of which is correct.");
      case CharacterId.snakeCharmer:
        return const Character(
            characterId: CharacterId.snakeCharmer,
            primaryScript: Scripts.sectsAndViolets,
            name: "Snake Charmer",
            type: CharacterType.townsfolk,
            alignment: CharacterAlignment.good,
            icon: ClocktowerIcons.characterSnakeCharmer,
            description: "Each night, choose an alive player: a chosen Demon swaps characters & alignments with you & is then poisoned.");
      case CharacterId.mathematician:
        return const Character(
            characterId: CharacterId.mathematician,
            primaryScript: Scripts.sectsAndViolets,
            name: "Mathematician",
            type: CharacterType.townsfolk,
            alignment: CharacterAlignment.good,
            icon: ClocktowerIcons.characterMathematician,
            description: "Each night, you learn how many players' abilities worked abnormally (since dawn) due to another character's ability.");
      case CharacterId.flowergirl:
        return const Character(
            characterId: CharacterId.flowergirl,
            primaryScript: Scripts.sectsAndViolets,
            name: "Flowergirl",
            type: CharacterType.townsfolk,
            alignment: CharacterAlignment.good,
            icon: ClocktowerIcons.characterFlowergirl,
            description: "Each night except for the first, you learn if a Demon voted today.");
      case CharacterId.townCrier:
        return const Character(
            characterId: CharacterId.townCrier,
            primaryScript: Scripts.sectsAndViolets,
            name: "Town Crier",
            type: CharacterType.townsfolk,
            alignment: CharacterAlignment.good,
            icon: ClocktowerIcons.characterTownCrier,
            description: "Each night except for the first, you learn if a Minion nominated today.");
      case CharacterId.oracle:
        return const Character(
            characterId: CharacterId.oracle,
            primaryScript: Scripts.sectsAndViolets,
            name: "Oracle",
            type: CharacterType.townsfolk,
            alignment: CharacterAlignment.good,
            icon: ClocktowerIcons.characterOracle,
            description: "Each night except for the first, you learn how many dead players are evil.");
      case CharacterId.savant:
        return const Character(
            characterId: CharacterId.savant,
            primaryScript: Scripts.sectsAndViolets,
            name: "Savant",
            type: CharacterType.townsfolk,
            alignment: CharacterAlignment.good,
            icon: ClocktowerIcons.characterSavant,
            description: "Each day, you may visit the Storyteller to learn 2 things in private: 1 is true & 1 is false.");
      case CharacterId.seamstress:
        return const Character(
            characterId: CharacterId.seamstress,
            primaryScript: Scripts.sectsAndViolets,
            name: "Seamstress",
            type: CharacterType.townsfolk,
            alignment: CharacterAlignment.good,
            icon: ClocktowerIcons.characterSeamstress,
            description: "Once per game, at night, choose 2 players (not yourself): you learn if they are the same alignment.");
      case CharacterId.philosopher:
        return const Character(
            characterId: CharacterId.philosopher,
            primaryScript: Scripts.sectsAndViolets,
            name: "Philosopher",
            type: CharacterType.townsfolk,
            alignment: CharacterAlignment.good,
            icon: ClocktowerIcons.characterPhilosopher,
            description: "Once per game, at night, choose a good character: gain that ability. If this character is in play, they are drunk.");
      case CharacterId.artist:
        return const Character(
            characterId: CharacterId.artist,
            primaryScript: Scripts.sectsAndViolets,
            name: "Artist",
            type: CharacterType.townsfolk,
            alignment: CharacterAlignment.good,
            icon: ClocktowerIcons.characterArtist,
            description: "Once per game, during the day, privately ask the Storyteller any yes/no question.");
      case CharacterId.juggler:
        return const Character(
            characterId: CharacterId.juggler,
            primaryScript: Scripts.sectsAndViolets,
            name: "Juggler",
            type: CharacterType.townsfolk,
            alignment: CharacterAlignment.good,
            icon: ClocktowerIcons.characterJuggler,
            description: "On your 1st day, publicly guess up to 5 players' characters. That night, you learn how many you got correct.");
      case CharacterId.sage:
        return const Character(
            characterId: CharacterId.sage,
            primaryScript: Scripts.sectsAndViolets,
            name: "Sage",
            type: CharacterType.townsfolk,
            alignment: CharacterAlignment.good,
            icon: ClocktowerIcons.characterSage,
            description: "If the Demon kills you, you learn that it is 1 of 2 players.");
      case CharacterId.mutant:
        return const Character(
            characterId: CharacterId.mutant,
            primaryScript: Scripts.sectsAndViolets,
            name: "Mutant",
            type: CharacterType.outsider,
            alignment: CharacterAlignment.good,
            icon: ClocktowerIcons.characterMutant,
            description: "If you are \"mad\" about being an Outsider, you might be executed.");
      case CharacterId.sweetheart:
        return const Character(
            characterId: CharacterId.sweetheart,
            primaryScript: Scripts.sectsAndViolets,
            name: "Sweetheart",
            type: CharacterType.outsider,
            alignment: CharacterAlignment.good,
            icon: ClocktowerIcons.characterSweetheart,
            description: "When you die, 1 player is drunk from now on.");
      case CharacterId.barber:
        return const Character(
            characterId: CharacterId.barber,
            primaryScript: Scripts.sectsAndViolets,
            name: "Barber",
            type: CharacterType.outsider,
            alignment: CharacterAlignment.good,
            icon: ClocktowerIcons.characterBarber,
            description: "If you died today or tonight, the Demon may choose 2 players (not another Demon) to swap characters.");
      case CharacterId.klutz:
        return const Character(
            characterId: CharacterId.klutz,
            primaryScript: Scripts.sectsAndViolets,
            name: "Klutz",
            type: CharacterType.outsider,
            alignment: CharacterAlignment.good,
            icon: ClocktowerIcons.characterKlutz,
            description: "When you learn that you died, publicly choose 1 alive player: if they are evil, your team loses.");
      case CharacterId.evilTwin:
        return const Character(
            characterId: CharacterId.evilTwin,
            primaryScript: Scripts.sectsAndViolets,
            name: "Evil Twin",
            type: CharacterType.minion,
            alignment: CharacterAlignment.evil,
            icon: ClocktowerIcons.characterEvilTwin,
            description: "You & an opposing player know each other. If the good player is executed, evil wins. Good can't win if you both live.");
      case CharacterId.witch:
        return const Character(
            characterId: CharacterId.witch,
            primaryScript: Scripts.sectsAndViolets,
            name: "Witch",
            type: CharacterType.minion,
            alignment: CharacterAlignment.evil,
            icon: ClocktowerIcons.characterWitch,
            description: "Each night, choose a player: if they nominate tomorrow, they die. If just 3 players live, you lose this ability.");
      case CharacterId.cerenovus:
        return const Character(
            characterId: CharacterId.cerenovus,
            primaryScript: Scripts.sectsAndViolets,
            name: "Cerenovus",
            type: CharacterType.minion,
            alignment: CharacterAlignment.evil,
            icon: ClocktowerIcons.characterCerenovus,
            description: "Each night, choose a player & a good character: they are \"mad\" they are this character tomorrow, or might be executed.");
      case CharacterId.pitHag:
        return const Character(
            characterId: CharacterId.pitHag,
            primaryScript: Scripts.sectsAndViolets,
            name: "Pit-Hag",
            type: CharacterType.minion,
            alignment: CharacterAlignment.evil,
            icon: ClocktowerIcons.characterPitHag,
            description: "Each night except for the first, choose a player & a character they become (if not in play). If a Demon is made, deaths tonight are arbitrary.");
      case CharacterId.fangGu:
        return const Character(
            characterId: CharacterId.fangGu,
            primaryScript: Scripts.sectsAndViolets,
            name: "Fang Gu",
            type: CharacterType.demon,
            alignment: CharacterAlignment.evil,
            icon: ClocktowerIcons.characterFangGu,
            description: "Each night except for the first, choose a player: they die. The 1st Outsider this kills becomes an evil Fang Gu & you die instead. [+1 Outsider]");
      case CharacterId.vigormortis:
        return const Character(
            characterId: CharacterId.vigormortis,
            primaryScript: Scripts.sectsAndViolets,
            name: "Vigormortis",
            type: CharacterType.demon,
            alignment: CharacterAlignment.evil,
            icon: ClocktowerIcons.characterVigormortis,
            description: "Each night except for the first, choose a player: they die. Minions you kill keep their ability & poison 1 Townsfolk neighbor. [-1 Outsider]");
      case CharacterId.noDashii:
        return const Character(
            characterId: CharacterId.noDashii,
            primaryScript: Scripts.sectsAndViolets,
            name: "No Dashii",
            type: CharacterType.demon,
            alignment: CharacterAlignment.evil,
            icon: ClocktowerIcons.characterNoDashii,
            description: "Each night except for the first, choose a player: they die. Your 2 Townsfolk neighbours are poisoned.");
      case CharacterId.vortox:
        return const Character(
            characterId: CharacterId.vortox,
            primaryScript: Scripts.sectsAndViolets,
            name: "Vortox",
            type: CharacterType.demon,
            alignment: CharacterAlignment.evil,
            icon: ClocktowerIcons.characterVortox,
            description: "Each night except for the first, choose a player; they die. Townsfolk abilities yield false info. Each day, if no-one is executed, evil wins.");

      // Bad Moon Rising
      case CharacterId.grandmother:
        return const Character(
            characterId: CharacterId.grandmother,
            primaryScript: Scripts.sectsAndViolets,
            name: "Grandmother",
            type: CharacterType.townsfolk,
            alignment: CharacterAlignment.good,
            icon: ClocktowerIcons.characterGrandmother,
            description: "You start knowing a good player & their character. If the Demon kills them, you die too.");
      case CharacterId.sailor:
        return const Character(
            characterId: CharacterId.sailor,
            primaryScript: Scripts.sectsAndViolets,
            name: "Sailor",
            type: CharacterType.townsfolk,
            alignment: CharacterAlignment.good,
            icon: ClocktowerIcons.characterSailor,
            description: "Each night, choose an alive player: either you or they are drunk until dusk. You can't die.");
      case CharacterId.chambermaid:
        return const Character(
            characterId: CharacterId.chambermaid,
            primaryScript: Scripts.sectsAndViolets,
            name: "Chambermaid",
            type: CharacterType.townsfolk,
            alignment: CharacterAlignment.good,
            icon: ClocktowerIcons.characterChambermaid,
            description: "Each night, choose 2 alive players (not yourself): you learn how many woke tonight due to their ability.");
      case CharacterId.exorcist:
        return const Character(
            characterId: CharacterId.exorcist,
            primaryScript: Scripts.sectsAndViolets,
            name: "Exorcist",
            type: CharacterType.townsfolk,
            alignment: CharacterAlignment.good,
            icon: ClocktowerIcons.characterExorcist,
            description: "Each night except for the first, choose a player (different to last night): the Demon, if chosen, learns who you are then doesn't wake tonight.");
      case CharacterId.innkeeper:
        return const Character(
            characterId: CharacterId.innkeeper,
            primaryScript: Scripts.sectsAndViolets,
            name: "Innkeeper",
            type: CharacterType.townsfolk,
            alignment: CharacterAlignment.good,
            icon: ClocktowerIcons.characterInnkeeper,
            description: "Each night except for the first, choose 2 players: they can't die tonight, but 1 is drunk until dusk.");
      case CharacterId.gambler:
        return const Character(
          characterId: CharacterId.gambler,
          primaryScript: Scripts.sectsAndViolets,
          name: "Gambler",
          type: CharacterType.townsfolk,
          alignment: CharacterAlignment.good,
          icon: ClocktowerIcons.characterGambler,
          description: "Each night except for the first, choose a player & guess their character: if you guess wrong, you die.");
      case CharacterId.gossip:
        return const Character(
            characterId: CharacterId.gossip,
            primaryScript: Scripts.sectsAndViolets,
            name: "Gossip",
            type: CharacterType.townsfolk,
            alignment: CharacterAlignment.good,
            icon: ClocktowerIcons.characterGossip,
            description: "Each day, you may make a public statement. Tonight, if it was true, a player dies.");
      case CharacterId.courtier:
        return const Character(
            characterId: CharacterId.courtier,
            primaryScript: Scripts.sectsAndViolets,
            name: "Courtier",
            type: CharacterType.townsfolk,
            alignment: CharacterAlignment.good,
            icon: ClocktowerIcons.characterCourtier,
            description: "Once per game, at night, choose a character: they are drunk for 3 nights & 3 days.");
      case CharacterId.professor:
        return const Character(
          characterId: CharacterId.professor,
          primaryScript: Scripts.sectsAndViolets,
          name: "Professor",
          type: CharacterType.townsfolk,
          alignment: CharacterAlignment.good,
          icon: ClocktowerIcons.characterProfessor,
          description: "Once per game, at night (except for the first), choose a dead player: if they are a Townsfolk, they are resurrected.");
      case CharacterId.minstrel:
        return const Character(
            characterId: CharacterId.minstrel,
            primaryScript: Scripts.sectsAndViolets,
            name: "Minstrel",
            type: CharacterType.townsfolk,
            alignment: CharacterAlignment.good,
            icon: ClocktowerIcons.characterMinstrel,
            description: "When a Minion dies by execution, all other players (except Travellers) are drunk until dusk tomorrow.");
      case CharacterId.teaLady:
        return const Character(
          characterId: CharacterId.teaLady,
          primaryScript: Scripts.sectsAndViolets,
          name: "Tea Lady",
          type: CharacterType.townsfolk,
          alignment: CharacterAlignment.good,
          icon: ClocktowerIcons.characterTeaLady,
          description: "If both your alive neighbors are good, they can't die.");
      case CharacterId.pacifist:
        return const Character(
          characterId: CharacterId.pacifist,
          primaryScript: Scripts.sectsAndViolets,
          name: "Pacifist",
          type: CharacterType.townsfolk,
          alignment: CharacterAlignment.good,
          icon: ClocktowerIcons.characterPacifist,
          description: "Executed good players might not die.");
      case CharacterId.fool:
        return const Character(
          characterId: CharacterId.fool,
          primaryScript: Scripts.sectsAndViolets,
          name: "Fool",
          type: CharacterType.townsfolk,
          alignment: CharacterAlignment.good,
          icon: ClocktowerIcons.characterFool,
          description: "The first time you die, you don't.");
      case CharacterId.goon:
        return const Character(
          characterId: CharacterId.goon,
          primaryScript: Scripts.sectsAndViolets,
          name: "Goon",
          type: CharacterType.outsider,
          alignment: CharacterAlignment.good,
          icon: ClocktowerIcons.characterGoon,
          description: "Each night, the 1st player to choose you with their ability is drunk until dusk. You become their alignment.");
      case CharacterId.lunatic:
        return const Character(
            characterId: CharacterId.lunatic,
            primaryScript: Scripts.sectsAndViolets,
            name: "Lunatic",
            type: CharacterType.outsider,
            alignment: CharacterAlignment.good,
            icon: ClocktowerIcons.characterLunatic,
            description: "You think you are a Demon, but you are not. The Demon knows who you are & who you choose at night.");
      case CharacterId.tinker:
        return const Character(
            characterId: CharacterId.tinker,
            primaryScript: Scripts.sectsAndViolets,
            name: "Tinker",
            type: CharacterType.outsider,
            alignment: CharacterAlignment.good,
            icon: ClocktowerIcons.characterTinker,
            description: "You might die at any time.");
      case CharacterId.moonchild:
        return const Character(
            characterId: CharacterId.moonchild,
            primaryScript: Scripts.sectsAndViolets,
            name: "Moonchild",
            type: CharacterType.outsider,
            alignment: CharacterAlignment.good,
            icon: ClocktowerIcons.characterMoonchild,
            description: "When you learn that you died, publicly choose 1 alive player. Tonight, if it was a good player, they die.");
      case CharacterId.godfather:
        return const Character(
            characterId: CharacterId.godfather,
            primaryScript: Scripts.sectsAndViolets,
            name: "Godfather",
            type: CharacterType.minion,
            alignment: CharacterAlignment.evil,
            icon: ClocktowerIcons.characterGodfather,
            description: "You start knowing which Outsiders are in play. If 1 died today, choose a player tonight: they die. [-1 or +1 Outsider]");
      case CharacterId.devilsAdvocate:
        return const Character(
            characterId: CharacterId.devilsAdvocate,
            primaryScript: Scripts.sectsAndViolets,
            name: "Devils Advocate",
            type: CharacterType.minion,
            alignment: CharacterAlignment.evil,
            icon: ClocktowerIcons.characterDevilsAdvocate,
            description: "Each night, choose a living player (different to last night): if executed tomorrow, they don't die.");
      case CharacterId.assassin:
        return const Character(
            characterId: CharacterId.assassin,
            primaryScript: Scripts.sectsAndViolets,
            name: "Assassin",
            type: CharacterType.minion,
            alignment: CharacterAlignment.evil,
            icon: ClocktowerIcons.characterAssassin,
            description: "Once per game, at night (except for the first), choose a player: they die, even if for some reason they could not.");
      case CharacterId.mastermind:
        return const Character(
            characterId: CharacterId.mastermind,
            primaryScript: Scripts.sectsAndViolets,
            name: "Mastermind",
            type: CharacterType.minion,
            alignment: CharacterAlignment.evil,
            icon: ClocktowerIcons.characterMastermind,
            description: "If the Demon dies by execution (ending the game), play for 1 more day. If a player is then executed, their team loses.");
      case CharacterId.zombuul:
        return const Character(
            characterId: CharacterId.zombuul,
            primaryScript: Scripts.sectsAndViolets,
            name: "Zombuul",
            type: CharacterType.demon,
            alignment: CharacterAlignment.evil,
            icon: ClocktowerIcons.characterZombuul,
            description: "Each night except for the first, if no-one died today, choose a player: they die. The 1st time you die, you live but register as dead.");
      case CharacterId.pukka:
        return const Character(
            characterId: CharacterId.pukka,
            primaryScript: Scripts.sectsAndViolets,
            name: "Pukka",
            type: CharacterType.demon,
            alignment: CharacterAlignment.evil,
            icon: ClocktowerIcons.characterPukka,
            description: "Each night, choose a player: they are poisoned. The previously poisoned player dies then becomes healthy.");
      case CharacterId.shabaloth:
        return const Character(
            characterId: CharacterId.shabaloth,
            primaryScript: Scripts.sectsAndViolets,
            name: "Shabaloth",
            type: CharacterType.demon,
            alignment: CharacterAlignment.evil,
            icon: ClocktowerIcons.characterShabaloth,
            description: "Each night except for the first, choose 2 players: they die. A dead player you chose last night might be regurgitated.");
      case CharacterId.po:
        return const Character(
            characterId: CharacterId.po,
            primaryScript: Scripts.sectsAndViolets,
            name: "Po",
            type: CharacterType.demon,
            alignment: CharacterAlignment.evil,
            icon: ClocktowerIcons.characterPo,
            description: "Each night except for the first, you may choose a player: they die. If your last choice was no-one, choose 3 players tonight.");

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

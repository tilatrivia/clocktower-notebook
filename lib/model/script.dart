import 'package:clocktower_notes/model/tile.dart';
import 'package:flutter/material.dart' hide Alignment, Characters;
import 'package:json_annotation/json_annotation.dart';
import 'characters.dart';

part 'script.g.dart';

@JsonSerializable()
class Script {
  static const String scriptKey = "script";

  List<Tile> tiles;
  Scripts scriptId;

  factory Script.fromJson(Map<String, dynamic> json) => _$ScriptFromJson(json);

  Map<String, dynamic> toJson() => _$ScriptToJson(this);

  Script() : tiles = <Tile>[], scriptId = Scripts.custom;

  Script.troubleBrewing() : tiles = <Tile>[], scriptId = Scripts.troubleBrewing {
    // Alignments
    tiles.add(const Tile(
        name: "Good",
        character: Characters.good,
        category: Category.unkown,
        alignment: Alignment.good,
        description: "Could be any character on the good team."));
    tiles.add(const Tile(
        name: "Evil",
        character: Characters.evil,
        category: Category.unkown,
        alignment: Alignment.evil,
        description: "Could be any character working for evil."));

    // Townsfolk
    tiles.add(const Tile(
        name: "Washerwoman",
        character: Characters.washerwoman,
        category: Category.townsfolk,
        alignment: Alignment.good,
        description:
            "You start knowing that 1 of 2 players is a particular Townsfolk."));
    tiles.add(const Tile(
        name: "Librarian",
        character: Characters.librarian,
        category: Category.townsfolk,
        alignment: Alignment.good,
        description:
            "You start knowing that 1 of 2 players is a particular Outsider. (Or that zero are in play.)"));
    tiles.add(const Tile(
        name: "Investigator",
        character: Characters.investigator,
        category: Category.townsfolk,
        alignment: Alignment.good,
        description:
            "You start knowing that 1 of 2 players is a particular Minion."));
    tiles.add(const Tile(
        name: "Chef",
        character: Characters.chef,
        category: Category.townsfolk,
        alignment: Alignment.good,
        description:
            "You start knowing how many pairs of evil players there are."));
    tiles.add(const Tile(
        name: "Empath",
        character: Characters.empath,
        category: Category.townsfolk,
        alignment: Alignment.good,
        description:
            "Each night, you learn how many of your 2 alive neighbours are evil."));
    tiles.add(const Tile(
        name: "Fortune Teller",
        character: Characters.fortuneTeller,
        category: Category.townsfolk,
        alignment: Alignment.good,
        description:
            "Each night, choose 2 players: you learn if either is a Demon. There is a good player that registers as a Demon to you."));
    tiles.add(const Tile(
        name: "Undertaker",
        character: Characters.undertaker,
        category: Category.townsfolk,
        alignment: Alignment.good,
        description:
            "Each night except for the first, you learn which character died by execution today."));
    tiles.add(const Tile(
        name: "Monk",
        character: Characters.monk,
        category: Category.townsfolk,
        alignment: Alignment.good,
        description:
            "Each night except for the first, choose a player (not yourself): they are safe from the Demon tonight."));
    tiles.add(const Tile(
        name: "Ravenskeeper",
        character: Characters.ravenkeeper,
        category: Category.townsfolk,
        alignment: Alignment.good,
        description:
            "If you die at night, you are woken to choose a player: you learn their character."));
    tiles.add(const Tile(
        name: "Virgin",
        character: Characters.virgin,
        category: Category.townsfolk,
        alignment: Alignment.good,
        description:
            "The 1st time you are nominated, if the nominator is a Townsfolk, they are executed immediately."));
    tiles.add(const Tile(
        name: "Slayer",
        character: Characters.slayer,
        category: Category.townsfolk,
        alignment: Alignment.good,
        description:
            "Once per game, during the day, publicly choose a player: if they are the Demon, they die."));
    tiles.add(const Tile(
        name: "Soldier",
        character: Characters.soldier,
        category: Category.townsfolk,
        alignment: Alignment.good,
        description: "You are safe from the Demon."));
    tiles.add(const Tile(
        name: "Mayor",
        character: Characters.mayor,
        category: Category.townsfolk,
        alignment: Alignment.good,
        description:
            "If only 3 players live & no execution occurs, your team wins. If you die at night, another player might die instead."));

    // Outsiders
    tiles.add(const Tile(
        name: "Butler",
        character: Characters.butler,
        category: Category.outsider,
        alignment: Alignment.good,
        description:
            "Each night, choose a player (not yourself): tomorrow, you may only vote if they are voting too."));
    tiles.add(const Tile(
        name: "Recluse",
        character: Characters.recluse,
        category: Category.outsider,
        alignment: Alignment.good,
        description:
            "You might register as evil & as a Minion or Demon, even if dead."));
    tiles.add(const Tile(
        name: "Drunk",
        character: Characters.drunk,
        category: Category.outsider,
        alignment: Alignment.good,
        description:
            "You do not know you are the Drunk. You think you are a Townsfolk character, but you are not."));
    tiles.add(const Tile(
        name: "Saint",
        character: Characters.saint,
        category: Category.outsider,
        alignment: Alignment.good,
        description: "If you die by execution, your team loses."));

    // Minions
    tiles.add(const Tile(
        name: "Poisoner",
        character: Characters.poisoner,
        category: Category.minion,
        alignment: Alignment.evil,
        description:
            "Each night, choose a player: they are poisoned tonight and tomorrow day."));
    tiles.add(const Tile(
        name: "Spy",
        character: Characters.spy,
        category: Category.minion,
        alignment: Alignment.evil,
        description:
            "Each night, you see the Grimoire. You might register as good & as a Townsfolk or Outsider, even if dead."));
    tiles.add(const Tile(
        name: "Baron",
        character: Characters.baron,
        category: Category.minion,
        alignment: Alignment.evil,
        description: "There are extra Outsiders in play. [+2 Outsiders]"));
    tiles.add(const Tile(
        name: "Scarlett Woman",
        character: Characters.scarlettWoman,
        category: Category.minion,
        alignment: Alignment.evil,
        description:
            "If there are 5 or more players alive & the Demon dies, you become the Demon. (Travellers don't count)"));

    // Demons
    tiles.add(const Tile(
        name: "Imp",
        character: Characters.imp,
        category: Category.demon,
        alignment: Alignment.evil,
        description:
            "Each night except for the first, choose a player: they die. If you kill yourself this way, a Minion becomes the Imp."));
  }

  Script.sectsAndViolets() : tiles = <Tile>[], scriptId = Scripts.sectsAndViolets {
    // Alignments
    tiles.add(const Tile(
        name: "Good",
        character: Characters.good,
        category: Category.unkown,
        alignment: Alignment.good,
        description: "Could be any character on the good team."));
    tiles.add(const Tile(
        name: "Evil",
        character: Characters.evil,
        category: Category.unkown,
        alignment: Alignment.evil,
        description: "Could be any character working for evil."));

    // Townsfolk
    tiles.add(const Tile(
        name: "Clockmaker",
        character: Characters.clockmaker,
        category: Category.townsfolk,
        alignment: Alignment.good,
        description:
            "You start knowing how many steps from the Demon to its nearest Minion."));
    tiles.add(const Tile(
        name: "Dreamer",
        character: Characters.dreamer,
        category: Category.townsfolk,
        alignment: Alignment.good,
        description:
            "Each night, choose a player (not yourself or Travellers): you learn 1 good & 1 evil character, 1 of which is correct."));
    tiles.add(const Tile(
        name: "Snake Charmer",
        character: Characters.snakeCharmer,
        category: Category.townsfolk,
        alignment: Alignment.good,
        description:
            "Each night, choose an alive player: a chosen Demon swaps characters & alignments with you & is then poisoned."));
    tiles.add(const Tile(
        name: "Mathematician",
        character: Characters.mathematician,
        category: Category.townsfolk,
        alignment: Alignment.good,
        description:
            "Each night, you learn how many players' abilities worked abnormally (since dawn) due to another character's ability."));
    tiles.add(const Tile(
        name: "Flowergirl",
        character: Characters.flowerGirl,
        category: Category.townsfolk,
        alignment: Alignment.good,
        description:
            "Each night except for the first, you learn if a Demon voted today."));
    tiles.add(const Tile(
        name: "Town Crier",
        character: Characters.townCrier,
        category: Category.townsfolk,
        alignment: Alignment.good,
        description:
            "Each night except for the first, you learn if a Minion nominated today."));
    tiles.add(const Tile(
        name: "Oracle",
        character: Characters.oracle,
        category: Category.townsfolk,
        alignment: Alignment.good,
        description:
            "Each night except for the first, you learn how many dead players are evil."));
    tiles.add(const Tile(
        name: "Savant",
        character: Characters.savant,
        category: Category.townsfolk,
        alignment: Alignment.good,
        description:
            "Each day, you may visit the Storyteller to learn 2 things in private: 1 is true & 1 is false."));
    tiles.add(const Tile(
        name: "Seamstress",
        character: Characters.seamstress,
        category: Category.townsfolk,
        alignment: Alignment.good,
        description:
            "Once per game, at night, choose 2 players (not yourself): you learn if they are the same alignment."));
    tiles.add(const Tile(
        name: "Philosopher",
        character: Characters.philosopher,
        category: Category.townsfolk,
        alignment: Alignment.good,
        description:
            "Once per game, at night, choose a good character: gain that ability. If this character is in play, they are drunk."));
    tiles.add(const Tile(
        name: "Artist",
        character: Characters.artist,
        category: Category.townsfolk,
        alignment: Alignment.good,
        description:
            "Once per game, during the day, privately ask the Storyteller any yes/no question."));
    tiles.add(const Tile(
        name: "Juggler",
        character: Characters.juggler,
        category: Category.townsfolk,
        alignment: Alignment.good,
        description:
            "On your 1st day, publicly guess up to 5 players' characters. That night, you learn how many you got correct."));
    tiles.add(const Tile(
        name: "Sage",
        character: Characters.sage,
        category: Category.townsfolk,
        alignment: Alignment.good,
        description:
            "If the Demon kills you, you learn that it is 1 of 2 players."));

    // Outsiders
    tiles.add(const Tile(
        name: "Mutant",
        character: Characters.mutant,
        category: Category.outsider,
        alignment: Alignment.good,
        description:
            "If you are \"mad\" about being an Outsider, you might be executed."));
    tiles.add(const Tile(
        name: "Sweetheart",
        character: Characters.sweetheart,
        category: Category.outsider,
        alignment: Alignment.good,
        description: "When you die, 1 player is drunk from now on."));
    tiles.add(const Tile(
        name: "Barber",
        character: Characters.barber,
        category: Category.outsider,
        alignment: Alignment.good,
        description:
            "If you died today or tonight, the Demon may choose 2 players (not another Demon) to swap characters."));
    tiles.add(const Tile(
        name: "Klutz",
        character: Characters.klutz,
        category: Category.outsider,
        alignment: Alignment.good,
        description:
            "When you learn that you died, publicly choose 1 alive player: if they are evil, your team loses."));

    // Minions
    tiles.add(const Tile(
        name: "Evil Twin",
        character: Characters.evilTwin,
        category: Category.minion,
        alignment: Alignment.evil,
        description:
            "You & an opposing player know each other. If the good player is executed, evil wins. Good can't win if you both live."));
    tiles.add(const Tile(
        name: "Witch",
        character: Characters.witch,
        category: Category.minion,
        alignment: Alignment.evil,
        description:
            "Each night, choose a player: if they nominate tomorrow, they die. If just 3 players live, you lose this ability."));
    tiles.add(const Tile(
        name: "Cerenovus",
        character: Characters.cerenovus,
        category: Category.minion,
        alignment: Alignment.evil,
        description:
            "Each night, choose a player & a good character: they are \"mad\" they are this character tomorrow, or might be executed."));
    tiles.add(const Tile(
        name: "Pit-Hag",
        character: Characters.pitHag,
        category: Category.minion,
        alignment: Alignment.evil,
        description:
            "Each night except for the first, choose a player & a character they become (if not in play). If a Demon is made, deaths tonight are arbitrary."));

    // Demons
    tiles.add(const Tile(
        name: "Fang Gu",
        character: Characters.fangGu,
        category: Category.demon,
        alignment: Alignment.evil,
        description:
            "Each night except the first, choose a player: they die. The 1st Outsider this kills becomes an evil Fang Gu & you die instead. [+1 Outsider]"));
    tiles.add(const Tile(
        name: "Vigormortis",
        character: Characters.vigimortis,
        category: Category.demon,
        alignment: Alignment.evil,
        description: "Each night except for the first, choose a player: they die. Minions you kill keep their ability & poison 1 Townsfolk neighbor. [-1 Outsider]"));
    tiles.add(const Tile(
        name: "No Dashii",
        character: Characters.noDashii,
        category: Category.demon,
        alignment: Alignment.evil,
        description: "Each night except for the first, choose a player: they die. Your 2 Townsfolk neighbours are poisoned."));
    tiles.add(const Tile(
        name: "Vortox",
        character: Characters.vortox,
        category: Category.demon,
        alignment: Alignment.evil,
        description: "Each night except for the first, choose a player; they die. Townsfolk abilities yield false info. Each day, if no-one is executed, evil wins."));
  }

  static Color getScriptColor(Scripts scriptId) {
    switch (scriptId) {
      case Scripts.troubleBrewing:
        return Colors.red.shade900;
      case Scripts.sectsAndViolets:
        return Colors.purple.shade900;
      case Scripts.badMoonRising:
        return Colors.yellow.shade900;
      default:
        return Colors.blue.shade900;
    }
  }

  static String getScriptTitle(Scripts scriptId) {
    switch (scriptId) {
      case Scripts.troubleBrewing:
        return "Trouble Brewing";
      case Scripts.sectsAndViolets:
        return "Sects And Violets";
      case Scripts.badMoonRising:
        return "Bad Moon Rising";
      default:
        return "Custom Script";
    }
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
  custom
}

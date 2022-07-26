import 'package:clocktower_notes/model/tile.dart';
import 'package:flutter/material.dart' hide Alignment;

class Script {
  List<Tile> tiles;
  Scripts scriptId;

  Script.troubleBrewing() : tiles = <Tile>[], scriptId = Scripts.troubleBrewing {
    // Alignments
    tiles.add(const Tile(
        name: "Good",
        category: Category.unkown,
        alignment: Alignment.good,
        icon: Icons.thumb_up_outlined,
        description: "Could be any character on the good team."));
    tiles.add(const Tile(
        name: "Evil",
        category: Category.unkown,
        alignment: Alignment.evil,
        icon: Icons.thumb_down_outlined,
        description: "Could be any character working for evil."));

    // Townsfolk
    tiles.add(const Tile(
        name: "Washerwoman",
        category: Category.townsfolk,
        alignment: Alignment.good,
        icon: Icons.local_laundry_service_outlined,
        description:
            "You start knowing that 1 of 2 players is a particular Townsfolk."));
    tiles.add(const Tile(
        name: "Librarian",
        category: Category.townsfolk,
        alignment: Alignment.good,
        icon: Icons.library_books_outlined,
        description:
            "You start knowing that 1 of 2 players is a particular Outsider. (Or that zero are in play.)"));
    tiles.add(const Tile(
        name: "Investigator",
        category: Category.townsfolk,
        alignment: Alignment.good,
        icon: Icons.search_outlined,
        description:
            "You start knowing that 1 of 2 players is a particular Minion."));
    tiles.add(const Tile(
        name: "Chef",
        category: Category.townsfolk,
        alignment: Alignment.good,
        icon: Icons.cookie_outlined,
        description:
            "You start knowing how many pairs of evil players there are."));
    tiles.add(const Tile(
        name: "Empath",
        category: Category.townsfolk,
        alignment: Alignment.good,
        icon: Icons.favorite_outline,
        description:
            "Each night, you learn how many of your 2 alive neighbours are evil."));
    tiles.add(const Tile(
        name: "Fortune Teller",
        category: Category.townsfolk,
        alignment: Alignment.good,
        icon: Icons.psychology_outlined,
        description:
            "Each night, choose 2 players: you learn if either is a Demon. There is a good player that registers as a Demon to you."));
    tiles.add(const Tile(
        name: "Undertaker",
        category: Category.townsfolk,
        alignment: Alignment.good,
        icon: Icons.cottage_outlined,
        description:
            "Each night except for the first, you learn which character died by execution today."));
    tiles.add(const Tile(
        name: "Monk",
        category: Category.townsfolk,
        alignment: Alignment.good,
        icon: Icons.church_outlined,
        description:
            "Each night except for the first, choose a player (not yourself): they are safe from the Demon tonight."));
    tiles.add(const Tile(
        name: "Ravenskeeper",
        category: Category.townsfolk,
        alignment: Alignment.good,
        icon: Icons.park_outlined,
        description:
            "If you die at night, you are woken to choose a player: you learn their character."));
    tiles.add(const Tile(
        name: "Virgin",
        category: Category.townsfolk,
        alignment: Alignment.good,
        icon: Icons.circle_outlined,
        description:
            "The 1st time you are nominated, if the nominator is a Townsfolk, they are executed immediately."));
    tiles.add(const Tile(
        name: "Slayer",
        category: Category.townsfolk,
        alignment: Alignment.good,
        icon: Icons.north_east_outlined,
        description:
            "Once per game, during the day, publicly choose a player: if they are the Demon, they die."));
    tiles.add(const Tile(
        name: "Soldier",
        category: Category.townsfolk,
        alignment: Alignment.good,
        icon: Icons.security_outlined,
        description: "You are safe from the Demon."));
    tiles.add(const Tile(
        name: "Mayor",
        category: Category.townsfolk,
        alignment: Alignment.good,
        icon: Icons.account_balance_outlined,
        description:
            "If only 3 players live & no execution occurs, your team wins. If you die at night, another player might die instead."));

    // Outsiders
    tiles.add(const Tile(
        name: "Butler",
        category: Category.outsider,
        alignment: Alignment.good,
        icon: Icons.supervised_user_circle_outlined,
        description:
            "Each night, choose a player (not yourself): tomorrow, you may only vote if they are voting too."));
    tiles.add(const Tile(
        name: "Recluse",
        category: Category.outsider,
        alignment: Alignment.good,
        icon: Icons.lightbulb_outline,
        description:
            "You might register as evil & as a Minion or Demon, even if dead."));
    tiles.add(const Tile(
        name: "Drunk",
        category: Category.outsider,
        alignment: Alignment.good,
        icon: Icons.sports_bar_outlined,
        description:
            "You do not know you are the Drunk. You think you are a Townsfolk character, but you are not."));
    tiles.add(const Tile(
        name: "Saint",
        category: Category.outsider,
        alignment: Alignment.good,
        icon: Icons.auto_awesome_outlined,
        description: "If you die by execution, your team loses."));

    // Minions
    tiles.add(const Tile(
        name: "Poisoner",
        category: Category.minion,
        alignment: Alignment.evil,
        icon: Icons.science_outlined,
        description:
            "Each night, choose a player: they are poisoned tonight and tomorrow day."));
    tiles.add(const Tile(
        name: "Spy",
        category: Category.minion,
        alignment: Alignment.evil,
        icon: Icons.visibility_outlined,
        description:
            "Each night, you see the Grimoire. You might register as good & as a Townsfolk or Outsider, even if dead."));
    tiles.add(const Tile(
        name: "Baron",
        category: Category.minion,
        alignment: Alignment.evil,
        icon: Icons.school_outlined,
        description: "There are extra Outsiders in play. [+2 Outsiders]"));
    tiles.add(const Tile(
        name: "Scarlett Woman",
        category: Category.minion,
        alignment: Alignment.evil,
        icon: Icons.woman_outlined,
        description:
            "If there are 5 or more players alive & the Demon dies, you become the Demon. (Travellers don't count)"));

    // Demons
    tiles.add(const Tile(
        name: "Imp",
        category: Category.demon,
        alignment: Alignment.evil,
        icon: Icons.call_split_outlined,
        description:
            "Each night except for the first, choose a player: they die. If you kill yourself this way, a Minion becomes the Imp."));
  }

  Script.sectsAndViolets() : tiles = <Tile>[], scriptId = Scripts.sectsAndViolets {
    // Alignments
    tiles.add(const Tile(
        name: "Good",
        category: Category.unkown,
        alignment: Alignment.good,
        icon: Icons.thumb_up_outlined,
        description: "Could be any character on the good team."));
    tiles.add(const Tile(
        name: "Evil",
        category: Category.unkown,
        alignment: Alignment.evil,
        icon: Icons.thumb_down_outlined,
        description: "Could be any character working for evil."));

    // Townsfolk
    tiles.add(const Tile(
        name: "Clockmaker",
        category: Category.townsfolk,
        alignment: Alignment.good,
        icon: Icons.school_outlined,
        description:
            "You start knowing how many steps from the Demon to its nearest Minion."));
    tiles.add(const Tile(
        name: "Dreamer",
        category: Category.townsfolk,
        alignment: Alignment.good,
        icon: Icons.hourglass_empty_outlined,
        description:
            "Each night, choose a player (not yourself or Travellers): you learn 1 good & 1 evil character, 1 of which is correct."));
    tiles.add(const Tile(
        name: "Snake Charmer",
        category: Category.townsfolk,
        alignment: Alignment.good,
        icon: Icons.polymer_outlined,
        description:
            "Each night, choose an alive player: a chosen Demon swaps characters & alignments with you & is then poisoned."));
    tiles.add(const Tile(
        name: "Mathematician",
        category: Category.townsfolk,
        alignment: Alignment.good,
        icon: Icons.calculate_outlined,
        description:
            "Each night, you learn how many players' abilities worked abnormally (since dawn) due to another character's ability."));
    tiles.add(const Tile(
        name: "Flowergirl",
        category: Category.townsfolk,
        alignment: Alignment.good,
        icon: Icons.local_florist_outlined,
        description:
            "Each night except for the first, you learn if a Demon voted today."));
    tiles.add(const Tile(
        name: "Town Crier",
        category: Category.townsfolk,
        alignment: Alignment.good,
        icon: Icons.notifications_outlined,
        description:
            "Each night except for the first, you learn if a Minion nominated today."));
    tiles.add(const Tile(
        name: "Oracle",
        category: Category.townsfolk,
        alignment: Alignment.good,
        icon: Icons.visibility,
        description:
            "Each night except for the first, you learn how many dead players are evil."));
    tiles.add(const Tile(
        name: "Savant",
        category: Category.townsfolk,
        alignment: Alignment.good,
        icon: Icons.accessible_outlined,
        description:
            "Each day, you may visit the Storyteller to learn 2 things in private: 1 is true & 1 is false."));
    tiles.add(const Tile(
        name: "Seamstress",
        category: Category.townsfolk,
        alignment: Alignment.good,
        icon: Icons.content_cut_outlined,
        description:
            "Once per game, at night, choose 2 players (not yourself): you learn if they are the same alignment."));
    tiles.add(const Tile(
        name: "Philosopher",
        category: Category.townsfolk,
        alignment: Alignment.good,
        icon: Icons.smoking_rooms_outlined,
        description:
            "Once per game, at night, choose a good character: gain that ability. If this character is in play, they are drunk."));
    tiles.add(const Tile(
        name: "Artist",
        category: Category.townsfolk,
        alignment: Alignment.good,
        icon: Icons.brush_outlined,
        description:
            "Once per game, during the day, privately ask the Storyteller any yes/no question."));
    tiles.add(const Tile(
        name: "Juggler",
        category: Category.townsfolk,
        alignment: Alignment.good,
        icon: Icons.scatter_plot_outlined,
        description:
            "On your 1st day, publicly guess up to 5 players' characters. That night, you learn how many you got correct."));
    tiles.add(const Tile(
        name: "Sage",
        category: Category.townsfolk,
        alignment: Alignment.good,
        icon: Icons.cake_outlined,
        description:
            "If the Demon kills you, you learn that it is 1 of 2 players."));

    // Outsiders
    tiles.add(const Tile(
        name: "Mutant",
        category: Category.outsider,
        alignment: Alignment.good,
        icon: Icons.festival_outlined,
        description:
            "If you are \"mad\" about being an Outsider, you might be executed."));
    tiles.add(const Tile(
        name: "Sweetheart",
        category: Category.outsider,
        alignment: Alignment.good,
        icon: Icons.volunteer_activism_outlined,
        description: "When you die, 1 player is drunk from now on."));
    tiles.add(const Tile(
        name: "Barber",
        category: Category.outsider,
        alignment: Alignment.good,
        icon: Icons.storefront_outlined,
        description:
            "If you died today or tonight, the Demon may choose 2 players (not another Demon) to swap characters."));
    tiles.add(const Tile(
        name: "Klutz",
        category: Category.outsider,
        alignment: Alignment.good,
        icon: Icons.personal_injury_outlined,
        description:
            "When you learn that you died, publicly choose 1 alive player: if they are evil, your team loses."));

    // Minions
    tiles.add(const Tile(
        name: "Evil Twin",
        category: Category.minion,
        alignment: Alignment.evil,
        icon: Icons.people_outline,
        description:
            "You & an opposing player know each other. If the good player is executed, evil wins. Good can't win if you both live."));
    tiles.add(const Tile(
        name: "Witch",
        category: Category.minion,
        alignment: Alignment.evil,
        icon: Icons.change_history_outlined,
        description:
            "Each night, choose a player: if they nominate tomorrow, they die. If just 3 players live, you lose this ability."));
    tiles.add(const Tile(
        name: "Cerenovus",
        category: Category.minion,
        alignment: Alignment.evil,
        icon: Icons.disabled_visible_outlined,
        description:
            "Each night, choose a player & a good character: they are \"mad\" they are this character tomorrow, or might be executed."));
    tiles.add(const Tile(
        name: "Pit-Hag",
        category: Category.minion,
        alignment: Alignment.evil,
        icon: Icons.emoji_events_outlined,
        description:
            "Each night except for the first, choose a player & a character they become (if not in play). If a Demon is made, deaths tonight are arbitrary."));

    // Demons
    tiles.add(const Tile(
        name: "Fang Gu",
        category: Category.demon,
        alignment: Alignment.evil,
        icon: Icons.swap_calls_outlined,
        description:
            "Each night except the first, choose a player: they die. The 1st Outsider this kills becomes an evil Fang Gu & you die instead. [+1 Outsider]"));
    tiles.add(const Tile(
        name: "Vigormortis",
        category: Category.demon,
        alignment: Alignment.evil,
        icon: Icons.vpn_key_outlined,
        description: "Each night except for the first, choose a player: they die. Minions you kill keep their ability & poison 1 Townsfolk neighbor. [-1 Outsider]"));
    tiles.add(const Tile(
        name: "No Dashii",
        category: Category.demon,
        alignment: Alignment.evil,
        icon: Icons.vaccines_outlined,
        description: "Each night except for the first, choose a player: they die. Your 2 Townsfolk neighbours are poisoned."));
    tiles.add(const Tile(
        name: "Vortox",
        category: Category.demon,
        alignment: Alignment.evil,
        icon: Icons.tornado_outlined,
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

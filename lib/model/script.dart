import 'package:clocktower_notes/model/tile.dart';
import 'package:flutter/src/material/icons.dart';

class Script {
  List<Tile> tiles;

  Script.troubleBrewing() : tiles = <Tile>[] {
    // Alignments
    tiles.add(const Tile("Good", Category.unkown, Alignment.good, Icons.thumb_up_outlined));
    tiles.add(const Tile("Evil", Category.unkown, Alignment.evil, Icons.thumb_down_outlined));
    // Townsfolk
    tiles.add(const Tile("Washerwoman", Category.townsfolk, Alignment.good, Icons.local_laundry_service_outlined));
    tiles.add(const Tile("Librarian", Category.townsfolk, Alignment.good, Icons.library_books_outlined));
    tiles.add(const Tile("Investigator", Category.townsfolk, Alignment.good, Icons.search_outlined));
    tiles.add(const Tile("Chef", Category.townsfolk, Alignment.good, Icons.cookie_outlined));
    tiles.add(const Tile("Empath", Category.townsfolk, Alignment.good, Icons.favorite_outline));
    tiles.add(const Tile("Fortune Teller", Category.townsfolk, Alignment.good, Icons.psychology_outlined));
    tiles.add(const Tile("Undertaker", Category.townsfolk, Alignment.good, Icons.notifications_outlined));
    tiles.add(const Tile("Monk", Category.townsfolk, Alignment.good, Icons.church_outlined));
    tiles.add(const Tile("Ravenskeeper", Category.townsfolk, Alignment.good, Icons.park_outlined));
    tiles.add(const Tile("Virgin", Category.townsfolk, Alignment.good, Icons.circle_outlined));
    tiles.add(const Tile("Slayer", Category.townsfolk, Alignment.good, Icons.north_east_outlined));
    tiles.add(const Tile("Soldier", Category.townsfolk, Alignment.good, Icons.cancel_outlined));
    tiles.add(const Tile("Mayor", Category.townsfolk, Alignment.good, Icons.account_balance_outlined));
    // Outsiders
    tiles.add(const Tile("Butler", Category.outsider, Alignment.good, Icons.people_outline));
    tiles.add(const Tile("Recluse", Category.outsider, Alignment.good, Icons.lightbulb_outline));
    tiles.add(const Tile("Drunk", Category.outsider, Alignment.good, Icons.liquor_outlined));
    tiles.add(const Tile("Saint", Category.outsider, Alignment.good, Icons.auto_awesome_outlined));
    // Minions
    tiles.add(const Tile("Poisoner", Category.minion, Alignment.evil, Icons.science_outlined));
    tiles.add(const Tile("Spy", Category.minion, Alignment.evil, Icons.visibility_outlined));
    tiles.add(const Tile("Baron", Category.minion, Alignment.evil, Icons.school_outlined));
    tiles.add(const Tile("Scarlett Woman", Category.minion, Alignment.evil, Icons.woman_outlined));
    // Demons
    tiles.add(const Tile("Imp", Category.demon, Alignment.evil, Icons.call_split_outlined));
  }

  static int getBaseTownsfolkCount(int players) {
    switch(players) {
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
    switch(players) {
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
    switch(players) {
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

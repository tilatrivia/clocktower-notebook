import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/game.dart';

class Store {
  static String gameStoreKey = "game";

  static void updateGame(Game game) async {
    String gameJSON = jsonEncode(game);
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(gameStoreKey, gameJSON);
  }

  static Future<Game?> getGame() async {
    final prefs = await SharedPreferences.getInstance();
    final gameJSON = prefs.getString(gameStoreKey);
    if (gameJSON == null) return null;
    return Game.fromJson(jsonDecode(gameJSON));
  }

  static void clearGame() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(gameStoreKey);
  }
}
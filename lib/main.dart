import 'dart:convert';

import 'package:clocktower_notes/notebook.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model/player.dart';
import 'model/script.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clocktower Notebook',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Script? lastScript;
  List<Player>? lastPlayers;

  void _startNewGame(Script script) {
    _storeScript(script);
    _awaitNavigatorPage(script, lastPlayers);
  }

  void _startExistingGame() {
    _awaitNavigatorPage(lastScript!, lastPlayers);
  }

  void _awaitNavigatorPage(Script script, List<Player>? lastPlayers) async {
    await Navigator.of(context).push(MaterialPageRoute(builder: (context) => NotebookPage(script: script, lastPlayers: lastPlayers)));
    _checkStore();
  }

  @override
  void initState() {
    super.initState();

    _checkStore();
  }

  void _storeScript(Script script) async {
    final scriptJSON = jsonEncode(script);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(Script.scriptKey, scriptJSON);
  }

  void _checkStore() async {
    final prefs = await SharedPreferences.getInstance();
    final scriptJSON = prefs.getString(Script.scriptKey);
    final playersJSON = prefs.getString(Player.playersKey);

    if (scriptJSON != null && playersJSON != null) {
      final Script script = Script.fromJson(jsonDecode(scriptJSON));
      final List<Player> players = (json.decode(playersJSON) as List).map((i) =>
          Player.fromJson(i)).toList();
      setState(() {
        lastScript = script;
        lastPlayers = players;
      });
    } else {
      setState(() {
        lastScript = null;
        lastPlayers = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: const Text("Clocktower Notes"),
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text("New Game",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w800
                ),
              ),
              Container(
                height: 8,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(12)),
                  backgroundColor: MaterialStateProperty.all<Color>(Script.getScriptColor(Scripts.troubleBrewing))
                ),
                onPressed: () => _startNewGame(Script.troubleBrewing()),
                child: const Text("Trouble Brewing",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                )
              ),
              Container(
                height: 8,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(12)),
                      backgroundColor: MaterialStateProperty.all<Color>(Script.getScriptColor(Scripts.sectsAndViolets))
                  ),
                  onPressed: () => _startNewGame(Script.sectsAndViolets()),
                  child: const Text("Sects and Violets",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  )
              ),
              Container(
                height: 8,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(12)),
                      backgroundColor: MaterialStateProperty.all<Color>(Script.getScriptColor(Scripts.badMoonRising))
                  ),
                  onPressed: () => debugPrint("Bad Moon Rising"),
                  child: const Text("Bad Moon Rising",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  )
              ),
              Container(
                height: 32,
              ),
              const Text("Existing Game",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w800
                ),
              ),
              Container(
                height: 8,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(12)),
                      backgroundColor: (lastScript != null)
                          ? MaterialStateProperty.all<Color>(Script.getScriptColor(lastScript!.scriptId))
                          : MaterialStateProperty.all<Color>(Colors.grey.shade400)
                  ),
                  onPressed: () {
                    if (lastScript != null) {
                      _startExistingGame();
                    }
                  },
                  child: const Text("Continue",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}



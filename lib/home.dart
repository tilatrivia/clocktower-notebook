import 'package:clocktower_notes/about.dart';
import 'package:clocktower_notes/settings.dart';
import 'package:clocktower_notes/widgets/main_option.dart';
import 'package:flutter/material.dart';

import 'data/store.dart';
import 'model/game.dart';
import 'model/icons.dart';
import 'model/script.dart';
import 'notebook.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Game? lastGame;

  void _startNewGame(Script script) {
    Store.clearGame();
    _awaitNotebookPage(Game.withScript(script));
  }

  void _startExistingGame() {
    _awaitNotebookPage(lastGame!);
  }

  void _awaitNotebookPage(Game lastGame) async {
    await Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => NotebookPage(game: lastGame)));
    _checkStore();
  }

  void _openAbout() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const AboutPage()));
  }

  void _openSettings() async {
    await Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const SettingsPage()));
    _checkStore();
  }

  @override
  void initState() {
    super.initState();

    _checkStore();
  }

  void _checkStore() async {
    final Game? retrievedGame = await Store.getGame();

    if (retrievedGame != null) {
      setState(() {
        lastGame = retrievedGame;
      });
    } else {
      setState(() {
        lastGame = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Clocktower Notes"),
          actions: [
            IconButton(
              onPressed: _openAbout,
              icon: const Icon(Icons.info)
            ),
            IconButton(
                onPressed: _openSettings,
                icon: const Icon(Icons.settings)
            ),
          ],
        ),
        body: Flex(
          direction: Axis.vertical,
          children: [
            Expanded(
              child: MainOption(
                icon: ClocktowerIcons.scriptTroubleBrewing.data,
                iconColor: ClocktowerColors.scriptTroubleBrewing.data,
                title: "Trouble Brewing",
                subtitle: "New Game",
                onPressed: () => _startNewGame(Script.troubleBrewing()),
              ),
            ),
            Container(
                height: 0.5,
                color: Colors.black12
            ),
            Expanded(
              child: MainOption(
                icon: ClocktowerIcons.scriptSectsAndViolets.data,
                iconColor: ClocktowerColors.scriptSectsAndViolets.data,
                title: "Sects And Violets",
                subtitle: "New Game",
                onPressed: () => _startNewGame(Script.sectsAndViolets()),
              ),
            ),
            Container(
                height: 0.5,
                color: Colors.black12
            ),
            Expanded(
              child: MainOption(
                icon: ClocktowerIcons.scriptBadMoodRising.data,
                iconColor: ClocktowerColors.scriptBadMoonRising.data,
                title: "Bad Moon Rising",
                subtitle: "New Game",
                onPressed: () => _startNewGame(Script.badMoodRising()),
              ),
            ),
            Container(
                height: 0.5,
                color: Colors.black12
            ),
            Expanded(
              child: MainOption(
                icon: Icons.save_outlined,
                iconColor: Colors.blueGrey,
                title: "Previous Game",
                subtitle: (lastGame != null) ? "Script: ${lastGame?.script.name} Players: ${lastGame?.players.length}" : "No Game Saved",
                onPressed: () => _startExistingGame(),
                enabled: lastGame != null,
              ),
            ),
          ],
        )
    );
  }
}
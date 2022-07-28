import 'package:clocktower_notes/model/icons.dart';
import 'package:clocktower_notes/notebook.dart';
import 'package:flutter/material.dart';

import 'data/store.dart';
import 'model/game.dart';
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
        primarySwatch: Colors.blueGrey,
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
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "New Game",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w800),
              ),
              Container(
                height: 8,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.all(12)),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          ClocktowerColors.scriptTroubleBrewing.data)),
                  onPressed: () => _startNewGame(Script.troubleBrewing()),
                  child: const Text(
                    "Trouble Brewing",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  )),
              Container(
                height: 8,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.all(12)),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          ClocktowerColors.scriptSectsAndViolets.data)),
                  onPressed: () => _startNewGame(Script.sectsAndViolets()),
                  child: const Text(
                    "Sects and Violets",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  )),
              Container(
                height: 8,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.all(12)),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          ClocktowerColors.scriptBadMoonRising.data)),
                  onPressed: () => _startNewGame(Script.badMoodRising()),
                  child: const Text(
                    "Bad Moon Rising",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  )),
              Container(
                height: 32,
              ),
              const Text(
                "Existing Game",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w800),
              ),
              Container(
                height: 8,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.all(12)),
                      backgroundColor: (lastGame != null)
                          ? MaterialStateProperty.all<Color>(
                              Colors.green.shade900)
                          : MaterialStateProperty.all<Color>(
                              Colors.grey.shade400)),
                  onPressed: () {
                    if (lastGame != null) {
                      _startExistingGame();
                    }
                  },
                  child: const Text(
                    "Continue",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

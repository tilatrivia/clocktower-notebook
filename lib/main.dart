import 'package:clocktower_notes/notebook.dart';
import 'package:flutter/material.dart';

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
  void _startGameWithScript(Script script) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => NotebookPage(script: script)));
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
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red.shade900)
                ),
                onPressed: () => _startGameWithScript(Script.troubleBrewing()),
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
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow.shade900)
                  ),
                  onPressed: () => debugPrint("Dark Moon Rising"),
                  child: const Text("Dark Moon Rising",
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
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.purple.shade900)
                ),
                onPressed: () => debugPrint("Sects and Violets"),
                child: const Text("Sects and Violets",
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



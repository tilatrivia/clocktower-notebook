import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blood on the Clocktower Notes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NotesPage(),
    );
  }
}

class Player {
  String name;
  Set<Character> characters;

  Player({required String playerName}) : name = playerName, characters = {};

  addCharacter(Character character) {
    characters.add(character);
  }

  removeCharacter(Character character) {
    characters.remove(character);
  }
}

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final List<Player> players = [];
  // final Map<String, List<Character>> players = {
  //   "Player 1": [Character.somethingGood],
  //   "Player 2": [Character.baron, Character.ravenskeeper],
  //   "Player 3": [],
  //   "Player 4": [Character.drunk, Character.investigator],
  //   "Player 5": [],
  // };

  void reset() {
    setState(() {
      players.clear();
    });
  }

  void addPlayer() {
    setState(() {
      players.add(Player(playerName: "Player ${players.length + 1}"));
    });
  }

  void removePlayer() {
    setState(() {
      players.removeLast();
    });
  }

  void addToPlayer(Player player, Character character) {
    setState(() {
      player.characters.add(character);
    });
  }

  void removeFromPlayer(Player player, Character character) {
    setState(() {
      player.characters.remove(character);
    });
  }

  int getCharacterCount(Character character) {
    return players.fold(0, (prev, player) => (player.characters.contains(character)) ? prev + 1 : prev );
  }

  int getCategoryCount(Category category) {
    return players.fold(0, (prev, player) => player.characters.fold(prev, (playerPrev, character) => (character.category == category) ? playerPrev + 1 : playerPrev ));
  }

  int getAlignmentCount(Alignment alignment) {
    return players.fold(0, (prev, player) => player.characters.fold(prev, (playerPrev, character) => (character.alignment == alignment) ? playerPrev + 1 : playerPrev ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trouble Brewing Notes"),
        actions: [
          IconButton(
            onPressed: () => reset(),
            icon: const Icon(Icons.delete),
          ),
          IconButton(
            onPressed: () => removePlayer(),
            icon: const Icon(Icons.remove),
          ),
          IconButton(
            onPressed: () => addPlayer(),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(child:
            SizedBox(
              width: double.infinity,
              child: ListView.separated(
                itemCount: players.length,
                itemBuilder: (context, index) {
                  return DragTarget<Character>(
                    builder: (context, candidates, rejects) {
                      return _buildPlayerTile(
                          player: players.elementAt(index),
                          onRemove: removeFromPlayer,
                      );
                    },
                    onAccept: (character) {
                      addToPlayer(players.elementAt(index), character);
                    }
                  );
                },
                separatorBuilder: (BuildContext context, int index) => const Divider()
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 300,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Wrap(
                    spacing: 8,
                    children: Character.values.map((character) => Draggable(
                      data: character,
                      feedback: Material(
                          color: Colors.transparent,
                          child: _buildCharacterTile(character: character)
                      ),
                      child: _buildCharacterTile(character: character, count: getCharacterCount(character)),
                      onDragEnd: (details) => {
                        debugPrint(details.wasAccepted.toString())
                      },
                    )).toList(),
                ),
              ),
            )
          ),
        ],
      ),
    );
  }
}

Widget _buildPlayerTile({required Player player, required void Function(Player, Character) onRemove}) {
  return Container(
    padding: const EdgeInsets.all(8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              player.name,
              style: const TextStyle(fontSize: 28),
            ),
          ],
        ),
        Wrap(
          spacing: 8,
          children: player.characters.map((character) => _buildCharacterTile(
              character: character, onRemove: () => onRemove(player, character))).toList(),
        )
      ],
    ),
  );
}

Widget _buildCharacterTile({required Character character, void Function()? onRemove, int? count}) {
  debugPrint(character.toString());
  debugPrint(count.toString());
  return Padding(
    padding: const EdgeInsets.only(top: 4, bottom: 4),
    child: Chip(
      padding: const EdgeInsets.all(8),
      avatar: Icon(
        character.icon,
        color: (character.alignment == Alignment.good) ? Colors.blue : Colors.red,
        size: 24,
      ),
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            character.name,
            style: const TextStyle(fontSize: 20),
          ),
          if (count != null && count > 0)
            Container(
              width: 10,
            ),
          if (count != null && count > 0)
            Text(
              count.toString()
            )
        ],
      ),
      deleteIcon: const Icon(Icons.close),
      onDeleted: onRemove,
    ),
  );
}

enum Alignment {
  good,
  evil
}

enum Category {
  townsfolk,
  outsider,
  minion,
  demon,
  unkown
}

enum Character {
  somethingGood,
  somethingBad,
  washerwoman,
  librarian,
  investigator,
  chef,
  empath,
  fortuneTeller,
  undertaker,
  monk,
  ravenskeeper,
  virgin,
  slayer,
  soldier,
  mayor,
  butler,
  recluse,
  drunk,
  saint,
  poisoner,
  spy,
  baron,
  scarlettWoman,
  imp
}

extension CharachterExtension on Character {
  String get name {
    switch (this) {
      case Character.somethingGood:
        return "Good";
      case Character.somethingBad:
        return "Bad";
      case Character.washerwoman:
        return "Washerwoman";
      case Character.librarian:
        return "Librarian";
      case Character.investigator:
        return "Investigator";
      case Character.chef:
        return "Chef";
      case Character.empath:
        return "Empath";
      case Character.fortuneTeller:
        return "Fortune Teller";
      case Character.undertaker:
        return "Undertaker";
      case Character.monk:
        return "Monk";
      case Character.ravenskeeper:
        return "Ravenskeeper";
      case Character.virgin:
        return "Virgin";
      case Character.slayer:
        return "Slayer";
      case Character.soldier:
        return "Soldier";
      case Character.mayor:
        return "Mayor";
      case Character.butler:
        return "Butler";
      case Character.recluse:
        return "Recluse";
      case Character.drunk:
        return "Drunk";
      case Character.saint:
        return "Saint";
      case Character.poisoner:
        return "Poisoner";
      case Character.spy:
        return "Spy";
      case Character.baron:
        return "Baron";
      case Character.scarlettWoman:
        return "Scarlett Woman";
      case Character.imp:
        return "Imp";
    }
  }

  Category get category {
    switch (this) {
      case Character.somethingGood:
      case Character.somethingBad:
        return Category.unkown;
      case Character.washerwoman:
      case Character.librarian:
      case Character.investigator:
      case Character.chef:
      case Character.empath:
      case Character.fortuneTeller:
      case Character.undertaker:
      case Character.monk:
      case Character.ravenskeeper:
      case Character.virgin:
      case Character.slayer:
      case Character.soldier:
      case Character.mayor:
        return Category.townsfolk;
      case Character.butler:
      case Character.recluse:
      case Character.drunk:
      case Character.saint:
        return Category.outsider;
      case Character.poisoner:
      case Character.spy:
      case Character.baron:
      case Character.scarlettWoman:
        return Category.minion;
      case Character.imp:
        return Category.demon;
    }
  }

  Alignment get alignment {
    switch (this) {
      case Character.somethingGood:
      case Character.washerwoman:
      case Character.librarian:
      case Character.investigator:
      case Character.chef:
      case Character.empath:
      case Character.fortuneTeller:
      case Character.undertaker:
      case Character.monk:
      case Character.ravenskeeper:
      case Character.virgin:
      case Character.slayer:
      case Character.soldier:
      case Character.mayor:
      case Character.butler:
      case Character.recluse:
      case Character.drunk:
      case Character.saint:
        return Alignment.good;
      case Character.somethingBad:
      case Character.poisoner:
      case Character.spy:
      case Character.baron:
      case Character.scarlettWoman:
      case Character.imp:
        return Alignment.evil;
    }
  }

  IconData get icon {
    switch (this) {
      case Character.somethingGood:
        return Icons.thumb_up_outlined;
      case Character.somethingBad:
        return Icons.thumb_down_outlined;
      case Character.washerwoman:
        return Icons.local_laundry_service_outlined;
      case Character.librarian:
        return Icons.library_books_outlined;
      case Character.investigator:
        return Icons.search_outlined;
      case Character.chef:
        return Icons.cookie_outlined;
      case Character.empath:
        return Icons.favorite_outline;
      case Character.fortuneTeller:
        return Icons.psychology_outlined;
      case Character.undertaker:
        return Icons.notifications_outlined;
      case Character.monk:
        return Icons.church_outlined;
      case Character.ravenskeeper:
        return Icons.park_outlined;
      case Character.virgin:
        return Icons.circle_outlined;
      case Character.slayer:
        return Icons.north_east_outlined;
      case Character.soldier:
        return Icons.cancel_outlined;
      case Character.mayor:
        return Icons.account_balance_outlined;
      case Character.butler:
        return Icons.people_outline;
      case Character.recluse:
        return Icons.lightbulb_outline;
      case Character.drunk:
        return Icons.liquor;
      case Character.saint:
        return Icons.auto_awesome_outlined;
      case Character.poisoner:
        return Icons.science_outlined;
      case Character.spy:
        return Icons.visibility_outlined;
      case Character.baron:
        return Icons.school_outlined;
      case Character.scarlettWoman:
        return Icons.woman_outlined;
      case Character.imp:
        return Icons.sentiment_very_dissatisfied_outlined;
    }
  }

  bool isEqual(Character other) {
    return index == other.index;
  }
}

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have clicked the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

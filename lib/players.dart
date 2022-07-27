import 'package:flutter/material.dart';

import 'model/player.dart';

class PlayersPage extends StatefulWidget {
  const PlayersPage({Key? key}) : super(key: key);

  @override
  State createState() => _PlayersPageState();
}

class _PlayersPageState extends State<PlayersPage> {
  final List<Player> players = [ // TODO: Remove extra players
    Player("Myself"),
    Player("Player 1"),
    Player("Player 2"),
    Player("Player 3"),
    Player("Player 4"),
    Player("Player 5"),
    Player("Player 6"),
    Player("Player 7"),
    Player("Player 8"),
    Player("Player 9"),
    Player("Player 10"),
    Player("Player 11"),
  ];
  late TextEditingController textFieldController;
  final ScrollController scrollController = ScrollController();
  
  void _addPlayer(String name) {
    setState(() {
      players.add(Player(name));
    });
  }

  void _removePlayer(int index) {
    setState(() {
      players.removeAt(index);
    });
  }

  void _reorderPlayers(int oldIndex, int newIndex) {
    setState(() {
      if (oldIndex < newIndex) {
        newIndex -= 1;
      }
      final Player player = players.removeAt(oldIndex);
      players.insert(newIndex, player);
    });
  }

  @override
  void initState() {
    super.initState();

    textFieldController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();

    textFieldController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: _confirmPlayers,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Add Players"),
          actions: [
            TextButton(
              onPressed: _confirmPlayers,
              child: const Text("DONE",
                style: TextStyle(color: Colors.white),
              )
            ),
          ],
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: ReorderableListView(
                scrollController: scrollController,
                onReorder: _reorderPlayers,
                children: [
                  for (int i = 0; i < players.length; i++)
                    Card(
                      key: Key("$i"),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Text(players.elementAt(i).name,
                              style: const TextStyle(fontSize: 24),
                            ),
                            const Spacer(),
                            IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () => _removePlayer(i),
                            )
                          ],
                        ),
                      ),
                    )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: TextField(
                      autofocus: true,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: const InputDecoration(
                        hintText: "Player Name",
                      ),
                      controller: textFieldController,
                      onSubmitted: (value) {
                        _addPlayer(value);
                        WidgetsBinding.instance.addPostFrameCallback(
                                (_) => _scrollToBottom());
                        textFieldController.clear();
                      },
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _addPlayer(textFieldController.value.text);
                      WidgetsBinding.instance.addPostFrameCallback(
                              (_) => _scrollToBottom());
                      textFieldController.clear();
                    },
                    child: const Text("ADD")
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _scrollToBottom() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  Future<bool> _confirmPlayers() async {
    return (await showDialog(
      context: context,
      builder: (context) =>
        AlertDialog(
          title: Text("Adding ${players.length} Players"),
          content: const Text("The players cannot be changed later."),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text("CANCEL"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
                Navigator.of(context).pop(players);
              },
              child: const Text("OK")
            )
          ],
        )
    )
    ) ?? false;
  }
}
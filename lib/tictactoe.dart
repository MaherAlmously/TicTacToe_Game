import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:tictactoe/game.dart';
import 'package:tictactoe/players.dart';
import 'package:tictactoe/result_screen.dart';
import 'package:tictactoe/start_screen.dart';

class Tictactoe extends StatefulWidget {
  const Tictactoe({super.key});

  @override
  State<Tictactoe> createState() {
    return _Tictactoe();
  }
}

class _Tictactoe extends State<Tictactoe> {
  String player1 = '';
  String player2 = '';
  String player1NickName = '';
  String player2NickName = '';
  //final player = AudioPlayer();

  void startGame(
    String player1,
    String player2,
    String player1NickName,
    String player2Nickname,
  ) {
    this.player1 = player1;
    this.player2 = player2;
    this.player1NickName = player1NickName;
    this.player2NickName = player2Nickname;

    setState(() {
      currentScreen = "game";
    });
  }

  String name = '';
  String label = '';

  void next() {
    setState(() {
      currentScreen = "player_Screen";
    });
  }

  void replay() {
    setState(() {
      currentScreen = "game";
    });
  }

  void results(String playerName, String playerIcon) {
    name = playerName;
    label = playerIcon;
    setState(() {
      currentScreen = 'result_screen';
    });
    // player.play(AssetSource('assets/sounds/congrats.mp3'));
  }

  void restart() {
    setState(() {
      currentScreen = "player_Screen";
    });
  }

  String currentScreen = "start_screen";

  @override
  Widget build(BuildContext context) {
    Widget currentWidget = StartScreen(next: next);
    if (currentScreen == "player_Screen") {
      currentWidget = Players(startGame: startGame);
    } else if (currentScreen == "game") {
      currentWidget = Game(
        player1,
        player2,
        player1NickName,
        player2NickName,
        results,
        replay,
        key: UniqueKey(),
      );
    }
    if (currentScreen == 'result_screen') {
      currentWidget = ResultScreen(name: name, label: label, replay, restart);
    }
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,

        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 156, 154, 154),
              const Color.fromARGB(255, 56, 56, 56),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),

        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: currentWidget,
          ),
        ),
      ),
    );
  }
}

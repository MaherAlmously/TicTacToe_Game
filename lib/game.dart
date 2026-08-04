import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Game extends StatefulWidget {
  const Game(
    this.player1,
    this.player2,
    this.player1Nickname,
    this.player2Nickname,
    this.results,
    this.replay, {
    super.key,
  });
  final void Function(String playerName, String playerIcon) results;
  final void Function() replay;
  final String player1Nickname;
  final String player2Nickname;
  final String player1;
  final String player2;
  @override
  State<Game> createState() {
    return _Game();
  }
}

class _Game extends State<Game> {
  bool turns = Random().nextBool();
  List<IconData?> iconNames = List.filled(9, null);
  List<Color?> iconColors = List.filled(9, null);
  String playerLabels = '';
  bool endGame = false;
  bool itsTie = false;
  int iconCounts = 0;
  Widget ifTie = SizedBox(height: 1);
  @override
  Widget build(context) {
    final size = MediaQuery.sizeOf(context);

    Widget textTurns = turns
        ? Text(
            "${widget.player1Nickname}'s Turn",
            style: GoogleFonts.bebasNeue(fontSize: 35, color: Colors.white),
          )
        : Text(
            "${widget.player2Nickname}'s Turn",
            style: GoogleFonts.bebasNeue(fontSize: 35, color: Colors.white),
          );

    if (endGame) {
      textTurns = Text(
        "We Have A Winner!!",
        style: GoogleFonts.bebasNeue(fontSize: 35, color: Colors.white),
      );
    }

    if (iconCounts == 9 && !endGame) {
      textTurns = Text(
        "Its A Tie!",
        style: GoogleFonts.bebasNeue(fontSize: 35, color: Colors.white),
      );
      itsTie = true;
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final double cellSize = (constraints.maxWidth - 60) / 3;
        final double iconSize = cellSize * 0.6;

        List<Widget> boxes = [];
        int index = 0;
        while (boxes.length < 9) {
          Widget icon = Icon(
            iconNames[index],
            size: iconSize,
            color: iconColors[index] ?? Colors.black,
          );
          // using this final currentIndex every box gets it unique Index and not all share the same index variable.
          final currentIndex = index;

          // Here im adding all the boxes in the tic tac game , like all of the boxes will have these propetied
          boxes.add(
            GestureDetector(
              onTap: () {
                if (!endGame) {
                  if (iconNames[currentIndex] == null) {
                    setState(() {
                      iconCounts++;

                      if (turns) {
                        if (widget.player1 == 'O') {
                          playerLabels = "Player1: O";
                          iconNames[currentIndex] = Icons.circle_outlined;
                        } else {
                          playerLabels = "Player1: X";

                          iconNames[currentIndex] = Icons.close_outlined;
                        }
                      } else {
                        if (widget.player2 == 'O') {
                          playerLabels = "Player2: O";

                          iconNames[currentIndex] = Icons.circle_outlined;
                        } else {
                          playerLabels = "Player2: X";
                          iconNames[currentIndex] = Icons.close_outlined;
                        }
                      }

                      turns = turns ? false : true;
                    });
                  }

                  // Tie Logic

                  // for (int i = 0; i < 9; i++) {
                  //   if (iconNames[i] != null) {
                  //     iconCounts++;
                  //   }
                  // }

                  // O Winning logic
                  if (Icons.circle_outlined == iconNames[0] &&
                      Icons.circle_outlined == iconNames[1] &&
                      Icons.circle_outlined == iconNames[2]) {
                    iconColors[0] = Colors.amber;
                    iconColors[1] = Colors.amber;
                    iconColors[2] = Colors.amber;

                    endGame = true;
                    if (playerLabels == 'Player1: O') {
                      Future.delayed(Duration(seconds: 2), () {
                        widget.results(widget.player1Nickname, 'O');
                      });

                      // call results of course , but what will we pass to it , what info is the best ?
                    } else {
                      Future.delayed(Duration(seconds: 2), () {
                        widget.results(widget.player2Nickname, 'O');
                      });
                    }
                  }

                  if (Icons.circle_outlined == iconNames[3] &&
                      Icons.circle_outlined == iconNames[4] &&
                      Icons.circle_outlined == iconNames[5]) {
                    iconColors[3] = Colors.amber;
                    iconColors[4] = Colors.amber;
                    iconColors[5] = Colors.amber;

                    endGame = true;
                    if (playerLabels == 'Player1: O') {
                      Future.delayed(Duration(seconds: 2), () {
                        widget.results(widget.player1Nickname, 'O');
                      });

                      // call results of course , but what will we pass to it , what info is the best ?
                    } else {
                      Future.delayed(Duration(seconds: 2), () {
                        widget.results(widget.player2Nickname, 'O');
                      });
                    }
                  }

                  if (Icons.circle_outlined == iconNames[6] &&
                      Icons.circle_outlined == iconNames[7] &&
                      Icons.circle_outlined == iconNames[8]) {
                    iconColors[6] = Colors.amber;
                    iconColors[7] = Colors.amber;
                    iconColors[8] = Colors.amber;

                    endGame = true;
                    if (playerLabels == 'Player1: O') {
                      Future.delayed(Duration(seconds: 2), () {
                        widget.results(widget.player1Nickname, 'O');
                      });

                      // call results of course , but what will we pass to it , what info is the best ?
                    } else {
                      Future.delayed(Duration(seconds: 2), () {
                        widget.results(widget.player2Nickname, 'O');
                      });
                    }
                  }

                  if (Icons.circle_outlined == iconNames[0] &&
                      Icons.circle_outlined == iconNames[3] &&
                      Icons.circle_outlined == iconNames[6]) {
                    iconColors[0] = Colors.amber;
                    iconColors[3] = Colors.amber;
                    iconColors[6] = Colors.amber;

                    endGame = true;
                    if (playerLabels == 'Player1: O') {
                      Future.delayed(Duration(seconds: 2), () {
                        widget.results(widget.player1Nickname, 'O');
                      });

                      // call results of course , but what will we pass to it , what info is the best ?
                    } else {
                      Future.delayed(Duration(seconds: 2), () {
                        widget.results(widget.player2Nickname, 'O');
                      });
                    }
                  }

                  if (Icons.circle_outlined == iconNames[1] &&
                      Icons.circle_outlined == iconNames[4] &&
                      Icons.circle_outlined == iconNames[7]) {
                    iconColors[1] = Colors.amber;
                    iconColors[4] = Colors.amber;
                    iconColors[7] = Colors.amber;

                    endGame = true;
                    if (playerLabels == 'Player1: O') {
                      Future.delayed(Duration(seconds: 2), () {
                        widget.results(widget.player1Nickname, 'O');
                      });

                      // call results of course , but what will we pass to it , what info is the best ?
                    } else {
                      Future.delayed(Duration(seconds: 2), () {
                        widget.results(widget.player2Nickname, 'O');
                      });
                    }
                  }

                  if (Icons.circle_outlined == iconNames[2] &&
                      Icons.circle_outlined == iconNames[5] &&
                      Icons.circle_outlined == iconNames[8]) {
                    iconColors[2] = Colors.amber;
                    iconColors[5] = Colors.amber;
                    iconColors[8] = Colors.amber;

                    endGame = true;
                    if (playerLabels == 'Player1: O') {
                      Future.delayed(Duration(seconds: 2), () {
                        widget.results(widget.player1Nickname, 'O');
                      });

                      // call results of course , but what will we pass to it , what info is the best ?
                    } else {
                      Future.delayed(Duration(seconds: 2), () {
                        widget.results(widget.player2Nickname, 'O');
                      });
                    }
                  }

                  if (Icons.circle_outlined == iconNames[0] &&
                      Icons.circle_outlined == iconNames[4] &&
                      Icons.circle_outlined == iconNames[8]) {
                    iconColors[0] = Colors.amber;
                    iconColors[4] = Colors.amber;
                    iconColors[8] = Colors.amber;

                    endGame = true;
                    if (playerLabels == 'Player1: O') {
                      Future.delayed(Duration(seconds: 2), () {
                        widget.results(widget.player1Nickname, 'O');
                      });

                      // call results of course , but what will we pass to it , what info is the best ?
                    } else {
                      Future.delayed(Duration(seconds: 2), () {
                        widget.results(widget.player2Nickname, 'O');
                      });
                    }
                  }

                  if (Icons.circle_outlined == iconNames[6] &&
                      Icons.circle_outlined == iconNames[4] &&
                      Icons.circle_outlined == iconNames[2]) {
                    iconColors[6] = Colors.amber;
                    iconColors[4] = Colors.amber;
                    iconColors[2] = Colors.amber;

                    endGame = true;
                    if (playerLabels == 'Player1: O') {
                      Future.delayed(Duration(seconds: 2), () {
                        widget.results(widget.player1Nickname, 'O');
                      });

                      // call results of course , but what will we pass to it , what info is the best ?
                    } else {
                      Future.delayed(Duration(seconds: 2), () {
                        widget.results(widget.player2Nickname, 'O');
                      });
                    }
                  }

                  // X Winning Logic

                  if (Icons.close_outlined == iconNames[0] &&
                      Icons.close_outlined == iconNames[1] &&
                      Icons.close_outlined == iconNames[2]) {
                    iconColors[0] = Colors.amber;
                    iconColors[1] = Colors.amber;
                    iconColors[2] = Colors.amber;

                    endGame = true;
                    if (playerLabels == 'Player1: X') {
                      Future.delayed(Duration(seconds: 2), () {
                        widget.results(widget.player1Nickname, 'X');
                      });

                      // call results of course , but what will we pass to it , what info is the best ?
                    } else {
                      Future.delayed(Duration(seconds: 2), () {
                        widget.results(widget.player2Nickname, 'X');
                      });
                    }
                  }

                  if (Icons.close_outlined == iconNames[3] &&
                      Icons.close_outlined == iconNames[4] &&
                      Icons.close_outlined == iconNames[5]) {
                    iconColors[3] = Colors.amber;
                    iconColors[4] = Colors.amber;
                    iconColors[5] = Colors.amber;

                    endGame = true;
                    if (playerLabels == 'Player1: X') {
                      Future.delayed(Duration(seconds: 2), () {
                        widget.results(widget.player1Nickname, 'X');
                      });

                      // call results of course , but what will we pass to it , what info is the best ?
                    } else {
                      Future.delayed(Duration(seconds: 2), () {
                        widget.results(widget.player2Nickname, 'X');
                      });
                    }
                  }

                  if (Icons.close_outlined == iconNames[6] &&
                      Icons.close_outlined == iconNames[7] &&
                      Icons.close_outlined == iconNames[8]) {
                    iconColors[6] = Colors.amber;
                    iconColors[7] = Colors.amber;
                    iconColors[8] = Colors.amber;

                    endGame = true;
                    if (playerLabels == 'Player1: X') {
                      Future.delayed(Duration(seconds: 2), () {
                        widget.results(widget.player1Nickname, 'X');
                      });

                      // call results of course , but what will we pass to it , what info is the best ?
                    } else {
                      Future.delayed(Duration(seconds: 2), () {
                        widget.results(widget.player2Nickname, 'X');
                      });
                    }
                  }

                  if (Icons.close_outlined == iconNames[0] &&
                      Icons.close_outlined == iconNames[3] &&
                      Icons.close_outlined == iconNames[6]) {
                    iconColors[0] = Colors.amber;
                    iconColors[3] = Colors.amber;
                    iconColors[6] = Colors.amber;

                    endGame = true;
                    if (playerLabels == 'Player1: X') {
                      Future.delayed(Duration(seconds: 2), () {
                        widget.results(widget.player1Nickname, 'X');
                      });

                      // call results of course , but what will we pass to it , what info is the best ?
                    } else {
                      Future.delayed(Duration(seconds: 2), () {
                        widget.results(widget.player2Nickname, 'X');
                      });
                    }
                  }

                  if (Icons.close_outlined == iconNames[1] &&
                      Icons.close_outlined == iconNames[4] &&
                      Icons.close_outlined == iconNames[7]) {
                    iconColors[1] = Colors.amber;
                    iconColors[4] = Colors.amber;
                    iconColors[7] = Colors.amber;

                    endGame = true;
                    if (playerLabels == 'Player1: X') {
                      Future.delayed(Duration(seconds: 2), () {
                        widget.results(widget.player1Nickname, 'X');
                      });

                      // call results of course , but what will we pass to it , what info is the best ?
                    } else {
                      Future.delayed(Duration(seconds: 2), () {
                        widget.results(widget.player2Nickname, 'X');
                      });
                    }
                  }

                  if (Icons.close_outlined == iconNames[2] &&
                      Icons.close_outlined == iconNames[5] &&
                      Icons.close_outlined == iconNames[8]) {
                    iconColors[2] = Colors.amber;
                    iconColors[5] = Colors.amber;
                    iconColors[8] = Colors.amber;

                    endGame = true;
                    if (playerLabels == 'Player1: X') {
                      Future.delayed(Duration(seconds: 2), () {
                        widget.results(widget.player1Nickname, 'X');
                      });

                      // call results of course , but what will we pass to it , what info is the best ?
                    } else {
                      Future.delayed(Duration(seconds: 2), () {
                        widget.results(widget.player2Nickname, 'X');
                      });
                    }
                  }

                  if (Icons.close_outlined == iconNames[0] &&
                      Icons.close_outlined == iconNames[4] &&
                      Icons.close_outlined == iconNames[8]) {
                    iconColors[0] = Colors.amber;
                    iconColors[4] = Colors.amber;
                    iconColors[8] = Colors.amber;

                    endGame = true;
                    if (playerLabels == 'Player1: X') {
                      Future.delayed(Duration(seconds: 2), () {
                        widget.results(widget.player1Nickname, 'X');
                      });

                      // call results of course , but what will we pass to it , what info is the best ?
                    } else {
                      Future.delayed(Duration(seconds: 2), () {
                        widget.results(widget.player2Nickname, 'X');
                      });
                    }
                  }

                  if (Icons.close_outlined == iconNames[6] &&
                      Icons.close_outlined == iconNames[4] &&
                      Icons.close_outlined == iconNames[2]) {
                    iconColors[6] = Colors.amber;
                    iconColors[4] = Colors.amber;
                    iconColors[2] = Colors.amber;

                    endGame = true;
                    if (playerLabels == 'Player1: X') {
                      Future.delayed(Duration(seconds: 2), () {
                        widget.results(widget.player1Nickname, 'X');
                      });

                      // call results of course , but what will we pass to it , what info is the best ?
                    } else {
                      Future.delayed(Duration(seconds: 2), () {
                        widget.results(widget.player2Nickname, 'X');
                      });
                    }
                  }
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  border: currentIndex == 0 || currentIndex == 3
                      ? BorderDirectional(
                          bottom: BorderSide(width: 5, color: Colors.white),
                        )
                      : currentIndex == 1 ||
                            currentIndex == 2 ||
                            currentIndex == 4 ||
                            currentIndex == 5
                      ? BorderDirectional(
                          bottom: BorderSide(width: 5, color: Colors.white),
                          start: BorderSide(width: 5, color: Colors.white),
                        )
                      : currentIndex == 7 || currentIndex == 8
                      ? BorderDirectional(
                          start: BorderSide(width: 5, color: Colors.white),
                        )
                      : Border.all(
                          width: 0,
                          color: const Color.fromARGB(0, 0, 0, 0),
                        ),
                ),
                child: Center(
                  child: iconNames[currentIndex] != null
                      ? icon
                      : const SizedBox.shrink(),
                ),
              ),
            ),
          );

          if (index < 9) {
            index++;
          }
        }

        return Container(
          margin: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.07),
              textTurns,
              SizedBox(height: size.height * 0.04),

              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                children: boxes.map((box) {
                  return box;
                }).toList(),
              ),
              SizedBox(height: size.height * 0.04),
              itsTie
                  ? ElevatedButton.icon(
                      onPressed: widget.replay,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      label: Text(
                        "Replay",
                        style: GoogleFonts.dmSans(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontSize: 35,
                        ),
                      ),
                      icon: Icon(Icons.replay, size: 25, color: Colors.black),
                      iconAlignment: IconAlignment.end,
                    )
                  : SizedBox(height: 1),
            ],
          ),
        );
      },
    );
  }
}

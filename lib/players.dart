import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Players extends StatefulWidget {
  Players({required this.startGame, super.key});

  void Function(
    String player1,
    String player2,
    String player1NickName,
    String player2Nickname,
  )
  startGame;

  @override
  State<Players> createState() {
    return _Players();
  }
}

class _Players extends State<Players> {
  final _nickNameController = TextEditingController();
  String selectedPlayer = '';
  String currentPlayer = '1';
  bool hidO = false;
  bool hidX = false;
  String player1 = '';
  String player2 = '';
  String player1Name = '';
  String player2Name = '';

  @override
  void dispose() {
    _nickNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final titleSize = (size.width * 0.15).clamp(40.0, 70.0);
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.13),
            Text(
              currentPlayer == '1' ? "Player #1" : "Player #2",
              style: GoogleFonts.bebasNeue(fontSize: titleSize, color: Colors.white),
            ),

            SizedBox(height: size.height * 0.05),
            TextField(
              controller: _nickNameController,
              cursorColor: Colors.white,
              maxLength: 7,
              style: GoogleFonts.dmSans(color: Colors.white),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                label: Text("nickname", style: TextStyle(color: Colors.white)),
              ),
            ),

            hidX && currentPlayer == '2'
                ? const SizedBox(height: 0)
                : RadioListTile<String>(
                    activeColor: Colors.white,
                    selected: currentPlayer == '2',
                    title: Text(
                      "Player: X",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    value: "X", // this option's identity
                    groupValue: selectedPlayer, // current selected
                    onChanged: (value) {
                      setState(() {
                        selectedPlayer = value!; // update the choice
                      });
                    },
                  ),

            // Here and above im hiding the choice that was selected
            hidO && currentPlayer == '2'
                ? const SizedBox(height: 0)
                : RadioListTile<String>(
                    activeColor: Colors.white,
                    selected: currentPlayer == '2',
                    title: Text(
                      "Player: O",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    value: "O", // this option's identity
                    groupValue: selectedPlayer, // current selected
                    onChanged: (value) {
                      setState(() {
                        selectedPlayer = value!; // update the choice
                      });
                    },
                  ),

            SizedBox(height: size.height * 0.05),

            ElevatedButton(
              onPressed: () {
                if (selectedPlayer.isEmpty ||
                    _nickNameController.text.isEmpty) {
                  showDialog(
                    context: context,
                    builder: (ctx) {
                      return AlertDialog(
                        title: Text("Invalid Data"),
                        content: Text(
                          "Please Choose a  valid nickname (Must be 2 unique names) , choose Player: X or Player: O",
                        ),
                        actions: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(ctx);
                            },
                            icon: Icon(Icons.close),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  if (currentPlayer == '2') {
                    String testName = _nickNameController.text.trim();
                    if (testName == player1Name) {
                      showDialog(
                        context: context,
                        builder: (ctx) {
                          return AlertDialog(
                            title: Text("Invalid Data"),
                            content: Text(
                              "Please Choose a  valid nickname (Must be 2 unique names) , choose Player: X or Player: O",
                            ),
                            actions: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(ctx);
                                },
                                icon: Icon(Icons.close),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      player2Name = _nickNameController.text.trim();
                      widget.startGame(
                        player1,
                        player2,
                        player1Name,
                        player2Name,
                      );
                      //print("Lets Start The Game");
                    }
                  } else {
                    setState(() {
                      player1Name = _nickNameController.text.trim();

                      _nickNameController.clear();
                      currentPlayer = '2';
                      if (selectedPlayer == 'O') {
                        hidO = true;
                        player1 = 'O';
                        player2 = 'X';
                        selectedPlayer = 'X';
                      } else {
                        hidX = true;
                        player1 = 'X';
                        player2 = 'O';
                        selectedPlayer = 'O';
                      }
                    });
                  }
                }
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
              child: Text(
                currentPlayer == '1' ? "NEXT" : "BEGIN",
                style: GoogleFonts.dmSans(color: Colors.black, fontSize: 35),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

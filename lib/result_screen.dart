import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen(
    this.replay,
    this.restart, {
    required this.name,
    required this.label,
    super.key,
  });
  
  String name;
  String label;
  void Function() replay;
  void Function() restart;

  // NEXT STEPS: make the functions for restart , play again and exit , and some final touches , also try to add sound maybe !
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        SizedBox(height: size.height * 0.05),
        Text(
          "$name Is the Winner!",
          style: GoogleFonts.bebasNeue(
            fontSize: 40,
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        SizedBox(height: size.height * 0.1),
        Text(
          "Choose from the following:",
          style: GoogleFonts.dmSans(fontSize: 30, color: Colors.white),
        ),
        SizedBox(height: size.height * 0.03),
        //Button-1
        ElevatedButton.icon(
          onPressed: replay,
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          label: Text(
            "Play Again",
            style: GoogleFonts.dmSans(color: Colors.white, fontSize: 35),
          ),
          icon: Icon(Icons.replay, size: 25, color: Colors.black),
          iconAlignment: IconAlignment.end,
        ),
        SizedBox(height: 20),
        //Button-2
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 0, 78, 3),
          ),
          onPressed: restart,
          label: Text(
            "Restart Game",
            style: GoogleFonts.dmSans(color: Colors.white, fontSize: 35),
          ),
          icon: Icon(Icons.repeat_sharp, size: 25, color: Colors.black),
          iconAlignment: IconAlignment.end,
        ),
        SizedBox(height: 20),
        //Button-3
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          onPressed: () {
            if (!kIsWeb) {
              SystemNavigator.pop();
            }
          },
          label: Text(
            "Exit Game",
            style: GoogleFonts.dmSans(color: Colors.white, fontSize: 35),
          ),
          icon: Icon(Icons.exit_to_app_rounded, size: 25, color: Colors.black),
          iconAlignment: IconAlignment.end,
        ),
      ],
    );
  }
}

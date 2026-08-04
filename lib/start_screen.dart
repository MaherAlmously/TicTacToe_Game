import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
   StartScreen({required this.next, super.key});

  void Function() next;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final titleSize = (size.width * 0.2).clamp(48.0, 100.0);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Tic-Tac-Toe",
          style: GoogleFonts.bebasNeue(
            color: Colors.white,
            fontSize: titleSize,
          ),
        ),
        SizedBox(height: size.height * 0.08),

        ElevatedButton.icon(
          onPressed: next,
          style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
          label: Text(
            "Begin",
            style: GoogleFonts.dmSans(fontSize: 35, color: Colors.black),
          ),
          icon: Icon(Icons.double_arrow_sharp, color: const Color.fromARGB(255, 0, 0, 0), size: 35),
          iconAlignment: IconAlignment.end,
        ),
      ],
    );
  }
}

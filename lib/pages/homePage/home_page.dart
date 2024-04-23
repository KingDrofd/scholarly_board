import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "This Is The Home Page",
        style: GoogleFonts.rubik(fontSize: 26),
      ),
    );
  }
}

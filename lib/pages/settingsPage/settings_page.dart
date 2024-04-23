import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "This Is The Settings Page",
          style: GoogleFonts.rubik(fontSize: 26),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "This Is The Dashboard Page",
        style: GoogleFonts.rubik(fontSize: 26),
      ),
    );
  }
}

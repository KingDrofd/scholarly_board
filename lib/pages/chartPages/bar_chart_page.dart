import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class BarChartPage extends StatelessWidget {
  const BarChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "This Is The Bar Chart Page",
        style: GoogleFonts.rubik(fontSize: 26),
      ),
    );
  }
}

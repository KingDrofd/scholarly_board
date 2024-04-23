import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class PieChartPage extends StatelessWidget {
  const PieChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "This Is The Pie Chart Page",
        style: GoogleFonts.rubik(fontSize: 26),
      ),
    );
  }
}

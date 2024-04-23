import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class ScatterChartPage extends StatelessWidget {
  const ScatterChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "This Is The Scatter Chart Page",
        style: GoogleFonts.rubik(fontSize: 26),
      ),
    );
  }
}

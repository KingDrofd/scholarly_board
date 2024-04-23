import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class RadarChartPage extends StatelessWidget {
  const RadarChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "This Is The Radar Chart Page",
        style: GoogleFonts.rubik(fontSize: 26),
      ),
    );
  }
}

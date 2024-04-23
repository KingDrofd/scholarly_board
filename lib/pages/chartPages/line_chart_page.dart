import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class LineChartPage extends StatelessWidget {
  const LineChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "This Is The Line Chart Page",
        style: GoogleFonts.rubik(fontSize: 26),
      ),
    );
  }
}

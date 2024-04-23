import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "This Is The Account Page",
        style: GoogleFonts.rubik(fontSize: 26),
      ),
    );
  }
}

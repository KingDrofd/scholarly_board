import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scholarly_board/widgets/custom_button.dart';
import 'package:simple_shadow/simple_shadow.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 320,
            height: 450,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome to Scholarly Board!",
                      style: GoogleFonts.rubik(
                          fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    Gap(20),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Scholarly Board is here to help you ",
                            style: GoogleFonts.rubik(
                                fontSize: 16, color: Colors.black),
                          ),
                          TextSpan(
                            text: "manage ",
                            style: GoogleFonts.rubik(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          TextSpan(
                            text: "and ",
                            style: GoogleFonts.rubik(
                                fontSize: 16, color: Colors.black),
                          ),
                          TextSpan(
                            text: "display ",
                            style: GoogleFonts.rubik(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          TextSpan(
                            text: "your ",
                            style: GoogleFonts.rubik(
                                fontSize: 16, color: Colors.black),
                          ),
                          TextSpan(
                            text: "school's ",
                            style: GoogleFonts.rubik(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          TextSpan(
                            text: "performance by displaying, charts and "
                                "tables with student's performance, ",
                            style: GoogleFonts.rubik(
                                fontSize: 16, color: Colors.black),
                          ),
                          TextSpan(
                            text: "predicting ",
                            style: GoogleFonts.rubik(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          TextSpan(
                            text: "future test results based on provided"
                                " information along with ",
                            style: GoogleFonts.rubik(
                                fontSize: 16, color: Colors.black),
                          ),
                          TextSpan(
                            text: "tips ",
                            style: GoogleFonts.rubik(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          TextSpan(
                            text: "that will help "
                                "improve your student's performance.",
                            style: GoogleFonts.rubik(
                                fontSize: 16, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                      text: "Log In",
                      onTap: () {},
                    ),
                    CustomButton(
                      text: "Sign Up",
                      color: Colors.white,
                      textColor: Colors.black,
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Stack(
          //   children: [
          //     Container(
          //       width: 410,
          //       height: 410,
          //       decoration: BoxDecoration(
          //           color: Colors.grey[300],
          //           borderRadius: BorderRadius.circular(20)),
          //     ),
          //     Transform.translate(
          //       offset: Offset(280, 280),
          //       child: Container(
          //         width: 260,
          //         height: 260,
          //         decoration: BoxDecoration(
          //             color: Colors.grey[400],
          //             borderRadius: BorderRadius.circular(20)),
          //       ),
          //     ),
          //     Transform.translate(
          //       offset: Offset(-80, -80),
          //       child: Container(
          //         width: 210,
          //         height: 210,
          //         decoration: BoxDecoration(
          //             color: Colors.grey[400],
          //             borderRadius: BorderRadius.circular(20)),
          //       ),
          //     ),
          //   ],
          // ),
          SimpleShadow(
            child: SvgPicture.asset("assets/svgs/dashboard_2.svg"),
            offset: Offset(1, 1),
            sigma: 7,
          ),
        ],
      ),
    );
  }
}

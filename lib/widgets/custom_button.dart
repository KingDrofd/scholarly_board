import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatefulWidget {
  final String? text;
  final Color? color;
  final Color? textColor;
  final Function() onTap;
  const CustomButton(
      {super.key,
      this.text = "Custom Button",
      this.color = Colors.deepPurpleAccent,
      this.textColor = Colors.white,
      required this.onTap});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 146,
      height: 48,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 4,
          offset: Offset(0, 2),
        ),
      ]),
      child: Material(
        color: widget.color,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.purple.withOpacity(.3),
          borderRadius: BorderRadius.circular(20),
          onTap: () {},
          child: Center(
            child: Text(
              widget.text!,
              style: GoogleFonts.rubik(fontSize: 14, color: widget.textColor),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppButtonElement extends StatelessWidget {
  double width;
  double hight;
  Color backgrounColor;
  double borderRadius;
  String title;
  Function() onTab;
  AppButtonElement({
    super.key,
    required this.width,
    this.hight = 55,
    this.backgrounColor = Colors.black,
    this.borderRadius = 10,
    required this.onTab,
    this.title="Login"
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        width: width,
        height: hight,
      
        decoration: BoxDecoration(
          color: backgrounColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.roboto(fontSize: 17, color: Colors.white,fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velora/Helper/Color/color_helper.dart';

class ReceiptGenerator extends StatelessWidget {
  const ReceiptGenerator({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorHelper.background,
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      color: Colors.black,
                      width: 20,
                      height: 20,
                    ),
                  ),
                  Text(
                    "Your Receipt",
                    style: GoogleFonts.roboto(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

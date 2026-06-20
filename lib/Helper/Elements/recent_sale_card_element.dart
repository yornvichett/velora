import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velora/Helper/Color/color_helper.dart';
import 'package:velora/Helper/Elements/spacer_element.dart';

class RecentSaleCardElement extends StatelessWidget {
  const RecentSaleCardElement({super.key});

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 70,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: ColorHelper.background)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Text(
                  "#0001",
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                SpacerElement(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Coffee Latte x2",
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      "12 May, 10:20 AM",
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "\$4.2",
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: ColorHelper.bannerColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 3,
                      bottom: 3,
                      left: 10,
                      right: 10,
                    ),
                    child: Text(
                      "cash",
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                        color: ColorHelper.bannerColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velora/Helper/Color/color_helper.dart';
import 'package:velora/Helper/Elements/card_element.dart';

class CardFeatureSumaryElement extends StatelessWidget {
  Size size;
  String title;
  int total;
  String percent;
  IconData icon;
  Color wrapIconColor;
  bool priceType ;
  bool hidePercent;
  bool hideArrowUp;
  Function()? onTab;
  CardFeatureSumaryElement({
    super.key,
    required this.size,
    required this.title,
    required this.icon,
    required this.percent,
    required this.total,
    required this.wrapIconColor,
    this.priceType=false,
    this.hideArrowUp=false,
    this.hidePercent=false,
    this.onTab
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTab!();
      },
      child: CardElement(
        height: 100,
        width: size.width / 2 - 13,
        backColor: ColorHelper.card,
        radius: 10,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.bricolageGrotesque(
                          color: Colors.black,
                          fontSize: 13,
                        ),
                      ),
                      Text(
                        "${priceType==true?"\$":""}${total}",
                        style: GoogleFonts.bricolageGrotesque(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: wrapIconColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        icon,
                        size: 18,
                        color: wrapIconColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    // width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorHelper.bannerColor.withOpacity(0.1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 2, bottom: 2,left: 10,right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          hideArrowUp?SizedBox(): Icon(
                            CupertinoIcons.arrow_up,
                            color: ColorHelper.bannerColor,
                            size: 12,
                            fontWeight: FontWeight.bold,
                          ),
                          Text(
                            "$percent ${hidePercent? "":"%"}",
                            style: GoogleFonts.bricolageGrotesque(
                              color: ColorHelper.bannerColor,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
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

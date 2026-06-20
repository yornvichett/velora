import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:velora/Helper/Color/color_helper.dart';
import 'package:velora/Helper/Elements/spacer_element.dart';
import 'package:velora/Helper/go_page/go_page.dart';
import 'package:velora/MVC/View/Payment/payment_view.dart';

class SaleView extends StatelessWidget {
  SaleView({super.key});

  int grid = 2;
  bool hasItem =true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorHelper.background,
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorHelper.background),
        backgroundColor: ColorHelper.bannerColor,
        title: Text(
          "SALE",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            color: ColorHelper.background,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    width: size.width,
                    height: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: size.width,
                          height: 50,

                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: ColorHelper.bannerColor.withOpacity(0.1),
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.search,
                                  color: Colors.grey,
                                  size: 22,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Container(
                            width: size.width,
                            height: 40,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: ColorHelper.bannerColor,
                                      ),

                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 3,
                                        bottom: 3,
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Coffee",
                                          style: GoogleFonts.saira(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: MasonryGridView.count(
                      crossAxisCount: grid,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        if (grid == 1) {
                          return Container(
                            height: 100,
                            decoration: BoxDecoration(
                              color: ColorHelper.card,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        "https://img.magnific.com/free-vector/realistic-cup-black-brewed-coffee-saucer-vector-illustration_1284-66002.jpg?semt=ais_hybrid&w=740&q=80",
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                      top: 5,
                                      right: 5,
                                      child: Container(
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        child: const Text(
                                          "4",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Coffee Latte Fresh Milk",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.saira(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "\$22.0",
                                              style:
                                                  GoogleFonts.bricolageGrotesque(
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ],
                                        ),

                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Stock : 50",
                                              style: GoogleFonts.saira(
                                                color: const Color.fromARGB(
                                                  255,
                                                  60,
                                                  60,
                                                  60,
                                                ),
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),

                                            CircleAvatar(
                                              radius: 16,
                                              backgroundColor:
                                                  ColorHelper.bannerColor,
                                              child: const Icon(
                                                Icons.add,
                                                size: 18,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                        return Container(
                          decoration: BoxDecoration(
                            color: ColorHelper.card,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AspectRatio(
                                aspectRatio: 1.2,
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(8),
                                      ),
                                      child: Image.network(
                                        "https://img.magnific.com/free-vector/realistic-cup-black-brewed-coffee-saucer-vector-illustration_1284-66002.jpg?semt=ais_hybrid&w=740&q=80",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                      top: 5,
                                      right: 5,
                                      child: Container(
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        child: const Text(
                                          "4",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Coffee Latte Fresh Milk",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.saira(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    const SizedBox(height: 5),

                                    Text(
                                      "\$22.0",
                                      style: GoogleFonts.bricolageGrotesque(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    const SizedBox(height: 8),

                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Stock : 50",
                                          style: GoogleFonts.saira(
                                            fontSize: 12,
                                            color: const Color.fromARGB(
                                              255,
                                              60,
                                              60,
                                              60,
                                            ),
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),

                                        CircleAvatar(
                                          radius: 15,
                                          backgroundColor:
                                              ColorHelper.bannerColor,
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: const Icon(
                                              Icons.add,
                                              size: 19,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 10,
                right: 0,
                left: 0,
                child: GestureDetector(
                  onTap: (){
                    GoPage.toPage(context: context, page: PaymentView());
                  },
                  child: Container(
                    width: size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: ColorHelper.bannerColor.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Icon(
                                CupertinoIcons.qrcode_viewfinder,
                                color: ColorHelper.bannerColor,
                                size: 40,
                              ),
                            ),
                          ),
                          SpacerElement(height: 10),
                          hasItem==true?  Container(
                            width: size.width,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: ColorHelper.bannerColor),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Flexible(
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 60,
                                          height: 60,
                                          decoration: BoxDecoration(
                                            color: ColorHelper.bannerColor,
                                            borderRadius: BorderRadius.circular(
                                              30,
                                            ),
                                          ),
                                          child: Center(
                                            child: Icon(
                                              CupertinoIcons.cart_fill,
                                              color: ColorHelper.background,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "3 items",
                                              style:
                                                  GoogleFonts.bricolageGrotesque(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              "Tap to view your order",
                                              style: GoogleFonts.roboto(
                                                fontSize: 9,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 1,
                                    height: 40,
                                    color: Colors.black26,
                                  ),
                                  Flexible(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Total",
                                                style:
                                                    GoogleFonts.bricolageGrotesque(
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                              ),
                                              SizedBox(height: 5),
                                              Text(
                                                "\$199.22",
                                                style: GoogleFonts.bricolageGrotesque(
                                                    fontSize: 19,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10,right: 10),
                                          child: Center(
                                            child: Icon(
                                              Icons.arrow_forward_rounded,
                                              color: ColorHelper.bannerColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ):SizedBox(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velora/Factory/profider_factory.dart';
import 'package:velora/Helper/Color/color_helper.dart';
import 'package:velora/Helper/Elements/card_element.dart';
import 'package:velora/Helper/Elements/card_feature_sumary_element.dart';
import 'package:velora/Helper/Elements/drawer_element.dart';
import 'package:velora/Helper/Elements/recent_sale_card_element.dart';
import 'package:velora/Helper/Elements/spacer_element.dart';
import 'package:velora/Helper/go_page/go_page.dart';
import 'package:velora/MVC/View/Inventory/inventory_view.dart';
import 'package:velora/MVC/View/Sale/sale_view.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
   
    return Scaffold(
      backgroundColor: ColorHelper.background,
      appBar: AppBar(
        iconTheme:  IconThemeData(
          color: ColorHelper.bannerColor,
          weight: 10
        ),
        backgroundColor: ColorHelper.background,
        centerTitle: true,
        title: Text(
          "Tymuy Kim",
          style: GoogleFonts.roboto(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              CupertinoIcons.bell,
              color: ColorHelper.bannerColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),

      drawer: DrawerElement(),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CardElement(
                  height: 140,
                  width: size.width,
                  backColor: ColorHelper.bannerColor,
                  radius: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Total Sales Today",
                          style: GoogleFonts.roboto(
                            color: ColorHelper.background,
                          ),
                        ),
                        SpacerElement(height: 3),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\$1,2500.00",
                              style: GoogleFonts.bricolageGrotesque(
                                color: ColorHelper.background,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(shape: BoxShape.circle),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 5,
                                  bottom: 5,
                                  left: 10,
                                  right: 10,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      CupertinoIcons.arrow_up,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 5),

                                    Text(
                                      "10% of \nYesturday",
                                      style: GoogleFonts.bricolageGrotesque(
                                        color: ColorHelper.background,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SpacerElement(height: 3),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 7,
                              bottom: 7,
                              left: 15,
                              right: 15,
                            ),
                            child: Text(
                              "Compare With Yesturday",
                              style: GoogleFonts.bricolageGrotesque(
                                color: ColorHelper.background,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SpacerElement(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CardFeatureSumaryElement(
                      onTab: () {
                        // GoPage.toPage(context: context, page: SaleView());
                      },
                      size: size,
                      icon: CupertinoIcons.bag,
                      title: 'Saled',
                      percent: "10.4",
                      total: 82,
                      wrapIconColor: ColorHelper.bannerColor,
                    ),
                    CardFeatureSumaryElement(
                      size: size,
                      icon: CupertinoIcons.chart_bar_fill,
                      wrapIconColor: ColorHelper.profitWrapColor,
                      title: 'Profit',
                      priceType: true,
                      percent: "10.4",
                      total: 310,
                    ),
                  ],
                ),
                SpacerElement(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CardFeatureSumaryElement(
                      size: size,
                      icon: CupertinoIcons.square_stack_3d_up,
                      wrapIconColor: ColorHelper.productWrapColor,
                      title: 'Products',
                      percent: "All products",
                      total: 8200,
                      hideArrowUp: true,
                      hidePercent: true,
                    ),
                    CardFeatureSumaryElement(
                      size: size,
                      icon: CupertinoIcons.exclamationmark_triangle,
                      wrapIconColor: ColorHelper.warningWrapColor,
                      title: 'Low Stocks',
                      percent: "View items",
                      total: 13,
                      hideArrowUp: true,
                      hidePercent: true,
                    ),
                  ],
                ),
                SpacerElement(height: 15),
                Text(
                  "Quick Actions",
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SpacerElement(height: 10),
                Row(
                  children: [
                    quickActionItem(
                      onTab: () {
                        GoPage.toPage(context: context, page: SaleView());
                      },
                      icon: CupertinoIcons.cart,
                      title: "Sale",
                      backgrounColor: ColorHelper.quickAccessSaleColor,
                    ),
                    quickActionItem(
                      onTab: () {
                          GoPage.toPage(context: context, page: InventoryView());
                      },
                      title: 'Inventory',
                      icon: CupertinoIcons.cube_box,
                      backgrounColor: ColorHelper.quickAccessInventory,
                    ),
                    quickActionItem(
                      onTab: () {
                        
                      },
                      title: 'Report',
                      icon: CupertinoIcons.chart_bar_alt_fill,
                      backgrounColor: ColorHelper.quickAccessReport,
                    ),
                    quickActionItem(
                      onTab: () {
                        
                      },
                      title: 'Purchase',
                      icon: CupertinoIcons.cart_badge_plus,
                      backgrounColor: ColorHelper.quickAccessPurchase,
                    ),
                  ],
                ),
                SpacerElement(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recent Sales",
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "View all",
                          style: GoogleFonts.bricolageGrotesque(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: ColorHelper.bannerColor,
                          ),
                        ),
                        SpacerElement(width: 2),
                        Icon(Icons.arrow_forward_ios_rounded, size: 14),
                        SpacerElement(width: 3),
                      ],
                    ),
                  ],
                ),
                SpacerElement(height: 10),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: ColorHelper.card,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          RecentSaleCardElement(),
                          RecentSaleCardElement(),
                          RecentSaleCardElement(),
                          RecentSaleCardElement(),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
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
    );
  }
}

Widget quickActionItem({
  required String title,
  required IconData icon,
  required Color backgrounColor,
  required Function() onTab
}) {
  return GestureDetector(
    onTap: onTab,
    child: Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          CardElement(
            height: 60,
            width: 80,
            radius: 10,
            backColor: backgrounColor,
            child: Center(
              child: Icon(
                icon,
                fontWeight: FontWeight.bold,
                color: ColorHelper.card,
                size: 30,
              ),
            ),
          ),
          SpacerElement(height: 2),
          Text(
            title,
            style: GoogleFonts.bricolageGrotesque(
              fontWeight: FontWeight.bold,
              fontSize: 13,
              color: Colors.black.withOpacity(0.7),
            ),
          ),
        ],
      ),
    ),
  );
}

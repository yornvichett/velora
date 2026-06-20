import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velora/Helper/Color/color_helper.dart';
import 'package:velora/Helper/Elements/spacer_element.dart';
import 'package:velora/Helper/go_page/go_page.dart';
import 'package:velora/MVC/View/Payment/receipt_generator.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorHelper.background,
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorHelper.background),
        backgroundColor: ColorHelper.bannerColor,
        title: Text(
          "Payment",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            color: ColorHelper.background,
          ),
        ),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      width: size.width,
                      height: 70,

                      decoration: BoxDecoration(
                        color: ColorHelper.card,
                        border: Border(
                          bottom: BorderSide(color: ColorHelper.background),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Container(
                                  width: 60,
                                  height: 60,

                                  decoration: BoxDecoration(
                                    color: ColorHelper.bannerColor,
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        "https://img.magnific.com/free-vector/realistic-cup-black-brewed-coffee-saucer-vector-illustration_1284-66002.jpg?semt=ais_hybrid&w=740&q=80",
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Text(
                                  "Coffee Latte",
                                  style: GoogleFonts.saira(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "x4",
                            style: GoogleFonts.bricolageGrotesque(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "\$44.00",
                            style: GoogleFonts.bricolageGrotesque(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),

            Container(
              width: size.width,
              height: 250,
              decoration: BoxDecoration(
                border: Border.all(color: ColorHelper.bannerColor),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Subtotal",
                                style: GoogleFonts.saira(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "\$105.00",
                                style: GoogleFonts.saira(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: size.width - 100,
                          color: Colors.grey.shade300,
                          height: 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Tax (8%)",
                                style: GoogleFonts.saira(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "\$8.20",
                                style: GoogleFonts.saira(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: size.width - 100,
                          color: Colors.grey.shade300,
                          height: 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Discount (0%)",
                                style: GoogleFonts.saira(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "\$0.00",
                                style: GoogleFonts.saira(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: size.width - 100,
                          color: Colors.grey.shade300,
                          height: 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total",
                                style: GoogleFonts.saira(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 23,
                                ),
                              ),
                              Text(
                                "\$120.00",
                                style: GoogleFonts.saira(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 23,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SafeArea(
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              showPaymentMethodBottomSheet(
                                context,
                                onTab: () {
                                  // GoPage.toPage(context: context, page: ReceiptGenerator());
                                },
                              );
                            },
                            child: Container(
                              width: size.width,
                              height: 50,
                              decoration: BoxDecoration(
                                color: ColorHelper.bannerColor,
                                borderRadius: BorderRadius.circular(10),
                              ),

                              child: Center(
                                child: Text(
                                  "Pay \$120.00",
                                  style: GoogleFonts.roboto(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                CupertinoIcons.checkmark_seal,
                                color: ColorHelper.bannerColor,
                                size: 18,
                              ),
                              SpacerElement(width: 5),
                              Text(
                                "Your payment is incrypted and secure",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.blueGrey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void showPaymentMethodBottomSheet(
  BuildContext context, {
  required Function() onTab,
}) {
  ValueNotifier<int> selectedIndex = ValueNotifier(0);
  final methods = [
    {
      "title": "Cash",
      "subtitle": "Pay with cash",
      "icon": Icons.payments_rounded,
    },
    {
      "title": "ABA KHQR",
      "subtitle": "Scan QR code",
      "icon": Icons.qr_code_2_rounded,
    },
    {
      "title": "Credit Card",
      "subtitle": "Visa / Mastercard",
      "icon": Icons.credit_card_rounded,
    },
    {
      "title": "Wing",
      "subtitle": "Mobile payment",
      "icon": Icons.account_balance_wallet_rounded,
    },
  ];

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return ValueListenableBuilder(
        valueListenable: selectedIndex,
        builder: (context, value, child) {
          return Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(height: 20),

                Text(
                  "Select Payment Method",
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),

                const SizedBox(height: 20),

                ...List.generate(
                  methods.length,
                  (index) => GestureDetector(
                    onTap: () {
                      selectedIndex.value = index;
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: selectedIndex.value == index
                            ? Colors.transparent
                            : Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: selectedIndex.value == index
                              ? ColorHelper.bannerColor.withOpacity(0.5)
                              : Colors.grey.shade300,
                          width: 1.5,
                        ),
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: ColorHelper.bannerColor,
                            child: Icon(
                              methods[index]["icon"] as IconData,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  methods[index]["title"].toString(),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  methods[index]["subtitle"].toString(),
                                  style: TextStyle(color: Colors.grey.shade600),
                                ),
                              ],
                            ),
                          ),
                          Radio(
                            value: index,
                            groupValue: selectedIndex.value,
                            activeColor: ColorHelper.bannerColor,
                            onChanged: (value) {
                              print("value ===${value}");
                              selectedIndex.value = int.parse(value.toString());
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                GestureDetector(
                  onTap: () {
                    onTab();
                  },
                  child: Container(
                    height: 55,
                    decoration: BoxDecoration(
                      color: ColorHelper.bannerColor,
                      borderRadius: BorderRadius.circular(10),
                    ),

                    child: Center(
                      child: Text(
                        "Confirm \$120.00 ( Cash )",
                        style: GoogleFonts.roboto(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 15),
              ],
            ),
          );
        },
      );
    },
  );
}

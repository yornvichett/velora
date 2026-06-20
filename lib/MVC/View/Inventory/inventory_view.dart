import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velora/Factory/profider_factory.dart';
import 'package:velora/Helper/Color/color_helper.dart';
import 'package:velora/Helper/Elements/app_button_element.dart';
import 'package:velora/Helper/Elements/app_text_input_element.dart';
import 'package:velora/Helper/Elements/spacer_element.dart';
import 'package:velora/Helper/Generator/date_time_generator.dart';
import 'package:velora/MVC/Model/product_model.dart';
import 'package:velora/Repository/RequestBody/add_product_request_body.dart';
import 'package:velora/Repository/State/product_state.dart';

class InventoryView extends ConsumerWidget {
  InventoryView({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController codeController = TextEditingController(
    text: DateTimeGenerator.barCodeGenerator(),
  );
  TextEditingController priceController = TextEditingController();
  TextEditingController stockController = TextEditingController();
  TextEditingController currencyController = TextEditingController(text: "\$");
  TextEditingController discountController = TextEditingController(text: "0%");
  TextEditingController imageController = TextEditingController(
    text: "default.jpg",
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    var productController = ref.read(productFactory.notifier);

    ref.listen<ProductModel>(productFactory, (previous, next) {
      if (next.productState == ProductState.success) {
        nameController.clear();
        codeController.clear();
        priceController.clear();
        stockController.clear();
        currencyController.clear();
        discountController.clear();
        imageController.clear();
        productController.generateBarcode().then((value){
          codeController.text= value;
        });
      }
    });

    return Scaffold(
      backgroundColor: ColorHelper.background,
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorHelper.background, weight: 10),
        backgroundColor: ColorHelper.bannerColor,
        centerTitle: true,
        title: Text(
          "Add Stock",
          style: GoogleFonts.roboto(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: ColorHelper.background,
          ),
        ),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Column(
                children: [
                  AppTextInputElement(
                    controller: nameController,
                    hintText: "Name",
                    activeColor: ColorHelper.bannerColor,
                    prefixIcon: CupertinoIcons.layers_alt_fill,
                    iconColor: Colors.grey,
                    fillColor: Colors.white,
                    hintColor: Colors.black.withOpacity(0.5),
                    borderRadius: 5,
                  ),
                  SpacerElement(height: 5),
                  AppTextInputElement(
                    controller: codeController,
                    hintText: "Product code",
                    activeColor: ColorHelper.bannerColor,
                    iconColor: Colors.grey,
                    fillColor: Colors.white,

                    prefixIcon: CupertinoIcons.barcode,
                    hintColor: Colors.black.withOpacity(0.5),
                    suffixIcon: CupertinoIcons.arrow_2_circlepath,
                    onSuffixTap: () async {
                      codeController.text = await productController
                          .generateBarcode();
                    },
                    borderRadius: 5,
                  ),
                  SpacerElement(height: 5),
                  AppTextInputElement(
                    controller: priceController,
                    hintText: "Price",
                    activeColor: ColorHelper.bannerColor,
                    iconColor: Colors.grey,
                    fillColor: Colors.white,
                    suffixIcon: Icons.arrow_drop_down_sharp,
                    onSuffixTap: () {
                      showModalBottomCurrency(
                        context: context,
                        onTab: (currency) {
                          currencyController.text = currency;
                        },
                      );
                    },
                    prefixIcon: Icons.price_check_outlined,
                    hintColor: Colors.black.withOpacity(0.5),
                    borderRadius: 5,
                  ),
                  SpacerElement(height: 5),
                  AppTextInputElement(
                    controller: stockController,
                    hintText: "Stock",
                    activeColor: ColorHelper.bannerColor,
                    prefixIcon: CupertinoIcons.cube_box_fill,
                    iconColor: Colors.grey,
                    fillColor: Colors.white,
                    hintColor: Colors.black.withOpacity(0.5),
                    borderRadius: 5,
                  ),
                ],
              ),
              Positioned(
                bottom: 10,
                child: SafeArea(
                  child: AppButtonElement(
                    width: size.width - 16,
                    onTab: () async{
                      var body = AddProductRequestBody(
                        conId: "velora",
                        name: nameController.text,
                        code: codeController.text,
                        price: double.parse(priceController.text.trim()),
                        stock: double.parse(stockController.text.toString()),
                        currency: currencyController.text,
                        discount: discountController.text,
                        image: imageController.text,
                      );
                      productController.addProduct(body: body);
                      
                    },
                    title: "Add Product",
                    backgrounColor: ColorHelper.bannerColor,
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

void showModalBottomCurrency({
  required BuildContext context,
  required Function(String) onTab,
}) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: const Text("USD (\$)"),
            onTap: () {
              onTab("\$");
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text("KHR (៛)"),
            onTap: () {
              onTab("៛");
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}

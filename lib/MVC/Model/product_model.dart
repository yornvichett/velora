import 'package:velora/Repository/State/product_state.dart';

class ProductModel {
  int? id;
  String? name;
  String? code;
  double? regularPrice;
  String? currency;
  String? discount;
  double? discountAmount;
  double? salePrice;
  String? image;
  String? createdAt;
  String? updatedAt;
  ProductState? productState;
  

  ProductModel({
    required this.id,
    required this.name,
    required this.code,
    required this.regularPrice,
    required this.currency,
    required this.discount,
    required this.discountAmount,
    required this.salePrice,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.productState
  });

  factory ProductModel.fromJson({required Map<String, dynamic> json}) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      code: json['code'],
      regularPrice: json['regular_price'],
      currency: json['currency'],
      discount: json['discount'],
      discountAmount: json['discount_amount'],
      salePrice: json['sale_price'],
      image: json['image'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      productState: ProductState.success
    );
  }
  factory ProductModel.empty(){
    return ProductModel(
      id: 0,
      name: "",
      code: "",
      regularPrice: 0.0,
      currency: "",
      discount: "",
      discountAmount: 0.0,
      salePrice: 0.0,
      image: "",
      createdAt: "",
      updatedAt: "",
      productState: ProductState.initialize
    ); 
  }
   ProductModel initState({required ProductState productState}){
    return ProductModel(
      id: 0,
      name: "",
      code: "",
      regularPrice: 0.0,
      currency: "",
      discount: "",
      discountAmount: 0.0,
      salePrice: 0.0,
      image: "",
      createdAt: "",
      updatedAt: "",
      productState: productState
    ); 
  }
  Map<String,dynamic> toJson(){
    return {
      "id":id,
      "name":name,
      "code":code,
      "regular_price":regularPrice,
      "currency":currency,
      "discount":discount,
      "discount_amount":discountAmount,
      "sale_price":salePrice,
      "image":image,
      "product_state":productState!.name
    };
  }
}


// {
//             "id": 12,
//             "name": "sss",
//             "code": "1233333",
//             "regular_price": 1.2,
//             "stock_id": 1,
//             "currency": "$",
//             "discount": "10",
//             "discount_amount": 0,
//             "sale_price": 0,
//             "status": 1,
//             "order_by": 0,
//             "image": "test",
//             "created_at": "2026-06-18 14:27:52",
//             "updated_at": "2026-06-18 14:27:52"
//         }
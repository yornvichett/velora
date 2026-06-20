class AddProductRequestBody {
  String? conId;
  String? name;
  String? code;
  double? price;
  double? stock;
  String? currency;
  String? discount;
  String? image;

  AddProductRequestBody({
    required this.conId,
    required this.name,
    required this.code,
    required this.price,
    required this.stock,
    required this.currency,
    required this.discount,
    required this.image,
  });

  factory AddProductRequestBody.fromJson({required Map<String,dynamic> json}) {
    return AddProductRequestBody(
      conId: json['con_id'],
      name: json['name'],
      code: json['code'],
      price: json['price'],
      stock: json['stock'],
      currency: json['currency'],
      discount: json['discount'],
      image: json['image'],
    );
  }

  Map<String,dynamic> toJson(){
    return {
      "con_id":conId,
      "name":name,
      "code":code,
      "price":price,
      "stock":stock,
      "currency":currency,
      "discount":discount,
      "image":image
    };
  }
}

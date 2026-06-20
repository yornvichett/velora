import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:velora/Helper/Generator/date_time_generator.dart';
import 'package:velora/MVC/Model/product_model.dart';
import 'package:velora/Repository/Api/api_service.dart';
import 'package:velora/Repository/RequestBody/add_product_request_body.dart';
import 'package:velora/Repository/State/product_state.dart';

class ProductController extends StateNotifier<ProductModel>{

  ProductController():super(ProductModel.empty());
  ApiService apiService=ApiService();

  Future<void> addProduct({required AddProductRequestBody body})async{
    try{
      state =state.initState(productState: ProductState.loading);
      var jsonResponse = await apiService.addProduct(body: body);
      if(jsonResponse.statusCode==200){
        state = ProductModel.fromJson(json: jsonResponse.data);
      }else{
        state =state.initState(productState: ProductState.error);
      }
    }catch(e,stackTrace){
      state =state.initState(productState: ProductState.error);
      debugPrint("Error: $e");
      debugPrint("StackTrace: $stackTrace");
    }
  }

  Future<String> generateBarcode()async{
    return DateTimeGenerator.barCodeGenerator();
  }

}
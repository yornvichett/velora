import 'package:dio/dio.dart';
import 'package:velora/Config/dio_config.dart';
import 'package:velora/Repository/RequestBody/add_product_request_body.dart';
import 'package:velora/Repository/RequestBody/get_product_request_body.dart';
import 'package:velora/Repository/RequestBody/login_request_body.dart';

class ApiService {
  final Dio dio = DioConfig().dio;


  Future<Response> login({required LoginRequestBody body}){
    return dio.post("auth/login",data: body.toJson());
  }

  Future<Response> addProduct({required AddProductRequestBody body}){
    return dio.post("products/add",data: body.toJson());
  }
  Future<Response> getProduct({required GetProductRequestBody body})async{
    return dio.get("products/getProduct",queryParameters: body.toJson());
  }
}

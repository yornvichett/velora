import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:velora/MVC/Model/auth_local_model.dart';
import 'package:velora/Storage/local_storage.dart';

class DioConfig {
  DioConfig._();
  static final DioConfig _instance = DioConfig._();
  factory DioConfig() => _instance;
  static const String _baseUrl = 'http://192.168.3.124:8000/api/';
  late final Dio dio =
      Dio(
          BaseOptions(
            baseUrl: _baseUrl,
            connectTimeout: const Duration(seconds: 15),
            receiveTimeout: const Duration(seconds: 30),
            sendTimeout: const Duration(seconds: 30),
            headers: {
              HttpHeaders.contentTypeHeader: 'application/json',
              HttpHeaders.acceptHeader: 'application/json',
            },
            responseType: ResponseType.json,
          ),
        )
        ..interceptors.addAll([
          InterceptorsWrapper(
            onRequest: (options, handler) async {
              try {
                final value = await LocalStorage.getString(key: LocalStorage.authKey);
                print("value=======> ${value}");
                if (value != null) {
                  final authToken = AuthLocalModel.fromJson(json: jsonDecode(value),);
                  print("authToken=======> ${authToken.toJson()}");
                  options.headers['Authorization'] ='Bearer ${authToken.accessToken}';
                }
              } catch (e) {
                debugPrint('Error Token $e');
              }
              handler.next(options);
            },
          ),
          if (kDebugMode)
            LogInterceptor(
              requestHeader: false,
              requestBody: true,
              responseHeader: false,
              responseBody: true,
              error: true,
              logPrint: (o) => debugPrint(o.toString()),
            ),
        ]);
}

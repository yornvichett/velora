import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:velora/MVC/Model/login_model.dart';
import 'package:velora/MVC/Model/user_model.dart';
import 'package:velora/Repository/Api/api_service.dart';
import 'package:velora/Repository/RequestBody/login_request_body.dart';
import 'package:velora/Repository/State/login_state.dart';
import 'package:velora/Storage/local_storage.dart';

class LoginController extends StateNotifier<LoginModel> {
  LoginController() : super(LoginModel.empty());
  ApiService apiService = ApiService();
  

  Future<void> userLogin({required LoginRequestBody body}) async {
    try {
      state = state.initState(
        state: LoginState.loading,
        status: 0,
        conID: "",
        accessToken: "",
        databaseConnection: "",
        refreshToken: "",
        tokenType: "",
        userModel: UserModel.empty(),
      );
      var jsonResponse = await apiService.login(body: body);
      if (jsonResponse.statusCode == 200) {
        print("jsonResponse.data======> ${jsonResponse.data}");
        state = LoginModel.fromJson(json: jsonResponse.data);
        print("state ====> ${state.toJson()}");
         await LocalStorage.saveString(key: LocalStorage.authKey, value: jsonEncode(state.toJson()));

      } else {
        state = state.initState(
          state: LoginState.error,
          status: 0,
          conID: "",
          accessToken: "",
          databaseConnection: "",
          refreshToken: "",
          tokenType: "",
          userModel: UserModel.empty(),
        );
      }
    } catch (e, stackTrace) {
      state = state.initState(
          state: LoginState.error,
          status: 0,
          conID: "",
          accessToken: "",
          databaseConnection: "",
          refreshToken: "",
          tokenType: "",
          userModel: UserModel.empty(),
        );
      debugPrint("Error: $e");
      debugPrint("StackTrace: $stackTrace");
    }
  }
}

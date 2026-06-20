import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:velora/MVC/Model/auth_local_model.dart';
import 'package:velora/MVC/Model/login_model.dart';
import 'package:velora/Repository/State/auth_local_state.dart';
import 'package:velora/Storage/local_storage.dart';

class AuthLocalController extends StateNotifier<AuthLocalModel> {
  AuthLocalController() : super(AuthLocalModel.empty());

  Future<void> initAuthLocal() async {
    try {
      state = state.initState(
        conID: "",
        accessToken: "",
        refreshToken: "",
        tokenType: "",
        authLocalState: AuthLocalState.loading,
      );
      var responseJson = await LocalStorage.getString(
        key: LocalStorage.authKey,
      );

      if (responseJson != null) {
        Map<String, dynamic> jsonMap = jsonDecode(responseJson);

        state = AuthLocalModel.fromJson(json: jsonMap);
        print("state ====> ${state.toJson()}");
      } else {
        state = state.initState(
          conID: "",
          accessToken: "",
          refreshToken: "",
          tokenType: "",
          authLocalState: AuthLocalState.error,
        );
      }
    } catch (e, stackTrace) {
      state = state.initState(
        conID: "",
        accessToken: "",
        refreshToken: "",
        tokenType: "",
        authLocalState: AuthLocalState.error,
      );
      debugPrint("Error: $e");
      debugPrint("StackTrace: $stackTrace");
    }
  }
}

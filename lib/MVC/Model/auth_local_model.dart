import 'package:velora/MVC/Model/user_model.dart';
import 'package:velora/Repository/State/auth_local_state.dart';

class AuthLocalModel {
  String? conID;
  String? refreshToken;
  String? accessToken;
  String? tokenType;
  AuthLocalState? authLocalState;

  AuthLocalModel({
    required this.conID,
    required this.accessToken,
    required this.refreshToken,
    required this.tokenType,
    required this.authLocalState,
  });

  factory AuthLocalModel.empty() {
    return AuthLocalModel(
      conID: "",
      accessToken: "",
      refreshToken: "",
      tokenType: "",
      authLocalState: AuthLocalState.loading
    );
  }

  AuthLocalModel initState({
    required String? conID,
    required String? accessToken,
    required String? refreshToken,
    required String? tokenType,
    required AuthLocalState? authLocalState
  }) {
    return AuthLocalModel(
      conID: conID,
      accessToken: accessToken,
      refreshToken: refreshToken,
      tokenType: tokenType,
      authLocalState: authLocalState
    );
  }

  factory AuthLocalModel.fromJson({required Map<String, dynamic> json}) {
    return AuthLocalModel(
      conID: json['con_id'] ?? "",
      accessToken: json['access_token'] ?? "",
      refreshToken: json['refresh_token'] ?? "",
      tokenType: json['token_type'] ?? "",
      authLocalState: AuthLocalState.success
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "con_id": conID,
      "access_token": accessToken,
      "refresh_token": refreshToken,
      "token_type": tokenType,
      "state":authLocalState!.name
    };
  }
}

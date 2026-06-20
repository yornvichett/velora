import 'package:velora/MVC/Model/user_model.dart';
import 'package:velora/Repository/State/login_state.dart';

class LoginModel {
  LoginState? state;
  int? status;
  String? conID;
  String? databaseConnection;
  String? refreshToken;
  String? accessToken;
  String? tokenType;
  UserModel? userModel;

  LoginModel({
    required this.state,
    required this.status,
    required this.conID,
    required this.accessToken,
    required this.databaseConnection,
    required this.refreshToken,
    required this.tokenType,
    required this.userModel,
  });

  factory LoginModel.fromJson({required Map<String, dynamic> json}) {

    return LoginModel(
      state: LoginState.success,
      status: json['status'] ?? 0,
      conID: json['con_id'] ?? "",
      accessToken: json['access_token'] ??"",
      databaseConnection: json['database_connection'] ?? "",
      refreshToken: json['refresh_token'] ?? "",
      tokenType: json['token_type'] ?? "",
      userModel: UserModel.fromJson(json: json['user'] ?? UserModel.empty()) ,
    );
  }

  Map<String,dynamic> toJson(){
    return {
      "state":state!.name,
      "status":status,
      "con_id":conID,
      "access_token":accessToken,
      "database_connection":databaseConnection,
      "refresh_token":refreshToken,
      "token_type":tokenType,
      "user":userModel
    };
  }

  factory LoginModel.empty() {
    return LoginModel(
      state: LoginState.initialize,
      status: 0,
      conID: "",
      accessToken: "",
      databaseConnection: "",
      refreshToken: "",
      tokenType: "",
      userModel: UserModel.empty(),
    );
  }

  LoginModel initState({
    required LoginState? state,
    required int? status,
    required String? conID,
    required String? accessToken,
    required String? databaseConnection,
    required String? refreshToken,
    required String? tokenType,
    required UserModel? userModel,
  }) {
    return LoginModel(
      state: state,
      status: status,
      conID: conID,
      accessToken: accessToken,
      databaseConnection: databaseConnection,
      refreshToken: refreshToken,
      tokenType: tokenType,
      userModel: userModel,
    );
  }
}



// {
//     "status": 200,
//     "con_id": "velora",
//     "database_connection": "remote_velora",
//     "user": {
//         "id": 1,
//         "name": "Yorn Vichet",
//         "user_name": "velora",
//         "email": "vichet@gmail.com",
//         "email_verified_at": null,
//         "created_at": "2026-06-18T02:36:02.000000Z",
//         "updated_at": "2026-06-18T02:36:02.000000Z"
//     },
//     "refresh_token": "zvCvwAfxnOIAo4yljuW3kJIUomAf93K3CIMahYdxDvRl45DDBft0EyjbNG8os26F",
//     "access_token": "11|l5Em8cocQNo3LEZhKH7HLCDMvg9Px2FFLcGu6hS341c4b6ea",
//     "token_type": "Bearer"
// }
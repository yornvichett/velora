class UserModel {
  int? id;
  String? name;
  String? userName;
  String? email;
  String? createdAt;
  String? updatedAt;

  UserModel({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.email,
    required this.updatedAt,
    required this.userName,
  });
  factory UserModel.empty() => UserModel(
    id:  0,
    name:  "",
    createdAt: "",
    email:"",
    updatedAt: "",
    userName: "",
  );

  factory UserModel.fromJson({required Map<String, dynamic> json}) => UserModel(
    id: json['id'] ?? 0,
    name: json['name'] ?? "",
    createdAt: json['created_at'] ?? "",
    email: json['email'] ?? "",
    updatedAt: json['created_at'] ?? "",
    userName: json['user_name'] ?? "",
  );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "user_name": userName,
      "created_at": createdAt,
      "updated_at": updatedAt,
    };
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
class LoginRequestBody {
  String? conId;
  String? userName;
  String? password;

  LoginRequestBody({
    required this.conId,
    required this.password,
    required this.userName,
  });

  factory LoginRequestBody.fromJson({required Map<String, dynamic> json}) {
    return LoginRequestBody(
      conId: json['con_id'] ?? "",
      password: json['password'] ?? "",
      userName: json['user_name'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {"con_id": conId, "user_name": userName, "password": password};
  }
}

class GetProductRequestBody {
  String? conID;
  GetProductRequestBody({required this.conID});

  factory GetProductRequestBody.fromJson({required Map<String, dynamic> json}) {
    return GetProductRequestBody(conID: json['con_id']);
  }
  Map<String, dynamic> toJson() {
    return {"con_id": conID};
  }
}

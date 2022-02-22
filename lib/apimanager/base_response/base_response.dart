class BaseResponse {
  String message;
  bool success;
  Map body;

  BaseResponse({this.message, this.success, this.body});

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(
        message: json['message'], success: json['success'], body: json['body']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['success'] = this.success;
    data['body'] = this.body;
    return data;
  }
}

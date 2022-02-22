class OpenOrdersResponse {
  Body body;
  String message;
  int status;
  bool success;

  OpenOrdersResponse({this.body, this.message, this.status, this.success});

  factory OpenOrdersResponse.fromJson(Map<String, dynamic> json) {
    return OpenOrdersResponse(
      body: json['body'] != null ? Body.fromJson(json['body']) : null,
      message: json['message'],
      status: json['status'],
      success: json['success'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    data['success'] = this.success;
    if (this.body != null) {
      data['body'] = this.body.toJson();
    }
    return data;
  }
}

class Data {
  int count;

  Data({this.count});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      count: json['count'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    return data;
  }
}

class Body {
  Data data;

  Body({this.data});

  factory Body.fromJson(Map<String, dynamic> json) {
    return Body(
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

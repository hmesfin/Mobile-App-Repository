class RequisitionTypeListResponse {
  RequisitionBody body;
  String message;
  int status;
  bool success;

  RequisitionTypeListResponse(
      {this.body, this.message, this.status, this.success});

  factory RequisitionTypeListResponse.fromJson(Map<String, dynamic> json) {
    return RequisitionTypeListResponse(
      body:
      json['body'] != null ? RequisitionBody.fromJson(json['body']) : null,
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

class RequisitionData {
  int count;
  List<RequisitionRow> rows;

  RequisitionData({this.count, this.rows});

  factory RequisitionData.fromJson(Map<String, dynamic> json) {
    return RequisitionData(
      count: json['count'],
      rows: json['rows'] != null
          ? (json['rows'] as List)
          .map((i) => RequisitionRow.fromJson(i))
          .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.rows != null) {
      data['rows'] = this.rows.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RequisitionBody {
  RequisitionData data;

  RequisitionBody({this.data});

  factory RequisitionBody.fromJson(Map<String, dynamic> json) {
    return RequisitionBody(
      data:
      json['data'] != null ? RequisitionData.fromJson(json['data']) : null,
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

class RequisitionRow {
  int account_request_status;
  String country_code;
  String email;
  int id;
  String phone;
  String requisition_name;
  String requisition_type;
  int status;

  RequisitionRow({this.account_request_status = 1,
    this.country_code = "+91",
    this.email = "abc@abc.com",
    this.id = 1,
    this.phone = "9999",
    this.requisition_name = "req name",
    this.requisition_type = "req type",
    this.status = 1});

  factory RequisitionRow.fromJson(Map<String, dynamic> json) {
    return RequisitionRow(
      account_request_status: json['account_request_status'] ?? 0,
      country_code: json['country_code'] ?? '',
      email: json['email'] ?? '',
      id: json['id'] ?? 0,
      phone: json['phone'] ?? '',
      requisition_name: json['requisition_name'] ?? '',
      requisition_type: json['requisition_type'] ?? '',
      status: json['status'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['account_request_status'] = this.account_request_status;
    data['country_code'] = this.country_code;
    data['email'] = this.email;
    data['id'] = this.id;
    data['phone'] = this.phone;
    data['requisition_name'] = this.requisition_name;
    data['requisition_type'] = this.requisition_type;
    data['status'] = this.status;
    return data;
  }
}

class ListPaymentMethodsModel {
  int status;
  bool success;
  String message;
  Body body;

  ListPaymentMethodsModel({this.status, this.success, this.message, this.body});

  ListPaymentMethodsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    message = json['message'];
    body = json['body'] != null ? new Body.fromJson(json['body']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.body != null) {
      data['body'] = this.body.toJson();
    }
    return data;
  }
}

class Body {
  Data data;

  Body({this.data});

  Body.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  Status status;
  List<DataNested> dataNested;

  Data({this.status, this.dataNested});

  Data.fromJson(Map<String, dynamic> json) {
    status =
        json['status'] != null ? new Status.fromJson(json['status']) : null;
    if (json['data'] != null) {
      dataNested = new List<DataNested>();
      json['data'].forEach((v) {
        dataNested.add(new DataNested.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.status != null) {
      data['status'] = this.status.toJson();
    }
    if (this.dataNested != null) {
      data['data'] = this.dataNested.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Status {
  String errorCode;
  String status;
  String message;
  String responseCode;
  String operationId;

  Status(
      {this.errorCode,
      this.status,
      this.message,
      this.responseCode,
      this.operationId});

  Status.fromJson(Map<String, dynamic> json) {
    errorCode = json['error_code'];
    status = json['status'];
    message = json['message'];
    responseCode = json['response_code'];
    operationId = json['operation_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error_code'] = this.errorCode;
    data['status'] = this.status;
    data['message'] = this.message;
    data['response_code'] = this.responseCode;
    data['operation_id'] = this.operationId;
    return data;
  }
}

class DataNested {
  String id;
  String type;
  String category;
  String image;
  String name;
  String last4;
  String acsCheck;
  String cvvCheck;
  BinDetails binDetails;
  String expirationYear;
  String expirationMonth;
  String fingerprintToken;

  DataNested(
      {this.id,
      this.type,
      this.category,
      this.image,
      this.name,
      this.last4,
      this.acsCheck,
      this.cvvCheck,
      this.binDetails,
      this.expirationYear,
      this.expirationMonth,
      this.fingerprintToken});

  DataNested.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    category = json['category'];
    image = json['image'];
    name = json['name'];
    last4 = json['last4'];
    acsCheck = json['acs_check'];
    cvvCheck = json['cvv_check'];
    binDetails = json['bin_details'] != null
        ? new BinDetails.fromJson(json['bin_details'])
        : null;
    expirationYear = json['expiration_year'];
    expirationMonth = json['expiration_month'];
    fingerprintToken = json['fingerprint_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['category'] = this.category;
    data['image'] = this.image;
    data['name'] = this.name;
    data['last4'] = this.last4;
    data['acs_check'] = this.acsCheck;
    data['cvv_check'] = this.cvvCheck;
    if (this.binDetails != null) {
      data['bin_details'] = this.binDetails.toJson();
    }
    data['expiration_year'] = this.expirationYear;
    data['expiration_month'] = this.expirationMonth;
    data['fingerprint_token'] = this.fingerprintToken;
    return data;
  }
}

class BinDetails {
  String brand;
  String binNumber;

  BinDetails({this.brand, this.binNumber});

  BinDetails.fromJson(Map<String, dynamic> json) {
    brand = json['brand'];
    binNumber = json['bin_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['brand'] = this.brand;
    data['bin_number'] = this.binNumber;
    return data;
  }
}

class GetSupportedPaymentMethodsModel {
  int status;
  bool success;
  String message;
  Body body;

  GetSupportedPaymentMethodsModel(
      {this.status, this.success, this.message, this.body});

  GetSupportedPaymentMethodsModel.fromJson(Map<String, dynamic> json) {
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
  String type;
  String name;
  String category;
  String image;
  String country;
  String paymentFlowType;
  List<String> currencies;
  int status;
  bool isCancelable;
  List<PaymentOptions> paymentOptions;
  bool isExpirable;
  bool isOnline;
  bool isRefundable;
  int minimumExpirationSeconds;
  int maximumExpirationSeconds;

  DataNested(
      {this.type,
      this.name,
      this.category,
      this.image,
      this.country,
      this.paymentFlowType,
      this.currencies,
      this.status,
      this.isCancelable,
      this.paymentOptions,
      this.isExpirable,
      this.isOnline,
      this.isRefundable,
      this.minimumExpirationSeconds,
      this.maximumExpirationSeconds});

  DataNested.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    name = json['name'];
    category = json['category'];
    image = json['image'];
    country = json['country'];
    paymentFlowType = json['payment_flow_type'];
    currencies = json['currencies'].cast<String>();
    status = json['status'];
    isCancelable = json['is_cancelable'];
    if (json['payment_options'] != null) {
      paymentOptions = new List<PaymentOptions>();
      json['payment_options'].forEach((v) {
        paymentOptions.add(new PaymentOptions.fromJson(v));
      });
    }
    isExpirable = json['is_expirable'];
    isOnline = json['is_online'];
    isRefundable = json['is_refundable'];
    minimumExpirationSeconds = json['minimum_expiration_seconds'] ?? 0;
    maximumExpirationSeconds = json['maximum_expiration_seconds'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['name'] = this.name;
    data['category'] = this.category;
    data['image'] = this.image;
    data['country'] = this.country;
    data['payment_flow_type'] = this.paymentFlowType;
    data['currencies'] = this.currencies;
    data['status'] = this.status;
    data['is_cancelable'] = this.isCancelable;
    if (this.paymentOptions != null) {
      data['payment_options'] =
          this.paymentOptions.map((v) => v.toJson()).toList();
    }
    data['is_expirable'] = this.isExpirable;
    data['is_online'] = this.isOnline;
    data['is_refundable'] = this.isRefundable;
    data['minimum_expiration_seconds'] = this.minimumExpirationSeconds;
    data['maximum_expiration_seconds'] = this.maximumExpirationSeconds;
    return data;
  }
}

class PaymentOptions {
  String name;
  String type;
  String regex;
  String description;
  bool isRequired;
  bool isUpdatable;

  PaymentOptions(
      {this.name,
      this.type,
      this.regex,
      this.description,
      this.isRequired,
      this.isUpdatable});

  PaymentOptions.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    regex = json['regex'];
    description = json['description'];
    isRequired = json['is_required'];
    isUpdatable = json['is_updatable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['type'] = this.type;
    data['regex'] = this.regex;
    data['description'] = this.description;
    data['is_required'] = this.isRequired;
    data['is_updatable'] = this.isUpdatable;
    return data;
  }
}

class GetPaymentUriResponse {
  int status;
  bool success;
  String message;
  PaymentBody body;

  GetPaymentUriResponse({this.status, this.success, this.message, this.body});

  GetPaymentUriResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    message = json['message'];
    body = json['body'] != null ? new PaymentBody.fromJson(json['body']) : null;
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

class PaymentBody {
  PaymentData data;

  PaymentBody({this.data});

  PaymentBody.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new PaymentData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class PaymentData {
  String redirectUrl;
  String orderId;
  String cancelUrl;
  String successUrl;

  PaymentData(
      {this.redirectUrl, this.orderId, this.cancelUrl, this.successUrl});

  PaymentData.fromJson(Map<String, dynamic> json) {
    redirectUrl = json['redirect_url'];
    orderId = json['order_id'];
    cancelUrl = json['cancel_url'];
    successUrl = json['success_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['redirect_url'] = this.redirectUrl;
    data['order_id'] = this.orderId;
    data['cancel_url'] = this.cancelUrl;
    data['success_url'] = this.successUrl;
    return data;
  }
}

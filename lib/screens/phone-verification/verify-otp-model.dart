class VerifyOtpModel {
  String otp;
  int stage;

  VerifyOtpModel({
    this.otp,
    this.stage,
  });

  VerifyOtpModel.fromJson(Map<String, dynamic> json) {
    otp = json['otp'];
    stage = json['stage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['otp'] = this.otp;
    data['stage'] = this.stage;

    return data;
  }
}

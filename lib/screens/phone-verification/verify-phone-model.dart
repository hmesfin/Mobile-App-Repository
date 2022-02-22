import 'package:virtudoc_app/index.dart';

class VerifyPhoneModel {
  String phone;
  bool tcValue;
  String countryCode;
  String role;
  // String socialId;

  VerifyPhoneModel({
    @required this.phone,
    @required this.tcValue,
    @required this.countryCode,
    @required this.role,
  });

  VerifyPhoneModel.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    tcValue = json['tc_val'];
    countryCode = json['country_code'];
    role = json['role'];
    // socialId = json['social_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['tc_val'] = this.tcValue;
    data['country_code'] = this.countryCode;
    data['role'] = this.role;
    // data['social_id'] = this.socialId;
    return data;
  }
}

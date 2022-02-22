import 'package:virtudoc_app/apimanager/api_request.dart';
import 'package:virtudoc_app/apimanager/api_url.dart';
import 'package:virtudoc_app/apimanager/base_response/base_response.dart';
import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/screens/phone-verification/verify-otp-model.dart';

class PhoneVerificationProvider extends ChangeNotifier {
  Response response;
  bool ispressed = false;

  Future<BaseResponse> phoneVerification(
      VerifyPhoneModel verifyPhoneModel) async {
    ispressed = true;
    notifyListeners();

    var response = await ApiRequest.postApi(
        ApiUrl.phoneVerifaction, verifyPhoneModel.toJson());
    ispressed = false;
    notifyListeners();

    return BaseResponse.fromJson(jsonDecode(response.body));
  }

  static Future<BaseResponse> optVerification(
      VerifyOtpModel verifyOtpModel) async {
    var response =
        await ApiRequest.postApi(ApiUrl.verifyOtp, verifyOtpModel.toJson());
    return BaseResponse.fromJson(jsonDecode(response.body));
  }

  static Future<BaseResponse> resendOtp(
      int stage, String phoneNumner, String countryCode) async {
    var response = await ApiRequest.postApi(ApiUrl.resendOtp,
        {"stage": stage, "username": phoneNumner, "country_code": countryCode});

    return BaseResponse.fromJson(jsonDecode(response.body));
  }

  static Future<BaseResponse> resetPassword(
      String phNumber, String countryCode) async {
    var response = await ApiRequest.postApi(ApiUrl.resetPassword,
        {"username": phNumber, "country_code": countryCode});
    return BaseResponse.fromJson(jsonDecode(response.body));
  }
}

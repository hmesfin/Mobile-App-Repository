import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/screens/home/patient/medical-history/medical-model.dart';

class MedicalModelProviders extends ChangeNotifier {
  bool isPressed = false;
  static Future<BaseResponse> updateUserProfile(
      MedicalModel medicalModel) async {
    var response =
        await ApiRequest.postApi(ApiUrl.updateDetails, medicalModel.toJson());

    return BaseResponse.fromJson(jsonDecode(response.body));
  }

  savePressed(bool pressed) {
    isPressed = pressed;
    notifyListeners();
  }
}

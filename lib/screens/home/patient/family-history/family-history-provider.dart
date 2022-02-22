import 'package:virtudoc_app/apimanager/api_request.dart';
import 'package:virtudoc_app/apimanager/api_url.dart';
import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/screens/home/patient/family-history/family-model.dart';

class FamilyHisotryProvider extends ChangeNotifier {
  bool isPressed = false;

  static Future<BaseResponse> updateUser(FamilyModel familyModel) async {
    var response =
    await ApiRequest.postApi(ApiUrl.updateDetails, familyModel.toJson());
    return BaseResponse.fromJson(jsonDecode(response.body));
  }

  savePressed(bool pressed) {
    isPressed = pressed;
    notifyListeners();
  }
}

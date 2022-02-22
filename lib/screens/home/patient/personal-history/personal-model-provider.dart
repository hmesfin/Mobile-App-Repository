import 'package:virtudoc_app/apimanager/api_request.dart';
import 'package:virtudoc_app/apimanager/api_url.dart';
import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/screens/home/patient/personal-history/personal-model.dart';

class PersonalModelProvider extends ChangeNotifier {
  bool ispressed = false;
  Future<BaseResponse> updateUser(PersonalModel personalModel) async {
    var response =
        await ApiRequest.postApi(ApiUrl.updateDetails, personalModel.toJson());
    return BaseResponse.fromJson(jsonDecode(response.body));
  }

  savePressed(bool pressed) {
    ispressed = pressed;
    notifyListeners();
  }
}

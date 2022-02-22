import 'package:virtudoc_app/apimanager/api_request.dart';
import 'package:virtudoc_app/apimanager/api_url.dart';
import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/screens/home/patient/change-password/change-pasword-model.dart';
class ChangePasswordProvider extends ChangeNotifier {

   Future<BaseResponse> setPassword(ChangePasswordModel changePasswordModel) async {
    var response =
        await ApiRequest.postApi(ApiUrl.setNewPassword, changePasswordModel.toJson());
    return BaseResponse.fromJson(jsonDecode(response.body));
  }

  
}
import 'package:virtudoc_app/apimanager/api_request.dart';
import 'package:virtudoc_app/apimanager/api_url.dart';
import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/screens/home/patient/update-lang/update-lang-model.dart';

class UpdateLangProvider with ChangeNotifier {
  Future<BaseResponse> updateLanguage(UpdateLangModel updateLangModel) async {
    var response =
    await ApiRequest.postApi(ApiUrl.updateDetails, updateLangModel.toJson());
    return BaseResponse.fromJson(jsonDecode(response.body));
  }

}
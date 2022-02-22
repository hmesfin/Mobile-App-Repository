import 'package:virtudoc_app/index.dart';

class BasicModelProvider extends ChangeNotifier {
  bool isPressed = false;
  bool isBackactive = false;
  Future<BaseResponse> uploadImage(String filePath) async {
    Map<String, String> headers = {
      "Content-Type": "multipart/form-data",
      "Authorization": PreferenceUtils.getString(PreferenceKeys.TOKEN)
    };
    var request = MultipartRequest('POST', Uri.parse(ApiUrl.fileUpload));
    request.headers.addAll(headers);
    request.files.add(await MultipartFile.fromPath('avatar', filePath));
    var res = await request.send();
    var response = await Response.fromStream(res);
    return BaseResponse.fromJson(jsonDecode(response.body));
  }

  Future<BaseResponse> updateUserDetials(BasicModel basicModel) async {
    var response =
        await ApiRequest.postApi(ApiUrl.updateDetails, basicModel.toJson());
    return BaseResponse.fromJson(jsonDecode(response.body));
  }

  savePressed(bool pressed) {
    isPressed = pressed;
    notifyListeners();
  }

  Future<bool> checkActive(BuildContext context) async {
    var value = await CommonWidgets.isCurrentRouteFirst(context);
    isBackactive = value ? false : true;
    notifyListeners();
    return isBackactive;
  }
}

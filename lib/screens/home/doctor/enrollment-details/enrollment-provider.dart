import 'package:virtudoc_app/index.dart';

class EnrollmentProvider extends ChangeNotifier {
  int index = 0;
  bool isLoading = false;
  bool isSavePressed = false;
  bool isBackActive = false;

  static List<String> specialityController = [];
  static var subspecialityController = TextEditingController();

  EnrollmentProvider() {
    getuserStep();
  }

  var scrollController = ScrollController();

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

  static Future<BaseResponse> uploadMultiImage(List<String> filePaths) async {
    Map<String, String> headers = {
      "Content-Type": "multipart/form-data",
      "Authorization": PreferenceUtils.getString(PreferenceKeys.TOKEN)
    };
    var request = MultipartRequest('POST', Uri.parse(ApiUrl.multifileUpload));
    request.headers.addAll(headers);
    request.files.add(
        await MultipartFile.fromPath('undergraduate_degree_doc', filePaths[0]));
    var pic =
    await MultipartFile.fromPath('medical_school_degree_doc', filePaths[1]);
    request.files.add(pic);
    request.files
        .add(await MultipartFile.fromPath('residency_doc', filePaths[2]));
    request.files.add(
        await MultipartFile.fromPath('national_license_doc', filePaths[3]));
    request.files
        .add(await MultipartFile.fromPath('fellowship_doc', filePaths[4]));
    request.files.add(
        await MultipartFile.fromPath('digital_signature_doc', filePaths[5]));
    request.files.forEach((element) {});
    var res = await request.send();
    var response = await Response.fromStream(res);

    return BaseResponse.fromJson(jsonDecode(response.body));
  }

  Future<BaseResponse> updateUserDetail1(
      EnrollStepModel1 enrollStepModel_1) async {
    var response = await ApiRequest.postApi(
        ApiUrl.updateDetails, enrollStepModel_1.toJson());
    return BaseResponse.fromJson(jsonDecode(response.body));
  }

  Future<BaseResponse> updateUserDetail2(
      EnrollStepModel2 enrollStepModel_2) async {
    var response = await ApiRequest.postApi(
        ApiUrl.updateDetails, enrollStepModel_2.toJson());
    return BaseResponse.fromJson(jsonDecode(response.body));
  }

  static Future<BaseResponse> updateUserDetail3(
      EnrollStepModel3 enrollStepModel_3) async {
    var response = await ApiRequest.postApi(
        ApiUrl.updateDetails, enrollStepModel_3.toJson());
    return BaseResponse.fromJson(jsonDecode(response.body));
  }

  isPressed(bool pressed) {
    isSavePressed = pressed;
    notifyListeners();
  }

  nextPage() {
    index++;
    scrollController.animateTo(
      0.0,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 50),
    );
    notifyListeners();
  }

  setIndex(int index) {
    this.index = index;
    notifyListeners();
  }

  void getuserStep() async {
    isLoading = true;
    notifyListeners();
    var response = await ApiRequest.getApi(ApiUrl.getUser);

    index = jsonDecode(response.body)['body']['data']['user_profile']
    ['completed_steps']
        .length;
    isLoading = false;
    notifyListeners();
  }

  checkActive(BuildContext context) async {
    var value = await CommonWidgets.isCurrentRouteFirst(context);
    isBackActive = value ? false : true;
    notifyListeners();
  }
}

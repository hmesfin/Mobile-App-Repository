import 'package:virtudoc_app/index.dart';

class EnrollmentProviderUpdate extends ChangeNotifier {
  int index = 0;
  bool isLoading = false;
  bool isSavePressed = false;
  bool isBackActive = false;

  static List<String> specialityController = [];
  static var subspecialityController = TextEditingController();

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

  static Future<BaseResponse> uploadMultiImage(
      Map<String, String> filePaths) async {
    Map<String, String> headers = {
      "Content-Type": "multipart/form-data",
      "Authorization": PreferenceUtils.getString(PreferenceKeys.TOKEN)
    };
    var request = MultipartRequest('POST', Uri.parse(ApiUrl.multifileUpload));
    request.headers.addAll(headers);
    if (filePaths[Strings.undergraddoc] != null)
      request.files.add(await MultipartFile.fromPath(
          Strings.undergraddoc, filePaths[Strings.undergraddoc]));

    if (filePaths[Strings.medicalSchoolDoc] != null) {
      var pic = await MultipartFile.fromPath(
          Strings.medicalSchoolDoc, filePaths[Strings.medicalSchoolDoc]);
      request.files.add(pic);
    }
    if (filePaths[Strings.residencyDoc] != null)
      request.files.add(await MultipartFile.fromPath(
          Strings.residencyDoc, filePaths[Strings.residencyDoc]));

    if (filePaths[Strings.nationalLicenceDoc] != null)
      request.files.add(await MultipartFile.fromPath(
          Strings.nationalLicenceDoc, filePaths[Strings.nationalLicenceDoc]));
    if (filePaths[Strings.fellowShipDoc] != null)
      request.files.add(await MultipartFile.fromPath(
          Strings.fellowShipDoc, filePaths[Strings.fellowShipDoc]));
    if (filePaths[Strings.digitalSigDoc] != null)
      request.files.add(await MultipartFile.fromPath(
          Strings.digitalSigDoc, filePaths[Strings.digitalSigDoc]));

    if (filePaths[Strings.specialityDoc] != null)
      request.files.add(await MultipartFile.fromPath(
          Strings.specialityDoc, filePaths[Strings.specialityDoc]));
    if (filePaths[Strings.subspecialityDoc] != null)
      request.files.add(await MultipartFile.fromPath(
          Strings.subspecialityDoc, filePaths[Strings.subspecialityDoc]));
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

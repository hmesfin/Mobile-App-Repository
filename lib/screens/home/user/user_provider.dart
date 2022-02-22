import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:virtudoc_app/index.dart' hide EnrollmentInformation;
import 'package:virtudoc_app/screens/home/patient/family-history/family-model.dart';
import 'package:virtudoc_app/screens/home/patient/medical-history/medical-model.dart';
import 'package:virtudoc_app/screens/home/patient/personal-history/personal-model.dart';
import 'package:virtudoc_app/screens/home/user/user_model.dart'
    show Addess, Documents, EnrollmentInformation;

class UserProvider extends ChangeNotifier {
  bool isLoading = false;
  String firstname;
  int accountRequestStatus;
  int accountStatus;
  int doctorId;
  String timeZone;
  String lastname;
  String email;
  Biometrics biometrics;
  PersonalHistoryModel personalModel;
  Addess addess;
  Documents documents;
  FamilyHistoryModel familyModel;
  MedicalHistoryModel medicalModel;
  EnrollmentInformation enrollmentInformation;
  String completeness;
  String fcmToken;
  double rating;
  String language = Strings.amharic;
  bool isNotify = false;
  String profileImage;
  bool isEmailVerified = false;
  String walletId;
  double throttleAmount;
  String rejectedReason;

  getIsEmailVerified() {
    return this.isEmailVerified;
  }

  Future getUser() async {
    isLoading = true;
    notifyListeners();
    try {
      var response = await ApiRequest.getApi(ApiUrl.getUser);
      fcmToken = await FirebaseMessaging().getToken();

      accountRequestStatus =
      jsonDecode(response.body)['body']['data']['account_request_status'];

      timeZone = jsonDecode(response.body)['body']['data']['timezone'] ?? '';
      rejectedReason =
      jsonDecode(response.body)['body']['data']['rejected_remark'];
      accountStatus = jsonDecode(response.body)['body']['data']['status'];
      throttleAmount =
          jsonDecode(response.body)['body']['data']['throttle_amount'] ?? 0.0;
      walletId = jsonDecode(response.body)['body']['data']['wallet_id'] ?? '';
      firstname = jsonDecode(response.body)['body']['data']['first_name'];
      lastname = jsonDecode(response.body)['body']['data']['last_name'];
      isEmailVerified =
      jsonDecode(response.body)['body']['data']['is_email_verified'];
      email = jsonDecode(response.body)['body']['data']['email'];
      enrollmentInformation = EnrollmentInformation.fromJson(
          jsonDecode(response.body)['body']['data']['user_profile']
          ['enrollment_information']);
      doctorId = jsonDecode(response.body)['body']['data']['user_id'];
      rating = jsonDecode(response.body)['body']['data']['user_profile']
      ['avg_rating'] !=
          null
          ? jsonDecode(response.body)['body']['data']['user_profile']
      ['avg_rating']
          .toDouble()
          : 0.0;

      if (jsonDecode(response.body)['body']['data']['user_profile']
      ['documents'] !=
          '') {
        documents = Documents.fromJson(jsonDecode(response.body)['body']['data']
        ['user_profile']['documents']);
      }
      profileImage = jsonDecode(response.body)['body']['data']['user_profile']
      ['profile_image'];

      addess = Addess.fromJson(
          jsonDecode(response.body)['body']['data']['user_profile']['address']);
      biometrics = Biometrics.fromJson(jsonDecode(response.body)['body']['data']
      ['user_profile']['biometrics']);
      language =
      jsonDecode(response.body)['body']['data']['user_profile']['language'];
      isNotify = jsonDecode(response.body)['body']['data']['user_profile']
      ['is_notify'];
      completeness = jsonDecode(response.body)['body']['data']
      ['percentage_profile_complete']
          .toString();
      medicalModel = MedicalHistoryModel.fromJson(
          jsonDecode(response.body)['body']['data']['user_profile']
          ['medical_history']);
      familyModel = FamilyHistoryModel.fromJson(
          jsonDecode(response.body)['body']['data']['user_profile']
          ['family_history']);
      personalModel = PersonalHistoryModel.fromJson(
          jsonDecode(response.body)['body']['data']['user_profile']
          ['personal_history']);

      isNotify = jsonDecode(response.body)['body']['data']['user_profile']
      ['is_notify'];
    } on PlatformException catch (e) {

    }

    isLoading = false;

    if (language == null) language = Strings.amharic;
    if (isNotify == null) isNotify = false;
    notifyListeners();
  }
}

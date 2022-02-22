import 'package:virtudoc_app/apimanager/api_request.dart';
import 'package:virtudoc_app/apimanager/api_url.dart';
import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/screens/home/doctor/rating-feedback/rating-feedback-model.dart';
import 'package:virtudoc_app/screens/home/patient/appointment/appointment-model.dart';

class AppointmentProvider with ChangeNotifier {
  bool isLoading = false;
  int page = 1;
  List<AppointmentModel> appointmentList = [];
  bool isMore = true;
  bool saving = false;

  clearListPatient() {
    appointmentList.clear();
  }

  setPageCount(int pg) {
    page = pg;
  }

  fetchListPatient(String requestType, int page) async {
    try {
      if (page == 1) {
        appointmentList.clear();
      }
      //print("fetch method 1...........");
      saving = true;
      notifyListeners();
      var response =
      await ApiRequest.getApi(ApiUrl.getAppointmentList(requestType, page));
      Map decoded = jsonDecode(response.body);
      decoded['body']['data']['rows'].forEach((element) {
        //print("fetch method 2...........");

        appointmentList.add(
          AppointmentModel(
              patientName: ((element['patient']['first_name'] ?? "") +
                  " " +
                  (element['patient']['last_name'])),
              patientDob:
              element['patient']['user_profile']['biometrics']['dob'] ?? "",
              gender: element['patient']['user_profile']['biometrics']
              ['gender'] ??
                  "",
              purpose: element['purpose'] ?? "",
              endTime: element['end_time'] ?? "",
              speciality: element['doctor']['user_profile']
              ['enrollment_information']['speciality'] is List
                  ? element['doctor']['user_profile']['enrollment_information']
              ['speciality']
                  : ['N.A.'],
              drName:

              (element['doctor']['first_name'] ?? 'N.A') +
                  " " +
                  (element['doctor']['last_name'] ?? 'N.A'),

              subSpeciality: element['doctor']['user_profile']
              ['enrollment_information']['sub_speciality'] is String
                  ? element['doctor']['user_profile']['enrollment_information']
              ['sub_speciality']
                  : '',
              houseNumber:
              element['doctor']['user_profile']['address']['house_no'] ?? '',
              city: element['doctor']['user_profile']['address']['city'] ?? '',
              subCity: element['doctor']['user_profile']['address']['sub_city'] ??
                  '',
              region: element['doctor']['user_profile']['address']['region'] ??
                  '',
              state: element['doctor']['user_profile']['address']['state'] ??
                  '',
              country: element['doctor']['user_profile']['address']['country'] ??
                  '',
              startTime: element['start_time'] ?? '',
              appointmentId: element['appointment_id'],
              date: element['date'] ?? '',
              drPic: element['doctor']['user_profile']['profile_image'] is String
                  ? element['doctor']['user_profile']['profile_image']
                  .toString()
                  : 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
              patientPic: element['patient']['user_profile']['profile_image'] is String
                  ? element['patient']['user_profile']['profile_image']
                  .toString()
                  : 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
        );
      });
      //print("fetch method 3 ...........");

      notifyListeners();

      saving = false;
    } catch (err) {
      saving = false;
    }
    notifyListeners();
  }

  Future<BaseResponse> reportFeedBack(
      ReportFeedbackModel feedbackReport) async {
    isLoading = true;
    notifyListeners();
    var response = await ApiRequest.postApi(
        ApiUrl.reportFeedback, feedbackReport.toJson());

    isLoading = false;
    notifyListeners();
    return BaseResponse.fromJson(jsonDecode(response.body));
  }
}

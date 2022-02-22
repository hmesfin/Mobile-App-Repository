import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/screens/home/patient/doctor-detail/model/request/book_appointment_body.dart';
import 'package:virtudoc_app/screens/orders/model/get_payment_uri_response.dart';

class DoctorDetailProvider with ChangeNotifier {
  bool isLoading = false;
  DoctorDetailData doctorDetailData;
  List<FeedbackListRow> feedbackList = [];
  int page = 0;
  String doctorId;
  String additionalInfo = "";

  RefreshController refreshController =
  RefreshController(initialRefresh: false);

  void refreshList() async {
    await Future.delayed(Duration(milliseconds: 2000));
    refreshController.refreshCompleted();
    notifyListeners();
  }

  Future getDoctorDetails({doctorId}) async {
    additionalInfo = "";
    this.doctorId = '$doctorId';
    isLoading = true;
    feedbackList.clear();
    page = 0;
    notifyListeners();

    try {
      getFeedbackList();
      var response =
      await ApiRequest.getApi(ApiUrl.getDoctorDetails('$doctorId'));

      Map decode = jsonDecode(response.body);

      DoctorDetailResponse result = DoctorDetailResponse.fromJson(decode);
      doctorDetailData = result.body.data;
    } on PlatformException catch (e) {

    }

    isLoading = false;
    notifyListeners();
  }

  Future getFeedbackList() async {
    isLoading = true;
    notifyListeners();
    var response =
    await ApiRequest.getApi(ApiUrl.getFeedbackList(doctorId, ++page));
    Map decode = jsonDecode(response.body);
    FeedbackListResponse result = FeedbackListResponse.fromJson(decode);
    if (result.body.data.rows.length != 0) {
      feedbackList.addAll(result.body.data.rows);
      notifyListeners();
    } else {
      --page;
      notifyListeners();
    }
    refreshController.loadComplete();
    isLoading = false;
    notifyListeners();
  }

  Future getPaymentUri({Function success, Function error}) async {
    isLoading = true;
    notifyListeners();
    var response = await ApiRequest.getApi(ApiUrl.getPaymentUri(doctorId));
    Map decode = jsonDecode(response.body);
    GetPaymentUriResponse result = GetPaymentUriResponse.fromJson(decode);
    if (result.status == 200) {
      success(result);
    } else {
      error(decode['message']);
    }

    isLoading = false;
    notifyListeners();
  }

  Future bookAppoinment({Function success,
    Function error,
    BookAppointmentBody bookAppointmentBody}) async {
    isLoading = true;
    notifyListeners();

    var response = await ApiRequest.postApi(
        ApiUrl.bookAppoitment, bookAppointmentBody.toJson());
    isLoading = false;
    Map decode = jsonDecode(response.body);
    //print(bookAppointmentBody.toJson());
    //print(decode);
    if (response.statusCode == 200) {
      notifyListeners();
      return success();
    } else {
      notifyListeners();
      return error(decode['message']);
    }
  }
}

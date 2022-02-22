import 'package:virtudoc_app/apimanager/api_request.dart';
import 'package:virtudoc_app/apimanager/api_url.dart';
import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/screens/home/doctor/rating-feedback/rating-feedback-model.dart';

class RatingFeedbackProvider with ChangeNotifier {
  bool isLoading = false;
  int page = 1;
  List<RatingFeedbackModel> _list = [];

  List<RatingFeedbackModel> get list => _list;

  void getFeedbackList(int doctorId, int page) async {
    if (page == 1) {
      list.clear();
    }

    isLoading = true;
    notifyListeners();
    var response = await ApiRequest.getApi(
      ApiUrl.getDoctorFeedback(doctorId, page),
    );

    final body = json.decode(response.body) as Map<String, dynamic>;
    final data = body['body']['data']['rows'];

    data.forEach((ele) {
      _list.add(RatingFeedbackModel.fromJson(ele));
    });
    isLoading = false;

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

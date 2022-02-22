import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/screens/home/patient/patient-notification/notification_model.dart';

class PatientNotificationProvider extends ChangeNotifier {
  bool isLoading = false;
  List<NotificationModel> notificationModelList = [];
  int count = 0;
  int page = 1;

  void getNotifications(int page) async {
    isLoading = true;

    if (page == 1) {
      notificationModelList.clear();
    }
    notifyListeners();
    var response = await ApiRequest.getApi(
        ApiUrl.getNotification + '?page=$page&page_size=10');
    var baseResponse = BaseResponse.fromJson(jsonDecode(response.body));
    try {
      baseResponse.body['data']['newdata'].forEach((notification) {
        notificationModelList.add(NotificationModel.fromJson(notification));
      });
    } catch (e) {}

    isLoading = false;
    notifyListeners();
  }

  Future<BaseResponse> clearNotification() async {
    isLoading = true;
    notifyListeners();
    final response = await ApiRequest.postApi(ApiUrl.clearNotification, {});
    notificationModelList = [];
    isLoading = false;
    notifyListeners();
    return BaseResponse.fromJson(jsonDecode(response.body));
  }

  Future<bool> getunreadNotification() async {
    try {
      final response = await ApiRequest.postApi(ApiUrl.unreadNotification, {});
      final body = json.decode(response.body) as Map<String, dynamic>;
      final data = body['body']['data']['count'];
      
      count = data;
      return true;
    } catch (e) {
      
    }
    return false;
  }
}

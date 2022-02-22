import 'package:virtudoc_app/apimanager/api_request.dart';
import 'package:virtudoc_app/apimanager/api_url.dart';
import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/screens/home/doctor/doctor-notification/doctor-notification-model.dart';

class DoctorNotificationProvider extends ChangeNotifier {
  List<DoctorNotificationModel> _list = [];

  List<DoctorNotificationModel> get list => _list;
  int count = 0;
  int poge = 1;
  bool isloading = false;

  void getNotification(int page) async {
    isloading = true;
    if (page == 1) {
      _list.clear();
    }
    notifyListeners();
    var response = await ApiRequest.getApi(
      ApiUrl.getNotification + '?page=$page&page_size=10',
    );

    final body = json.decode(response.body) as Map<String, dynamic>;
    final data = body['body']['data']['newdata'];

    data.forEach((ele) {
      _list.add(DoctorNotificationModel.fromJson(ele));
    });
    isloading = false;
    notifyListeners();
  }

  Future<BaseResponse> clearNotification() async {
    isloading = true;
    notifyListeners();
    final response = await ApiRequest.postApi(ApiUrl.clearNotification, {});
    _list.clear();

    isloading = false;
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
    } catch (e) {}
    return false;
  }
}

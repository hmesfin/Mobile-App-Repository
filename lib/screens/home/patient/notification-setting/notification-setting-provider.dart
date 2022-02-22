import 'package:virtudoc_app/apimanager/api_request.dart';
import 'package:virtudoc_app/apimanager/api_url.dart';
import 'package:virtudoc_app/index.dart';

import 'notification-setting-model.dart';

class NotificationSettingProvider with ChangeNotifier{
  Future<BaseResponse> setnotification(NotificationSettingModel notifyModel) async {
    var response =
        await ApiRequest.postApi(ApiUrl.updateDetails, notifyModel.toJson());
    return BaseResponse.fromJson(jsonDecode(response.body));
  }

}
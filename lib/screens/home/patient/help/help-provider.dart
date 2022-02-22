import 'package:virtudoc_app/apimanager/api_request.dart';
import 'package:virtudoc_app/apimanager/api_url.dart';
import 'package:virtudoc_app/index.dart';
import 'help-model.dart';

class HelpProvider extends ChangeNotifier {
  List<HelpModel> _list = [];

  List<HelpModel> get list => _list;

  Future<BaseResponse> getFaq() async {
    _list.clear();
    var response = await ApiRequest.getApi(
      ApiUrl.getFaq,
    );
    final body = jsonDecode(response.body) as Map<String, dynamic>;
    body['body']['data'].forEach((ele) {
      _list.add(HelpModel.fromJson(ele));
    });
    notifyListeners();


    return BaseResponse.fromJson(jsonDecode(response.body));
  }
}

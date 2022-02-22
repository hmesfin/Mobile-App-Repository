import 'package:virtudoc_app/apimanager/api_request.dart';
import 'package:virtudoc_app/apimanager/api_url.dart';
import 'package:virtudoc_app/index.dart';
import './login-model.dart';

class LoginProvider extends ChangeNotifier {
  Response response;

  bool isPressed = false;
  login(LoginClass loginModel) async {

    isPressed = true;
    notifyListeners();
    response = await ApiRequest.postApi(ApiUrl.login, loginModel.toJson());
    isPressed = false;
    notifyListeners();


  }
}

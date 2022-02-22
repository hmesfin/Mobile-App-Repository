import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/screens/home/patient/payment-method/get-supported-methods.model.dart';
import 'package:virtudoc_app/screens/home/patient/payment-method/list-payment-methods.model.dart';

class ListPaymentMethod extends ChangeNotifier {
  bool isLoading = false;
  ListPaymentMethodsModel listPaymentMethodsModel;
  fetch() async {
    try {
      isLoading = true;
      notifyListeners();
      var response = await ApiRequest.getApi(ApiUrl.listPaymentMethods);
      listPaymentMethodsModel =
          ListPaymentMethodsModel.fromJson(jsonDecode(response.body));
    } catch (err) {}
    isLoading = false;
    notifyListeners();
  }

  setLoading(bool isLoading) {
    isLoading = isLoading;
    notifyListeners();
  }
}

class GetSupportedPaymentMethods extends ChangeNotifier {
  GetSupportedPaymentMethodsModel getSupportedPaymentMethodsModel;
  fetch() async {
    try {
      var response = await ApiRequest.getApi(ApiUrl.getSupportedPaymentMethods);
      getSupportedPaymentMethodsModel =
          GetSupportedPaymentMethodsModel.fromJson(jsonDecode(response.body));
    } catch (err) {}
    notifyListeners();
  }
}

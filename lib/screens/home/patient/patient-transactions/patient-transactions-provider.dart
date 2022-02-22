import 'package:virtudoc_app/apimanager/api_request.dart';
import 'package:virtudoc_app/apimanager/api_url.dart';
import 'package:virtudoc_app/index.dart';

import 'model/patient-transactions-model.dart';

class PatientTransactionsProvider with ChangeNotifier {
  int page = 1;
  int pageItems;
  bool isLoading = false;
  List<PatientTransactionsModel> _list = [];
  List<PatientTransactionsModel> get list => _list;

  Future<void> getTransactionList(int page) async {
    isLoading = true;
    notifyListeners();
    if (page == 1) {
      _list.clear();
    }
    try {
      var response = await ApiRequest.getApi(
        ApiUrl.transactionPatientList + '?&page=$page',
      );
      final body = json.decode(response.body) as Map<String, dynamic>;
      final data = body['body']['data']['rows'];
      if (data != null)
        data.forEach((ele) {
          _list.add(PatientTransactionsModel.fromJson(ele));
        });
    } catch (e) {}

    isLoading = false;
    notifyListeners();
  }
}

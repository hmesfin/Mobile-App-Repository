import 'package:virtudoc_app/index.dart';

class WalletProvider extends ChangeNotifier {
  String id;
  String currency;
  String alias;
  double balance;
  double receivedBalance;
  double onHoldBalance;
  double reserveBalance;

  double throttleAmount;
  bool isLoading = false;
  double amountToBeAdded;

  Future getWalletAmount() async {
    isLoading = true;
    notifyListeners();
    try {
      var response = await ApiRequest.getApi(ApiUrl.getWalletAmount);

      var resBody = jsonDecode(response.body)['body']['data'];
      id = resBody['id'];
      balance = resBody['balance']?.toDouble() ?? 0.0;
      alias = resBody['alias'] ?? "";
      currency = resBody['currency'] ?? "";
      throttleAmount = resBody['throttle_amount'].toDouble() ?? 0.0;
      onHoldBalance = resBody['on_hold_balance'].toDouble() ?? 0.0;
      reserveBalance = resBody['reserve_balance'].toDouble() ?? 0.0;
    } catch (err) {}
    isLoading = false;
    notifyListeners();
  }
}

import 'package:virtudoc_app/index.dart';

class BookingProvider extends ChangeNotifier {
  String additionalInfo = '';
  String purposeVisit = '';

  setAdditionalInfo(String val) {
    this.additionalInfo = val;
    notifyListeners();
  }

  setPurposeVisit(String val) {
    this.purposeVisit = val;
    notifyListeners();
  }
}

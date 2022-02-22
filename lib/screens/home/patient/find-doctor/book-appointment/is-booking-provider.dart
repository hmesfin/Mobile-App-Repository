import 'package:virtudoc_app/index.dart';

class IsBookingProvider extends ChangeNotifier {
  bool isBooking = false;

  comingFromBookingPage(bool val) {
    this.isBooking = val;
    notifyListeners();
  }
}

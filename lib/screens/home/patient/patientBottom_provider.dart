import 'package:virtudoc_app/index.dart';

class PatientBottomProvider extends ChangeNotifier {
  int selectedIndex = 0;
  bool fromAppointmentNav = false;
  void setFromAppointmentNav(bool fromDash) {
    fromAppointmentNav = fromDash;
    notifyListeners();
  }

  void onItemTapped(int index) {
    selectedIndex = index;
    if (index == 3) {
      setFromAppointmentNav(true);
    } else {
      setFromAppointmentNav(false);
    }
    // });
    notifyListeners();
  }
}

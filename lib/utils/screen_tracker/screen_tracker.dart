import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/screens/home/patient/appointment/appointment-provider.dart';
import 'package:virtudoc_app/screens/home/patient/patientBottom_provider.dart';
import 'package:virtudoc_app/screens/home/patient/wallet/wallet_provider.dart';

class ScreenTracker {
  Timer _timer;
  int _counter = 0;
  static const ONE_MIN = const Duration(minutes: 1);

  void startTimer(BuildContext context) {
    if (PreferenceUtils.getBool(PreferenceKeys.IS_LOGIN)) {
      _counter = 14;
      _timer = Timer.periodic(ONE_MIN, (timer) async {
        if (_counter == 0) {
          //TODO uncomment
          await logoutFunctionCall(context);
          _timer.cancel();
        } else {
          _counter--;
        }
      });
    } else {

    }
  }

  void stopTimer() {
    if (_timer != null && PreferenceUtils.getBool(PreferenceKeys.IS_LOGIN)) {
      _timer.cancel();
    } else {

    }
  }

  Future<void> logoutFunctionCall(BuildContext context) async {
    await clearToken(context);
    PreferenceUtils.clear();
    Provider
        .of<PatientBottomProvider>(context, listen: false)
        .selectedIndex =
    0;
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => WelcomeScreen()),
            (route) => false);
  }

  Future<void> clearToken(BuildContext context) async {
    try {
      var token = await FirebaseMessaging().getToken();

      await ApiRequest.postApi(ApiUrl.logout, {'fcm_device_token': token});
      Provider
          .of<WalletProvider>(context, listen: false)
          .balance = 0.0;
      Provider.of<AppointmentProvider>(context, listen: false)
          .clearListPatient();
    } on PlatformException catch (e) {

    }
  }
}

var screenTracker = ScreenTracker();

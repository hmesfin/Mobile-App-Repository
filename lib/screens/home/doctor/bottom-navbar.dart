import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/screens/home/doctor/doctor-home-screen.dart';
import 'package:virtudoc_app/screens/home/doctor/profile/profile-doctor.dart';
import 'package:virtudoc_app/screens/home/patient/appointment/appointment.dart';
import 'package:virtudoc_app/screens/home/patient/patientBottom_provider.dart';
import 'package:virtudoc_app/screens/home/patient/setting/settings.dart';
import 'package:virtudoc_app/screens/home/patient/wallet/wallet.dart';
import 'package:virtudoc_app/screens/home/patient/wallet/wallet_provider.dart';
import 'package:virtudoc_app/screens/video_call/video_call_provider.dart';
import 'package:virtudoc_app/utils/custom-colors.dart';
import 'package:virtudoc_app/utils/screen_tracker/screen_tracker.dart';
import 'package:virtudoc_app/utils/strings.dart';

class BottomNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyStatefulWidget();
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key, this.selectedTab = -1}) : super(key: key);
  final int selectedTab;

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with WidgetsBindingObserver {
  FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;
  static List<Widget> _widgetOptions = <Widget>[
    DoctorHomeScreen(),
    ProfileDoctor(),
    //TODO uncomment with new payment gat
    // Wallet(false),
    Appointment(false),
    Settings(),
  ];

  void _onItemTapped(int index) {
    Provider.of<PatientBottomProvider>(context, listen: false)
        .onItemTapped(index);
    if (index == 3) {
      Provider.of<PatientBottomProvider>(context, listen: false)
          .setFromAppointmentNav(true);
    } else {
      Provider.of<PatientBottomProvider>(context, listen: false)
          .setFromAppointmentNav(false);
    }
  }

  @override
  void initState() {
    super.initState();
    PreferenceUtils.putBool(PreferenceKeys.IS_CALLING, false);
    WidgetsBinding.instance.addObserver(this);

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      screenTracker.stopTimer();
      screenTracker.startTimer(context);
      await Provider.of<UserProvider>(context, listen: false).getUser();

      //Add local time zone
      // if (Provider.of<UserProvider>(context, listen: false).timeZone.isEmpty) {
      //   await ApiRequest.postApi(ApiUrl.updateDetails, {
      //     'action': 'update_timezone',
      //     'timezone': await FlutterNativeTimezone.getLocalTimezone()
      //   });
      // }
      await initializeNotification();
      //TODO change with new payment implementation
      // try {
      //   if (Provider.of<UserProvider>(context, listen: false).walletId ==
      //       null) {
      //     await ApiRequest.getApi(ApiUrl.setupPaymentWallet);
      //   }

      //   Provider.of<WalletProvider>(context, listen: false).getWalletAmount();
      // } on PlatformException catch (e) {
      //   print("error ${e.message}");
      // }
    });
  }

  Future initializeNotification() async {
    configureFcm();
  }

  void configureFcm() {
    FirebaseMessaging().configure(
      onMessage: (Map<String, dynamic> message) async {
        try {
          // if (Platform.isAndroid)
          //   _navigateToItemDetail(message['notification']['title'],
          //       message['notification']['body'], context);
          // if (Platform.isIOS)
          //   _navigateToItemDetail(message['aps']['alert']['title'],
          //       message['aps']['alert']['body'], context);
        } catch (e) {}
      },
      onLaunch: (Map<String, dynamic> message) async {
        // if (Platform.isAndroid)
        //   _navigateToItemDetail(message['notification']['title'],
        //       message['notification']['body'], context);
        // if (Platform.isIOS)
        //   _navigateToItemDetail(message['aps']['alert']['title'],
        //       message['aps']['alert']['body'], context);
      },
      onResume: (Map<String, dynamic> message) async {
        // if (Platform.isAndroid)
        //   _navigateToItemDetail(message['notification']['title'],
        //       message['notification']['body'], context);
        // if (Platform.isIOS)
        //   _navigateToItemDetail(message['aps']['alert']['title'],
        //       message['aps']['alert']['body'], context);
      },
    );
  }

  // void _navigateToItemDetail(
  //     String title, String message, BuildContext context) {
  //   showDialog(
  //     context: context,
  //     child: AlertDialog(
  //       title: Text(
  //         title,
  //       ),
  //       content: Text(message),
  //       actions: [
  //         RaisedButton(
  //           onPressed: () {
  //             Navigator.pop(context);
  //           },
  //           child: Text('Ok'),
  //         )
  //       ],
  //     ),
  //   );
  // }

  void showMessageDialog({String title, String body, String url}) {
    showDialog(
      context: context,
      builder: (_) =>
          AlertDialog(
            title: Text(title),
            content: Text(body),
            actions: [
              RaisedButton(
                  child: Text('Ok'),
                  onPressed: () {
                    Navigator.pop(context);

                    VideoCallProvider().videoCallPage(
                        doctorImage:
                        Provider
                            .of<UserProvider>(context, listen: false)
                            .profileImage,
                        doctorName:
                        Provider
                            .of<UserProvider>(context, listen: false)
                            .firstname,
                        link: url);
                  })
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          screenTracker.stopTimer();
          screenTracker.startTimer(context);
        },
        behavior: HitTestBehavior.translucent,
        onDoubleTap: () {
          screenTracker.stopTimer();
          screenTracker.startTimer(context);
        },
        onVerticalDragStart: (dragDetails) {
          screenTracker.stopTimer();
          screenTracker.startTimer(context);
        },
        onHorizontalDragStart: (dragDetails) {
          screenTracker.stopTimer();
          screenTracker.startTimer(context);
        },
        child: Scaffold(
          body: Center(
            child: _widgetOptions.elementAt(
                Provider
                    .of<PatientBottomProvider>(context, listen: false)
                    .selectedIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: CustomColors.bg_app,
            showUnselectedLabels: true,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard),
                label: Strings.dashboard,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: Strings.profile,
              ),

              //TODO uncomment with new payment gateway
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.account_balance_wallet),
              //   label: Strings.finance,
              // ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.date_range,
                ),
                label: Strings.appointment,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                ),
                label: Strings.settings,
              ),
            ],
            currentIndex: widget.selectedTab == -1
                ? Provider
                .of<PatientBottomProvider>(context, listen: true)
                .selectedIndex
                : widget.selectedTab,
            selectedItemColor: CustomColors.blue,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  int logoutTime = 15;
  bool autoLogout = false;
  bool stateInactive = false;
  Timer logoutTimer;
  Stopwatch watch = Stopwatch();

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (!PreferenceUtils.getBool(PreferenceKeys.IS_CALLING)) {
      if (state == AppLifecycleState.resumed) {
        //get time difference from saved time and current time
        //then auto logout
        var savedtime = DateTime.parse(
            PreferenceUtils.getString(PreferenceKeys.TIME_STAMP));
        var currentTime = DateTime.now();
        if (currentTime
            .difference(savedtime)
            .inMinutes > logoutTime) {
          screenTracker.logoutFunctionCall(context);
        }
      } else if (state == AppLifecycleState.paused) {
        // when paused save the current time stamp
        PreferenceUtils.putString(
            PreferenceKeys.TIME_STAMP, DateTime.now().toString());
      }
    }
  }

  Future setIncative(bool value) async {
    setState(() {
      stateInactive = value;
    });
  }

  startWatch() {
    setState(() {
      autoLogout = false;
      watch.start();
      logoutTimer = Timer.periodic(Duration(seconds: 1), (timer) {
        if (!stateInactive) {
          timer.cancel();
        }
        if (timer.tick == logoutTime) {
          resetAutoBool(value: true);
          setIncative(true);
          timer.cancel();
        }
      });
    });
  }

  startWatchAndroid() {
    setState(() {
      autoLogout = false;
      watch.start();
      logoutTimer = Timer.periodic(Duration(seconds: 1), (timer) {
        if (timer.tick == logoutTime) {
          resetAutoBool(value: true);
          setIncative(true);
          timer.cancel();
        }
      });
    });
  }

  stopWatch() {
    setState(() {
      watch.stop();
      logoutTimer.cancel();
    });
  }

  resetAutoBool({bool value}) {
    if (logoutTimer != null) {
      if (!value) {
        logoutTimer.cancel();
      }
    }
    setState(() {
      autoLogout = value;
    });
  }
}

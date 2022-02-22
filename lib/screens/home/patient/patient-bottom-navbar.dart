import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/screens/home/doctor/chat/chat-detail.dart';
import 'package:virtudoc_app/screens/home/patient/appointment/appointment.dart';
import 'package:virtudoc_app/screens/home/patient/patient-home-screen.dart';
import 'package:virtudoc_app/screens/home/patient/patientBottom_provider.dart';
import 'package:virtudoc_app/screens/home/patient/profile/profile-patient.dart';
import 'package:virtudoc_app/screens/home/patient/setting/settings.dart';
import 'package:virtudoc_app/screens/home/patient/wallet/wallet.dart';
import 'package:virtudoc_app/screens/video_call/video_call_provider.dart';
import 'package:virtudoc_app/utils/custom-colors.dart';
import 'package:virtudoc_app/utils/screen_tracker/screen_tracker.dart';

class PatientBottomNavbar extends StatefulWidget {
  PatientBottomNavbar({Key key, this.selectedTab = -1}) : super(key: key);
  final int selectedTab;

  @override
  _PatientBottomNavbarState createState() => _PatientBottomNavbarState();
}

class _PatientBottomNavbarState extends State<PatientBottomNavbar>
    with WidgetsBindingObserver {
  FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;

  static List<Widget> _widgetOptions = <Widget>[
    PatientHomeScreen(),
    ProfilePatient(),
    //TODO uncomment with new payment gateway
    // Wallet(true),
    Appointment(true),
    Settings(),
  ];

  void onItemTapped(int index) {
    Provider.of<PatientBottomProvider>(context, listen: false)
        .onItemTapped(index);
  }

  @override
  void initState() {
    super.initState();

    PreferenceUtils.putBool(PreferenceKeys.IS_CHATTING, false);
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
      //TODO uncomment with new payment gateway
      try {
        if (Provider.of<UserProvider>(context, listen: false).walletId ==
            null) {
          await ApiRequest.getApi(ApiUrl.setupPaymentWallet);
        }
      } catch (e) {}
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
      child: SafeArea(
        child: Scaffold(
          body: Center(
            child: _widgetOptions.elementAt(
                Provider.of<PatientBottomProvider>(context, listen: true)
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
              //   label: Strings.wallet,
              // ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.date_range,
                ),
                label: Strings.appointment,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: Strings.settings,
              ),
            ],
            currentIndex: widget.selectedTab == -1
                ? Provider.of<PatientBottomProvider>(context, listen: true)
                    .selectedIndex
                : widget.selectedTab,
            selectedItemColor: CustomColors.blue,
            onTap: onItemTapped,
          ),
        ),
      ),
    );
  }

  Future initializeNotification() async {
    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    var android = AndroidInitializationSettings('@mipmap/ic_launcher');
    var ios = IOSInitializationSettings();
    var initializationSettings = InitializationSettings(
      android: android,
      iOS: ios,
    );
    await _flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onselectNotification);
    configureFcm();
  }

  void configureFcm() {
    FirebaseMessaging().configure(
      onMessage: (Map<String, dynamic> message) async {
        try {
          if (Platform.isIOS) {
            if (message['alert_type'].toString().toLowerCase() ==
                Strings.videocall.toLowerCase()) {
              showMessageDialog(
                  body: message['aps']['alert']['body'],
                  title: message['aps']['alert']['title'],
                  url: message['meeting_link'],
                  doctorImage: message['doctor_image_url'],
                  doctorName: message['doctor_name']);
            } else if (message['alert_type'].toString().toLowerCase() ==
                Strings.chat.toLowerCase()) {
              if (!PreferenceUtils.getBool(PreferenceKeys.IS_CHATTING)) {
                _navigateToItemDetail(
                  message['aps']['alert']['title'] ?? 'title',
                  message['aps']['alert']['body'] ?? 'body',
                  context,
                  appoitmentId: int.parse(message['roomname'].split('-')[1]),
                  doctorname: message['doctorname'] ?? 'doctorname',
                  username: message['username'] ?? 'username',
                  userpic: message['userpic'] ?? '',
                  isChat: true,
                );
              }
            }
          }

          if (Platform.isAndroid) {
            if (message['data']['alert_type'].toString().toLowerCase() ==
                Strings.videocall.toLowerCase()) {
              showMessageDialog(
                  body: message['notification']['body'],
                  title: message['notification']['title'],
                  url: message['data']['meeting_link'],
                  doctorImage: message['data']['doctor_image_url'],
                  doctorName: message['data']['doctor_name']);
            } else if (message['data']['alert_type'].toString().toLowerCase() ==
                Strings.chat.toLowerCase()) {
              if (!PreferenceUtils.getBool(PreferenceKeys.IS_CHATTING)) {
                _navigateToItemDetail(
                  message['notification']['title'],
                  message['notification']['body'],
                  context,
                  appoitmentId:
                      int.parse(message['data']['roomname'].split('-')[1]),
                  doctorname: message['data']['doctorname'],
                  username: message['data']['username'],
                  userpic: message['data']['userpic'] ?? '',
                  isChat: true,
                );
              }
            }
          }
        } catch (e) {}
      },
      onLaunch: (Map<String, dynamic> message) async {
        try {
          if (Platform.isIOS) {
            if (message['alert_type'].toString().toLowerCase() ==
                Strings.videocall.toLowerCase()) {
              showMessageDialog(
                  body: message['aps']['alert']['body'],
                  title: message['aps']['alert']['title'],
                  url: message['meeting_link'],
                  doctorImage: message['doctor_image_url'],
                  doctorName: message['doctor_name']);
            } else if (message['alert_type'].toString().toLowerCase() ==
                Strings.chat.toLowerCase()) {
              if (!PreferenceUtils.getBool(PreferenceKeys.IS_CHATTING)) {
                _navigateToItemDetail(
                  message['aps']['alert']['title'] ?? 'title',
                  message['aps']['alert']['body'] ?? 'body',
                  context,
                  appoitmentId: int.parse(message['roomname'].split('-')[1]),
                  doctorname: message['doctorname'] ?? 'doctorname',
                  username: message['username'] ?? 'username',
                  userpic: message['userpic'] ?? '',
                  isChat: true,
                );
              }
            }
          }

          if (Platform.isAndroid) {
            if (message['data']['alert_type'].toString().toLowerCase() ==
                Strings.videocall.toLowerCase()) {
              showMessageDialog(
                  body: message['notification']['body'],
                  title: message['notification']['title'],
                  url: message['data']['meeting_link'],
                  doctorImage: message['data']['doctor_image_url'],
                  doctorName: message['data']['doctor_name']);
            } else if (message['data']['alert_type'].toString().toLowerCase() ==
                Strings.chat.toLowerCase()) {
              if (!PreferenceUtils.getBool(PreferenceKeys.IS_CHATTING)) {
                _navigateToItemDetail(
                  message['notification']['title'],
                  message['notification']['body'],
                  context,
                  appoitmentId:
                      int.parse(message['data']['roomname'].split('-')[1]),
                  doctorname: message['data']['doctorname'],
                  username: message['data']['username'],
                  userpic: message['data']['userpic'] ?? '',
                  isChat: true,
                );
              }
            }
          }
        } catch (e) {}
      },
      onResume: (Map<String, dynamic> message) async {
        try {
          if (Platform.isIOS) {
            if (message['alert_type'].toString().toLowerCase() ==
                Strings.videocall.toLowerCase()) {
              showMessageDialog(
                  body: message['aps']['alert']['body'],
                  title: message['aps']['alert']['title'],
                  url: message['meeting_link'],
                  doctorImage: message['doctor_image_url'],
                  doctorName: message['doctor_name']);
            } else if (message['alert_type'].toString().toLowerCase() ==
                Strings.chat.toLowerCase()) {
              if (!PreferenceUtils.getBool(PreferenceKeys.IS_CHATTING)) {
                _navigateToItemDetail(
                  message['aps']['alert']['title'] ?? 'title',
                  message['aps']['alert']['body'] ?? 'body',
                  context,
                  appoitmentId: int.parse(message['roomname'].split('-')[1]),
                  doctorname: message['doctorname'] ?? 'doctorname',
                  username: message['username'] ?? 'username',
                  userpic: message['userpic'] ?? '',
                  isChat: true,
                );
              }
            }
          }

          if (Platform.isAndroid) {
            if (message['data']['alert_type'].toString().toLowerCase() ==
                Strings.videocall.toLowerCase()) {
              showMessageDialog(
                  body: message['notification']['body'],
                  title: message['notification']['title'],
                  url: message['data']['meeting_link'],
                  doctorImage: message['data']['doctor_image_url'],
                  doctorName: message['data']['doctor_name']);
            } else if (message['data']['alert_type'].toString().toLowerCase() ==
                Strings.chat.toLowerCase()) {
              if (!PreferenceUtils.getBool(PreferenceKeys.IS_CHATTING)) {
                _navigateToItemDetail(
                  message['notification']['title'],
                  message['notification']['body'],
                  context,
                  appoitmentId:
                      int.parse(message['data']['roomname'].split('-')[1]),
                  doctorname: message['data']['doctorname'],
                  username: message['data']['username'],
                  userpic: message['data']['userpic'] ?? '',
                  isChat: true,
                );
              }
            }
          }
        } catch (e) {}
      },
    );
  }

  void _navigateToItemDetail(String title, String message, BuildContext context,
      {bool isChat,
      String username,
      int appoitmentId,
      String userpic,
      String doctorname}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          title,
        ),
        content: Text(message),
        actions: [
          RaisedButton(
            color: Colors.red,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Dismiss'),
          ),
          RaisedButton(
            color: Colors.green,
            onPressed: () async {
              Navigator.pop(context);

              if (isChat) {
                await PreferenceUtils.putBool(PreferenceKeys.IS_CHATTING, true);
                Provider.of<ChatProvider>(context, listen: false)
                    .appointmentId = appoitmentId;
                Provider.of<ChatProvider>(context, listen: false).username =
                    username;

                Provider.of<ChatProvider>(context, listen: false)
                    .otherUsername = doctorname;

                Provider.of<ChatProvider>(context, listen: false).pic =
                    userpic ?? '';
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChatDetail()));
              } else {
                CommonWidgets()
                    .navigateTO(context, pageName: PatietnNotification());
              }
            },
            child: Text('View'),
          )
        ],
      ),
    );
  }

  Future onselectNotification(String payload) {
    return _showItemDialog(payload);
  }

  Future _showItemDialog(String message) {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(
          'Notification',
        ),
        content: Text(message),
        actions: [
          RaisedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Ok'),
          )
        ],
      ),
    );
  }

  void showMessageDialog(
      {String title,
      String body,
      String url,
      String doctorImage,
      String doctorName}) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(body),
        actions: [
          RaisedButton(
              color: CustomColors.green,
              child: Text('Accept'),
              onPressed: () {
                Navigator.pop(context);
                PreferenceUtils.putBool(PreferenceKeys.IS_CALLING, true);
                VideoCallProvider().videoCallPage(
                    doctorImage: doctorImage,
                    doctorName: doctorName,
                    link: url);
              }),
          RaisedButton(
              color: CustomColors.red,
              child: Text('Dismiss'),
              onPressed: () {
                Navigator.pop(context);
              })
        ],
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
        if (currentTime.difference(savedtime).inMinutes > logoutTime) {
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

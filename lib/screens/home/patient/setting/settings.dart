import 'package:package_info/package_info.dart';
import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/screens/home/patient/patientBottom_provider.dart';
import 'package:virtudoc_app/utils/screen_tracker/screen_tracker.dart';
/*
The file is covered under Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. Please review the license for full details.

This program is not free software: You cannot redistribute it for any use under the terms of the Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. However the source can be modified and updated for the working of the application Design & Development of Mobile Application for “Abyssinia Technology Group” for which it was licensed.
*/

class Settings extends StatefulWidget {
  Settings({Key key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String appVersion = '';
  String appName = 'VirtuDoc';

  @override
  void initState() {
    super.initState();
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      appVersion = packageInfo.version;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.bg_app,
      body: _buildWidget(context),
    );
  }

  _buildWidget(BuildContext context) {
    return Column(
      children: <Widget>[
        CustomTopBar(
          context: context,
          custonBackButton: false,
          titleText: Strings.settings,
        ),
        SettingsButton(
            text: Strings.changePassword,
            onpressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangePassword(),
                  ));
            }),
        SettingsButton(
            text: Strings.notificationSetting,
            onpressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotificationSetting(),
                  ));
            }),
        SettingsButton(
            text: Strings.privacyPolicy,
            onpressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PrivacyPolicy()));
            }),
        SettingsButton(
            text: Strings.termsCondition,
            onpressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TermsCondition(),
                  ));
            }),
        SettingsButton(
            text: Strings.logOut,
            onpressed: () {
              CommonWidgets.showCustomDialog(
                context,
                Strings.logOut,
                Strings.logoutText,
                iconData: Icons.exit_to_app,
                onYes: () async {
                  await screenTracker.clearToken(context);
                  PreferenceUtils.clear();
                  Provider
                      .of<PatientBottomProvider>(context, listen: false)
                      .selectedIndex = 0;
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => WelcomeScreen()),
                          (route) => false);
                },
              );
            },
            showArrow: false),
        Spacer(),
        Text(
          '$appName v$appVersion',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.blue, fontSize: 12),
        ),
        SizedBox(height: 20)
      ],
    );
  }
}

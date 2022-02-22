import 'package:url_launcher/url_launcher.dart';
import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/screens/home/patient/help/faqs.dart';
import 'package:virtudoc_app/screens/home/patient/help/help.dart';
import 'package:virtudoc_app/screens/home/patient/invite/invite-a-friend.dart';
/*
The file is covered under Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. Please review the license for full details.

This program is not free software: You cannot redistribute it for any use under the terms of the Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. However the source can be modified and updated for the working of the application Design & Development of Mobile Application for “Abyssinia Technology Group” for which it was licensed.
*/

class ProfilePatient extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfilePatientState();
}

class _ProfilePatientState extends State<ProfilePatient> {
  var isPatientEnable = false;
  var isDoctorEnable = false;

  @override
  void initState() {
    super.initState();
  }

  AppBar appBar = AppBar(
    title: AutoSizeText(Strings.appName),
  );

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: CustomColors.blue, //or set color with: Color(0xFF0000FF)
    ));
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.bg_app,
        body: SingleChildScrollView(
          child: _buildWidget(context),
        ),
      ),
    );
  }

  _buildWidget(BuildContext context) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    return Consumer<UserProvider>(builder: (context, provider, child) {
      return Stack(
        children: [
          Column(
            children: <Widget>[
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  userDetails(screenHeight, screenWidth, provider),
                  topBar(context),
                ],
              ),
              SettingsButton(
                  text: Strings.edit_profile,
                  onpressed: () {
                    CommonWidgets().navigateTO(context,
                        pageName: EditProfile(
                          biometrics: provider.biometrics,
                          email: provider.email,
                          firstname: provider.firstname,
                          lastname: provider.lastname,
                        ));
                  }),
              SettingsButton(
                  text: Strings.history,
                  onpressed: () {
                    CommonWidgets()
                        .navigateTO(context, pageName: PatientPrescription());
                  }),
              SettingsButton(
                  text: Strings.invitefriend,
                  onpressed: () {
                    CommonWidgets()
                        .navigateTO(context, pageName: InviteAFriend());
                  }),
              SettingsButton(
                  text: Strings.help,
                  onpressed: () async {
                    var url = Strings.helpUrl;
                    {
                      if (await canLaunch(url)) {
                        await launch(
                          url,
                          forceSafariVC: false,
                          forceWebView: false,
                        );
                      } else {
                        throw 'Could not launch $url';
                      }
                    }
                  }),
              SettingsButton(
                  text: Strings.faqs,
                  onpressed: () {
                    CommonWidgets().navigateTO(context, pageName: Faqs());
                  }),
            ],
          ),
          if (provider.isLoading) CommonWidgets.showLoader(context)
        ],
      );
    });
  }

  Positioned topBar(BuildContext context) {
    return Positioned(
      child: CustomTopBar(
        context: context,
        titleText: Strings.profile,
        custonBackButton: false,
      ),
    );
  }

  Positioned userDetails(double screenHeight, double screenWidth,
      UserProvider provider) {
    return Positioned(
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
        alignment: Alignment.bottomCenter,
        height: screenHeight * .35,
        width: screenWidth * .95,
        decoration: BoxDecoration(
            color: CustomColors.white,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Container(
          height: screenHeight * .16,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CommonWidgets.userImgeLoader(
                  imageUrl: provider?.biometrics?.profileImage),
              // Spacer(),
              Container(
                margin: EdgeInsets.only(
                    left: screenWidth * .05, top: screenHeight * .05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      '${provider?.firstname ?? "N.A."} ${provider?.lastname ??
                          "N.A."}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontWeight: FontStyles.semiBoldFontWeight400,
                        fontFamily: FontStyles.fontFamly,
                        package: FontStyles.package,
                        color: CustomColors.black1,
                        fontStyle: FontStyle.normal,
                      ),
                      presetFontSizes: [19, 18, 17],
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    AutoSizeText(
                      provider?.email ?? "N.A.",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontWeight: FontStyles.regularFontWeight300,
                        fontFamily: FontStyles.fontFamly,
                        package: FontStyles.package,
                        color: CustomColors.grey2,
                        fontStyle: FontStyle.normal,
                      ),
                      presetFontSizes: [18, 16, 14],
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    AutoSizeText.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Profile: ',
                            style: TextStyle(
                              fontWeight: FontStyles.regularFontWeight300,
                              fontFamily: FontStyles.fontFamly,
                              package: FontStyles.package,
                              color: CustomColors.grey2,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          TextSpan(
                            text: provider?.completeness == null
                                ? "N.A."
                                : "${provider?.completeness}% Complete",
                            style: TextStyle(
                              fontWeight: FontStyles.semiBoldFontWeight500,
                              fontFamily: FontStyles.fontFamly,
                              package: FontStyles.package,
                              color: CustomColors.yellow1,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

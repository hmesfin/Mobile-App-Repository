import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:virtudoc_app/custom-widgets/custom-text.dart';
import 'package:virtudoc_app/custom-widgets/custom-top-bar.dart';
import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/screens/home/doctor/enrollment-details-update/enrollment-provider-update.dart';
import 'package:virtudoc_app/screens/home/doctor/enrollment-details-update/enrollment_part1_update.dart';
import 'package:virtudoc_app/screens/home/doctor/enrollment-details-update/enrollment_part2_update.dart';
import 'package:virtudoc_app/screens/home/doctor/enrollment-details-update/enrollment_part3_update.dart';
import 'package:virtudoc_app/screens/home/doctor/enrollment-details-update/speciality_screen-update.dart';
import 'package:virtudoc_app/utils/common-widgets.dart';
import 'package:virtudoc_app/utils/custom-colors.dart';
import 'package:virtudoc_app/utils/strings.dart';
import 'package:virtudoc_app/utils/styles.dart';
/*
The file is covered under Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. Please review the license for full details.

This program is not free software: You cannot redistribute it for any use under the terms of the Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. However the source can be modified and updated for the working of the application Design & Development of Mobile Application for “Abyssinia Technology Group” for which it was licensed.
*/

class EnrollmentDetailUpdate extends StatefulWidget {
  final bool isSignUp;
  int completeStep;

  EnrollmentDetailUpdate({Key key, this.completeStep, this.isSignUp = false})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _EnrollmentDetailUpdateState();
}

class _EnrollmentDetailUpdateState extends State<EnrollmentDetailUpdate> {
  bool isDobFocused = false;
  bool isGenderFocused = false;
  bool isHeightFocused = false;
  bool isWeightFocused = false;
  String dropdownValue = "Male";
  bool isPasswordFocused = false;
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  //int currentStep = ;
  bool complete = false;
  List<Step> steps;
  double screenwidth = 0;
  double screenheight = 0;
  List<Widget> enrollmentPage = [];
  String errorMessage = Strings.noInternet;

  Future<Response> getUser() async {
    try {
      var res = await ApiRequest.getApi(ApiUrl.getUser);
      return res;
    } on HandshakeException {
      errorMessage = Strings.contactAdmin;
      return null;
    } on SocketException {
      errorMessage = Strings.noInternet;
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      PreferenceUtils.putInt(PreferenceKeys.INDICATOR, widget.completeStep);
      int indexing = PreferenceUtils.getInt(PreferenceKeys.INDICATOR);
      Provider.of<EnrollmentProviderUpdate>(context, listen: false)
          .setIndex(indexing == 0
          ? 0
          : indexing == 1
          ? 1
          : 3);
    });
    enrollmentPage = [
      EnrollMent1Update(isSignUp: widget.isSignUp, scaffoldKey: _scaffoldKey),
      SpecialityScreenUpdate(scaffoldKey: _scaffoldKey),
      EnrollMent2Update(scaffoldKey: _scaffoldKey),
      EnrollMent3Update(scaffoldKey: _scaffoldKey),
    ];
  }

  AppBar appBar = AppBar(
    title: Text(Strings.appName),
  );

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: CustomColors.blue, //or set color with: Color(0xFF0000FF)
    ));
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: CustomColors.bg_app,
        body: _buildWidget(context),
      ),
    );
  }

  _buildWidget(BuildContext context) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    return Container(
      width: screenWidth,
      decoration: BoxDecoration(
        color: CustomColors.bg_app,
      ),
      child:
      Consumer<EnrollmentProviderUpdate>(builder: (context, value, child) {
        if (value.isLoading) {
          return Center(child: CircularProgressIndicator());
        } else
          return ModalProgressHUD(
            inAsyncCall: value.isSavePressed,
            opacity: 0.3,
            child: Column(
              children: <Widget>[
                CustomTopBar(
                  context: context,
                  titleText: Strings.enrollment_details,
                  custonBackButton: false,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      indicatorCircle(
                          indicator: 1,
                          currentIndex: value.index,
                          provider: value),
                      topBar(
                        context,
                        indicator: 2,
                        currentIndex: value.index,
                      ),
                      indicatorCircle(
                          indicator: 2,
                          currentIndex: value.index,
                          provider: value),
                      topBar(
                        context,
                        indicator: 3,
                        currentIndex: value.index,
                      ),
                      indicatorCircle(
                          indicator: 3,
                          currentIndex: value.index,
                          provider: value),
                      topBar(
                        context,
                        indicator: 4,
                        currentIndex: value.index,
                      ),
                      indicatorCircle(
                          indicator: 4,
                          currentIndex: value.index,
                          provider: value),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    controller: Provider
                        .of<EnrollmentProviderUpdate>(context,
                        listen: false)
                        .scrollController,
                    physics: BouncingScrollPhysics(),
                    child: enrollmentPage[value.index],
                  ),
                ),
              ],
            ),
          );
      }),
      // ),
    );
  }

  Widget indicatorCircle({
    int indicator,
    int currentIndex,
    EnrollmentProviderUpdate provider,
  }) {
    Color textColor = CustomColors.black1;
    Color containerColor = CustomColors.grey1;
    return GestureDetector(
      onTap: () {
        if (indicator == 1) {
          provider.setIndex(indicator - 1);
        } else if (indicator == 2) {
          if (Provider
              .of<UserProvider>(context, listen: false)
              .firstname !=
              '') {
            provider.setIndex(indicator - 1);
          }
        } else if (indicator == 3) {
          if (Provider
              .of<UserProvider>(context, listen: false)
              .enrollmentInformation
              .speciality
              .length !=
              0 &&
              Provider
                  .of<UserProvider>(context, listen: false)
                  .firstname !=
                  '') {
            provider.setIndex(indicator - 1);
          }
        } else if (indicator == 4) {
          if (Provider
              .of<UserProvider>(context,
              listen: false)
              .enrollmentInformation
              .dlIssuingCountry !=
              '' &&
              Provider
                  .of<UserProvider>(context, listen: false)
                  .enrollmentInformation
                  .speciality
                  .length !=
                  0 &&
              Provider
                  .of<UserProvider>(context, listen: false)
                  .firstname !=
                  '') {
            provider.setIndex(indicator - 1);
          }
        }
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: decoration(currentIndex, indicator, containerColor),
        child: indicatorText(indicator, currentIndex, textColor),
      ),
    );
  }

  BoxDecoration decoration(int currentIndex, int indicator,
      Color containerColor) {
    return BoxDecoration(
      color: currentIndex == indicator - 1 || indicator - 1 < currentIndex
          ? CustomColors.blue
          : containerColor,
      border: Border.all(
        color: Colors.white,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(20),
    );
  }

  Center indicatorText(int indicator, int currentIndex, Color textColor) {
    return Center(
      child: CustomText(
        text: "$indicator",
        color: currentIndex == indicator - 1 || indicator - 1 < currentIndex
            ? CustomColors.white
            : textColor,
        fontSize: FontStyles.normal,
      ),
    );
  }

  Container topBar(BuildContext context, {
    int indicator,
    int currentIndex,
  }) {
    return Container(
      width: CommonWidgets().getWidth(context) * 0.2,
      height: 6,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(2.5)),
          color: currentIndex == indicator - 1 || indicator - 1 < currentIndex
              ? CustomColors.blue
              : CustomColors.grey1),
    );
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:virtudoc_app/custom-widgets/custom-top-bar.dart';
import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/screens/phone-verification/phone-verification.dart';
import 'package:virtudoc_app/utils/common-widgets.dart';
import 'package:virtudoc_app/utils/custom-colors.dart';
import 'package:virtudoc_app/utils/preference_utils.dart';
import 'package:virtudoc_app/utils/strings.dart';
import 'package:flutter/scheduler.dart';
/*
The file is covered under Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. Please review the license for full details.

This program is not free software: You cannot redistribute it for any use under the terms of the Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. However the source can be modified and updated for the working of the application Design & Development of Mobile Application for “Abyssinia Technology Group” for which it was licensed.
*/

class ChooseRoleScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChooseRoleScreenState();
}

class _ChooseRoleScreenState extends State<ChooseRoleScreen> {
  var isPatientEnable = false;
  var isDoctorEnable = false;

  bool isLoading = false;
  var value = false;
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      value = await CommonWidgets.isCurrentRouteFirst(context);
      setState(() {});
    });

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: CustomColors.blue, //or set color with: Color(0xFF0000FF)
    ));
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.bg_app,
        body: _buildWidget(context),
      ),
    );
  }

  double appbarheight = appBar.preferredSize.height;

  _buildWidget(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height - appbarheight;
    return Container(
      height: screenHeight,
      width: screenWidth,
      decoration: BoxDecoration(
        color: CustomColors.bg_app,
      ),
      child: Stack(
        children: [
          Column(
            children: <Widget>[
              // Header
              CustomTopBar(
                context: context,
                titleText: Strings.choose_role,
                custonBackButton: value ? false : true,
              ),

              Padding(
                padding: EdgeInsets.only(top: 24),
                child: AutoSizeText(
                  Strings.register_as,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    // color: CustomColors.grey2,
                    fontWeight: FontStyles.semiBoldFontWeight400,
                    fontFamily: FontStyles.fontFamly,
                    package: FontStyles.package,
                    color: CustomColors.black1,
                    fontStyle: FontStyle.normal,
                  ),
                  presetFontSizes: [18, 16, 14],
                  textAlign: TextAlign.center,
                ),
              ),

              // Rounded Rectangle 4
              InkWell(
                onTap: () async {
                  isLoading = true;
                  setState(() {
                    isPatientEnable = !isPatientEnable;
                    if (isDoctorEnable) {
                      isDoctorEnable = !isDoctorEnable;
                    }
                  });
                  if (PreferenceUtils.getBool(PreferenceKeys.IS_SOCIAL_LOGIN)) {
                    Map data = {'role': Strings.patient.toUpperCase()};
                    var result = await ApiRequest.postApi(ApiUrl.setRole, data);
                    Map decoded = jsonDecode(result.body);

                    PreferenceUtils.putString(
                        PreferenceKeys.TOKEN, decoded['body']['data']['token']);
                    PreferenceUtils.putString(
                        PreferenceKeys.ROLE, decoded['body']['data']['role']);
                  }
                  isLoading = false;
                  setState(() {});
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            PhoneVerification(Strings.patient)),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 28),
                  child: Container(
                    width: screenWidth / 1.55,
                    height: screenHeight / 8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        boxShadow: [
                          BoxShadow(
                              color: CustomColors.grey1,
                              offset: Offset(1.8369701987210297e-16, 3),
                              blurRadius: 7,
                              spreadRadius: 0)
                        ],
                        color: CustomColors.white),
                    child: Row(
                      children: <Widget>[
                        // Ellipse 2
                        Container(
                          width: screenHeight / 8,
                          height: screenHeight / 8,
                          decoration: isPatientEnable
                              ? BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: CustomColors.yellow1)
                              : BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                        color: CustomColors.grey1,
                                        offset:
                                            Offset(1.8369701987210297e-16, 3),
                                        blurRadius: 7,
                                        spreadRadius: 0)
                                  ],
                                  color: CustomColors.white),
                          child: Image.asset("assets/images/ic_patient.png",
                              color: isPatientEnable
                                  ? CustomColors.white
                                  : CustomColors.grey2),
                        ),
                        // Patient
                        Padding(
                            padding: EdgeInsets.only(left: screenWidth / 8),
                            child: isPatientEnable
                                ? AutoSizeText(
                                    Strings.patient,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                      // color: CustomColors.grey2,
                                      fontWeight:
                                          FontStyles.semiBoldFontWeight400,
                                      fontFamily: FontStyles.fontFamly,
                                      package: FontStyles.package,
                                      color: CustomColors.yellow1,
                                      fontStyle: FontStyle.normal,
                                    ),
                                    presetFontSizes: [18, 16, 14],
                                    textAlign: TextAlign.center,
                                  )
                                : AutoSizeText(
                                    Strings.patient,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                      // color: CustomColors.grey2,
                                      fontWeight:
                                          FontStyles.semiBoldFontWeight400,
                                      fontFamily: FontStyles.fontFamly,
                                      package: FontStyles.package,
                                      color: CustomColors.grey2,
                                      fontStyle: FontStyle.normal,
                                    ),
                                    presetFontSizes: [18, 16, 14],
                                    textAlign: TextAlign.center,
                                  ))
                      ],
                    ),
                  ),
                ),
              ),

              InkWell(
                onTap: () async {
                  isLoading = true;
                  setState(() {
                    isDoctorEnable = !isDoctorEnable;
                    if (isPatientEnable) {
                      isPatientEnable = !isPatientEnable;
                    }
                  });
                  if (PreferenceUtils.getBool(PreferenceKeys.IS_SOCIAL_LOGIN)) {
                    Map data = {'role': Strings.doctor.toUpperCase()};
                    var result = await ApiRequest.postApi(ApiUrl.setRole, data);
                    Map decoded = jsonDecode(result.body);
                    isLoading = false;
                    PreferenceUtils.putString(
                        PreferenceKeys.TOKEN, decoded['body']['data']['token']);
                    PreferenceUtils.putString(
                        PreferenceKeys.ROLE, decoded['body']['data']['role']);
                  }
                  isLoading = false;
                  setState(() {});
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            PhoneVerification(Strings.doctor)),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Container(
                    width: screenWidth / 1.55,
                    height: screenHeight / 8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        boxShadow: [
                          BoxShadow(
                              color: CustomColors.grey1,
                              offset: Offset(1.8369701987210297e-16, 3),
                              blurRadius: 7,
                              spreadRadius: 0)
                        ],
                        color: CustomColors.white),
                    child: Row(
                      children: <Widget>[
                        // Ellipse 2
                        Container(
                          width: screenHeight / 8,
                          height: screenHeight / 8,
                          decoration: isDoctorEnable
                              ? BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: CustomColors.yellow1)
                              : BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                        color: CustomColors.grey1,
                                        offset:
                                            Offset(1.8369701987210297e-16, 3),
                                        blurRadius: 7,
                                        spreadRadius: 0)
                                  ],
                                  color: CustomColors.white),
                          child: Image.asset("assets/images/ic_doctor.png",
                              color: isDoctorEnable
                                  ? CustomColors.white
                                  : CustomColors.grey2),
                        ),
                        // Patient
                        Padding(
                            padding: EdgeInsets.only(left: screenWidth / 8),
                            child: isDoctorEnable
                                ? AutoSizeText(
                                    Strings.doctor,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                      // color: CustomColors.grey2,
                                      fontWeight:
                                          FontStyles.semiBoldFontWeight400,
                                      fontFamily: FontStyles.fontFamly,
                                      package: FontStyles.package,
                                      color: CustomColors.yellow1,
                                      fontStyle: FontStyle.normal,
                                    ),
                                    presetFontSizes: [18, 16, 14],
                                    textAlign: TextAlign.center,
                                  )
                                : AutoSizeText(
                                    Strings.doctor,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                      // color: CustomColors.grey2,
                                      fontWeight:
                                          FontStyles.semiBoldFontWeight400,
                                      fontFamily: FontStyles.fontFamly,
                                      package: FontStyles.package,
                                      color: CustomColors.grey2,
                                      fontStyle: FontStyle.normal,
                                    ),
                                    presetFontSizes: [18, 16, 14],
                                    textAlign: TextAlign.center,
                                  ))
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: CommonWidgets().getHeight(context) * 0.3,
              ),

              // Already have an account?

              AutoSizeText(
                Strings.have_account,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  // color: CustomColors.grey2,
                  fontWeight: FontStyles.semiBoldFontWeight400,
                  fontFamily: FontStyles.fontFamly,
                  package: FontStyles.package,
                  color: CustomColors.grey2,
                  fontStyle: FontStyle.normal,
                ),
                presetFontSizes: [18, 16, 14],
                textAlign: TextAlign.center,
              ),

              Padding(
                padding: EdgeInsets.only(top: 6, bottom: 15),
                child: InkWell(
                  onTap: () {
                    CommonWidgets().navigateBack(context);
                  },
                  child: AutoSizeText(
                    Strings.login_now,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontWeight: FontStyles.semiBoldFontWeight500,
                      fontFamily: FontStyles.fontFamly,
                      package: FontStyles.package,
                      color: CustomColors.blue2,
                      fontStyle: FontStyle.normal,
                    ),
                    presetFontSizes: [18, 16, 14],
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
          if (isLoading) CommonWidgets.showLoader(context),
        ],
      ),
    );
  }
}

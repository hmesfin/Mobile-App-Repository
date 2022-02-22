import 'dart:convert';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:virtudoc_app/apimanager/api_request.dart';
import 'package:virtudoc_app/apimanager/api_url.dart';
import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/screens/choose-role/choose-role-screen.dart';
import 'package:virtudoc_app/screens/forget-password/forget-password.dart';
import 'package:virtudoc_app/screens/home/doctor/bottom-navbar.dart';
import 'package:virtudoc_app/screens/home/doctor/enrollment-details-update/enrollment-detail-update.dart';
import 'package:virtudoc_app/screens/home/patient/patient-bottom-navbar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/scheduler.dart';
import 'package:virtudoc_app/screens/login/login_otp.dart';
/*
The file is covered under Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. Please review the license for full details.

This program is not free software: You cannot redistribute it for any use under the terms of the Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. However the source can be modified and updated for the working of the application Design & Development of Mobile Application for “Abyssinia Technology Group” for which it was licensed.
*/

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _value = false;
  bool _showPassword = false;
  bool isPasswordFocused = false;
  bool isPhoneFocused = true;
  String dropdownValue = "+251";
  int role = 0;

  var _phoneController = TextEditingController();
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  var _passwordController = TextEditingController();
  var value = false;

  Country selectedCountry =
      Country(isoCode: 'ET', phoneCode: '251', name: 'Ethiopia');
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      value = await CommonWidgets.isCurrentRouteFirst(context);
      setState(() {});
    });
    setState(() {});
  }

  AppBar appBar = AppBar(
    title: Text(Strings.appName),
  );
  var _saving = false;
  // Map _source = {ConnectivityResult.none: false};
  // MyConnectivity _connectivity = MyConnectivity.instance;
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
    double appbarheight = appBar.preferredSize.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Container(
        height: screenHeight + appbarheight,
        width: screenWidth,
        decoration: BoxDecoration(
          color: CustomColors.bg_app,
        ),
        child: ModalProgressHUD(
          inAsyncCall: _saving,
          opacity: 0.3,
          child: Column(
            children: <Widget>[
              // Header
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Container(
                  width: screenWidth,
                  height: 120,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/bg_header.png"),
                        fit: BoxFit.fill),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      value
                          ? SizedBox()
                          : Padding(
                              padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                              child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Image.asset(
                                          "assets/images/ic_back.png"),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                          child: Text(Strings.login,
                              style: const TextStyle(
                                  color: const Color(0xffffffff),
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Roboto",
                                  package: 'assets/fonts/Roboto-Regular',
                                  fontStyle: FontStyle.normal,
                                  fontSize: FontStyles.size22),
                              textAlign: TextAlign.left),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth / 8,
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 24, bottom: 27),
                child: Text(Strings.login_to_access,
                    style: const TextStyle(
                        color: CustomColors.black1,
                        fontWeight: FontStyles.semiBoldFontWeight500,
                        fontFamily: "Roboto",
                        package: 'assets/fonts/Roboto-Regular',
                        fontStyle: FontStyle.normal,
                        fontSize: FontStyles.large),
                    textAlign: TextAlign.center),
              ),

              // Rounded Rectangle 1
              Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: FractionallySizedBox(
                    widthFactor: 0.85,
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          border:
                              Border.all(color: CustomColors.grey3, width: 1),
                          color: CustomColors.white),
                      child: Container(
                        child: Padding(
                            padding: EdgeInsets.only(left: 15, right: 15),
                            child: Row(
                              children: <Widget>[
                                ImageIcon(
                                  AssetImage("assets/images/ic_phone.png"),
                                  color: CustomColors.grey2,
                                ),
                                Container(
                                  width: 9,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _openCountryPickerDialog();
                                  },
                                  child: Row(
                                    children: [
                                      CountryPickerUtils.getDefaultFlagImage(
                                          selectedCountry),
                                      SizedBox(width: 5),
                                      Text(
                                        '+${selectedCountry.phoneCode}',
                                        textAlign: TextAlign.end,
                                      ),
                                    ],
                                  ),
                                ),
                                ImageIcon(
                                  AssetImage(
                                      "assets/images/bg_vertical_bar.png"),
                                  color: CustomColors.grey2,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: 5,
                                      right: 5,
                                    ),
                                    child: Focus(
                                      onFocusChange: (hasFocus) {
                                        setState(() {
                                          // isPhoneFocused = hasFocus;
                                        });
                                      },
                                      child: TextFormField(
                                        controller: _phoneController,
                                        textInputAction: TextInputAction.next,
                                        keyboardType: TextInputType.number,
                                        onFieldSubmitted: (term) {},
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp('^[1-9][0-9]*\$')),
                                        ],
                                        decoration: InputDecoration(
                                          hintText: '9898545663',
                                          border: InputBorder.none,
                                        ),
                                        maxLines: 1,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )),
                      ),
                    ),
                  )),

              // Rounded Rectangle 1
              Padding(
                  padding: EdgeInsets.only(bottom: 19),
                  child: FractionallySizedBox(
                    widthFactor: 0.85,
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          border:
                              Border.all(color: CustomColors.grey3, width: 1),
                          color: CustomColors.white),
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.only(left: 5, right: 5, top: 2),
                          child: Focus(
                            onFocusChange: (hasFocus) {
                              setState(() {});
                            },
                            child: TextFormField(
                              obscureText: !this._showPassword,
                              controller: _passwordController,
                              decoration: InputDecoration(
                                hintText: Strings.password,
                                prefixIcon: ImageIcon(
                                  AssetImage("assets/images/ic_password.png"),
                                  color: CustomColors.grey2,
                                ),
                                suffixIcon: IconButton(
                                  icon: ImageIcon(
                                    AssetImage(this._showPassword
                                        ? "assets/images/ic_password_show.png"
                                        : "assets/images/ic_password_hide.png"),
                                    color: CustomColors.grey2,
                                  ),
                                  onPressed: () {
                                    setState(() => this._showPassword =
                                        !this._showPassword);
                                  },
                                ),
                                border: InputBorder.none,
//                            focusedBorder: OutlineInputBorder(
//                              borderSide: BorderSide(color: CustomColors.blue3),
//                              borderRadius: BorderRadius.circular(25),
//                            ),
                              ),
                              maxLines: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )),

              Padding(
                padding: EdgeInsets.only(bottom: 0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgotPassword()),
                    );
                  },
                  child:

                      // Forgot Password?
                      Text(Strings.forgot_password,
                          style: const TextStyle(
                            color: CustomColors.blue3,
                            fontWeight: FontStyles.semiBoldFontWeight500,
                            fontFamily: "Roboto",
                            package: 'assets/fonts/Roboto-Regular',
                            fontStyle: FontStyle.normal,
                            fontSize: FontStyles.normal,
                          ),
                          textAlign: TextAlign.center),
                ),
              ),

              Container(
                margin: EdgeInsets.only(
                    top: screenHeight * 0.04,
                    left: screenWidth * .12,
                    right: screenWidth * .12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Checkbox(
                      value: _value,
                      activeColor: CustomColors.blue3,
                      onChanged: (bool newValue) {
                        setState(() {
                          _value = newValue;
                        });
                      },
                    ),

                    // I agree to the Terms and Conditions.
                    Expanded(
                      child: Container(
                        width: screenWidth * 0.8,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: 5, right: 5),
                        // height: screenHeight * 0.1,
                        child: RichText(
                            // maxLines: 2,
                            text: TextSpan(children: [
                          TextSpan(
                              style: const TextStyle(
                                color: CustomColors.black2,
                                fontWeight: FontStyles.semiBoldFontWeight500,
                                fontFamily: "Roboto",
                                package: 'assets/fonts/Roboto-Regular',
                                fontStyle: FontStyle.normal,
                                fontSize: FontStyles.normal,
                              ),
                              text: Strings.i_agree),
                          TextSpan(
                              style: const TextStyle(
                                decoration: TextDecoration.underline,
                                color: CustomColors.yellow1,
                                fontWeight: FontStyles.semiBoldFontWeight500,
                                fontFamily: "Roboto",
                                package: 'assets/fonts/Roboto-Regular',
                                fontStyle: FontStyle.normal,
                                fontSize: FontStyles.normal,
                              ),
                              recognizer: new TapGestureRecognizer()
                                ..onTap = () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => TermsCondition(),
                                    )),
                              text: Strings.terms_n_conditions),
                          TextSpan(
                              style: const TextStyle(
                                color: CustomColors.black2,
                                fontWeight: FontStyles.semiBoldFontWeight500,
                                fontFamily: "Roboto",
                                package: 'assets/fonts/Roboto-Regular',
                                fontStyle: FontStyle.normal,
                                fontSize: FontStyles.normal,
                              ),
                              text: " and "),
                          TextSpan(
                              style: const TextStyle(
                                color: CustomColors.yellow1,
                                decoration: TextDecoration.underline,
                                fontWeight: FontStyles.semiBoldFontWeight500,
                                fontFamily: "Roboto",
                                package: 'assets/fonts/Roboto-Regular',
                                fontStyle: FontStyle.normal,
                                fontSize: FontStyles.normal,
                              ),
                              recognizer: new TapGestureRecognizer()
                                ..onTap = () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PrivacyPolicy())),
                              text: "${Strings.privacyPolicy}"),
                          TextSpan(
                              style: const TextStyle(
                                color: CustomColors.black2,
                                fontWeight: FontStyles.semiBoldFontWeight500,
                                fontFamily: "Roboto",
                                package: 'assets/fonts/Roboto-Regular',
                                fontStyle: FontStyle.normal,
                                fontSize: FontStyles.normal,
                              ),
                              text: ".")
                        ])),
                      ),
                    )
                  ],
                ),
              ),
              // Rounded Rectangle 4
              Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: SizedBox(
                    width: 200,
                    height: 48,
                    child: RaisedButton(
                      child: // CONTINUE
                          Text(Strings.login.toUpperCase(),
                              style: const TextStyle(
                                color: CustomColors.white,
                                fontWeight: FontStyles.semiBoldFontWeight500,
                                fontFamily: "Roboto",
                                package: 'assets/fonts/Roboto-Medium',
                                fontStyle: FontStyle.normal,
                                fontSize: FontStyles.medium,
                              ),
                              textAlign: TextAlign.center),
                      onPressed: () async {
                        FocusScope.of(context).unfocus();
                        if (_phoneController.text.isEmpty) {
                          CommonWidgets.showToast(
                              context, Strings.enterPhone, _scaffoldKey);
                        } else if (_passwordController.text.isEmpty ||
                            _passwordController.text.length < 8) {
                          CommonWidgets.showToast(
                              context, Strings.enterPassword, _scaffoldKey);
                        } else if (!_value) {
                          CommonWidgets.showToast(
                              context,
                              'Please agree to the terms and conditions',
                              _scaffoldKey);
                        } else {
                          try {
                            setState(() {
                              _saving = true;
                            });
                            final result =
                                await InternetAddress.lookup('google.com');
                            if (result.isNotEmpty &&
                                result[0].rawAddress.isNotEmpty) {}

                            Map<String, dynamic> data = {
                              "country_code": dropdownValue.toString(),
                              "username": _phoneController.text.toString(),
                              "password": _passwordController.text.toString(),
                            };

                            var res =
                                await ApiRequest.postApi(ApiUrl.login, data);

                            Map resBody = await json.decode(res.body);

                            if (resBody['success'] == false) {
                              PreferenceUtils.putBool(
                                  PreferenceKeys.PHONE_VERIFICATION, true);

                              setState(() {
                                _saving = false;
                              });

                              //added proper error message when logging in
                              CommonWidgets.showToast(
                                  context, resBody['message'], _scaffoldKey);

                              setState(() {
                                _saving = false;
                              });
                            } else {
                              setState(() {
                                _saving = false;
                              });
                              PreferenceUtils.putString(PreferenceKeys.TOKEN,
                                  resBody['body']['data']['token']);

                              PreferenceUtils.putString(PreferenceKeys.ROLE,
                                  resBody['body']['data']['role']);
                              PreferenceUtils.putBool(
                                  PreferenceKeys.PHONE_VERIFICATION, true);

                              await addFcmToken();
                              if ((resBody['body']['data']['role']) ==
                                  "PATIENT") {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) => LoginOtp(
                                              countryCode:
                                                  dropdownValue.toString(),
                                              phoneNumber:
                                                  _phoneController.text,
                                              role:
                                                  Strings.patient.toUpperCase(),
                                            )),
                                    (Route<dynamic> route) => false);
                              } else {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) => LoginOtp(
                                              countryCode:
                                                  dropdownValue.toString(),
                                              phoneNumber:
                                                  _phoneController.text,
                                              role:
                                                  Strings.doctor.toUpperCase(),
                                            )),
                                    (Route<dynamic> route) => false);

                                // Navigator.of(context).pushNamedAndRemoveUntil(
                                //     '/screen4',
                                //     (Route<dynamic> route) => false);
                              }
                            }
                          } on SocketException catch (_) {
                            setState(() {
                              _saving = false;
                            });
                            CommonWidgets.showToast(
                                context, Strings.not_connected, _scaffoldKey);
                          } on HandshakeException catch (_) {
                            setState(() {
                              _saving = false;
                            });
                            CommonWidgets.showToast(
                                context, Strings.contactAdmin, _scaffoldKey);
                          } catch (err) {
                            setState(() {
                              _saving = false;
                            });

                            CommonWidgets.showToast(
                                context, err.toString(), _scaffoldKey);
                          }
                        }
                      },
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(24.0)),
                      color: CustomColors.yellow1,
                    ),
                  )),

              // social login removed
              SizedBox(
                height: CommonWidgets().getHeight(context) * 0.07,
              ),

              Text(Strings.dont_have_account,
                  style: const TextStyle(
                      color: CustomColors.grey2,
                      fontWeight: FontStyles.semiBoldFontWeight500,
                      fontFamily: "Roboto",
                      package: 'assets/fonts/Roboto-Regular',
                      fontStyle: FontStyle.normal,
                      fontSize: FontStyles.medium),
                  textAlign: TextAlign.center),

              // Login NOW!
              Padding(
                padding: EdgeInsets.only(top: 6, bottom: 15),
                child: InkWell(
                  onTap: () {
                    _passwordController.clear();
                    _phoneController.clear();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChooseRoleScreen()),
                    );
                  },
                  child: Text(Strings.sign_up_now,
                      style: const TextStyle(
                          color: CustomColors.blue2,
                          fontWeight: FontStyles.semiBoldFontWeight500,
                          fontFamily: "Roboto",
                          package: 'assets/fonts/Roboto-Medium',
                          fontStyle: FontStyle.normal,
                          fontSize: FontStyles.medium),
                      textAlign: TextAlign.center),
                ),
              ),
              CustomText(
                text: Strings.copyrights,
                fontSize: 14,
                maxLines: 2,
                color: CustomColors.grey2,
                fontWeight: FontStyles.semiBoldFontWeight500,
                fontFamily: "Roboto",
              ),
              // SizedBox(
              //   height: 10,
              // ),
            ],
          ),
        ),
      ),
    );
  }

  loginSocial() {
    PreferenceUtils.getString(PreferenceKeys.ROLE) == 'DOCTOR'
        ? PreferenceUtils.getBool(PreferenceKeys.PHONE_VERIFICATION)
            ? Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => LoginOtp()),
                (Route<dynamic> route) => false)
            : Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) => PhoneVerification(
                        PreferenceUtils.getString(PreferenceKeys.ROLE))),
                (Route<dynamic> route) => false)
        : PreferenceUtils.getString(PreferenceKeys.ROLE) == 'PATIENT'
            ? PreferenceUtils.getBool(PreferenceKeys.PHONE_VERIFICATION)
                ? Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => LoginOtp()),
                    (Route<dynamic> route) => false)
                : Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => PhoneVerification(
                            PreferenceUtils.getString(PreferenceKeys.ROLE))),
                    (Route<dynamic> route) => false)
            : PreferenceUtils.getBool(PreferenceKeys.IS_LOGIN)
                ? Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => ChooseRoleScreen()),
                    (Route<dynamic> route) => false)
                : Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                    (Route<dynamic> route) => false);
  }

  SplashScreen buildSplashScreen() {
    return SplashScreen(
        routeName: '/',
        seconds: 3,
        navigateAfterSeconds: PreferenceUtils.getBool(PreferenceKeys.IS_LOGIN)
            ? (PreferenceUtils.getString(PreferenceKeys.ROLE) == 'DOCTOR'
                ? (PreferenceUtils.getBool(PreferenceKeys.PHONE_VERIFICATION)
                    ? EnrollmentDetailUpdate()
                    : Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => doctorWidget()),
                        (Route<dynamic> route) => false))
                : PreferenceUtils.getString(PreferenceKeys.ROLE) == 'PATIENT'
                    ? (PreferenceUtils.getBool(
                            PreferenceKeys.PHONE_VERIFICATION)
                        ? BasicInfo()
                        : Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => patientWidget()),
                            (Route<dynamic> route) => false))
                    : LoginScreen())
            : WelcomeScreen(),
        imageBackground: AssetImage("assets/images/new_doc.png"),
        styleTextUnderTheLoader: TextStyle(),
        photoSize: 100.0,
        onClick: () => {},
        loaderColor: Colors.blue);
  }

  StreamBuilder<Response> doctorWidget() {
    return StreamBuilder(
      stream: getUser().asStream(),
      builder: (BuildContext context, AsyncSnapshot<Response> snapshot) {
        if (snapshot.data == null)
          return Scaffold(
            body: Container(
              child: Center(
                child: CommonWidgets.showLoader(context),
              ),
            ),
          );
        else if (snapshot.hasData &&
            jsonDecode(snapshot.data.body)['status'] == 401) {
          PreferenceUtils.clear();
          return LoginScreen();
        } else if (snapshot.hasData &&
            jsonDecode(snapshot.data.body)['body']['data']['user_profile']
                        ['completed_steps']
                    .length <
                3) {
          return EnrollmentDetailUpdate();
        } else if (snapshot.hasData &&
            jsonDecode(snapshot.data.body)['body']['data']['user_profile']
                        ['completed_steps']
                    .length ==
                3) {
          return BottomNavbar();
        } else
          return Scaffold(
            body: Center(child: Text(Strings.unknownError)),
          );
      },
    );
  }

  StreamBuilder<Response> patientWidget() {
    return StreamBuilder(
      stream: getUser().asStream(),
      builder: (BuildContext context, AsyncSnapshot<Response> snapshot) {
        if (snapshot.data == null)
          return Scaffold(
            body: Container(
              child: Center(
                child: CommonWidgets.showLoader(context),
              ),
            ),
          );
        else if (snapshot.hasData &&
            jsonDecode(snapshot.data.body)['status'] == 401) {
          PreferenceUtils.clear();
          return LoginScreen();
        } else if (snapshot.hasData &&
            jsonDecode(snapshot.data.body)['body']['data']['user_profile']
                        ['completed_steps']
                    .length ==
                0) {
          return BasicInfo();
        } else if (snapshot.hasData &&
            jsonDecode(snapshot.data.body)['body']['data']['user_profile']
                        ['completed_steps']
                    .length ==
                1) {
          return SignUpScreen();
        } else if (snapshot.hasData &&
            jsonDecode(snapshot.data.body)['body']['data']['user_profile']
                        ['completed_steps']
                    .length ==
                2) {
          return PersonalHistory();
        } else if (snapshot.hasData &&
            jsonDecode(snapshot.data.body)['body']['data']['user_profile']
                        ['completed_steps']
                    .length ==
                3) {
          return MedicalHistory();
        } else if (snapshot.hasData &&
            jsonDecode(snapshot.data.body)['body']['data']['user_profile']
                        ['completed_steps']
                    .length ==
                4) {
          return FamilyHistory();
        } else if (snapshot.hasData &&
            jsonDecode(snapshot.data.body)['body']['data']['user_profile']
                        ['completed_steps']
                    .length ==
                5) {
          return PatientBottomNavbar();
        } else
          return Scaffold(
            body: Center(child: Text(Strings.unknownError)),
          );
      },
    );
  }

  Future<Response> getUser() async {
    return await ApiRequest.getApi(ApiUrl.getUser);
  }

  Future addFcmToken() async {
    var token = await FirebaseMessaging().getToken();

    await ApiRequest.postApi(ApiUrl.updateDetails,
        {"action": "update_fcm_token", "fcm_token": token});
  }

  void _openCountryPickerDialog() => showDialog(
        context: context,
        builder: (context) => Theme(
            data: Theme.of(context).copyWith(primaryColor: Colors.pink),
            child: CountryPickerDialog(
                titlePadding: EdgeInsets.all(8.0),
                searchCursorColor: Colors.pinkAccent,
                searchInputDecoration: InputDecoration(hintText: 'Search...'),
                isSearchable: true,
                title: Text('Select your phone code'),
                onValuePicked: (Country country) {
                  selectedCountry = country;
                  dropdownValue = '+${country.phoneCode}';
                  setState(() {});
                },
                priorityList: [
                  CountryPickerUtils.getCountryByIsoCode('ET'),
                  CountryPickerUtils.getCountryByIsoCode('US'),
                ],
                itemBuilder: _buildDialogItem)),
      );

  Widget _buildDialogItem(Country country) {
    return Padding(
      padding: const EdgeInsets.only(top: 2.0),
      child: Row(
        children: [
          CountryPickerUtils.getDefaultFlagImage(country),
          Container(
            width: MediaQuery.of(context).size.width * 0.35,
            margin: EdgeInsets.only(left: 10),
            child: Text(
              country.name,
              style: TextStyle(fontSize: 14),
            ),
          ),
          Spacer(),
          Text(
            '+${country.phoneCode}',
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}

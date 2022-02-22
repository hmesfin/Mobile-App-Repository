import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:virtudoc_app/apimanager/api_request.dart';
import 'package:virtudoc_app/apimanager/api_url.dart';
import 'package:virtudoc_app/custom-widgets/custom-top-bar.dart';
import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/screens/basic-info/basic-info.dart';
import 'package:virtudoc_app/screens/home/doctor/enrollment-details-update/enrollment-detail-update.dart';
import 'package:virtudoc_app/screens/location/lat_lng_model.dart';
import 'package:virtudoc_app/utils/common-helper.dart';
import 'package:virtudoc_app/utils/custom-colors.dart';
import 'package:virtudoc_app/utils/screen_tracker/screen_tracker.dart';
import 'package:virtudoc_app/utils/strings.dart';
import 'package:virtudoc_app/utils/styles.dart';

class SetPassword extends StatefulWidget {
  final String role;
  SetPassword(this.role);
  @override
  State<StatefulWidget> createState() => _SetPasswordState();
}

class _SetPasswordState extends State<SetPassword> {
  bool _showPassword = false;
  bool isPasswordFocused = false;
  bool isPhoneFocused = true;
  String dropdownValue = "+91";
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  var _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  AppBar appBar = AppBar(
    title: Text(Strings.appName),
  );
  var _saving = false;
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
    double screenHeight = MediaQuery.of(context).size.height - appbarheight;
    return SingleChildScrollView(
      child: Container(
        height: screenHeight,
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

              CustomTopBar(context: context, titleText: Strings.setPassword),

              Padding(
                padding:
                    EdgeInsets.only(top: 2, bottom: 27, left: 20, right: 20),
                child: AutoSizeText(
                  Strings.newPasswordText,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    // color: CustomColors.grey2,
                    fontWeight: FontStyles.semiBoldFontWeight500,
                    fontFamily: FontStyles.fontFamly,
                    package: FontStyles.package,
                    color: CustomColors.black1,
                    fontStyle: FontStyle.normal,
                  ),
                  presetFontSizes: [18, 14, 14],
                  textAlign: TextAlign.center,
                ),
              ),

              // Rounded Rectangle 1
              Padding(
                  padding: EdgeInsets.only(bottom: 19, top: 30),
                  child: FractionallySizedBox(
                    widthFactor: 0.683,
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
                              setState(() {
                                isPasswordFocused = hasFocus;
                              });
                            },
                            child: TextFormField(
                              onTap: () {
                                screenTracker.stopTimer();
                                screenTracker.startTimer(context);
                              },
                              obscureText: !this._showPassword,
                              // focusNode: _passwordFocus,
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
                              ),
                              maxLines: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )),

              // Rounded Rectangle 4
              Padding(
                  padding: EdgeInsets.only(top: screenHeight / 100),
                  child: SizedBox(
                    width: 200,
                    height: 48,
                    child: RaisedButton(
                      child: // CONTINUE
                          Text(Strings.submit,
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

                        if (_passwordController.text.isEmpty) {
                          CommonWidgets.showToast(
                              context, Strings.enterPassword, _scaffoldKey);
                        } else if (validatePassword(_passwordController.text)) {
                          CommonWidgets.showToast(
                              context, Strings.passValidation, _scaffoldKey);
                        } else {
                          try {
                            setState(() {
                              _saving = true;
                            });

                            Map<String, dynamic> data = {
                              "action": "set_password",
                              "password": _passwordController.text.toString(),
                            };
                            var res = await ApiRequest.postApi(
                                ApiUrl.updateDetails, data);
                            Map resBody = await json.decode(res.body);

                            if (resBody.containsKey('error')) {
                              if (resBody.containsKey('error')) {
                                setState(() {
                                  _saving = false;
                                });
                                FocusScope.of(context).unfocus();

                                CommonWidgets.showToast(
                                    context,
                                    resBody['error']['message'].toString(),
                                    _scaffoldKey);
                              } else {
                                setState(() {
                                  _saving = false;
                                });
                              }
                            } else {
                              setState(() {
                                _saving = false;
                              });

                              PreferenceUtils.putString(PreferenceKeys.ROLE,
                                  widget.role.toUpperCase());
                              PreferenceUtils.putBool(
                                  PreferenceKeys.IS_LOGIN, true);

                              var response = await ApiRequest.postApi(
                                ApiUrl.updateDetails,
                                {
                                  Strings.action: Strings.setlanguage,
                                  Strings.languageKey: Strings.english
                                },
                              );
                              if (response.statusCode == 200) {
                                var response = await ApiRequest.postApi(
                                  ApiUrl.updateDetails,
                                  {
                                    Strings.action: Strings.setlocation,
                                    Strings.locationKey: LatLng(
                                            lat: PreferenceUtils.getDouble(
                                                PreferenceKeys.LAT),
                                            lng: PreferenceUtils.getDouble(
                                                PreferenceKeys.LNG))
                                        .toJson()
                                  },
                                );

                                if (response.statusCode == 200) {
                                  await addFcmToken();
                                  if (widget.role.toUpperCase() == 'PATIENT') {
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                            builder: (context) => BasicInfo()),
                                        (Route<dynamic> route) => false);
                                  } else {
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EnrollmentDetailUpdate(isSignUp:true)),
                                        (Route<dynamic> route) => false);
                                  }
                                } else {
                                  CommonWidgets.showToast(context,
                                      response.reasonPhrase, _scaffoldKey);
                                }
                              } else {
                                CommonWidgets.showToast(context,
                                    response.reasonPhrase, _scaffoldKey);
                              }
                            }
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
            ],
          ),
        ),
      ),
    );
  }

  Future addFcmToken() async {
    Provider.of<UserProvider>(context, listen: false).fcmToken =
        await FirebaseMessaging().getToken();

    await ApiRequest.postApi(ApiUrl.updateDetails, {
      "action": "update_fcm_token",
      "fcm_token": Provider.of<UserProvider>(context, listen: false).fcmToken
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:virtudoc_app/custom-widgets/custom-top-bar.dart';
import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/screens/signup/sign-up-screen.dart';
import 'package:virtudoc_app/utils/common-helper.dart';
import 'package:virtudoc_app/utils/custom-colors.dart';
import 'package:virtudoc_app/utils/strings.dart';
import 'package:virtudoc_app/utils/styles.dart';
/*
The file is covered under Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. Please review the license for full details.

This program is not free software: You cannot redistribute it for any use under the terms of the Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. However the source can be modified and updated for the working of the application Design & Development of Mobile Application for “Abyssinia Technology Group” for which it was licensed.
*/

class BasicInfo extends StatefulWidget {
  final bool isUpdating;

  BasicInfo({this.isUpdating = false});
  @override
  State<StatefulWidget> createState() => _BasicInfoState();
}

class _BasicInfoState extends State<BasicInfo> {
  var _fnameController = TextEditingController();
  var _lnameController = TextEditingController();
  var _mailController = TextEditingController();
  var isSocial;
  var firstName;
  var lastName;
  var email;
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();

    isSocial = PreferenceUtils.getBool(PreferenceKeys.IS_SOCIAL_LOGIN) ?? false;
    _fnameController.text =
        PreferenceUtils.getString(PreferenceKeys.FIRST_NAME) ?? "";
    _lnameController.text =
        PreferenceUtils.getString(PreferenceKeys.LAST_NAME) ?? "";
    _mailController.text =
        PreferenceUtils.getString(PreferenceKeys.EMAIL) ?? "";

    setState(() {});
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

  var _saving = false;
  Widget _buildWidget(BuildContext context) {
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
              CustomTopBar(
                context: context,
                titleText: Strings.basic_info,
                custonBackButton: false,
              ),
              !widget.isUpdating
                  ? Padding(
                      padding: EdgeInsets.only(top: 15, bottom: 27),
                      child: Text(Strings.pleaseTellUsMoreAboutYourself,
                          style: const TextStyle(
                              color: CustomColors.black1,
                              fontWeight: FontStyles.semiBoldFontWeight500,
                              fontFamily: "Roboto",
                              package: 'assets/fonts/Roboto-Regular',
                              fontStyle: FontStyle.normal,
                              fontSize: FontStyles.large),
                          textAlign: TextAlign.center),
                    )
                  : Container(),

              Padding(
                padding: EdgeInsets.only(bottom: 25),
                child: FractionallySizedBox(
                  widthFactor: 0.683,
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        border: Border.all(color: CustomColors.grey3, width: 1),
                        color: CustomColors.white),
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.only(left: 5, right: 5, top: 2),
                        child: TextFormField(
                          controller: _fnameController,
                          decoration: InputDecoration(
                            hintText: Strings.fname,
                            prefixIcon: ImageIcon(
                              AssetImage("assets/images/profile.png"),
                              color: CustomColors.grey2,
                            ),
                            border: InputBorder.none,
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                  padding: EdgeInsets.only(bottom: 25),
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
                          padding: EdgeInsets.only(
                            left: 5,
                            right: 5,
                            top: 2,
                          ),
                          child: TextFormField(
                            controller: _lnameController,
                            decoration: InputDecoration(
                              hintText: Strings.lname,
                              prefixIcon: ImageIcon(
                                AssetImage("assets/images/profile.png"),
                                color: CustomColors.grey2,
                              ),
                              border: InputBorder.none,
                            ),
                            maxLines: 1,
                          ),
                        ),
                      ),
                    ),
                  )),

              // Rounded Rectangle 1
              Padding(
                padding: EdgeInsets.only(bottom: 25),
                child: FractionallySizedBox(
                  widthFactor: 0.683,
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        border: Border.all(color: CustomColors.grey3, width: 1),
                        color: CustomColors.white),
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 5,
                          right: 5,
                          top: 2,
                        ),
                        child: TextFormField(
                          controller: _mailController,
                          keyboardType: TextInputType.emailAddress,
                          enabled: isSocial ? false : true,
                          decoration: InputDecoration(
                            hintText: Strings.email,
                            prefixIcon: ImageIcon(
                              AssetImage("assets/images/mail.png"),
                              color: CustomColors.grey2,
                            ),
                            border: InputBorder.none,
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: screenHeight / 45,
              ),
              // Rounded Rectangle 4
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: SizedBox(
                  width: 200,
                  height: 48,
                  child: RaisedButton(
                    child: // CONTINUE
                        Text(Strings.next.toUpperCase(),
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
                      setState(() {
                        _saving = true;
                      });
                      try {
                        if (_fnameController.text == '') {
                          setState(() {
                            _saving = false;
                          });
                          CommonWidgets.showToast(context,
                              'Please enter first name.', _scaffoldKey);
                        } else if (_fnameController.text.length < 2) {
                          setState(() {
                            _saving = false;
                          });
                          CommonWidgets.showToast(
                              context,
                              'First name should have atleast 2 character.',
                              _scaffoldKey);
                        } else if (_fnameController.text.length > 15) {
                          setState(() {
                            _saving = false;
                          });
                          CommonWidgets.showToast(
                              context,
                              'First name should be less than 15 characters.',
                              _scaffoldKey);
                        } else if (_lnameController.text == '') {
                          setState(() {
                            _saving = false;
                          });
                          CommonWidgets.showToast(
                              context, 'Please enter last name.', _scaffoldKey);
                        } else if (_lnameController.text.length < 2) {
                          setState(() {
                            _saving = false;
                          });
                          CommonWidgets.showToast(
                              context,
                              'Last name should have atleast 2 character.',
                              _scaffoldKey);
                        } else if (_lnameController.text.length > 15) {
                          setState(() {
                            _saving = false;
                          });
                          CommonWidgets.showToast(
                              context,
                              'Last name should be less than 15 characters.',
                              _scaffoldKey);
                        } else if (_mailController.text == '') {
                          setState(() {
                            _saving = false;
                          });
                          CommonWidgets.showToast(
                              context, 'Please enter email.', _scaffoldKey);
                        } else if (validateEmail(_mailController.text)) {
                          setState(() {
                            _saving = false;
                          });

                          CommonWidgets.showToast(context,
                              'Please enter a valid email.', _scaffoldKey);
                        } else {
                          Map<String, dynamic> data;
                          if (isSocial) {
                            data = {
                              "action": "about_me",
                              "about_me": {
                                "first_name": _fnameController.text.toString(),
                                "last_name": _lnameController.text.toString(),
                                "email": _mailController.text.toString(),
                              }
                            };
                          } else {
                            data = {
                              "action": "about_me",
                              "about_me": {
                                "first_name": _fnameController.text.toString(),
                                "last_name": _lnameController.text.toString(),
                                "email": _mailController.text.toString(),
                              }
                            };
                          }

                          var res = await ApiRequest.postApi(
                              ApiUrl.updateDetails, data);
                          Map resBody = await json.decode(res.body);

                          // if (resBody.containsKey('error')) {
                          if (resBody['success'] == false) {
                            // if (resBody.containsKey('error')) {
                            setState(() {
                              _saving = false;
                            });

                            CommonWidgets.showToast(context,
                                resBody['message'].toString(), _scaffoldKey);
                            // } else {
                            setState(() {
                              _saving = false;
                            });
                            // }
                          } else {
                            setState(() {
                              _saving = false;
                            });

                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => SignUpScreen(
                                        isUpdating: widget.isUpdating,
                                      )),
                            );
                          }
                        }
                      } catch (err) {
                        setState(() {
                          _saving = false;
                        });

                        CommonWidgets.showToast(
                            context, err.toString(), _scaffoldKey);
                      }
                    },
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(24.0)),
                    color: CustomColors.yellow1,
                  ),
                ),
              ),

              SizedBox(
                height: screenHeight / 40,
              ),

              SizedBox(
                height: screenHeight / 40,
              ),

              SizedBox(
                height: 35,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

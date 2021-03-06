import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

import 'package:flutter/rendering.dart';
import 'package:virtudoc_app/custom-widgets/custom-top-bar.dart';
import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/screens/forget-password/forget-set-password.dart';
import 'package:virtudoc_app/screens/phone-verification/verify-otp-model.dart';
import 'package:virtudoc_app/utils/custom-colors.dart';
import 'package:virtudoc_app/utils/strings.dart';
import 'package:virtudoc_app/utils/styles.dart';

class ForgetOtc extends StatefulWidget {
  // final String role;
  final String phoneNumber;
  final String countrycode;

  ForgetOtc(this.phoneNumber, this.countrycode);
  @override
  State<StatefulWidget> createState() => _ForgetOtcState();
}

class _ForgetOtcState extends State<ForgetOtc> {
  bool isPasswordFocused = false;
  bool isPhoneFocused = true;
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController controller = TextEditingController(text: "");
  String thisText = "";
  int pinLength = 4;
  bool hasError = false;
  String errorMessage;

  @override
  void initState() {
    super.initState();

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
        child: Column(
          children: <Widget>[
            // Header

            CustomTopBar(
                context: context, titleText: Strings.phoneVerification),

            Padding(
              padding: EdgeInsets.only(top: 24, bottom: 27),
              child: AutoSizeText(
                Strings.verificationCode,
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

              // Text(Strings.verificationCode,
              //     style: TextStyle(
              //         color: CustomColors.black1,
              //         fontWeight: FontStyles.semiBoldFontWeight500,
              //         fontFamily: FontStyles.fontFamly,
              //         package: FontStyles.package,
              //         fontStyle: FontStyle.normal,
              //         fontSize: FontStyles.large),
              //     textAlign: TextAlign.center),
            ),

            // Rounded Rectangle 1
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Container(
                height: 100.0,
                child: GestureDetector(
                  onLongPress: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content:
                                Text("Paste clipboard stuff into the pinbox?"),
                            actions: <Widget>[
                              FlatButton(
                                  onPressed: () async {
                                    var copiedText =
                                        await Clipboard.getData("text/plain");
                                    if (copiedText.text.isNotEmpty) {
                                      controller.text = copiedText.text;
                                    }
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("YES")),
                              FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("No"))
                            ],
                          );
                        });
                  },
                  child: PinCodeTextField(
                    pinBoxOuterPadding: EdgeInsets.only(right: 20),
                    autofocus: true,
                    pinBoxWidth: 40,
                    pinBoxHeight: 50,
                    controller: controller,
                    hideCharacter: true,
                    highlight: true,
                    highlightColor: Colors.blue,
                    defaultBorderColor: Colors.grey,
                    hasTextBorderColor: Colors.grey,
                    maxLength: pinLength,
                    hasError: hasError,
                    maskCharacter: "???",
                    onTextChanged: (text) {
                      setState(() {
                        hasError = false;
                      });
                    },
                    onDone: (text) {},
                    wrapAlignment: WrapAlignment.spaceAround,
                    pinBoxDecoration:
                        ProvidedPinBoxDecoration.defaultPinBoxDecoration,
                    pinTextStyle: TextStyle(fontSize: 30.0),
                    pinTextAnimatedSwitcherTransition:
                        ProvidedPinBoxTextAnimation.scalingTransition,
//                    pinBoxColor: Colors.green[100],
                    pinTextAnimatedSwitcherDuration:
                        Duration(milliseconds: 300),
//                    highlightAnimation: true,
                    highlightPinBoxColor: Colors.white,
                    highlightAnimationBeginColor: Colors.black,
                    highlightAnimationEndColor: Colors.white12,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
            ),

            // Rounded Rectangle 4
            Padding(
                padding: EdgeInsets.only(top: 5),
                child: SizedBox(
                  width: 200,
                  height: 48,
                  child: RaisedButton(
                    child: // CONTINUE
                        Text(Strings.verify,
                            style: const TextStyle(
                              color: CustomColors.white,
                              fontWeight: FontStyles.semiBoldFontWeight500,
                              fontFamily: FontStyles.fontFamly,
                              package: FontStyles.package,
                              fontStyle: FontStyle.normal,
                              fontSize: FontStyles.medium,
                            ),
                            textAlign: TextAlign.center),
                    onPressed: () => getOtpVerified(context),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(24.0)),
                    color: CustomColors.yellow1,
                  ),
                )),

            // Or login with:
            Padding(
              padding:
                  EdgeInsets.only(top: 40, bottom: 12, right: 20, left: 20),
              child: AutoSizeText(
                Strings.didntreceive,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  // color: CustomColors.grey2,
                  fontWeight: FontStyles.semiBoldFontWeight500,
                  fontFamily: FontStyles.fontFamly,
                  package: FontStyles.package,
                  color: CustomColors.grey2,
                  fontStyle: FontStyle.normal,
                ),
                presetFontSizes: [15, 14, 14],
                textAlign: TextAlign.center,
              ),
            ),

            GestureDetector(
              onTap: () async {
                FocusScope.of(context).unfocus();

                var response = await PhoneVerificationProvider.resendOtp(
                    2, widget.phoneNumber, widget.countrycode);

                if (response.success) {
                  CommonWidgets.showToast(context, 'OTP sent', _scaffoldKey);
                } else {
                  CommonWidgets.showToast(
                      context, response.message, _scaffoldKey);
                }
              },
              child: Padding(
                padding: EdgeInsets.only(bottom: 12, right: 20, left: 20),
                child: Text(Strings.resendcode,
                    style: const TextStyle(
                        color: CustomColors.blue,
                        fontWeight: FontStyles.semiBoldFontWeight500,
                        fontFamily: FontStyles.fontFamly,
                        package: FontStyles.package,
                        fontStyle: FontStyle.normal,
                        fontSize: FontStyles.medium),
                    textAlign: TextAlign.center),
              ),
            ),
          ],
        ),
      ),
    );
  }

  getOtpVerified(BuildContext context) async {
    FocusScope.of(context).unfocus();
    if (controller.text.length != 4) {
      CommonWidgets.showToast(context, Strings.enter_otp, _scaffoldKey);
      return;
    }

    var response =
        await PhoneVerificationProvider.optVerification(VerifyOtpModel(
      otp: controller.text,
      stage: 2,
    ));
    CommonWidgets.showToast(context, response.message, _scaffoldKey);

    if (response.success) {
      controller.clear();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ForgetSetPassword()),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    controller.clear();
  }
}

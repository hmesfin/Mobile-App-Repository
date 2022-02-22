import 'package:auto_size_text/auto_size_text.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dialog.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:virtudoc_app/custom-widgets/custom-top-bar.dart';
import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/screens/forget-password/forget-otc.dart';
import 'package:virtudoc_app/screens/phone-verification/response-model.dart';
import 'package:virtudoc_app/utils/custom-colors.dart';
import 'package:virtudoc_app/utils/screen_tracker/screen_tracker.dart';
import 'package:virtudoc_app/utils/strings.dart';
import 'package:virtudoc_app/utils/styles.dart';
/*
The file is covered under Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. Please review the license for full details.

This program is not free software: You cannot redistribute it for any use under the terms of the Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. However the source can be modified and updated for the working of the application Design & Development of Mobile Application for “Abyssinia Technology Group” for which it was licensed.
*/

class ForgotPassword extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool isPasswordFocused = false;
  bool isPhoneFocused = true;
  String dropdownValue = "+251";
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  var _phoneController = TextEditingController();
  Country selectedCountry =
      Country(isoCode: 'ET', phoneCode: '251', name: 'Ethiopia');

  bool ispressed = false;

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

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
        body: ModalProgressHUD(
          child: _buildWidget(context),
          inAsyncCall: _saving,
          // progressIndicator: CircularProgressIndicator(
          //   valueColor: new AlwaysStoppedAnimation<Color>(CustomColors.yellow),
          // ),
        ),
      ),
    );
  }

  _buildWidget(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
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
                padding: EdgeInsets.only(top: 10, bottom: 27),
                child: AutoSizeText(
                  Strings.phoneVerificationText,
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
                )),

            // Rounded Rectangle 1
            Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: FractionallySizedBox(
                  widthFactor: 0.75,
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        border: Border.all(color: CustomColors.grey3, width: 1),
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
                                AssetImage("assets/images/bg_vertical_bar.png"),
                                color: CustomColors.grey2,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: Focus(
                                    onFocusChange: (hasFocus) {
                                      setState(() {
                                        isPhoneFocused = hasFocus;
                                      });
                                    },
                                    child: TextFormField(
                                      onTap: () {
                                        screenTracker.stopTimer();
                                        screenTracker.startTimer(context);
                                      },
                                      keyboardType: TextInputType.number,
                                      // focusNode: _phoneFocus,
                                      controller: _phoneController,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp('^[1-9][0-9]*\$')),
                                      ],
                                      textInputAction: TextInputAction.next,
                                      onFieldSubmitted: (term) {},
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

            // Rounded Rectangle 4
            Padding(
                padding: EdgeInsets.only(top: 5),
                child: SizedBox(
                  width: 200,
                  height: 48,
                  child: RaisedButton(
                    child: // CONTINUE
                        Text(Strings.sendCode,
                            style: TextStyle(
                              color: CustomColors.white,
                              fontWeight: FontStyles.semiBoldFontWeight500,
                              fontFamily: "Roboto",
                              package: 'assets/fonts/Roboto-Medium',
                              fontStyle: FontStyle.normal,
                              fontSize: FontStyles.medium,
                            ),
                            textAlign: TextAlign.center),
                    onPressed: ispressed
                        ? null
                        : () {
                            FocusScope.of(context).unfocus();
                            processVerification(context);
                          },
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(24.0)),
                    color: CustomColors.yellow1,
                  ),
                )),

            // Or login with:
            Padding(
                padding:
                    EdgeInsets.only(top: 41, bottom: 12, right: 50, left: 50),
                child: AutoSizeText(
                  Strings.otcText,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: TextStyle(
                    // color: CustomColors.grey2,
                    fontWeight: FontStyles.semiBoldFontWeight400,
                    fontFamily: FontStyles.fontFamly,
                    package: FontStyles.package,
                    color: CustomColors.grey2,
                    fontStyle: FontStyle.normal,
                  ),
                  presetFontSizes: [16, 15, 14],
                  textAlign: TextAlign.center,
                )),
          ],
        ),
      ),
    );
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

  void processVerification(BuildContext context) async {
    if (_phoneController.text.isEmpty) {
      CommonWidgets.showToast(context, Strings.enterPhone, _scaffoldKey);
      ispressed = false;
      setState(() {});
    } else if (_phoneController.text.length < 6) {
      ispressed = false;
      CommonWidgets.showToast(context, Strings.phoneNumLimit, _scaffoldKey);
      setState(() {});
    } else {
      setState(() {
        _saving = true;
      });
      var response = await PhoneVerificationProvider.resetPassword(
          _phoneController.text.toString(), dropdownValue);

      if (response.success) {
        setState(() {
          _saving = false;
        });
        var model = OtpResponseModel.fromJson(response.body);
        PreferenceUtils.putString(PreferenceKeys.TOKEN, model.data.token);

        CommonWidgets.showToast(context, 'OTP sent', _scaffoldKey);
        await Future.delayed(Duration(milliseconds: 500));
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  ForgetOtc(_phoneController.text, dropdownValue)),
        );
      } else {
        ispressed = false;
        setState(() {
          _saving = false;
        });
        CommonWidgets.showToast(context, response.message, _scaffoldKey);
      }
    }
  }
}

import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/screens/phone-verification/response-model.dart';
import 'package:flutter/scheduler.dart';
import 'package:virtudoc_app/utils/screen_tracker/screen_tracker.dart';

class PhoneVerification extends StatefulWidget {
  final String role;

  PhoneVerification(this.role);
  @override
  State<StatefulWidget> createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  bool isPasswordFocused = false;
  bool isPhoneFocused = true;
  String dropdownValue = "+251";
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var _phoneController = TextEditingController();
  bool tcValue = false;
  bool ispressed = false;
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
          inAsyncCall: ispressed,
          dismissible: false,
          opacity: 0.3,
          child: Column(
            children: <Widget>[
              // Header

              CustomTopBar(
                context: context,
                titleText: Strings.phoneVerification,
                custonBackButton: value ? false : true,
              ),

              Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 27),
                  child: AutoSizeText(
                    Strings.phoneVerificationText,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontWeight: FontStyles.semiBoldFontWeight400,
                      fontFamily: FontStyles.fontFamly,
                      package: FontStyles.package,
                      color: CustomColors.black1,
                      fontStyle: FontStyle.normal,
                    ),
                    presetFontSizes: [18, 16, 14],
                    textAlign: TextAlign.center,
                  )),

              Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: FractionallySizedBox(
                    widthFactor: 0.85,
                    child: Container(
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
                                        controller: _phoneController,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp('^[1-9][0-9]*\$')),
                                        ],
                                        textInputAction: TextInputAction.next,
                                        onFieldSubmitted: (term) {},
                                        maxLength: 15,
                                        decoration: InputDecoration(
                                          counterText: "",
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
                              ispressed = true;
                              setState(() {});
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

              Spacer(),
            ],
          ),
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

  processVerification(BuildContext context) async {
    FocusScope.of(context).unfocus();
    if (_phoneController.text.isEmpty) {
      ispressed = false;
      CommonWidgets.showToast(context, Strings.enterPhone, _scaffoldKey);
      setState(() {});
    } else if (_phoneController.text.length < 6) {
      ispressed = false;
      CommonWidgets.showToast(context, Strings.phoneNumLimit, _scaffoldKey);
      setState(() {});
    } else {
      var response;
      try {
        if (PreferenceUtils.getBool(PreferenceKeys.IS_SOCIAL_LOGIN)) {
          Map json = {
            'phone': _phoneController.text,
            'tc_val': true,
            'country_code': dropdownValue,
            'role': widget.role.toUpperCase(),
            'social_id': PreferenceUtils.getString(PreferenceKeys.SOCIAL_ID)
          };

          var res = await ApiRequest.postApi(ApiUrl.phoneVerifaction, json);
          response = BaseResponse.fromJson(jsonDecode(res.body));
        } else {
          response = await PhoneVerificationProvider().phoneVerification(
            VerifyPhoneModel(
                phone: _phoneController.text,
                tcValue: true,
                countryCode: dropdownValue,
                role: widget.role.toUpperCase()),
          );
        }
        if (response != null) {
          if (response.success) {
            var model = OtpResponseModel.fromJson(response.body);
            PreferenceUtils.putString(PreferenceKeys.TOKEN, model.data.token);

            CommonWidgets.showToast(context, Strings.otpSent, _scaffoldKey);
            await Future.delayed(Duration(milliseconds: 500));
            ispressed = false;
            setState(() {});

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OtcVerification(widget.role.toUpperCase(),
                    model.data, dropdownValue, _phoneController.text),
              ),
            );
          } else {
            ispressed = false;
            setState(() {});
            CommonWidgets.showToast(context, response.message, _scaffoldKey);
          }
        } else {
          CommonWidgets.showToast(context, Strings.noResponse, _scaffoldKey);
        }
      } catch (err) {}
    }
  }

  @override
  void dispose() {
    super.dispose();
    _phoneController.clear();
  }
}

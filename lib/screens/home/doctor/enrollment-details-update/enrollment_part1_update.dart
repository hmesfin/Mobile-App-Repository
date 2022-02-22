import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:virtudoc_app/custom-widgets/custom_button.dart';
import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/screens/home/doctor/enrollment-details-update/enrollment-provider-update.dart';
import 'package:virtudoc_app/screens/location/country_model.dart';
import 'package:virtudoc_app/utils/custom-colors.dart';
import 'package:virtudoc_app/utils/screen_tracker/screen_tracker.dart';
import 'package:virtudoc_app/utils/strings.dart';
import 'package:http/http.dart' as http;

class EnrollMent1Update extends StatefulWidget {
  final bool isSignUp;
  final GlobalKey<ScaffoldState> scaffoldKey;

  EnrollMent1Update({this.isSignUp = false, @required this.scaffoldKey});

  @override
  _EnrollMent1State createState() => _EnrollMent1State();
}

class _EnrollMent1State extends State<EnrollMent1Update> {
  File profileImage;

  bool ifbackActive = false;
  FocusNode isFocus1 = FocusNode();
  FocusNode isFocus2 = FocusNode();
  FocusNode isFocus3 = FocusNode();
  FocusNode isFocus4 = FocusNode();
  FocusNode isFocus5 = FocusNode();
  FocusNode isFocus6 = FocusNode();
  FocusNode isFocus7 = FocusNode();
  FocusNode isFocus8 = FocusNode();
  FocusNode isFocus9 = FocusNode();
  FocusNode isFocus10 = FocusNode();

  var _genderController = TextEditingController();
  var _dobController = TextEditingController();
  var _page = TextEditingController();

  var _countryController = TextEditingController();
  var _fname = TextEditingController();
  var _sname = TextEditingController();
  var _mailController = TextEditingController();

  //etiopia
  var _regionController = TextEditingController();
  var _cityController = TextEditingController();
  var _subcityController = TextEditingController();
  var _weredaController = TextEditingController();
  var _houseController = TextEditingController();

  //usa
  var _address1Controller = TextEditingController();
  var _address2Controller = TextEditingController();
  var _stateController = TextEditingController();
  var _zipCodeController = TextEditingController();
  var mailResponseBody;
  Response mailResponse;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    EnrollmentProviderUpdate().checkActive(context);
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Provider.of<UserProvider>(context, listen: false).getUser();
      EnrollmentProviderUpdate.specialityController =
          Provider
              .of<UserProvider>(context, listen: false)
              ?.enrollmentInformation
              ?.speciality ??
              [];
      // _page.text =Provider.of<UserProvider>(context,listen: false).page;
      _fname.text = Provider
          .of<UserProvider>(context, listen: false)
          .firstname;
      _sname.text = Provider
          .of<UserProvider>(context, listen: false)
          .lastname;
      _mailController.text =
          Provider
              .of<UserProvider>(context, listen: false)
              .email;
      _dobController.text =
          Provider
              .of<UserProvider>(context, listen: false)
              .biometrics
              .dob;
      _genderController.text =
          Provider
              .of<UserProvider>(context, listen: false)
              .biometrics
              .gender;
      _address1Controller.text =
          Provider
              .of<UserProvider>(context, listen: false)
              .addess
              .addressLine1;
      _address2Controller.text =
          Provider
              .of<UserProvider>(context, listen: false)
              .addess
              .addressLine2;
      _weredaController.text =
          Provider
              .of<UserProvider>(context, listen: false)
              .addess
              .wereda;
      _regionController.text =
          Provider
              .of<UserProvider>(context, listen: false)
              .addess
              .region;
      _stateController.text =
          Provider
              .of<UserProvider>(context, listen: false)
              .addess
              .state;
      _cityController.text =
          Provider
              .of<UserProvider>(context, listen: false)
              .addess
              .city;
      _subcityController.text =
          Provider
              .of<UserProvider>(context, listen: false)
              .addess
              .subCity;
      _countryController.text =
          Provider
              .of<UserProvider>(context, listen: false)
              .addess
              .country;
      _zipCodeController.text =
          Provider
              .of<UserProvider>(context, listen: false)
              .addess
              .zipCode;
      _houseController.text =
          Provider
              .of<UserProvider>(context, listen: false)
              .addess
              .houseNo;

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<EnrollmentProviderUpdate>(
        builder: (context, provider, child) =>
            Stack(
              children: [
                Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          border: Border.all(
                              color: CustomColors.blue3, width: 1),
                          color: CustomColors.white),
                      child: Stack(
                        children: <Widget>[
                          profileImage == null
                              ? CommonWidgets.userImgeLoader(
                              imageUrl: Provider
                                  .of<UserProvider>(context)
                                  ?.profileImage ??
                                  '',
                              size: 100)
                              : Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: CustomColors.blue3, width: 1),
                              color: CustomColors.white,
                            ),
                            child: CircleAvatar(
                              backgroundImage: new FileImage(profileImage),
                              radius: 200.0,
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              profileImage = await CommonWidgets.getPhoto(
                                  context);
                              setState(() {});
                            },
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                    border: Border.all(
                                        color: CustomColors.grey1, width: 1),
                                    color: CustomColors.white),
                                child: ImageIcon(
                                  AssetImage("assets/images/ic_camera.png"),
                                  color: CustomColors.grey2,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                    // fname
                    Padding(
                        padding: EdgeInsets.only(top: 19, bottom: 19),
                        child: FractionallySizedBox(
                          widthFactor: 0.833,
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    25)),
                                border:
                                Border.all(color: CustomColors.grey3, width: 1),
                                color: CustomColors.white),
                            child: Container(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 5, right: 5, top: 2),
                                child: TextFormField(
                                  onTap: () {
                                    screenTracker.stopTimer();
                                    screenTracker.startTimer(context);
                                  },
                                  focusNode: isFocus1,
                                  controller: _fname,
                                  keyboardType: TextInputType.name,
                                  maxLength: 30,
                                  decoration: InputDecoration(
                                    counterText: '',
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                    ),
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
                        )),

                    // lname
                    Padding(
                        padding: EdgeInsets.only(bottom: 19),
                        child: FractionallySizedBox(
                          widthFactor: 0.833,
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    25)),
                                border:
                                Border.all(color: CustomColors.grey3, width: 1),
                                color: CustomColors.white),
                            child: Container(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 5, right: 5, top: 2),
                                child: TextFormField(
                                  onTap: () {
                                    screenTracker.stopTimer();
                                    screenTracker.startTimer(context);
                                  },
                                  focusNode: isFocus2,
                                  controller: _sname,
                                  maxLength: 30,
                                  decoration: InputDecoration(
                                    counterText: '',
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                    ),
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

                    // gender
                    Padding(
                        padding: EdgeInsets.only(bottom: 19),
                        child: FractionallySizedBox(
                          widthFactor: 0.833,
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    25)),
                                border:
                                Border.all(color: CustomColors.grey3, width: 1),
                                color: CustomColors.white),
                            child: Container(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 5, right: 5, top: 2),
                                child: TextFormField(
                                  onTap: () {
                                    screenTracker.stopTimer();
                                    screenTracker.startTimer(context);
                                  },
                                  focusNode: isFocus3,
                                  controller: _mailController,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                    ),
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
                        )),

                    widget.isSignUp
                        ? SizedBox()
                        : Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 40, 0),
                          child: Provider
                              .of<UserProvider>(context,
                              listen: false)
                              .isEmailVerified
                              ? GestureDetector(
                            child: Icon(Icons.verified,
                                color: CustomColors.green),
                            onTap: () =>
                                CommonWidgets.showToast(
                                    context,
                                    Strings.emailVerified,
                                    widget.scaffoldKey),
                          )
                              : GestureDetector(
                            child: Icon(Icons.cancel_sharp,
                                color: CustomColors.red),
                            onTap: () =>
                                CommonWidgets.showToast(
                                    context,
                                    Strings.emailNotVerified,
                                    widget.scaffoldKey),
                          ),
                        ),
                      ],
                    ),
                    if (!Provider
                        .of<UserProvider>(context, listen: false)
                        .isEmailVerified)
                      widget.isSignUp
                          ? SizedBox()
                          : Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(40, 5, 40, 20),
                            child: isLoading
                                ? CircularProgressIndicator()
                                : GestureDetector(
                              child: Text('Resend Verification',
                                  style: TextStyle(
                                      color: CustomColors.blue)),
                              onTap: () async {
                                Map jsonMap = {
                                  'email': _mailController.text.trim()
                                };

                                setState(() {
                                  isLoading = true;
                                });
                                mailResponse = await ApiRequest.postApi(
                                    ApiUrl.emailVerification, jsonMap);

                                mailResponseBody = await json
                                    .decode(mailResponse.body);

                                if (mailResponseBody['success']) {
                                  CommonWidgets.showCustomDialog(
                                      context,
                                      Strings.mailSent,
                                      Strings.verificationMail,
                                      showButton: false,
                                      iconData: Icons.check);
                                  setState(() {
                                    isLoading = false;
                                  });
                                } else {
                                  CommonWidgets.showCustomDialog(
                                      context,
                                      'Response',
                                      "${mailResponseBody['message']}",
                                      showButton: false);
                                  setState(() {
                                    isLoading = false;
                                  });
                                }
                              },
                            ),
                          ),
                        ],
                      ),

                    // dob
                    Padding(
                        padding: EdgeInsets.only(bottom: 19),
                        child: FractionallySizedBox(
                          widthFactor: 0.833,
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    25)),
                                border:
                                Border.all(color: CustomColors.grey3, width: 1),
                                color: CustomColors.white),
                            child: Container(
                              child: Container(
                                  width: double.infinity,
                                  child: InkWell(
                                    child: PopupMenuButton(
                                      offset: Offset(0.1, 0),
                                      onSelected: (gender) {
                                        clearFocus(context);
                                        _genderController.text = gender;
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 5, right: 5, top: 2),
                                        child: TextFormField(
                                          onTap: () {
                                            screenTracker.stopTimer();
                                            screenTracker.startTimer(context);
                                          },
                                          controller: _genderController,
                                          enabled: false,
                                          decoration: InputDecoration(
                                            hintText: Strings.gender,
                                            prefixIcon: ImageIcon(
                                              AssetImage(
                                                  "assets/images/ic_gender.png"),
                                              color: CustomColors.grey2,
                                            ),
                                            suffixIcon: IconButton(
                                              icon: ImageIcon(
                                                AssetImage(
                                                    "assets/images/ic_drop_down1.png"),
                                                color: CustomColors.grey2,
                                              ),
                                              onPressed: () {},
                                            ),
                                            border: InputBorder.none,
                                          ),
                                          maxLines: 1,
                                        ),
                                      ),
                                      itemBuilder: (context) =>
                                          Strings.genders
                                              .map((gender) =>
                                              PopupMenuItem(
                                                  value: gender,
                                                  child: Text(gender)))
                                              .toList(),
                                    ),
                                  )),
                            ),
                          ),
                        )),

                    // region
                    Padding(
                        padding: EdgeInsets.only(bottom: 19),
                        child: FractionallySizedBox(
                          widthFactor: 0.833,
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    25)),
                                border:
                                Border.all(color: CustomColors.grey3, width: 1),
                                color: CustomColors.white),
                            child: Container(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 5, right: 5, top: 2),
                                child: Focus(
                                  onFocusChange: (hasFocus) {
                                    setState(() {});
                                  },
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10.0, right: 10),
                                        child: ImageIcon(
                                          AssetImage(
                                              "assets/images/ic_password.png"),
                                          color: CustomColors.grey2,
                                        ),
                                      ),
                                      CustomText(
                                        text: _dobController.text.isEmpty
                                            ? Strings.dob
                                            : _dobController.text,
                                        fontWeight:
                                        FontStyles.semiBoldFontWeight400,
                                        color: _dobController.text.isEmpty
                                            ? Colors.grey
                                            : null,
                                        fontSize: 16,
                                      ),
                                      Spacer(),
                                      IconButton(
                                        icon: ImageIcon(
                                          AssetImage(
                                              "assets/images/ic_calender.png"),
                                          color: CustomColors.grey2,
                                        ),
                                        onPressed: () async {
                                          clearFocus(context);
                                          DateTime date = DateTime(1900);

                                          date = await showDatePicker(
                                              context: context,
                                              initialDate: DateTime(
                                                  DateTime
                                                      .now()
                                                      .year - 22),
                                              firstDate: DateTime(1900),
                                              lastDate: DateTime(
                                                  DateTime
                                                      .now()
                                                      .year - 22));

                                          _dobController.text =
                                          "${date.day}-${date.month}-${date
                                              .year}";
                                          setState(() {});
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )),

                    Padding(
                        padding: EdgeInsets.only(bottom: 19),
                        child: FractionallySizedBox(
                          widthFactor: 0.833,
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    25)),
                                border:
                                Border.all(color: CustomColors.grey3, width: 1),
                                color: CustomColors.white),
                            child: Container(
                              child: Container(
                                  width: double.infinity,
                                  child: PopupMenuButton(
                                    offset: Offset(0.1, 0),
                                    onSelected: (String country) {
                                      Provider.of<LocationProvider>(context,
                                          listen: false)
                                          .getLocations(
                                          countryCode:
                                          country == Strings.eithopia
                                              ? 'ET'
                                              : 'USA');
                                      clearFocus(context);
                                      _cityController.clear();
                                      _weredaController.clear();
                                      _houseController.clear();
                                      _regionController.clear();
                                      _subcityController.clear();
                                      _countryController.text = country;
                                      setState(() {});
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 5, right: 5, top: 2),
                                      child: Focus(
                                        child: TextFormField(
                                          onTap: () {
                                            screenTracker.stopTimer();
                                            screenTracker.startTimer(context);
                                          },
                                          controller: _countryController,
                                          enabled: false,
                                          decoration: InputDecoration(
                                            hintText: Strings.country,
                                            prefixIcon: ImageIcon(
                                              AssetImage(
                                                  "assets/images/location.png"),
                                              color: CustomColors.grey2,
                                            ),
                                            suffixIcon: IconButton(
                                              icon: ImageIcon(
                                                AssetImage(
                                                    "assets/images/ic_drop_down1.png"),
                                                color: CustomColors.grey2,
                                              ),
                                              onPressed: () {},
                                            ),
                                            border: InputBorder.none,
                                          ),
                                          maxLines: 1,
                                        ),
                                      ),
                                    ),
                                    itemBuilder: (context) =>
                                        Strings.countries
                                            .map((country) =>
                                            PopupMenuItem(
                                                value: country,
                                                child: Text(country)))
                                            .toList(),
                                  )),
                            ),
                          ),
                        )),

                    _countryController.text.isNotEmpty
                        ? buildCommonAddress()
                        : Container(),

                    Consumer<EnrollmentProviderUpdate>(
                        builder: (context, value, child) =>
                            CustomButton(
                                ontap: value.isLoading
                                    ? null
                                    : () async {
                                  FocusScope.of(context).unfocus();
                                  if (_fname.text.isEmpty ||
                                      _fname.text.length < 2) {
                                    CommonWidgets.showToast(
                                        context,
                                        _fname.text.isEmpty
                                            ? 'Please add first name'
                                            : 'Please add valid first name',
                                        widget.scaffoldKey);
                                  } else if (_sname.text.isEmpty ||
                                      _sname.text.length < 2) {
                                    CommonWidgets.showToast(
                                        context,
                                        _sname.text.isEmpty
                                            ? 'Please add last name'
                                            : 'Please add valid last name',
                                        widget.scaffoldKey);
                                  } else if (_mailController.text.isEmpty ||
                                      !RegExp(Strings.emailRegExp)
                                          .hasMatch(_mailController.text)) {
                                    CommonWidgets.showToast(
                                        context,
                                        _mailController.text.isEmpty
                                            ? 'Please add email'
                                            : 'Please add valid email',
                                        widget.scaffoldKey);
                                  } else if (_genderController.text.isEmpty) {
                                    CommonWidgets.showToast(context,
                                        'Please add gender',
                                        widget.scaffoldKey);
                                  } else if (_dobController.text.isEmpty) {
                                    CommonWidgets.showToast(context,
                                        'Please add dob', widget.scaffoldKey);
                                  } else if (_countryController.text.isEmpty) {
                                    CommonWidgets.showToast(
                                        context,
                                        'Please select country',
                                        widget.scaffoldKey);
                                  }
                                  // validations for ethiopia
                                  else if (_countryController.text ==
                                      Strings.eithopia) {
                                    if (_regionController.text.isEmpty) {
                                      CommonWidgets.showToast(
                                          context,
                                          'Please add region',
                                          widget.scaffoldKey);
                                    } else {
                                      updateUser(value);
                                    }
                                  } //validations for usa
                                  else if (_countryController.text ==
                                      Strings.usa) {
                                    if (_stateController.text.isEmpty ||
                                        _stateController.text.length < 2) {
                                      CommonWidgets.showToast(
                                          context,
                                          _stateController.text.isEmpty
                                              ? 'Please add state'
                                              : 'Please add valid state',
                                          widget.scaffoldKey);
                                    } else {
                                      updateUser(value);
                                    }
                                  }
                                },
                                buttonText: Strings.next)),
                  ],
                ),
                if (provider.isLoading ||
                    Provider
                        .of<UserProvider>(context, listen: false)
                        .isLoading)
                  CommonWidgets.showLoader(context)
              ],
            ),
      ),
    );
  }

  Column buildCommonAddress() {
    return Column(
      children: [
        Strings.eithopia == _countryController.text
            ? ethiopiaAddress()
            : buildUsAddress()
      ],
    );
  }

  Widget buildUsAddress() {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.only(bottom: 19),
            child: FractionallySizedBox(
              widthFactor: 0.833,
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    border: Border.all(color: CustomColors.grey3, width: 1),
                    color: CustomColors.white),
                child: PopupMenuButton(
                  offset: Offset(0.1, 0),
                  onSelected: (RegionModel region) {
                    clearFocus(context);
                    _cityController.clear();
                    _subcityController.clear();
                    _stateController.clear();
                    _zipCodeController.clear();
                    _stateController.text = region.region;

                    Provider.of<LocationProvider>(context, listen: false)
                        .getCity(regionId: region.regionId);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 5, right: 5, top: 2),
                    child: Focus(
                      child: TextFormField(
                        onTap: () {
                          screenTracker.stopTimer();
                          screenTracker.startTimer(context);
                        },
                        controller: _stateController,
                        enabled: false,
                        decoration: InputDecoration(
                          hintText: Strings.state,
                          prefixIcon: ImageIcon(
                            AssetImage("assets/images/location.png"),
                            color: CustomColors.grey2,
                          ),
                          suffixIcon: IconButton(
                            icon: ImageIcon(
                              AssetImage("assets/images/ic_drop_down1.png"),
                              color: CustomColors.grey2,
                            ),
                            onPressed: () {},
                          ),
                          border: InputBorder.none,
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ),
                  itemBuilder: (context) =>
                      Provider
                          .of<LocationProvider>(context, listen: false)
                          .locationList
                          .map((location) =>
                          PopupMenuItem(
                              value: location, child: Text(location.region)))
                          .toList(),
                ),
              ),
            )),
      ],
    );
  }

  updateUser(EnrollmentProviderUpdate value) async {
    value.isPressed(true);
    var baseImageResponse;
    if (profileImage != null) {
      baseImageResponse = await value.uploadImage(profileImage.path);
      value.isPressed(false);

      if (baseImageResponse.success) {
        var response = await value.updateUserDetail1(
          EnrollStepModel1(
            action: Strings.actionEnroll1,
            enrollmentStep1: EnrollmentStep1(
                profileImage: baseImageResponse.body['data']['url'],
                dob: _dobController.text,
                email: _mailController.text,
                firstName: _fname.text,
                gender: _genderController.text,
                lastName: _sname.text,
                address: UserAddress(
                    groupNumber: '',
                    insuranceCarrier: '',
                    insuredName: '',
                    policyNumber: '',
                    wereda: _weredaController.text ?? '',
                    addressLine1: _address1Controller.text ?? '',
                    addressLine2: _address2Controller.text ?? '',
                    country: _countryController.text,
                    state: _stateController.text ?? "",
                    zipCode: _zipCodeController.text ?? "",
                    region: _regionController.text ?? '',
                    city: _cityController.text ?? '',
                    subCity: _subcityController.text ?? '',
                    houseNo: _houseController.text ?? '')),
          ),
        );

        if (!response.success) {
          CommonWidgets.showToast(
              context, response.message, widget.scaffoldKey);
          await Future.delayed(Duration(milliseconds: 500));
        }

        if (response.success) {
          Provider.of<UserProvider>(context, listen: false).getUser();
          PreferenceUtils.putInt(PreferenceKeys.INDICATOR, 1);
          value.nextPage();
        }
      } else {
        CommonWidgets.showToast(
            context, baseImageResponse.message, widget.scaffoldKey);
      }
    } else {
      value.isPressed(false);

      var response = await value.updateUserDetail1(
        EnrollStepModel1(
          action: Strings.actionEnroll1,
          enrollmentStep1: EnrollmentStep1(
              profileImage: Provider
                  .of<UserProvider>(context, listen: false)
                  .profileImage,
              //  page: _page.text,
              dob: _dobController.text,
              email: _mailController.text,
              firstName: _fname.text,
              gender: _genderController.text,
              lastName: _sname.text,
              address: UserAddress(
                  groupNumber: '',
                  insuranceCarrier: '',
                  insuredName: '',
                  policyNumber: '',
                  wereda: _weredaController.text ?? '',
                  addressLine1: _address1Controller.text ?? '',
                  addressLine2: _address2Controller.text ?? '',
                  country: _countryController.text,
                  state: _stateController.text ?? "",
                  zipCode: _zipCodeController.text ?? "",
                  region: _regionController.text ?? '',
                  city: _cityController.text ?? '',
                  subCity: _subcityController.text ?? '',
                  houseNo: _houseController.text ?? '')),
        ),
      );
      if (!response.success) {
        CommonWidgets.showToast(context, response.message, widget.scaffoldKey);
        await Future.delayed(Duration(milliseconds: 500));
      }

      if (response.success) {
        Provider.of<UserProvider>(context, listen: false).getUser();
        PreferenceUtils.putInt(PreferenceKeys.INDICATOR, 1);

        value.nextPage();
      }
    }
  }

  clearFocus(BuildContext context) {
    FocusManager.instance.primaryFocus.unfocus();
  }

  Widget ethiopiaAddress() {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.only(bottom: 19),
            child: FractionallySizedBox(
              widthFactor: 0.833,
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    border: Border.all(color: CustomColors.grey3, width: 1),
                    color: CustomColors.white),
                child: PopupMenuButton(
                  offset: Offset(0.1, 0),
                  onSelected: (RegionModel region) {
                    clearFocus(context);
                    _cityController.clear();
                    _subcityController.clear();
                    _stateController.clear();
                    _zipCodeController.clear();
                    _regionController.text = region.region;

                    Provider.of<LocationProvider>(context, listen: false)
                        .getCity(regionId: region.regionId);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 5, right: 5, top: 2),
                    child: Focus(
                      child: TextFormField(
                        onTap: () {
                          screenTracker.stopTimer();
                          screenTracker.startTimer(context);
                        },
                        controller: _regionController,
                        enabled: false,
                        decoration: InputDecoration(
                          hintText: Strings.region,
                          prefixIcon: ImageIcon(
                            AssetImage("assets/images/location.png"),
                            color: CustomColors.grey2,
                          ),
                          suffixIcon: IconButton(
                            icon: ImageIcon(
                              AssetImage("assets/images/ic_drop_down1.png"),
                              color: CustomColors.grey2,
                            ),
                            onPressed: () {},
                          ),
                          border: InputBorder.none,
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ),
                  itemBuilder: (context) =>
                      Provider
                          .of<LocationProvider>(context, listen: false)
                          .locationList
                          .map((location) =>
                          PopupMenuItem(
                              value: location, child: Text(location.region)))
                          .toList(),
                ),
              ),
            )),
      ],
    );
  }
}

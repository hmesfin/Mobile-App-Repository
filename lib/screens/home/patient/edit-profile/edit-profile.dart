import 'package:flutter/scheduler.dart';
import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/utils/common-helper.dart';
import 'package:http/http.dart' as http;
import 'package:virtudoc_app/utils/screen_tracker/screen_tracker.dart';
/*
The file is covered under Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. Please review the license for full details.

This program is not free software: You cannot redistribute it for any use under the terms of the Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. However the source can be modified and updated for the working of the application Design & Development of Mobile Application for “Abyssinia Technology Group” for which it was licensed.
*/

class EditProfile extends StatefulWidget {
  final String firstname;
  final String lastname;
  final String email;
  final Biometrics biometrics;
  final bool isSignUp;

  EditProfile({@required this.biometrics,
    @required this.email,
    @required this.firstname,
    @required this.lastname,
    this.isSignUp = false});

  @override
  State<StatefulWidget> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  AppBar appBar = AppBar();
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  var _fnameController = TextEditingController();
  var _lnameController = TextEditingController();
  var _mailController = TextEditingController();
  var _genderController = TextEditingController();
  var _dobController = TextEditingController();
  var _heightController = TextEditingController();
  var _weightController = TextEditingController();
  var _unitController = TextEditingController();
  var _medicationAllergyontroller = TextEditingController();
  String image = '';
  FocusNode weightNode = FocusNode();
  FocusNode heightNode = FocusNode();
  File profileImage;
  String userImagePath = '';
  bool issaving = false;

  // bool isEmailVerified = false;

  Response mailResponse;
  bool isLoading = false;

  var mailResponseBody;

  @override
  void initState() {
    super.initState();
    _unitController.text = widget.biometrics.unit;

    _dobController.text = widget.biometrics?.dob ?? 'N.A.';
    _genderController.text = widget.biometrics?.gender ?? 'N.A.';
    _fnameController.text = widget.firstname;
    _lnameController.text = widget.lastname;
    _mailController.text = widget.email;
    _heightController.text = widget.biometrics?.height.toString();
    _weightController.text = widget.biometrics.weight.toString();
    image = widget.biometrics.profileImage;
    _medicationAllergyontroller.text = widget.biometrics.medicationAllergy;
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Provider.of<UserProvider>(context, listen: false).getUser();
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
        key: _scaffoldKey,
        backgroundColor: CustomColors.bg_app,
        body: _buildWidget(context),
      ),
    );
  }

  Widget _buildWidget(BuildContext context) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    return ListView(children: [
      Container(
        width: screenWidth,
        decoration: BoxDecoration(
          color: CustomColors.bg_app,
        ),
        child: Stack(
          children: [
            Column(
              children: <Widget>[
                CustomTopBar(
                  context: context,
                  titleText: Strings.update_profile,
                ),
                userBiometric(),
              ],
            ),
            issaving
                ? Container(
              height: CommonWidgets().getHeight(context) + 100,
              color: Colors.black12,
              child: Center(child: CircularProgressIndicator()),
            )
                : Container()
          ],
        ),
      ),
    ]);
  }

  Column userInfo() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 19),
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
                    onTap: () {
                      screenTracker.stopTimer();
                      screenTracker.startTimer(context);
                    },
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
            padding: EdgeInsets.only(bottom: 19),
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
                      onTap: () {
                        screenTracker.stopTimer();
                        screenTracker.startTimer(context);
                      },
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
        Wrap(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 5, left: 8),
              child: FractionallySizedBox(
                widthFactor: 0.73,
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
                        onTap: () {
                          screenTracker.stopTimer();
                          screenTracker.startTimer(context);
                        },
                        controller: _mailController,
                        keyboardType: TextInputType.emailAddress,
                        enabled: PreferenceUtils.getBool(
                            PreferenceKeys.IS_SOCIAL_LOGIN)
                            ? false
                            : true,
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
          ],
        ),

        widget.isSignUp
            ? SizedBox()
            : Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(10, 5, 50, 10),
              child: Provider.of<UserProvider>(context, listen: true)
                  .getIsEmailVerified()
                  ? GestureDetector(
                child:
                Icon(Icons.verified, color: CustomColors.green),
                onTap: () =>
                    CommonWidgets.showToast(
                        context, Strings.emailVerified, _scaffoldKey),
              )
                  : GestureDetector(
                child: Icon(Icons.cancel_sharp,
                    color: CustomColors.red),
                onTap: () =>
                    CommonWidgets.showToast(context,
                        Strings.emailNotVerified, _scaffoldKey),
              ),
            ),
          ],
        ),
        if (!Provider.of<UserProvider>(context, listen: true)
            .getIsEmailVerified())
          widget.isSignUp
              ? SizedBox(
            height: 20,
          )
              : Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(40, 5, 50, 15),
                child: isLoading
                    ? CircularProgressIndicator()
                    : GestureDetector(
                  child: Text(Strings.resendVerification,
                      style: TextStyle(color: CustomColors.blue)),
                  onTap: () async {
                    Map<String, String> jsonMap = {
                      'email': _mailController.text.trim()
                    };
                    setState(() {
                      isLoading = true;
                    });
                    mailResponse = await ApiRequest.postApi(
                        ApiUrl.emailVerification, jsonMap);
                    //print(mailResponse.body);

                    mailResponseBody =
                    await json.decode(mailResponse.body);
                    //print(mailResponseBody);
                    if (mailResponseBody['success']) {
                      CommonWidgets.showCustomDialog(
                          context,
                          Strings.mailSent,
                          Strings.verificationMail,
                          showButton: false,
                          iconData: Icons.check);
                      Provider.of<UserProvider>(context,
                          listen: false)
                          .getUser();
                      setState(() {
                        isLoading = false;
                      });
                    } else {
                      Provider.of<UserProvider>(context,
                          listen: false)
                          .getUser();
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
      ],
    );
  }

  Widget userBiometric() {
    return Column(
      children: <Widget>[
        Container(
          width: 100,
          height: 100,
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              border: Border.all(color: CustomColors.blue3, width: 1),
              color: CustomColors.white),
          child: Stack(
            children: <Widget>[
              profileImage == null
                  ? CommonWidgets.userImgeLoader(imageUrl: image, size: 100)
                  : Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: CustomColors.blue3, width: 1),
                  color: CustomColors.white,
                ),
                child: CircleAvatar(
                  backgroundImage: new FileImage(profileImage),
                  radius: 200.0,
                ),
              ),
              InkWell(
                onTap: () async {
                  var image = await CommonWidgets.getPhoto(context);

                  profileImage = image;
                  setState(() {});
                },
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        border: Border.all(color: CustomColors.grey1, width: 1),
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

        userInfo(),
        Padding(
          padding: EdgeInsets.only(bottom: 19, top: 7),
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
                child: Container(
                    width: double.infinity,
                    child: PopupMenuButton(
                      offset: Offset(0.1, 0),
                      onSelected: (gender) {
                        clearFocus();
                        _genderController.text = gender;
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 5, right: 5, top: 2),
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
                              AssetImage("assets/images/ic_gender.png"),
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
                      itemBuilder: (context) =>
                          Strings.genders
                              .map((gender) =>
                              PopupMenuItem(value: gender, child: Text(gender)))
                              .toList(),
                    )),
              ),
            ),
          ),
        ),
        // Rounded Rectangle 1
        Padding(
            padding: EdgeInsets.only(bottom: 19),
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
                    child: Focus(
                      onFocusChange: (hasFocus) {
                        setState(() {});
                      },
                      child: Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            alignment: Alignment.centerLeft,
                            child: ImageIcon(
                              AssetImage("assets/images/ic_password.png"),
                              color: CustomColors.grey2,
                            ),
                          ),
                          Container(
                            alignment: Alignment(-0.6, 0),
                            child: CustomText(
                              text: _dobController.text,
                              fontWeight:
                              _dobController.text == "    dd-mm-yyyy"
                                  ? FontStyles.regularFontWeight300
                                  : FontStyles.semiBoldFontWeight400,
                              fontSize: 16,
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              icon: ImageIcon(
                                AssetImage("assets/images/ic_calender.png"),
                                color: CustomColors.grey2,
                              ),
                              onPressed: () async {
                                clearFocus();
                                DateTime date = DateTime(1900);
                                date = await showDatePicker(
                                    context: context,
                                    initialDate:
                                    DateTime(DateTime
                                        .now()
                                        .year - 18),
                                    firstDate: DateTime(1900),
                                    lastDate:
                                    DateTime(DateTime
                                        .now()
                                        .year - 18));

                                _dobController.text =
                                "${date.day}-${date.month}-${date.year}";

                                setState(() {});
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )),

        // Rounded Rectangle 1
        Padding(
          padding: EdgeInsets.only(top: 18, bottom: 19),
          child: FractionallySizedBox(
            widthFactor: 0.45,
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  border: Border.all(color: CustomColors.grey3, width: 1),
                  color: CustomColors.white),
              child: Container(
                child: Container(
                    width: double.infinity,
                    child: InkWell(
                      child: PopupMenuButton(
                        offset: Offset(0.1, 0),
                        onSelected: (unit) {
                          clearFocus();

                          //unit conversion logic
                          // if (_heightController.text.isNotEmpty &&
                          //     _weightController.text.isNotEmpty) {
                          //   if (_unitController.text == Strings.imperial &&
                          //       unit == Strings.metric) {
                          //     double height =
                          //         int.parse(_heightController.text) * 2.54;
                          //     double weight =
                          //         double.parse(_weightController.text) *
                          //             0.453592;

                          //     _heightController.text =
                          //         height.toInt().toString();
                          //     _weightController.text =
                          //         weight.toInt().toString();
                          //   } else if (_unitController.text == Strings.metric &&
                          //       unit == Strings.imperial) {
                          //     double height =
                          //         double.parse(_heightController.text) / 2.54;
                          //     double weight =
                          //         double.parse(_weightController.text) /
                          //             0.453592;

                          //     _heightController.text =
                          //         height.toInt().toString();
                          //     _weightController.text =
                          //         weight.toInt().toString();
                          //   }
                          // }
                          setState(() {});
                          _unitController.text = unit;
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: 5, right: 5, top: 2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Scale:",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                _unitController.text,
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              Icon(Icons.keyboard_arrow_down,
                                  color: Colors.grey),
                            ],
                          ),
                        ),
                        itemBuilder: (context) =>
                            Strings.unitList
                                .map((unit) =>
                                PopupMenuItem(value: unit, child: Text(unit)))
                                .toList(),
                      ),
                    )),
              ),
            ),
          ),
        ),
        Padding(
            padding: EdgeInsets.only(bottom: 19),
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
                    child: Focus(
                      onFocusChange: (hasFocus) {
                        setState(() {
                          // isWeightFocused = hasFocus;
                        });
                      },
                      child: TextFormField(
                        onTap: () {
                          screenTracker.stopTimer();
                          screenTracker.startTimer(context);
                        },
                        maxLength: 5,
                        focusNode: weightNode,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        controller: _weightController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          counterText: '',
                          hintText: _unitController.text == Strings.metric
                              ? Strings.weight + ' in kgs'
                              : Strings.weight + ' in lbs',
                          prefixIcon: ImageIcon(
                            AssetImage("assets/images/ic_weight.png"),
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
            )),
        // Rounded Rectangle 1
        Padding(
            padding: EdgeInsets.only(bottom: 19),
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
                    child: Focus(
                      onFocusChange: (hasFocus) {
                        setState(() {
                          // isHeightFocused = hasFocus;
                        });
                      },
                      child: TextFormField(
                        onTap: () {
                          screenTracker.stopTimer();
                          screenTracker.startTimer(context);
                        },
                        // focusNode: _heightFocus,
                        controller: _heightController,
                        maxLength: 5,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          counterText: '',
                          hintText: _unitController.text == Strings.metric
                              ? Strings.height + ' in cms'
                              : Strings.height + ' in In',
                          prefixIcon: ImageIcon(
                            AssetImage("assets/images/ic_height.png"),
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
            )),

        Padding(
          padding: EdgeInsets.only(bottom: 19),
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
                    onTap: () {
                      screenTracker.stopTimer();
                      screenTracker.startTimer(context);
                    },
                    controller: _medicationAllergyontroller,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^[\a-zA-Z0-9, ]*'))
                    ],
                    decoration: InputDecoration(
                      hintText: Strings.medicationAllergy,
                      prefixIcon: ImageIcon(
                        AssetImage(
                          "assets/images/profile.png",
                        ),
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

        // Rounded Rectangle 4
        Padding(
            padding: EdgeInsets.only(top: 5),
            child: SizedBox(
              width: 200,
              height: 48,
              child: RaisedButton(
                child: // CONTINUE
                Text(Strings.next,
                    style: const TextStyle(
                      color: CustomColors.white,
                      fontWeight: FontStyles.semiBoldFontWeight500,
                      fontFamily: "Roboto",
                      package: 'assets/fonts/Roboto-Medium',
                      fontStyle: FontStyle.normal,
                      fontSize: FontStyles.medium,
                    ),
                    textAlign: TextAlign.center),
                onPressed: issaving
                    ? null
                    : () async {
                  FocusScope.of(context).unfocus();

                  if (_fnameController.text == '') {
                    CommonWidgets.showToast(context,
                        'Please enter first name.', _scaffoldKey);
                  } else if (_fnameController.text.length < 2) {
                    CommonWidgets.showToast(
                        context,
                        'First name should have atleast 2 character.',
                        _scaffoldKey);
                  } else if (_fnameController.text.length > 15) {
                    CommonWidgets.showToast(
                        context,
                        'First name should be less than 15 characters.',
                        _scaffoldKey);
                  } else if (_lnameController.text == '') {
                    CommonWidgets.showToast(
                        context, 'Please enter last name.', _scaffoldKey);
                  } else if (_lnameController.text.length < 2) {
                    CommonWidgets.showToast(
                        context,
                        'Last name should have atleast 2 character.',
                        _scaffoldKey);
                  } else if (_lnameController.text.length > 15) {
                    CommonWidgets.showToast(
                        context,
                        'Last name should be less than 15 characters.',
                        _scaffoldKey);
                  } else if (_mailController.text == '') {
                    CommonWidgets.showToast(
                        context, 'Please enter email.', _scaffoldKey);
                  } else if (validateEmail(_mailController.text)) {
                    CommonWidgets.showToast(context,
                        'Please enter a valid email.', _scaffoldKey);
                  } else if (_genderController.text.isEmpty) {
                    CommonWidgets.showToast(
                        context, 'Please enter gender', _scaffoldKey);
                  } else if (_dobController.text.isEmpty ||
                      _dobController.text == "    dd-mm-yyyy") {
                    CommonWidgets.showToast(
                        context, 'Please enter dob', _scaffoldKey);
                  } else if (_weightController.text.isEmpty ||
                      _weightController.text.length < 2) {
                    CommonWidgets.showToast(
                        context,
                        _weightController.text.isEmpty
                            ? 'Please enter weight'
                            : 'Please enter valid weight',
                        _scaffoldKey);
                  } else if (double.parse(_weightController.text) < 0 ||
                      double.parse(_weightController.text) == 0) {
                    CommonWidgets.showToast(
                        context,
                        int.parse(_weightController.text) == 0
                            ? "Weight can't be 0"
                            : "Weight can't be negative",
                        _scaffoldKey);
                  } else if (_heightController.text.isEmpty ||
                      _heightController.text.length < 2) {
                    CommonWidgets.showToast(
                        context,
                        _heightController.text.isEmpty
                            ? 'Please enter height'
                            : 'Please enter valid height',
                        _scaffoldKey);
                  } else if (double.parse(_heightController.text) < 0 ||
                      double.parse(_heightController.text) == 0) {
                    CommonWidgets.showToast(
                        context,
                        int.parse(_heightController.text) == 0
                            ? "Height can't be 0"
                            : "Height can't be negative",
                        _scaffoldKey);
                  } else if (_medicationAllergyontroller.text
                      .trim()
                      .isEmpty) {
                    CommonWidgets.showToast(
                        context,
                        Strings.pleaseEnter(Strings.medicationAllergy),
                        _scaffoldKey);
                  } else if (_medicationAllergyontroller.text.length <
                      3) {
                    CommonWidgets.showToast(
                        context,
                        Strings.pleaseEnter(
                            "valid " + Strings.medicationAllergy),
                        _scaffoldKey);
                  } else if (_medicationAllergyontroller.text.length >
                      250) {
                    CommonWidgets.showToast(
                        context,
                        Strings.pleaseEnter(Strings.medicationAllergy +
                            " can't be longer than 250 characters"),
                        _scaffoldKey);
                  } else {
                    setState(() {
                      issaving = true;
                    });

                    Map<String, dynamic> data = {
                      "action": "about_me",
                      "about_me": {
                        "first_name": _fnameController.text.toString(),
                        "last_name": _lnameController.text.toString(),
                        "email": _mailController.text.toString(),
                      }
                    };

                    var res = await ApiRequest.postApi(
                        ApiUrl.updateDetails, data);
                    Map resBody = await json.decode(res.body);
                    if (resBody.containsKey('error')) {
                      setState(() {
                        issaving = false;
                      });

                      CommonWidgets.showToast(
                          context,
                          resBody['error']['message'].toString(),
                          _scaffoldKey);
                    } else if (resBody['success'] == false) {
                      issaving = false;
                      setState(() {});
                      CommonWidgets.showToast(
                          context, resBody['message'], _scaffoldKey);
                    } else {
                      if (profileImage != null) {
                        var responseImage = await BasicModelProvider()
                            .uploadImage(profileImage.path)
                            .catchError((onError) {
                          setState(() {
                            issaving = false;
                          });

                          CommonWidgets.showToast(context,
                              Strings.errorUploadingImage, _scaffoldKey);
                        });
                        setState(() {
                          issaving = false;
                        });
                        if (responseImage != null) {
                          if (responseImage.success) {
                            var response = await BasicModelProvider()
                                .updateUserDetials(
                              BasicModel(
                                action: Strings.actionBiometrics,
                                biometrics: Biometrics(
                                    dob: _dobController.text,
                                    gender: _genderController.text,
                                    height:
                                    int.parse(_heightController.text),
                                    profileImage:
                                    responseImage.body['data']['url'],
                                    weight:
                                    int.parse(_weightController.text),
                                    unit: _unitController.text,
                                    medicationAllergy:
                                    _medicationAllergyontroller.text),
                              ),
                            );
                            setState(() {
                              issaving = false;
                            });
                            if (response.success) {
                              Provider.of<UserProvider>(context,
                                  listen: false)
                                  .getUser();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        PersonalHistory(
                                          isupdating: true,
                                          personalModel:
                                          Provider
                                              .of<UserProvider>(
                                              context,
                                              listen: false)
                                              .personalModel,
                                        )),
                              );
                            }
                          } else {
                            CommonWidgets.showToast(context,
                                responseImage.message, _scaffoldKey);
                          }
                        } else {
                          CommonWidgets.showToast(
                              context, Strings.noResponse, _scaffoldKey);
                        }
                      } else {
                        var response =
                        await BasicModelProvider().updateUserDetials(
                          BasicModel(
                            action: Strings.actionBiometrics,
                            biometrics: Biometrics(
                                dob: _dobController.text,
                                gender: _genderController.text,
                                height: int.parse(_heightController.text),
                                profileImage: image,
                                weight: int.parse(_weightController.text),
                                unit: _unitController.text,
                                medicationAllergy:
                                _medicationAllergyontroller.text),
                          ),
                        );
                        if (!response.success)
                          CommonWidgets.showToast(
                              context, response.message, _scaffoldKey);
                        if (response.success) {
                          setState(() {
                            issaving = false;
                          });
                          Provider.of<UserProvider>(context,
                              listen: false)
                              .getUser();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    PersonalHistory(
                                      isupdating: true,
                                      personalModel:
                                      Provider
                                          .of<UserProvider>(
                                          context,
                                          listen: false)
                                          .personalModel,
                                    )),
                          );
                        }
                      }
                    }
                  }
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(24.0)),
                color: CustomColors.yellow1,
              ),
            )),
        SizedBox(
          height: 20,
        )
      ],
    );
  }

  clearControllers() {
    _fnameController.clear();
    _fnameController.clear();
    _mailController.clear();
    _genderController.clear();
    _dobController.clear();
    _heightController.clear();
    _weightController.clear();
    _medicationAllergyontroller.clear();
    profileImage = null;
  }

  clearFocus() {
    FocusManager.instance.primaryFocus.unfocus();
  }
}

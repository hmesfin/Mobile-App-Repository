import 'package:flutter/scheduler.dart';
import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/utils/screen_tracker/screen_tracker.dart';

class SignUpScreen extends StatefulWidget {
  final bool isUpdating;
  SignUpScreen({this.isUpdating = false});

  @override
  State<StatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isDobFocused = false;
  bool isGenderFocused = false;
  bool isHeightFocused = false;
  bool isWeightFocused = false;
  String dropdownValue = "Male";
  File profileImage;
  String userImagePath = '';

  var _scaffoldKey = GlobalKey<ScaffoldState>();

  var _genderController = TextEditingController();
  var _dobController = TextEditingController();
  var _heightController = TextEditingController();
  var _weightController = TextEditingController();
  var _unitController = TextEditingController(text: Strings.metric);
  var _medicationAllergyontroller = TextEditingController();
  FocusNode weightNode = FocusNode();
  FocusNode heightNode = FocusNode();

  // final FocusNode _weightFocus = FocusNode();

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      Provider.of<BasicModelProvider>(context, listen: false)
          .checkActive(context);
    });
    // _dobController.text = "${date.day}-${date.month}-${date.year}";

    if (PreferenceUtils.getString(PreferenceKeys.DOB).length > 0) {
      _dobController.text = PreferenceUtils.getString(PreferenceKeys.DOB);
    } else {
      _dobController.text = "    dd-mm-yyyy";
    }
    if (PreferenceUtils.getString(PreferenceKeys.GENDER).length > 0) {
      _genderController.text = PreferenceUtils.getString(PreferenceKeys.GENDER);
    } else {
      _dobController.text = "    dd-mm-yyyy";
    }
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

  _buildWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<BasicModelProvider>(
        builder: (context, provider, child) => Stack(
          children: [
            Column(
              children: <Widget>[
                CustomTopBar(
                  context: context,
                  titleText: Strings.profile_info,
                  custonBackButton:
                      Provider.of<BasicModelProvider>(context, listen: false)
                          .isBackactive,
                ),
                !widget.isUpdating
                    ? Padding(
                        padding: EdgeInsets.only(top: 24, bottom: 27),
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

                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      border: Border.all(color: CustomColors.blue3, width: 1),
                      color: CustomColors.white),
                  child: Stack(
                    children: <Widget>[
                      (PreferenceUtils.getString(PreferenceKeys.PROFILE_IMAGE)
                                      .length ==
                                  0 ||
                              profileImage != null)
                          ? (profileImage == null
                              ? Container()
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
                                    backgroundImage:
                                        new FileImage(profileImage),
                                    radius: 200.0,
                                  ),
                                ))
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
                                child: CommonWidgets.userImgeLoader(
                                    imageUrl: PreferenceUtils.getString(
                                        PreferenceKeys.PROFILE_IMAGE)),
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

                // Rounded Rectangle 1
                Padding(
                  padding: EdgeInsets.only(top: 18, bottom: 19),
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
                        child: Container(
                            width: double.infinity,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  isGenderFocused = true;
                                });
                              },
                              child: PopupMenuButton(
                                offset: Offset(0.1, 0),
                                onSelected: (gender) {
                                  clearFocus();
                                  _genderController.text = gender;
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 5, right: 5, top: 2),
                                  child: Focus(
                                    onFocusChange: (hasFocus) {
                                      setState(() {});
                                    },
                                    child: TextFormField(
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
                                ),
                                itemBuilder: (context) => Strings.genders
                                    .map((gender) => PopupMenuItem(
                                        value: gender, child: Text(gender)))
                                    .toList(),
                              ),
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
                              child: Stack(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    alignment: Alignment.centerLeft,
                                    child: ImageIcon(
                                      AssetImage(
                                          "assets/images/ic_password.png"),
                                      color: CustomColors.grey2,
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment(-0.6, 0),
                                    child: CustomText(
                                      text: _dobController.text,
                                      fontWeight: _dobController.text ==
                                              "    dd-mm-yyyy"
                                          ? FontStyles.regularFontWeight300
                                          : FontStyles.semiBoldFontWeight400,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    child: IconButton(
                                      icon: ImageIcon(
                                        AssetImage(
                                            "assets/images/ic_calender.png"),
                                        color: CustomColors.grey2,
                                      ),
                                      onPressed: () async {
                                        clearFocus();
                                        DateTime date = DateTime(1900);
                                        date = await showDatePicker(
                                            context: context,
                                            initialDate: DateTime(
                                                DateTime.now().year - 18),
                                            firstDate: DateTime(1900),
                                            lastDate: DateTime(
                                                DateTime.now().year - 18));

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
                          border:
                              Border.all(color: CustomColors.grey3, width: 1),
                          color: CustomColors.white),
                      child: Container(
                        child: Container(
                            width: double.infinity,
                            child: InkWell(
                              child: PopupMenuButton(
                                offset: Offset(0.1, 0),
                                onSelected: (unit) {
                                  clearFocus();
                                  // unit conversion logic
                                  // if (_heightController.text.isNotEmpty &&
                                  //     _weightController.text.isNotEmpty) {
                                  //   if (_unitController.text ==
                                  //           Strings.imperial &&
                                  //       unit == Strings.metric) {
                                  //     double height =
                                  //         int.parse(_heightController.text) *
                                  //             2.54;
                                  //     double weight =
                                  //         double.parse(_weightController.text) *
                                  //             0.453592;

                                  //     _heightController.text =
                                  //         height.toInt().toString();
                                  //     _weightController.text =
                                  //         weight.toInt().toString();
                                  //   } else if (_unitController.text ==
                                  //           Strings.metric &&
                                  //       unit == Strings.imperial) {
                                  //     double height =
                                  //         double.parse(_heightController.text) /
                                  //             2.54;
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
                                  padding: EdgeInsets.only(
                                      left: 5, right: 5, top: 2),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
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
                                itemBuilder: (context) => Strings.unitList
                                    .map((unit) => PopupMenuItem(
                                        value: unit, child: Text(unit)))
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
                            border:
                                Border.all(color: CustomColors.grey3, width: 1),
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
                                maxLength: 5,
                                focusNode: weightNode,
                                controller: _weightController,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: InputDecoration(
                                  counterText: '',
                                  hintText:
                                      _unitController.text == Strings.metric
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
                            border:
                                Border.all(color: CustomColors.grey3, width: 1),
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
                                  hintText:
                                      _unitController.text == Strings.metric
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
                          border:
                              Border.all(color: CustomColors.grey3, width: 1),
                          color: CustomColors.white),
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.only(left: 5, right: 5, top: 2),
                          child: TextFormField(
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
                    padding: EdgeInsets.only(top: 20),
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
                        onPressed: provider.isPressed
                            ? null
                            : () async {
                                FocusScope.of(context).unfocus();

                                // if (profileImage == null &&
                                //     PreferenceUtils.getString(
                                //                 PreferenceKeys.PROFILE_IMAGE)
                                //             .length ==
                                //         0) {
                                //   CommonWidgets.showToast(
                                //       context, 'Please add profile image');
                                // } else
                                if (_genderController.text.isEmpty) {
                                  CommonWidgets.showToast(context,
                                      'Please enter gender', _scaffoldKey);
                                } else if (_dobController.text.isEmpty ||
                                    _dobController.text == "    dd-mm-yyyy") {
                                  CommonWidgets.showToast(context,
                                      'Please enter dob', _scaffoldKey);
                                } else if (_weightController.text.isEmpty ||
                                    _weightController.text.length < 2) {
                                  CommonWidgets.showToast(
                                      context,
                                      _weightController.text.isEmpty
                                          ? 'Please enter weight'
                                          : 'Please enter valid weight',
                                      _scaffoldKey);
                                } else if (double.parse(
                                            _weightController.text) <
                                        0 ||
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
                                } else if (double.parse(
                                            _heightController.text) <
                                        0 ||
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
                                      Strings.pleaseEnter(
                                          Strings.medicationAllergy),
                                      _scaffoldKey);
                                } else if (_medicationAllergyontroller
                                        .text.length <
                                    3) {
                                  CommonWidgets.showToast(
                                      context,
                                      Strings.pleaseEnter(
                                          "valid " + Strings.medicationAllergy),
                                      _scaffoldKey);
                                } else if (_medicationAllergyontroller
                                        .text.length >
                                    250) {
                                  CommonWidgets.showToast(
                                      context,
                                      Strings.pleaseEnter(Strings
                                              .medicationAllergy +
                                          " can't be longer than 250 characters"),
                                      _scaffoldKey);
                                } else {
                                  provider.savePressed(true);

                                  if (profileImage != null) {
                                    var responseImage =
                                        await BasicModelProvider()
                                            .uploadImage(profileImage.path)
                                            .catchError((onError) {
                                      provider.savePressed(false);

                                      CommonWidgets.showToast(
                                          context,
                                          Strings.errorUploadingImage,
                                          _scaffoldKey);
                                    });
                                    provider.savePressed(false);
                                    if (responseImage != null) {
                                      if (responseImage.success) {
                                        var response =
                                            await BasicModelProvider()
                                                .updateUserDetials(
                                          BasicModel(
                                            action: Strings.actionBiometrics,
                                            biometrics: Biometrics(
                                                dob: _dobController.text,
                                                gender: _genderController.text,
                                                height: int.parse(
                                                    _heightController.text),
                                                profileImage: responseImage
                                                    .body['data']['url'],
                                                weight: int.parse(
                                                    _weightController.text),
                                                unit: _unitController.text,
                                                medicationAllergy:
                                                    _medicationAllergyontroller
                                                        .text),
                                          ),
                                        );
                                        if (!response.success)
                                          CommonWidgets.showToast(context,
                                              response.message, _scaffoldKey);
                                        if (response.success) {
                                          // clearControllers();

                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PersonalHistory()),
                                          );
                                        }
                                      } else {
                                        CommonWidgets.showToast(
                                            context,
                                            responseImage.message,
                                            _scaffoldKey);
                                      }
                                    } else {
                                      CommonWidgets.showToast(context,
                                          Strings.noResponse, _scaffoldKey);
                                    }
                                  } else if (PreferenceUtils.getString(
                                              PreferenceKeys.PROFILE_IMAGE)
                                          .length !=
                                      0) {
                                    provider.savePressed(true);
                                    var response = await BasicModelProvider()
                                        .updateUserDetials(
                                      BasicModel(
                                        action: Strings.actionBiometrics,
                                        biometrics: Biometrics(
                                            dob: _dobController.text,
                                            gender: _genderController.text,
                                            height: int.parse(
                                                _heightController.text),
                                            profileImage:
                                                PreferenceUtils.getString(
                                                    PreferenceKeys
                                                        .PROFILE_IMAGE),
                                            weight: int.parse(
                                                _weightController.text),
                                            unit: _unitController.text,
                                            medicationAllergy:
                                                _medicationAllergyontroller
                                                    .text),
                                      ),
                                    );
                                    provider.savePressed(false);
                                    if (!response.success)
                                      CommonWidgets.showToast(context,
                                          response.message, _scaffoldKey);
                                    if (response.success) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PersonalHistory()),
                                      );
                                    }
                                  } else {
                                    var response = await BasicModelProvider()
                                        .updateUserDetials(
                                      BasicModel(
                                        action: Strings.actionBiometrics,
                                        biometrics: Biometrics(
                                            dob: _dobController.text,
                                            gender: _genderController.text,
                                            height: int.parse(
                                                _heightController.text),
                                            profileImage: '',
                                            weight: int.parse(
                                                _weightController.text),
                                            unit: _unitController.text,
                                            medicationAllergy:
                                                _medicationAllergyontroller
                                                    .text),
                                      ),
                                    );
                                    if (!response.success)
                                      CommonWidgets.showToast(context,
                                          response.message, _scaffoldKey);
                                    if (response.success) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PersonalHistory()),
                                      );
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
            ),
            if (provider.isPressed) CommonWidgets.showLoader(context)
          ],
        ),
      ),
    );
  }

  void clearControllers() {
    _genderController.clear();
    _dobController.clear();
    _heightController.clear();
    _weightController.clear();
  }

  clearFocus() {
    FocusManager.instance.primaryFocus.unfocus();
  }
}

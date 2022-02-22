import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:virtudoc_app/custom-widgets/custom_button.dart';
import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/screens/home/doctor/enrollment-details-update/enrollment-provider-update.dart';

import 'package:virtudoc_app/screens/location/issuing_country_model.dart';
import 'package:virtudoc_app/utils/custom-colors.dart';
import 'package:virtudoc_app/utils/screen_tracker/screen_tracker.dart';
import 'package:virtudoc_app/utils/strings.dart';

class EnrollMent2Update extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const EnrollMent2Update({Key key, @required this.scaffoldKey})
      : super(key: key);

  @override
  _EnrollMent2State createState() => _EnrollMent2State();
}

class _EnrollMent2State extends State<EnrollMent2Update> {
  bool isDobFocused = false;
  bool isGenderFocused = false;
  bool isHeightFocused = false;
  bool isWeightFocused = false;

  List<String> stateLicencedToPractice = [];
  List<String> countryLicencedPractice = [];
  List<String> languageSpoken = [];

  var _experienceController = TextEditingController();

  var _socialsecuritynumberController = TextEditingController();
  var _driverlicenseController = TextEditingController();
  var _issuingcountryController = TextEditingController();

  var _usdeaController = TextEditingController();
  var _countrylicensedController = TextEditingController();
  var _additionalController = TextEditingController();
  var _postgradController = TextEditingController();
  var _undergradController = TextEditingController();
  bool showDropdown = false;

  FocusNode isFocus1 = FocusNode();
  FocusNode isFocus2 = FocusNode();
  FocusNode isFocus3 = FocusNode();
  FocusNode isFocus4 = FocusNode();
  FocusNode isFocus5 = FocusNode();

  var _issuingstateController = TextEditingController();

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (Provider
          .of<UserProvider>(context, listen: false)
          .enrollmentInformation !=
          null) {
        _experienceController.text =
        (Provider
            .of<UserProvider>(context, listen: false)
            .enrollmentInformation
            .yearsOfExperience ==
            0)
            ? null
            : Provider
            .of<UserProvider>(context, listen: false)
            .enrollmentInformation
            .yearsOfExperience
            .toString();

        _usdeaController.text =
            Provider
                .of<UserProvider>(context, listen: false)
                .enrollmentInformation
                .usDeaLicenseNumber
                .toString();
        _issuingcountryController.text =
            Provider
                .of<UserProvider>(context, listen: false)
                .enrollmentInformation
                .dlIssuingCountry;
        if (Provider
            .of<UserProvider>(context, listen: false)
            .enrollmentInformation
            .countriesLicenseToPractice
            .isNotEmpty)
          _countrylicensedController.text =
          Provider
              .of<UserProvider>(context, listen: false)
              .enrollmentInformation
              .countriesLicenseToPractice[0];
        countryLicencedPractice =
            Provider
                .of<UserProvider>(context, listen: false)
                .enrollmentInformation
                .countriesLicenseToPractice;

        stateLicencedToPractice =
            Provider
                .of<UserProvider>(context, listen: false)
                .enrollmentInformation
                .stateLicenseToPractice;

        _issuingstateController.text =
            Provider
                .of<UserProvider>(context, listen: false)
                .enrollmentInformation
                .stateLicenseToPractice
                .toString();
        _undergradController.text =
            Provider
                .of<UserProvider>(context, listen: false)
                .enrollmentInformation
                .underGrad;

        _postgradController.text =
            Provider
                .of<UserProvider>(context, listen: false)
                .enrollmentInformation
                .postGrad;

        _socialsecuritynumberController.text =
            Provider
                .of<UserProvider>(context, listen: false)
                .enrollmentInformation
                .ssnNumber
                .toString();
        _driverlicenseController.text =
            Provider
                .of<UserProvider>(context, listen: false)
                .enrollmentInformation
                .dlNumber
                .toString();

        languageSpoken = Provider
            .of<UserProvider>(context, listen: false)
            .enrollmentInformation
            .languagesSpoken;
        _additionalController.text =
            Provider
                .of<UserProvider>(context, listen: false)
                .enrollmentInformation
                .additionalInfo;
      }
      Provider.of<LocationProvider>(context, listen: false).getCountry();

      Provider.of<LocationProvider>(context, listen: false)
          .getLocations(countryCode: 'USA');

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery
        .of(context)
        .size
        .width;

    return Stack(
      children: [
        Column(
          children: <Widget>[
            experience(screenwidth),
            issuingCountry(screenwidth),
            countryLicencedToPractice(screenwidth),
            if (!countryLicencedPractice.contains(Strings.eithopia))
              stateLicencedToPracticedata(screenwidth),
            if (!countryLicencedPractice.contains(Strings.eithopia))
              deanumber(screenwidth),
            if (!countryLicencedPractice.contains(Strings.eithopia))
              ssnNumber(screenwidth),
            underGrad(),
            postGrad(),
            driversLicenceNumber(screenwidth),
            languageSpokenDoctor(screenwidth),
            additionalInfo(screenwidth),
            Consumer<EnrollmentProviderUpdate>(
              builder: (context, value, child) =>
                  CustomButton(
                      ontap: value.isSavePressed
                          ? null
                          : () async {
                        FocusScope.of(context).unfocus();

                        if (_experienceController.text.isEmpty) {
                          CommonWidgets.showToast(context,
                              Strings.pleaseAddExp, widget.scaffoldKey);
                        } else if (double.parse(_experienceController.text) <
                            0 ||
                            int.parse(_experienceController.text) == 0) {
                          CommonWidgets.showToast(
                              context,
                              double.parse(_experienceController.text) == 0
                                  ? Strings.experienceCantbe0
                                  : Strings.experienceCantbeNeg,
                              widget.scaffoldKey);
                        } else if (_postgradController.text.isEmpty) {
                          CommonWidgets.showToast(context,
                              Strings.pleaseAddPostGrad, widget.scaffoldKey);
                        } else if (((_socialsecuritynumberController
                            .text.isEmpty ||
                            _socialsecuritynumberController.text.length <
                                2) &&
                            countryLicencedPractice.contains(Strings.usa))) {
                          CommonWidgets.showToast(
                              context,
                              _socialsecuritynumberController.text.isEmpty
                                  ? Strings.pleaseAddSSN
                                  : Strings.pleaseAddValidSSN,
                              widget.scaffoldKey);
                        } else if ((double.parse(
                            _socialsecuritynumberController
                                .text.isEmpty
                                ? '0.0'
                                : _socialsecuritynumberController
                                .text) <
                            0 ||
                            double.parse(_socialsecuritynumberController
                                .text.isEmpty
                                ? '0.0'
                                : _socialsecuritynumberController
                                .text ??
                                0) ==
                                0) &&
                            countryLicencedPractice.contains(Strings.usa)) {
                          CommonWidgets.showToast(
                              context,
                              double.parse(_socialsecuritynumberController
                                  .text ??
                                  0) ==
                                  0
                                  ? Strings.ssnCantbe0
                                  : Strings.ssnCantbeNeg,
                              widget.scaffoldKey);
                        } else if ((_driverlicenseController.text != null &&
                            _driverlicenseController.text != '') &&
                            (double.parse(_driverlicenseController.text ??
                                '0.0') <
                                0 ||
                                double.parse(_driverlicenseController.text ??
                                    '0.0') ==
                                    0)) {
                          CommonWidgets.showToast(
                              context,
                              double.parse(_driverlicenseController.text) == 0
                                  ? Strings.drivingLicenceCantbe0
                                  : Strings.drivingLicenceCantbeNeg,
                              widget.scaffoldKey);
                        } else if (_issuingcountryController.text.isEmpty) {
                          CommonWidgets.showToast(
                              context,
                              Strings.pleaseAddIssuingCounty,
                              widget.scaffoldKey);
                        } else if (stateLicencedToPractice.length == 0 &&
                            countryLicencedPractice.contains(Strings.usa)) {
                          CommonWidgets.showToast(
                              context,
                              Strings.pleaseAddIssuingState,
                              widget.scaffoldKey);
                        } else if ((_usdeaController.text.isEmpty ||
                            _usdeaController.text.length < 2) &&
                            countryLicencedPractice.contains(Strings.usa)) {
                          CommonWidgets.showToast(
                              context,
                              _usdeaController.text.isEmpty
                                  ? Strings.pleaseAddDea
                                  : Strings.pleaseAddValidDea,
                              widget.scaffoldKey);
                        } else if ((double.parse(_usdeaController.text.isEmpty
                            ? '0.0'
                            : _usdeaController.text) <
                            0 ||
                            double.parse(_usdeaController.text.isEmpty
                                ? '0'
                                : _usdeaController.text) ==
                                0) &&
                            countryLicencedPractice.contains(Strings.usa)) {
                          CommonWidgets.showToast(
                              context,
                              double.parse(_usdeaController.text) == 0
                                  ? Strings.deaCantbe0
                                  : Strings.deaCantbeNeg,
                              widget.scaffoldKey);
                        } else if (languageSpoken.isEmpty) {
                          CommonWidgets.showToast(context,
                              Strings.pleaseAddLanguage, widget.scaffoldKey);
                        } else if (countryLicencedPractice.length == 0) {
                          CommonWidgets.showToast(
                              context,
                              Strings.pleaseAddCountryLicencetoPrac,
                              widget.scaffoldKey);
                        } else if (EnrollmentProviderUpdate
                            .specialityController.length <=
                            0) {
                          CommonWidgets.showToast(
                              context,
                              Strings.pleaseUpdateSpeciality,
                              widget.scaffoldKey);
                        } else {
                          value.isPressed(true);
                          var response =
                          await value.updateUserDetail2(EnrollStepModel2(
                              action: Strings.actionEnroll2,
                              enrollmentStep2: EnrollmentStep2(
                                yearsOfExperience:
                                int.parse(_experienceController.text),
                                speciality: EnrollmentProviderUpdate
                                    .specialityController,
                                subSpeciality: EnrollmentProviderUpdate
                                    .subspecialityController.text ??
                                    '',
                                ssnNumber: _socialsecuritynumberController
                                    .text ??
                                    '',
                                dlNumber:
                                _driverlicenseController.text ?? '',
                                dlIssuingCountry:
                                _issuingcountryController.text,
                                dlIssuingState: "",
                                usDeaLicenseNumber:
                                _usdeaController.text ?? '',
                                languagesSpoken: languageSpoken,
                                countriesLicenseToPractice:
                                countryLicencedPractice,
                                underGrad: _undergradController.text,
                                postGrad: _postgradController.text,
                                stateLicenseToPractice:
                                stateLicencedToPractice,
                                additionalInfo:
                                _additionalController.text,
                              )));

                          value.isPressed(false);
                          if (!response.success) {
                            CommonWidgets.showToast(context, response.message,
                                widget.scaffoldKey);
                            await Future.delayed(Duration(milliseconds: 500));
                          }

                          if (response.success) {
                            PreferenceUtils.putInt(
                                PreferenceKeys.INDICATOR, 3);
                            await Provider.of<UserProvider>(context,
                                listen: false)
                                .getUser();
                            value.nextPage();
                          }
                        }
                      },
                      buttonText: Strings.next),
            )
          ],
        ),
        if (Provider
            .of<UserProvider>(context, listen: false)
            .isLoading)
          CommonWidgets.showLoader(context)
      ],
    );
  }

  Padding experience(double screenwidth) {
    return Padding(
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
            child: Container(
              child: Padding(
                padding: EdgeInsets.only(right: 5, top: 2),
                child: Focus(
                  onFocusChange: (hasFocus) {
                    setState(() {
                      isWeightFocused = hasFocus;
                    });
                  },
                  child: TextFormField(
                    onTap: () {
                      screenTracker.stopTimer();
                      screenTracker.startTimer(context);
                    },
                    focusNode: isFocus1,
                    controller: _experienceController,
                    keyboardType: TextInputType.number,
                    maxLength: 2,
                    decoration: InputDecoration(
                      counterText: '',
                      hintText: Strings.years_of_experience,
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      prefixIcon: SizedBox(
                        width: screenwidth / 200,
                      ),
                      border: InputBorder.none,
                    ),
                    maxLines: 1,
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  Padding underGrad() {
    return Padding(
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
            child: Container(
                width: double.infinity,
                child: PopupMenuButton(
                  offset: Offset(0.1, 0),
                  onSelected: (undergrad) {
                    clearFocus();
                    _undergradController.text = undergrad;
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 5, right: 5, top: 2),
                    child: TextFormField(
                      onTap: () {
                        screenTracker.stopTimer();
                        screenTracker.startTimer(context);
                      },
                      controller: _undergradController,
                      enabled: false,
                      decoration: InputDecoration(
                        hintText: Strings.undergrade,
                        prefixIcon: Icon(
                          CupertinoIcons.book,
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
                      Strings.undergrad
                          .map((undergrad) =>
                          PopupMenuItem(
                              value: undergrad, child: Text(undergrad)))
                          .toList(),
                )),
          ),
        ));
  }

  Padding postGrad() {
    return Padding(
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
            child: Container(
                width: double.infinity,
                child: PopupMenuButton(
                  offset: Offset(0.1, 0),
                  onSelected: (postgrad) {
                    clearFocus();
                    _postgradController.text = postgrad;
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 5, right: 5, top: 2),
                    child: TextFormField(
                      onTap: () {
                        screenTracker.stopTimer();
                        screenTracker.startTimer(context);
                      },
                      controller: _postgradController,
                      enabled: false,
                      decoration: InputDecoration(
                        hintText: Strings.postgrade,
                        prefixIcon: Icon(
                          CupertinoIcons.book,
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
                      Strings.postgrad
                          .map((postgrad) =>
                          PopupMenuItem(value: postgrad, child: Text(postgrad)))
                          .toList(),
                )),
          ),
        ));
  }

  Padding ssnNumber(double screenwidth) {
    return Padding(
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
            child: Container(
              child: Padding(
                padding: EdgeInsets.only(right: 5, top: 2),
                child: Focus(
                  onFocusChange: (hasFocus) {
                    setState(() {
                      isWeightFocused = hasFocus;
                    });
                  },
                  child: TextFormField(
                    onTap: () {
                      screenTracker.stopTimer();
                      screenTracker.startTimer(context);
                    },
                    focusNode: isFocus2,
                    controller: _socialsecuritynumberController,
                    obscureText: true,
                    maxLength: 15,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      counterText: '',
                      hintText: Strings.social_security_number,
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      prefixIcon: SizedBox(
                        width: screenwidth / 200,
                      ),
                      border: InputBorder.none,
                    ),
                    maxLines: 1,
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  Padding driversLicenceNumber(double screenwidth) {
    return Padding(
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
            child: Container(
              child: Padding(
                padding: EdgeInsets.only(right: 5, top: 2),
                child: Focus(
                  onFocusChange: (hasFocus) {
                    setState(() {
                      isWeightFocused = hasFocus;
                    });
                  },
                  child: TextFormField(
                    onTap: () {
                      screenTracker.stopTimer();
                      screenTracker.startTimer(context);
                    },
                    focusNode: isFocus3,
                    controller: _driverlicenseController,
                    maxLength: 15,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      counterText: '',
                      hintText: Strings.drivers_license_number,
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      prefixIcon: SizedBox(
                        width: screenwidth / 200,
                      ),
                      border: InputBorder.none,
                    ),
                    maxLines: 1,
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  Padding additionalInfo(double screenwidth) {
    return Padding(
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
            child: Container(
              child: Padding(
                padding: EdgeInsets.only(right: 5, top: 2),
                child: Focus(
                  onFocusChange: (hasFocus) {
                    setState(() {
                      isWeightFocused = hasFocus;
                    });
                  },
                  child: TextFormField(
                    onTap: () {
                      screenTracker.stopTimer();
                      screenTracker.startTimer(context);
                    },
                    focusNode: isFocus5,
                    controller: _additionalController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      hintText: Strings.additional_information,
                      prefixIcon: SizedBox(
                        width: screenwidth / 200,
                      ),
                      border: InputBorder.none,
                    ),
                    maxLines: 1,
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  Padding stateLicencedToPracticedata(double screenwidth) {
    return Padding(
        padding: EdgeInsets.only(bottom: 19),
        child: FractionallySizedBox(
          widthFactor: 0.833,
          child: Container(
            width: double.infinity,
            child: Container(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(right: 5, top: 2),
                child: GestureDetector(
                  onTap: () async {
                    if (Provider
                        .of<LocationProvider>(context, listen: false)
                        .locationList
                        .length >
                        0) {
                      showDialog(
                        context: context,
                        builder: (context) =>
                            AlertDialog(
                              content: Stack(
                                children: [
                                  listOfStates(),
                                  crossButton(),
                                ],
                              ),
                            ),
                      );
                    } else {}
                  },
                  child: dropDownItem(
                    context: context,
                    stateLicenced: stateLicencedToPractice,
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  Widget listOfStates() {
    return Container(
      height: double.infinity,
      width: 300.0,
      child: ListView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: Provider
              .of<LocationProvider>(context, listen: false)
              .locationList
              .length,
          itemBuilder: (context, index) =>
              GestureDetector(
                  onTap: () {
                    if (!stateLicencedToPractice.contains(
                        Provider
                            .of<LocationProvider>(context, listen: false)
                            .locationList[index]
                            .region))
                      stateLicencedToPractice.add(
                          Provider
                              .of<LocationProvider>(context, listen: false)
                              .locationList[index]
                              .region);
                    _issuingstateController.text =
                        Provider
                            .of<LocationProvider>(context, listen: false)
                            .locationList[index]
                            .region;
                    setState(() {});
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      Provider
                          .of<LocationProvider>(context, listen: false)
                          .locationList[index]
                          .region,
                      textAlign: TextAlign.start,
                    ),
                  ))),
    );
  }

  Container crossButton() {
    return Container(
      alignment: Alignment(1, -1),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.cancel,
          color: Colors.red,
        ),
      ),
    );
  }

  Padding languageSpokenDoctor(double screenwidth) {
    return Padding(
        padding: EdgeInsets.only(bottom: 19),
        child: FractionallySizedBox(
          widthFactor: 0.833,
          child: Container(
            width: double.infinity,
            child: Container(
              width: double.infinity,
              child: PopupMenuButton(
                offset: Offset(0.1, 0),
                onSelected: (String language) {
                  clearFocus();
                  if (!languageSpoken.contains(language))
                    languageSpoken.add(language);
                  setState(() {});
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 5, top: 2),
                  child: Focus(
                    child: dropDownItemLanguage(
                        context: context, languageSpoken: languageSpoken),
                  ),
                ),
                itemBuilder: (context) =>
                    Strings.languageSpoken
                        .map((language) =>
                        PopupMenuItem(value: language, child: Text(language)))
                        .toList(),
              ),
            ),
          ),
        ));
  }

  Padding countryLicencedToPractice(double screenwidth) {
    return Padding(
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
            child: Container(
                width: double.infinity,
                child: PopupMenuButton(
                  offset: Offset(0.1, 0),
                  onSelected: (countryLicenced) {
                    clearFocus();
                    _socialsecuritynumberController.clear();
                    _usdeaController.clear();
                    stateLicencedToPractice.clear();
                    _issuingstateController.clear();
                    countryLicencedPractice.clear();
                    _countrylicensedController.text = countryLicenced;
                    countryLicencedPractice.add(countryLicenced);
                    setState(() {});
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 5, top: 2),
                    child: Focus(
                      onFocusChange: (hasFocus) {
                        setState(() {
                          isGenderFocused = hasFocus;
                        });
                      },
                      child: TextFormField(
                        onTap: () {
                          screenTracker.stopTimer();
                          screenTracker.startTimer(context);
                        },
                        // focusNode: _genderFocus,
                        controller: _countrylicensedController,
                        enabled: false,
                        decoration: InputDecoration(
                          hintText: Strings.country_licensed_to_practice,
                          prefixIcon: SizedBox(
                            width: screenwidth / 200,
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
                      Strings.countries
                          .map((countryLicenced) =>
                          PopupMenuItem(
                              value: countryLicenced,
                              child: Text(countryLicenced)))
                          .toList(),
                )),
          ),
        ));
  }

  Padding issuingCountry(double screenwidth) {
    return Padding(
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
            child: Container(
              decoration: isGenderFocused
                  ? BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  border: Border.all(color: CustomColors.blue3, width: 1),
                  color: CustomColors.white)
                  : null,
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
                      onSelected: (CountryModel country) {
                        clearFocus();
                        _issuingcountryController.text = country.name;
                      },
                      child: Padding(
                        padding: EdgeInsets.only(right: 5, top: 2),
                        child: Focus(
                          onFocusChange: (hasFocus) {
                            setState(() {
                              isGenderFocused = hasFocus;
                            });
                          },
                          child: TextFormField(
                            onTap: () {
                              screenTracker.stopTimer();
                              screenTracker.startTimer(context);
                            },
                            controller: _issuingcountryController,
                            enabled: false,
                            textAlign: TextAlign.justify,
                            decoration: InputDecoration(
                              hintText: Strings.issuing_country,
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              prefixIcon: SizedBox(
                                width: screenwidth / 200,
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
                              .issuingCountrylist
                              .map((country) =>
                              PopupMenuItem(
                                  value: country, child: Text(country.name)))
                              .toList(),
                    ),
                  )),
            ),
          ),
        ));
  }

  Padding deanumber(double screenwidth) {
    return Padding(
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
            child: Container(
              child: Padding(
                padding: EdgeInsets.only(right: 5, top: 2),
                child: Focus(
                  onFocusChange: (hasFocus) {
                    setState(() {
                      isWeightFocused = hasFocus;
                    });
                  },
                  child: TextFormField(
                    onTap: () {
                      screenTracker.stopTimer();
                      screenTracker.startTimer(context);
                    },
                    focusNode: isFocus4,
                    controller: _usdeaController,
                    keyboardType: TextInputType.number,
                    maxLength: 15,
                    decoration: InputDecoration(
                      counterText: '',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      hintText: Strings.us_dea_license_number,
                      prefixIcon: SizedBox(
                        width: screenwidth / 200,
                      ),
                      border: InputBorder.none,
                    ),
                    maxLines: 1,
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  BoxDecoration boxDecoration() {
    return BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(22)),
        border: Border.all(
          color: CustomColors.grey1,
          width: 1,
        ),
        color: CustomColors.white);
  }

  Widget dropDownItem({
    BuildContext context,
    List<String> stateLicenced,
    Function(String) onchanged,
  }) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      curve: Curves.decelerate,
      margin: EdgeInsets.only(top: 20),
      width: CommonWidgets().getWidth(context),
      height: 135,
      decoration: boxDecoration(),
      child: Stack(
        children: [
          stateLicenced.length != 0
              ? Container(
            height: 130,
            width: 300,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Wrap(
                  children: List.generate(
                    stateLicenced.length,
                        (index) =>
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: CustomColors.grey1,
                          ),
                          margin: EdgeInsets.all(5),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomText(
                                maxLines: 1,
                                padding: EdgeInsets.only(left: 10),
                                text: stateLicenced[index].length > 20
                                    ? stateLicenced[index].substring(0, 20) +
                                    '...'
                                    : stateLicenced[index],
                                fontSize: 15,
                              ),
                              Container(
                                padding: EdgeInsets.all(5),
                                child: GestureDetector(
                                  child: Icon(Icons.cancel),
                                  onTap: () {
                                    stateLicenced.remove(stateLicenced[index]);
                                    setState(() {});
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                  )),
            ),
          )
              : Center(
              child: Text(
                Strings.stateLicencedToPractice,
                style: TextStyle(color: CustomColors.grey2),
              )),
        ],
      ),
    );
  }

  Widget dropDownItemLanguage({
    BuildContext context,
    List<String> languageSpoken,
    Function(String) onchanged,
  }) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      curve: Curves.decelerate,
      margin: EdgeInsets.only(top: 20),
      width: CommonWidgets().getWidth(context),
      height: 135,
      decoration: boxDecoration(),
      child: Stack(
        children: [
          languageSpoken.length != 0
              ? Container(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Wrap(
                  children: List.generate(
                    languageSpoken.length,
                        (index) =>
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: CustomColors.grey1,
                          ),
                          margin: EdgeInsets.all(5),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomText(
                                maxLines: 1,
                                padding: EdgeInsets.only(left: 10),
                                text: languageSpoken[index],
                                fontSize: 15,
                              ),
                              Container(
                                padding: EdgeInsets.all(5),
                                child: GestureDetector(
                                  child: Icon(Icons.cancel),
                                  onTap: () {
                                    languageSpoken.remove(
                                        languageSpoken[index]);
                                    setState(() {});
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                  )),
            ),
          )
              : Center(
              child: Text(
                Strings.languageSpokenText,
                style: TextStyle(color: CustomColors.grey2),
              )),
        ],
      ),
    );
  }

  clearFocus() {
    FocusManager.instance.primaryFocus.unfocus();
    isFocus1.unfocus();
    isFocus2.unfocus();
    isFocus3.unfocus();
    isFocus4.unfocus();
    isFocus5.unfocus();
  }
}

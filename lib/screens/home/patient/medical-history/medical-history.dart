import 'package:virtudoc_app/index.dart';
/*
The file is covered under Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. Please review the license for full details.

This program is not free software: You cannot redistribute it for any use under the terms of the Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. However the source can be modified and updated for the working of the application Design & Development of Mobile Application for “Abyssinia Technology Group” for which it was licensed.
*/

class MedicalHistory extends StatefulWidget {
  final bool isUpdating;
  final MedicalHistoryModel medicalModel;

  MedicalHistory({this.isUpdating = false, this.medicalModel});
  @override
  _MedicalHistoryState createState() => _MedicalHistoryState();
}

class _MedicalHistoryState extends State<MedicalHistory> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  MedicalHistoryModel medicalHistoryModel = MedicalHistoryModel(
      isSkip: true,
      asthmaDisease: false,
      cancerDisease: false,
      copdDisease: false,
      diabetesDisease: false,
      heartDisease: false,
      highBlodPresureDisease: false,
      kidenyDisease: false,
      hospitalization: false,
      howLongAgoMonths: 1);

  @override
  void initState() {
    super.initState();
    Provider.of<BasicModelProvider>(context, listen: false)
        .checkActive(context);

    if (widget.isUpdating && medicalHistoryModel != null) {
      medicalHistoryModel = widget.medicalModel;
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: Consumer<MedicalModelProviders>(
          builder: (context, provider, child) => ModalProgressHUD(
            inAsyncCall: provider.isPressed,
            dismissible: false,
            opacity: 0.3,
            child: Container(
              height: CommonWidgets().getHeight(context),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomTopBar(
                      context: context,
                      titleText: Strings.medicalHistory,
                      custonBackButton: Provider.of<BasicModelProvider>(context,
                              listen: false)
                          .isBackactive,
                      traling: !widget.isUpdating
                          ? Padding(
                              padding: EdgeInsets.only(right: 20.0, bottom: 20),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: GestureDetector(
                                  onTap: provider.isPressed
                                      ? null
                                      : () async {
                                          provider.savePressed(true);
                                          var response =
                                              await MedicalModelProviders
                                                  .updateUserProfile(
                                            MedicalModel(
                                              action:
                                                  Strings.actionMedicalHistory,
                                              medicalHistory:
                                                  medicalHistoryModel,
                                            ),
                                          );
                                          provider.savePressed(false);
                                          if (!response.success)
                                            CommonWidgets.showToast(context,
                                                response.message, _scaffoldKey);

                                          if (response.success) {
                                            Provider.of<UserProvider>(context,
                                                    listen: false)
                                                .getUser();
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      FamilyHistory(
                                                        familyModel: Provider
                                                                .of<UserProvider>(
                                                                    context,
                                                                    listen:
                                                                        false)
                                                            .familyModel,
                                                        isUpdating:
                                                            widget.isUpdating,
                                                      )),
                                            );
                                          }
                                        },
                                  child: CustomText(
                                    color: Colors.white,
                                    text: "Skip",
                                  ),
                                ),
                              ),
                            )
                          : null,
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (!widget.isUpdating)
                              CustomText(
                                text: Strings.medicalHistoryText,
                                fontSize: 18,
                              ),
                            if (!widget.isUpdating)
                              SizedBox(
                                height: 10,
                              ),
                            middleColumn(screenWidth),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: Divider(
                                color: CustomColors.grey1,
                                thickness: 1,
                              ),
                            ),
                            AnimatedContainer(
                              duration: Duration(milliseconds: 200),
                              curve: Curves.decelerate,
                              height:
                                  medicalHistoryModel.hospitalization ? 150 : 0,
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 20),
                                    alignment: Alignment.topLeft,
                                    child: CustomText(
                                      text: Strings.howLong,
                                      fontSize: 16,
                                    ),
                                  ),
                                  dropDownItem(
                                    context: context,
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical:
                                            medicalHistoryModel.hospitalization
                                                ? 20
                                                : 0),
                                    child: Divider(
                                      color: CustomColors.grey1,
                                      thickness: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            CustomButton(
                              ontap: provider.isPressed
                                  ? null
                                  : () async {
                                      provider.savePressed(true);
                                      medicalHistoryModel.isSkip = false;
                                      var response = await MedicalModelProviders
                                          .updateUserProfile(
                                        MedicalModel(
                                          action: Strings.actionMedicalHistory,
                                          medicalHistory: medicalHistoryModel,
                                        ),
                                      );
                                      provider.savePressed(false);
                                      if (!response.success)
                                        CommonWidgets.showToast(context,
                                            response.message, _scaffoldKey);

                                      if (response.success)
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  FamilyHistory(
                                                      familyModel: Provider.of<
                                                                  UserProvider>(
                                                              context,
                                                              listen: false)
                                                          .familyModel,
                                                      isUpdating:
                                                          widget.isUpdating)),
                                        );
                                    },
                              buttonText: Strings.next,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column middleColumn(double screenWidth) {
    return Column(children: [
      singleSwitch(
        text: Strings.heartDisease,
        value: medicalHistoryModel.heartDisease,
        onChange: () {
          medicalHistoryModel.heartDisease = !medicalHistoryModel.heartDisease;
          setState(() {});
        },
      ),
      singleSwitch(
        text: Strings.cancer,
        value: medicalHistoryModel.cancerDisease,
        onChange: () {
          medicalHistoryModel.cancerDisease =
              !medicalHistoryModel.cancerDisease;

          setState(() {});
        },
      ),
      singleSwitch(
        text: Strings.diabities,
        value: medicalHistoryModel.diabetesDisease,
        onChange: () {
          medicalHistoryModel.diabetesDisease =
              !medicalHistoryModel.diabetesDisease;
          setState(() {});
        },
      ),
      copdSwitch(
        screenWidth: screenWidth,
        text: Strings.copd,
        value: medicalHistoryModel.copdDisease,
        onChange: () {
          medicalHistoryModel.copdDisease = !medicalHistoryModel.copdDisease;
          setState(() {});
        },
      ),
      singleSwitch(
        text: Strings.kidney,
        value: medicalHistoryModel.kidenyDisease,
        onChange: () {
          medicalHistoryModel.kidenyDisease =
              !medicalHistoryModel.kidenyDisease;
          setState(() {});
        },
      ),
      singleSwitch(
        text: Strings.highblood,
        value: medicalHistoryModel.highBlodPresureDisease,
        onChange: () {
          medicalHistoryModel.highBlodPresureDisease =
              !medicalHistoryModel.highBlodPresureDisease;
          setState(() {});
        },
      ),
      singleSwitch(
        text: Strings.asthama,
        value: medicalHistoryModel.asthmaDisease,
        onChange: () {
          medicalHistoryModel.asthmaDisease =
              !medicalHistoryModel.asthmaDisease;
          setState(() {});
        },
      ),
      singleSwitch(
        text: Strings.hospitalization,
        value: medicalHistoryModel.hospitalization,
        onChange: () {
          medicalHistoryModel.hospitalization =
              !medicalHistoryModel.hospitalization;
          setState(() {});
        },
      ),
    ]);
  }

  Widget dropDownItem({BuildContext context}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin:
          EdgeInsets.only(top: medicalHistoryModel.hospitalization ? 20 : 1),
      width: CommonWidgets().getWidth(context) * 0.70,
      height: medicalHistoryModel.hospitalization ? 44 : 0,
      decoration: boxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          hintVal(),
          CustomText(
            text: "${medicalHistoryModel.howLongAgoMonths} Months",
            color: CustomColors.grey2,
            fontSize: 15,
          ),
          monthDropDown()
        ],
      ),
    );
  }

  Widget monthDropDown() {
    return DropdownButtonHideUnderline(
      child: DropdownButton<int>(
        isDense: true,
        icon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            "assets/images/ic_drop_down_big.png",
            height: 8,
            width: 15,
            color: CustomColors.grey2,
          ),
        ),
        style: TextStyle(
          fontSize: 14,
          color: CustomColors.white,
        ),
        items: Strings.monthsFullList.map((int value) {
          return new DropdownMenuItem<int>(
            value: value,
            child: new CustomText(
              text: "$value",
              fontSize: 14,
            ),
          );
        }).toList(),
        onChanged: (newMonth) {
          medicalHistoryModel.howLongAgoMonths = newMonth;
          setState(() {});
        },
      ),
    );
  }

  Widget hintVal() {
    return Center(
      child: CustomText(
        text: "1+",
        fontSize: 15,
        color: CustomColors.grey2,
      ),
    );
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

  Widget copdSwitch(
      {String text, bool value, Function onChange, double screenWidth}) {
    return Container(
      width: screenWidth,
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Divider(
              color: CustomColors.grey1,
              thickness: 1,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: screenWidth * 0.63,
                child: CustomText(
                  maxLines: 3,
                  text: text,
                  fontSize: 15,
                  textAlign: TextAlign.start,
                ),
              ),
              NotificationSwitch(
                switchOn: value,
                onChanged: onChange,
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget singleSwitch(
      {String text, bool value, Function onChange, double screenWidth}) {
    return Container(
      width: screenWidth,
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Divider(
              color: CustomColors.grey1,
              thickness: 1,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                maxLines: 3,
                text: text,
                fontSize: 15,
                textAlign: TextAlign.start,
              ),
              NotificationSwitch(
                switchOn: value,
                onChanged: onChange,
              )
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:virtudoc_app/index.dart';
/*
The file is covered under Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. Please review the license for full details.

This program is not free software: You cannot redistribute it for any use under the terms of the Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. However the source can be modified and updated for the working of the application Design & Development of Mobile Application for “Abyssinia Technology Group” for which it was licensed.
*/

class FamilyHistory extends StatefulWidget {
  final bool isUpdating;
  final FamilyHistoryModel familyModel;

  FamilyHistory({this.isUpdating = false, this.familyModel});

  @override
  _FamilyHistoryState createState() => _FamilyHistoryState();
}

class _FamilyHistoryState extends State<FamilyHistory> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  FamilyHistoryModel familyHistoryModel = FamilyHistoryModel(
    isSkip: true,
    asthmaDisease: HeartDisease(
      isbool: false,
      memberNames: [],
    ),
    cancerDisease: HeartDisease(
      isbool: false,
      memberNames: [],
    ),
    diabetesDisease: HeartDisease(
      isbool: false,
      memberNames: [],
    ),
    heartDisease: HeartDisease(
      isbool: false,
      memberNames: [],
    ),
    highBlodPresureDisease: HeartDisease(
      isbool: false,
      memberNames: [],
    ),
  );

  @override
  void initState() {
    super.initState();
    Provider.of<BasicModelProvider>(context, listen: false)
        .checkActive(context);

    if (widget.isUpdating) {
      familyHistoryModel = widget.familyModel;
      familyHistoryModel.heartDisease.memberNames.add(Strings.familyList[0]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: Consumer<MedicalModelProviders>(
          builder: (__, provider, _) =>
              ModalProgressHUD(
                inAsyncCall: provider.isPressed,
                opacity: 0.3,
                dismissible: false,
                child: Container(
                  height: CommonWidgets().getHeight(context),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CustomTopBar(
                          context: context,
                          titleText: Strings.familyHistory,
                          custonBackButton: Provider
                              .of<BasicModelProvider>(context,
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
                                  await FamilyHisotryProvider
                                      .updateUser(FamilyModel(
                                      action:
                                      Strings
                                          .actionFamilyHistory,
                                      familyHistory:
                                      familyHistoryModel));

                                  provider.savePressed(false);
                                  CommonWidgets.showToast(context,
                                      response.message, _scaffoldKey);

                                  if (response.success) {
                                    if (!widget.isUpdating) {
                                      Provider.of<UserProvider>(context,
                                          listen: false)
                                          .getUser();
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PatientBottomNavbar()),
                                              (route) => false);
                                    } else {
                                      Navigator.of(context)
                                          .popUntil((route) => false);
                                    }
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
                                    text: Strings.familyHistoryText,
                                    fontSize: 18,
                                  ),
                                if (!widget.isUpdating)
                                  SizedBox(
                                    height: 30,
                                  ),
                                buildDivider(),
                                singleFieldValue(
                                    text: Strings.heartDisease,
                                    value: familyHistoryModel.heartDisease
                                        .isbool,
                                    onchanged: () {
                                      familyHistoryModel.heartDisease.isbool =
                                      !familyHistoryModel.heartDisease.isbool;
                                      setState(() {});
                                    }),
                                dropDownItem(
                                  context: context,
                                  people:
                                  familyHistoryModel.heartDisease.memberNames,
                                  value: familyHistoryModel.heartDisease.isbool,
                                  onchanged: (string) {
                                    if (!familyHistoryModel.heartDisease
                                        .memberNames
                                        .contains(string)) {
                                      familyHistoryModel.heartDisease
                                          .memberNames
                                          .add(string);

                                      setState(() {});
                                    }
                                  },
                                ),
                                buildDivider(),
                                singleFieldValue(
                                    text: Strings.cancer,
                                    value: familyHistoryModel.cancerDisease
                                        .isbool,
                                    onchanged: () {
                                      familyHistoryModel.cancerDisease.isbool =
                                      !familyHistoryModel.cancerDisease.isbool;
                                      setState(() {});
                                    }),
                                dropDownItem(
                                  context: context,
                                  people:
                                  familyHistoryModel.cancerDisease.memberNames,
                                  value: familyHistoryModel.cancerDisease
                                      .isbool,
                                  onchanged: (string) {
                                    if (!familyHistoryModel
                                        .cancerDisease.memberNames
                                        .contains(string)) {
                                      familyHistoryModel.cancerDisease
                                          .memberNames
                                          .add(string);

                                      setState(() {});
                                    }
                                  },
                                ),
                                buildDivider(),
                                singleFieldValue(
                                    text: Strings.diabities,
                                    value:
                                    familyHistoryModel.diabetesDisease.isbool,
                                    onchanged: () {
                                      familyHistoryModel.diabetesDisease
                                          .isbool =
                                      !familyHistoryModel
                                          .diabetesDisease.isbool;
                                      setState(() {});
                                    }),
                                dropDownItem(
                                  context: context,
                                  people: familyHistoryModel
                                      .diabetesDisease.memberNames,
                                  value: familyHistoryModel.diabetesDisease
                                      .isbool,
                                  onchanged: (string) {
                                    if (!familyHistoryModel
                                        .diabetesDisease.memberNames
                                        .contains(string)) {
                                      familyHistoryModel.diabetesDisease
                                          .memberNames
                                          .add(string);

                                      setState(() {});
                                    }
                                  },
                                ),
                                buildDivider(),
                                singleFieldValue(
                                    text: Strings.highblood,
                                    value: familyHistoryModel
                                        .highBlodPresureDisease.isbool,
                                    onchanged: () {
                                      familyHistoryModel
                                          .highBlodPresureDisease.isbool =
                                      !familyHistoryModel
                                          .highBlodPresureDisease.isbool;
                                      setState(() {});
                                    }),
                                dropDownItem(
                                  context: context,
                                  people: familyHistoryModel
                                      .highBlodPresureDisease.memberNames,
                                  value: familyHistoryModel
                                      .highBlodPresureDisease.isbool,
                                  onchanged: (string) {
                                    if (!familyHistoryModel
                                        .highBlodPresureDisease.memberNames
                                        .contains(string)) {
                                      familyHistoryModel
                                          .highBlodPresureDisease.memberNames
                                          .add(string);

                                      setState(() {});
                                    }
                                  },
                                ),
                                buildDivider(),
                                singleFieldValue(
                                    text: Strings.asthama,
                                    value: familyHistoryModel.asthmaDisease
                                        .isbool,
                                    onchanged: () {
                                      familyHistoryModel.asthmaDisease.isbool =
                                      !familyHistoryModel.asthmaDisease.isbool;
                                      setState(() {});
                                    }),
                                dropDownItem(
                                    onchanged: (string) {
                                      if (!familyHistoryModel
                                          .asthmaDisease.memberNames
                                          .contains(string)) {
                                        familyHistoryModel.asthmaDisease
                                            .memberNames
                                            .add(string);

                                        setState(() {});
                                      }
                                    },
                                    context: context,
                                    people: familyHistoryModel
                                        .asthmaDisease.memberNames,
                                    value: familyHistoryModel.asthmaDisease
                                        .isbool),
                                buildDivider(),
                                CustomButton(
                                  ontap: provider.isPressed
                                      ? null
                                      : () async {
                                    provider.savePressed(true);
                                    familyHistoryModel.isSkip = false;
                                    var response = await FamilyHisotryProvider
                                        .updateUser(
                                      FamilyModel(
                                          action: Strings.actionFamilyHistory,
                                          familyHistory: familyHistoryModel),
                                    );

                                    provider.savePressed(false);

                                    CommonWidgets.showToast(context,
                                        response.message, _scaffoldKey);

                                    if (response.success) {
                                      if (!widget.isUpdating) {
                                        Provider.of<UserProvider>(context,
                                            listen: false)
                                            .getUser();
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PatientBottomNavbar()),
                                                (route) => false);
                                      } else {
                                        Navigator.of(context).popUntil(
                                                (route) => route.isFirst);
                                      }
                                    }
                                  },
                                  buttonText: Strings.done.toUpperCase(),
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

  Container buildDivider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Divider(
        color: CustomColors.grey1,
        thickness: 1,
      ),
    );
  }

  Container singleFieldValue({String text, bool value, Function onchanged}) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: text,
                fontSize: 16,
                textAlign: TextAlign.start,
              ),
              NotificationSwitch(switchOn: value, onChanged: onchanged)
            ],
          ),
        ],
      ),
    );
  }

  Widget dropDownItem({
    BuildContext context,
    bool value,
    List<String> people,
    Function(String) onchanged,
  }) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      curve: Curves.decelerate,
      margin: EdgeInsets.only(top: value ? 20 : 1),
      width: CommonWidgets().getWidth(context) * 0.90,
      height: value ? 135 : 0,
      decoration: boxDecoration(),
      child: Stack(
        children: [
          people.length != 0
              ? Container(
            height: 130,
            width: 300,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Wrap(
                  children: List.generate(
                    people.length,
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
                                padding: EdgeInsets.only(left: 10),
                                text: people[index],
                                fontSize: 15,
                              ),
                              Container(
                                padding: EdgeInsets.all(5),
                                child: GestureDetector(
                                  child: Icon(Icons.cancel),
                                  onTap: () {
                                    people.remove(people[index]);
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
                Strings.addMembers,
                style: TextStyle(color: CustomColors.grey2),
              )),
          Container(
              padding: EdgeInsets.only(right: 10),
              alignment: Alignment.centerRight,
              child: monthDropDown(onChanged: onchanged))
        ],
      ),
    );
  }

  Widget monthDropDown({Function(String) onChanged}) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
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
        items: Strings.familyList.map((String value) {
          return new DropdownMenuItem<String>(
            value: value,
            child: new CustomText(
              text: "$value",
              fontSize: 14,
            ),
          );
        }).toList(),
        onChanged: onChanged,
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
}

import 'package:flutter/scheduler.dart';
import 'package:virtudoc_app/index.dart';
/*
The file is covered under Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. Please review the license for full details.

This program is not free software: You cannot redistribute it for any use under the terms of the Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. However the source can be modified and updated for the working of the application Design & Development of Mobile Application for “Abyssinia Technology Group” for which it was licensed.
*/

class PersonalHistory extends StatefulWidget {
  final bool isupdating;
  final PersonalHistoryModel personalModel;
  const PersonalHistory({this.isupdating = false, this.personalModel});

  @override
  _PersonalHistoryState createState() => _PersonalHistoryState();
}

class _PersonalHistoryState extends State<PersonalHistory> {
  PersonalHistoryModel personalHistoryModel = PersonalHistoryModel(
    children: Children(count: 0, isbool: false),
    drugs: Drugs(isbool: false, typeOfDrugs: []),
    smoke: Children(count: 0, isbool: false),
    maritalStatus: Strings.maritalStatusList[0],
    drink: Children(count: 0, isbool: false),
    isSkip: true,
  );
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      Provider.of<BasicModelProvider>(context, listen: false)
          .checkActive(context);
    });
    if (widget.isupdating) {
      personalHistoryModel = widget.personalModel;
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: Consumer<PersonalModelProvider>(
          builder: (context, provider, child) => ModalProgressHUD(
            inAsyncCall: provider.ispressed,
            dismissible: false,
            child: Container(
              height: CommonWidgets().getHeight(context),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomTopBar(
                      context: context,
                      titleText: Strings.personal_history,
                      custonBackButton: Provider.of<BasicModelProvider>(context,
                              listen: false)
                          .isBackactive,
                      traling: !widget.isupdating
                          ? Padding(
                              padding: const EdgeInsets.only(
                                  right: 20.0, bottom: 20),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: GestureDetector(
                                  onTap: provider.ispressed
                                      ? null
                                      : () async {
                                          provider.savePressed(true);
                                          var response =
                                              await PersonalModelProvider()
                                                  .updateUser(
                                            PersonalModel(
                                              action:
                                                  Strings.actionPersonalHistory,
                                              personalHistory:
                                                  personalHistoryModel,
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
                                            CommonWidgets().navigateTO(context,
                                                pageName: MedicalHistory(
                                                  medicalModel:
                                                      Provider.of<UserProvider>(
                                                              context,
                                                              listen: false)
                                                          .medicalModel,
                                                  isUpdating: widget.isupdating,
                                                ));
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
                            if (!widget.isupdating)
                              CustomText(
                                text: Strings.personal_history_text,
                                fontSize: 18,
                              ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20, right: 20),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      CustomText(
                                        text: Strings.marital_status,
                                        fontSize: 16,
                                        textAlign: TextAlign.start,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: screenHeight / 65,
                                  ),
                                  singleMarried(screenWidth),
                                  divorecSeperated(screenWidth),
                                  widowed(screenWidth),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    child: Divider(
                                      color: CustomColors.grey1,
                                      thickness: 1,
                                    ),
                                  ),
                                  buildChildrenSelection(),
                                ],
                              ),
                            ),
                            dropDownItem(
                              context: context,
                            ),
                            middleColumn(),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: Divider(
                                color: CustomColors.grey1,
                                thickness: 1,
                              ),
                            ),
                            CustomButton(
                              ontap: provider.ispressed
                                  ? null
                                  : () async {
                                      provider.savePressed(true);
                                      personalHistoryModel.isSkip = false;
                                      var response =
                                          await PersonalModelProvider()
                                              .updateUser(
                                        PersonalModel(
                                          action: Strings.actionPersonalHistory,
                                          personalHistory: personalHistoryModel,
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
                                        CommonWidgets().navigateTO(context,
                                            pageName: MedicalHistory(
                                                isUpdating: widget.isupdating,
                                                medicalModel:
                                                    Provider.of<UserProvider>(
                                                            context,
                                                            listen: false)
                                                        .medicalModel));
                                      }
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

  Widget buildChildrenSelection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: Strings.doHaveChildren,
              fontSize: 16,
              textAlign: TextAlign.start,
            ),
            NotificationSwitch(
                switchOn: personalHistoryModel.children.isbool,
                onChanged: () {
                  personalHistoryModel.children.isbool =
                      !personalHistoryModel.children.isbool;
                  setState(() {});
                }),
          ],
        ),
        CustomText(
          padding: EdgeInsets.only(top: 5),
          text: personalHistoryModel.children.isbool
              ? Strings.howManyChilderen
              : '',
          alignment: Alignment.centerLeft,
          fontSize: 14,
          textAlign: TextAlign.start,
        ),
      ],
    );
  }

  Row singleMarried(double screenWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: screenWidth / 25,
        ),
        singleOption(text: Strings.maritalStatusList[0]),
        Spacer(),
        singleOption(text: Strings.maritalStatusList[1]),
        SizedBox(
          width: screenWidth / 10,
        ),
      ],
    );
  }

  Row divorecSeperated(double screenWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: screenWidth / 25,
        ),
        singleOption(text: Strings.maritalStatusList[2]),
        Spacer(),
        singleOption(text: Strings.maritalStatusList[3]),
        SizedBox(
          width: screenWidth / 17,
        ),
      ],
    );
  }

  Row widowed(double screenWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: screenWidth / 25,
        ),
        singleOption(text: Strings.maritalStatusList[4]),
      ],
    );
  }

  Container singleOption({String text}) {
    return Container(
      margin: EdgeInsets.only(right: 18),
      child: Row(
        children: [
          Radio(
            value: text.toLowerCase(),
            groupValue: personalHistoryModel.maritalStatus.toLowerCase(),
            onChanged: (string) =>
                handleMaritalStatus(status: string.toLowerCase()),
          ),
          CustomText(
            text: text,
            fontSize: 16,
            color: CustomColors.grey2,
            fontWeight: FontStyles.semiBoldFontWeight500,
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }

  Column middleColumn() {
    return Column(children: [
      singleSwitch(
        text: Strings.smoke,
        detailText:
            personalHistoryModel.smoke.isbool ? Strings.packsPerWeek : '',
        swtichval: personalHistoryModel.smoke.isbool,
        ontap: () {
          personalHistoryModel.smoke.isbool =
              !personalHistoryModel.smoke.isbool;
          setState(() {});
        },
      ),
      CommonWidgets.dropDownSelection(
          context: context,
          value: personalHistoryModel.smoke.count.toString(),
          onchanged: (data) {
            personalHistoryModel.smoke.count = data;
            setState(() {});
          },
          status: personalHistoryModel.smoke.isbool),
      singleSwitch(
        text: Strings.drink,
        detailText:
            personalHistoryModel.drink.isbool ? Strings.drinksPerWeek : '',
        swtichval: personalHistoryModel.drink.isbool,
        ontap: () {
          personalHistoryModel.drink.isbool =
              !personalHistoryModel.drink.isbool;
          setState(() {});
        },
      ),
      CommonWidgets.dropDownSelection(
          context: context,
          value: personalHistoryModel.drink.count.toString(),
          onchanged: (data) {
            personalHistoryModel.drink.count = data;
            setState(() {});
          },
          status: personalHistoryModel.drink.isbool),
      singleSwitch(
        text: Strings.drugs,
        detailText: personalHistoryModel.drugs.isbool ? Strings.drugsTypes : '',
        swtichval: personalHistoryModel.drugs.isbool,
        ontap: () {
          personalHistoryModel.drugs.isbool =
              !personalHistoryModel.drugs.isbool;

          setState(() {});
        },
      ),
      dropDownItemWithText(
          context: context,
          onchanged: (type) {
            if (!personalHistoryModel.drugs.typeOfDrugs.contains(type)) {
              personalHistoryModel.drugs.typeOfDrugs.add(type);
              setState(() {});
            }
          },
          types: personalHistoryModel.drugs.typeOfDrugs,
          value: personalHistoryModel.drugs.isbool)
    ]);
  }

  Widget dropDownItem({BuildContext context}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      curve: Curves.decelerate,
      margin:
          EdgeInsets.only(top: personalHistoryModel.children.isbool ? 20 : 1),
      width: CommonWidgets().getWidth(context) * 0.70,
      height: personalHistoryModel.children.isbool ? 44 : 0,
      decoration: CommonWidgets.boxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          hintVal(),
          CustomText(
            text: "${personalHistoryModel.children.count} ",
            color: CustomColors.grey2,
            fontSize: 15,
          ),
          childDropDown()
        ],
      ),
    );
  }

  Widget childDropDown() {
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
        items: Strings().childrenList.map((int value) {
          return new DropdownMenuItem<int>(
            value: value,
            child: new CustomText(
              text: "$value",
              fontSize: 14,
            ),
          );
        }).toList(),
        onChanged: (childcount) {
          personalHistoryModel.children.count = childcount;
          setState(() {});
        },
      ),
    );
  }

  Widget hintVal() {
    return Center(
      child: CustomText(
        text: '',
        fontSize: 15,
        color: CustomColors.grey2,
      ),
    );
  }

  Widget singleSwitch(
      {String text, String detailText, Function ontap, bool swtichval}) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 15),
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
                text: text,
                fontSize: 16,
                textAlign: TextAlign.start,
              ),
              NotificationSwitch(
                switchOn: swtichval,
                onChanged: ontap,
              )
            ],
          ),
          CustomText(
            padding: EdgeInsets.only(top: 5),
            text: detailText,
            alignment: Alignment.centerLeft,
            fontSize: 14,
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }

  Widget dropDownItemWithText({
    BuildContext context,
    bool value,
    List<String> types,
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
          (types?.length ?? 0) != 0
              ? Container(
                  height: 130,
                  width: 300,
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Wrap(
                        children: List.generate(
                      types.length,
                      (index) => Container(
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
                              text: types[index],
                              fontSize: 15,
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              child: GestureDetector(
                                child: Icon(Icons.cancel),
                                onTap: () {
                                  types.remove(types[index]);
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
                  Strings.addDrugType,
                  style: TextStyle(color: CustomColors.grey2),
                )),
          Container(
              padding: EdgeInsets.only(right: 10),
              alignment: Alignment.centerRight,
              child: drugdropDown(onChanged: onchanged))
        ],
      ),
    );
  }

  Widget drugdropDown({Function(String) onChanged}) {
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
        items: Strings.drugsList.map((String value) {
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

  handleMaritalStatus({String status}) {
    personalHistoryModel.maritalStatus = status;
    setState(() {});
  }
}

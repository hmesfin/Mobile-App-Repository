import 'package:virtudoc_app/utils/screen_tracker/screen_tracker.dart';

import '../../../../index.dart';

class PostVisitSecond extends StatefulWidget {
  @override
  _PostVisitSecondState createState() => _PostVisitSecondState();
}

class _PostVisitSecondState extends State<PostVisitSecond> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double appbarheight = appBar.preferredSize.height;
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height - appbarheight;
    return SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: CustomColors.bg_app,
          body: WillPopScope(
            onWillPop: () async {
              CommonWidgets.showCustomDialog(
                  context, Strings.wishToMoveBack, Strings.onMovingBack,
                  onYes: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  }, iconData: Icons.delete_forever);
              return true;
            },
            child: SingleChildScrollView(
              child: parentContainer(screenHeight, screenWidth, context),
            ),
          ),
        ));
  }

  Container parentContainer(double screenHeight, double screenWidth,
      BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CustomTopBar(
            context: context,
            titleText: Strings.postVisitHeader,
            onTap: () {
              CommonWidgets.showCustomDialog(
                  context, Strings.wishToMoveBack, Strings.onMovingBack,
                  onYes: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  }, iconData: Icons.delete_forever);
            },
          ),
          Container(
            margin: EdgeInsets.only(bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonWidgets().indicatorCircle(indicator: 1, currentIndex: 1),
                CommonWidgets().topBar(context, indicator: 2, currentIndex: 1),
                CommonWidgets().indicatorCircle(indicator: 2, currentIndex: 1),
                CommonWidgets().topBar(context, indicator: 3, currentIndex: 1),
                CommonWidgets().indicatorCircle(indicator: 3, currentIndex: 1),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
            child: form(context),
          ),
          SizedBox(height: 10),
          Consumer<PostVisitProvider>(
              builder: (context, model, child) =>
                  Center(
                      child: CommonWidgets().roundButton(Strings.next, context,
                          onTap: () async {
                            model.initDoctorNote();
                            FocusScope.of(context).requestFocus(FocusNode());
                            model.setHistoryPhysicalExamination(
                                failure: (message) {
                                  CommonWidgets.showToast(
                                      context, message, _scaffoldKey);
                                }, success: () {
                              CommonWidgets().navigateTo(
                                  context, PostVisitThird());
                            });
                          }))),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget form(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: Strings.historyPhysicalExam,
          fontWeight: FontStyles.boldFontWeight600,
        ),
        SizedBox(
          height: 5.0,
        ),
        Padding(
          padding: EdgeInsets.only(left: 7, top: 15),
          child: CustomText(
              text: Strings.chiefCompaint,
              fontSize: FontStyles.medium,
              fontWeight: FontStyles.semiBoldFontWeight400),
        ),
        Consumer<PostVisitProvider>(
            builder: (context, model, child) =>
                Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: CommonWidgets().customFormField(
                        context, Strings.typeHere, TextInputAction.next, (
                        text) {
                      model.historyAndPhysicalExamination.chief_complaint =
                          text.toString().trim();
                    }, inputType: TextInputType.name, maxLength: 50))),
        Padding(
          padding: EdgeInsets.only(left: 7, top: 15),
          child: CustomText(
              text: Strings.historyofPresentillness,
              fontSize: FontStyles.medium,
              fontWeight: FontStyles.semiBoldFontWeight400),
        ),
        Consumer<PostVisitProvider>(
            builder: (context, model, child) =>
                Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: CommonWidgets().customFormField(
                        context, Strings.typeHere, TextInputAction.next, (
                        text) {
                      model.historyAndPhysicalExamination
                          .history_of_present_illness = text.toString().trim();
                    }, inputType: TextInputType.name, maxLength: 50))),
        Padding(
          padding: EdgeInsets.only(left: 7, top: 15),
          child: CustomText(
              text: Strings.pastSurgicalHistory,
              fontSize: FontStyles.medium,
              fontWeight: FontStyles.semiBoldFontWeight400),
        ),
        Consumer<PostVisitProvider>(
            builder: (context, model, child) =>
                Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: CommonWidgets().customFormField(
                        context, Strings.typeHere, TextInputAction.next, (
                        text) {
                      model.historyAndPhysicalExamination.pastSurgicalHistory =
                          text.toString().trim();
                    }, inputType: TextInputType.name, maxLength: 50))),
        Padding(
          padding: EdgeInsets.only(left: 7, top: 15),
          child: CustomText(
              text: Strings.hospitalizationHistory,
              fontSize: FontStyles.medium,
              fontWeight: FontStyles.semiBoldFontWeight400),
        ),
        Consumer<PostVisitProvider>(
            builder: (context, model, child) =>
                Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: CommonWidgets().customFormField(
                        context, Strings.typeHere, TextInputAction.next, (
                        text) {
                      model.historyAndPhysicalExamination
                          .hospitalization_history =
                          text.toString().trim();
                    }, inputType: TextInputType.name, maxLength: 50))),
        Padding(
          padding: EdgeInsets.only(left: 7, top: 15),
          child: CustomText(
              text: Strings.socialHistory,
              fontSize: FontStyles.medium,
              fontWeight: FontStyles.semiBoldFontWeight400),
        ),
        Consumer<PostVisitProvider>(
            builder: (context, model, child) =>
                Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: CommonWidgets().customFormField(
                        context, Strings.typeHere, TextInputAction.next, (
                        text) {
                      model.historyAndPhysicalExamination.social_history =
                          text.toString().trim();
                    }, inputType: TextInputType.name, maxLength: 50))),
        Padding(
          padding: EdgeInsets.only(left: 7, top: 15),
          child: CustomText(
              text: Strings.allergy,
              fontSize: FontStyles.medium,
              fontWeight: FontStyles.semiBoldFontWeight400),
        ),
        Consumer<PostVisitProvider>(
            builder: (context, model, child) =>
                Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: CommonWidgets().customFormField(
                        context, Strings.typeHere, TextInputAction.next, (
                        text) {
                      model.historyAndPhysicalExamination.allergy =
                          text.toString().trim();
                    }, inputType: TextInputType.name, maxLength: 50))),
        Padding(
          padding: EdgeInsets.only(left: 7, top: 15),
          child: CustomText(
              text: Strings.familyHistory,
              fontSize: FontStyles.medium,
              fontWeight: FontStyles.semiBoldFontWeight400),
        ),
        Consumer<PostVisitProvider>(
            builder: (context, model, child) =>
                Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: CommonWidgets().customFormField(
                        context, Strings.typeHere, TextInputAction.next, (
                        text) {
                      model.historyAndPhysicalExamination.review_of_system =
                          text.toString().trim();
                    }, inputType: TextInputType.name, maxLength: 50))),
        Padding(
          padding: EdgeInsets.only(left: 7, top: 15),
          child: CustomText(
              text: Strings.medication,
              fontSize: FontStyles.medium,
              fontWeight: FontStyles.semiBoldFontWeight400),
        ),
        Consumer<PostVisitProvider>(
            builder: (context, model, child) =>
                Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: CommonWidgets().customFormField(
                        context, Strings.typeHere, TextInputAction.next, (
                        text) {
                      model.historyAndPhysicalExamination.medication =
                          text.toString().trim();
                    }, inputType: TextInputType.name, maxLength: 50))),
        Padding(
          padding: EdgeInsets.only(left: 7, top: 15, bottom: 10),
          child: CustomText(
              text: Strings.vitals,
              fontSize: FontStyles.medium,
              fontWeight: FontStyles.semiBoldFontWeight400),
        ),
        vitalTypes(context),
        Consumer<PostVisitProvider>(
            builder: (context, model, child) =>
                FlatButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    model.addVitalType();
                  },
                  child: Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.blueAccent,
                        ),
                        CustomText(
                          text: Strings.addNew,
                          fontWeight: FontWeight.w500,
                          color: Colors.blueAccent,
                        )
                      ],
                    ),
                    padding: EdgeInsets.all(10.0),
                  ),
                ))
      ],
    );
  }

  Widget vitalTypes(context) {
    return Consumer<PostVisitProvider>(
        builder: (context, model, child) =>
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: model.vitalTypeController.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 10.0),
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 33.0,
                              ),
                              Container(
                                  width: double.infinity,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(25.0)),
                                      border: Border.all(
                                          color: CustomColors.grey3, width: 1),
                                      color: CustomColors.white),
                                  child: Consumer<PostVisitProvider>(
                                      builder: (context, model, child) =>
                                          PopupMenuButton(
                                              offset: Offset(0.1, 0),
                                              onSelected: (vitalType) {
                                                FocusScope.of(context)
                                                    .requestFocus(FocusNode());
                                                if (model
                                                    .vitalTypeController[index]
                                                    .text !=
                                                    'Please Select') {
                                                  model.vitalTypeList.add(model
                                                      .vitalTypeController[index]
                                                      .text);
                                                }
                                                model.vitalTypeController
                                                    .elementAt(index)
                                                    .text = vitalType;
                                                model.vitalValuesController
                                                    .elementAt(index)
                                                    .clear();

                                                model.vitalTypeList
                                                    .remove(vitalType);
                                              },
                                              child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 20,
                                                      right: 5,
                                                      top: 2),
                                                  child: TextFormField(
                                                      onTap: () {
                                                        screenTracker
                                                            .stopTimer();
                                                        screenTracker
                                                            .startTimer(
                                                            context);
                                                      },
                                                      onChanged: (text) {},
                                                      controller: model
                                                          .vitalTypeController
                                                          .elementAt(index),
                                                      enabled: false,
                                                      decoration: InputDecoration(
                                                          hintText: Strings
                                                              .selectVitalType,
                                                          hintStyle: TextStyle(
                                                            color: Colors.grey,
                                                          ),
                                                          suffixIcon:
                                                          ImageIcon(AssetImage(
                                                              "assets/images/ic_drop_down1.png"),
                                                              color:
                                                              CustomColors
                                                                  .grey2),
                                                          border: InputBorder
                                                              .none),
                                                      maxLines: 1)),
                                              itemBuilder: (context) =>
                                                  model
                                                      .vitalTypeList
                                                      .map((vitalType) =>
                                                      PopupMenuItem(
                                                          value: vitalType,
                                                          child: Text(
                                                              vitalType)))
                                                      .toList()))),
                              Consumer<PostVisitProvider>(
                                  builder: (context, model, child) =>
                                      Padding(
                                          padding: EdgeInsets.only(top: 10),
                                          child: CommonWidgets()
                                              .customFormFieldController(
                                              context,
                                              Strings.units,
                                              TextInputAction.done,
                                              onChanged: (text) {},
                                              // inputType: TextInputType.number,
                                              maxLines: 1,
                                              maxLenghth: 15,
                                              paddingLeft: 20.0,
                                              inPutFormatters: <
                                                  TextInputFormatter>[
                                                FilteringTextInputFormatter
                                                    .allow(
                                                    RegExp(r'[0-9\/]')),
                                              ],
                                              controller: model
                                                  .vitalValuesController
                                                  .elementAt(index)))),
                              SizedBox(
                                height: 10.0,
                              ),
                            ],
                          ),
                        ),
                        model.vitalTypeController.length > 1
                            ? Align(
                          child: FlatButton(
                              minWidth: 20,
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                model.deleteVitalType(index);
                              },
                              child: Icon(
                                Icons.clear,
                                color: CustomColors.yellow1,
                                size: 30,
                              )),
                          alignment: Alignment.topRight,
                        )
                            : Container(),
                      ],
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                            color: Colors.grey.withOpacity(0.5), width: 1),
                        color: Colors.grey.withOpacity(0.5)),
                  );
                }));
  }
}

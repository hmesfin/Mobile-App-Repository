import 'package:flutter/cupertino.dart';
import 'package:virtudoc_app/utils/screen_tracker/screen_tracker.dart';

import '../../../../index.dart';

class PostVisitFirst extends StatefulWidget {
  @override
  _PostVisitFirstState createState() => _PostVisitFirstState();
}

class _PostVisitFirstState extends State<PostVisitFirst> {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
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
            margin: EdgeInsets.only(bottom: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonWidgets().indicatorCircle(indicator: 1, currentIndex: 0),
                CommonWidgets().topBar(context, indicator: 2, currentIndex: 0),
                CommonWidgets().indicatorCircle(indicator: 2, currentIndex: 0),
                CommonWidgets().topBar(context, indicator: 3, currentIndex: 0),
                CommonWidgets().indicatorCircle(indicator: 3, currentIndex: 0),
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
                            FocusScope.of(context).requestFocus(FocusNode());
                            model.initHistoryExam();
                            model.initDoctorNote();
                            model.setPatientInfo(failure: (message) {
                              CommonWidgets.showToast(
                                  context, message, _scaffoldKey);
                            }, success: () {
                              CommonWidgets().navigateTo(
                                  context, PostVisitSecond());
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
          text: Strings.patientInfo,
          fontWeight: FontStyles.boldFontWeight600,
        ),
        Consumer<PostVisitProvider>(
            builder: (context, model, child) =>
                Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: CommonWidgets().customFormField(
                        context, Strings.enterName, TextInputAction.next, (
                        text) {
                      model.postVisitRequest.name = text.toString().trim();
                    },
                        inputType: TextInputType.name,
                        inital: model?.postVisitRequest?.name ?? ""))),
        Consumer<PostVisitProvider>(
            builder: (context, model, child) =>
                Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: CommonWidgets().customFormField(
                        context, Strings.enterAge, TextInputAction.next, (
                        text) {
                      model.postVisitRequest.age =
                          int.parse(text?.toString() ?? "");
                    },
                        inputType: TextInputType.number,
                        inital: "${model?.postVisitRequest?.age ?? 0}"))),
        Padding(
            padding: EdgeInsets.only(top: 20),
            child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    border: Border.all(color: CustomColors.grey3, width: 1),
                    color: CustomColors.white),
                child: Consumer<PostVisitProvider>(
                    builder: (context, model, child) =>
                        PopupMenuButton(
                            offset: Offset(0.1, 0),
                            onSelected: (gender) {
                              FocusScope.of(context).requestFocus(FocusNode());
                              model.genderController.text = gender;
                              model.postVisitRequest.gender =
                                  gender?.toString()?.trim();
                            },
                            child: Padding(
                                padding:
                                EdgeInsets.only(left: 20, right: 5, top: 2),
                                child: TextFormField(
                                    onTap: () {
                                      screenTracker.stopTimer();
                                      screenTracker.startTimer(context);
                                    },
                                    onChanged: (text) {},
                                    controller: model.genderController,
                                    enabled: false,
                                    decoration: InputDecoration(
                                        hintText: Strings.gender,
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                        ),
                                        suffixIcon: ImageIcon(
                                            AssetImage(
                                                "assets/images/ic_drop_down1.png"),
                                            color: CustomColors.grey2),
                                        border: InputBorder.none),
                                    maxLines: 1)),
                            itemBuilder: (context) =>
                                Strings.genders
                                    .map((gender) =>
                                    PopupMenuItem(
                                        value: gender, child: Text(gender)))
                                    .toList())))),
        Container(
            margin: EdgeInsets.only(top: 20),
            height: 90,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: CustomColors.grey3, width: 1),
                color: CustomColors.white),
            child: Padding(
                padding: EdgeInsets.only(top: 10.0, left: 20),
                child: Consumer<PostVisitProvider>(
                    builder: (context, model, child) =>
                        TextFormField(
                          maxLines: 5,
                          decoration: InputDecoration(
                              hintText: Strings.enterPatientDetails,
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              border: InputBorder.none),
                          onChanged: (text) {
                            model.postVisitRequest.patient_details =
                                text?.trim();
                          },
                          initialValue:
                          model?.postVisitRequest?.patient_details ?? "",
                        ))))
      ],
    );
  }
}

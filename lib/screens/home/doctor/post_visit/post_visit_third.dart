import 'package:virtudoc_app/utils/screen_tracker/screen_tracker.dart';

import '../../../../index.dart';

class PostVisitThird extends StatefulWidget {
  @override
  _PostVisitThirdState createState() => _PostVisitThirdState();
}

class _PostVisitThirdState extends State<PostVisitThird> {
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
            child: Consumer<PostVisitProvider>(
                builder: (context, model, child) =>
                    ModalProgressHUD(
                      child: SingleChildScrollView(
                        child: parentContainer(
                            screenHeight, screenWidth, context),
                      ),
                      inAsyncCall: model.isLoading,
                      progressIndicator: CircularProgressIndicator(
                        valueColor:
                        new AlwaysStoppedAnimation<Color>(CustomColors.blue),
                      ),
                    )),
          ),
        ));
  }

  Container parentContainer(double screenHeight, double screenWidth,
      BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                CommonWidgets().indicatorCircle(indicator: 1, currentIndex: 2),
                CommonWidgets().topBar(context, indicator: 2, currentIndex: 2),
                CommonWidgets().indicatorCircle(indicator: 2, currentIndex: 2),
                CommonWidgets().topBar(context, indicator: 3, currentIndex: 2),
                CommonWidgets().indicatorCircle(indicator: 3, currentIndex: 2),
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
                      child: CommonWidgets().roundButton(
                          Strings.submit, context, onTap: () async {
                        FocusScope.of(context).requestFocus(FocusNode());
                        model.setDoctorNote(failure: (message) {
                          CommonWidgets.showToast(
                              context, message, _scaffoldKey);
                        }, success: () {
                          CommonWidgets().showOkPopup(
                              context,
                              Strings.formSubmittedSuccessHeader,
                              Strings.formSubmittedSuccessSubheader,
                              onTapp: () {
                                Navigator.pop(context);
                                Navigator.of(context)
                                    .popUntil((route) => route.isFirst);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PlaceOrder(),
                                    ));
                              });
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
            text: Strings.remarks, fontWeight: FontStyles.boldFontWeight600),
        SizedBox(height: 10.0),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: Strings.visitType,
              fontSize: FontStyles.medium,
              fontWeight: FontStyles.boldFontWeight600,
            ),
            SizedBox(width: 2.0),
            Expanded(
                child: Row(
                  children: [
                    CustomText(
                      text: Strings.progressNote,
                      fontSize: FontStyles.normal,
                      color: Colors.grey,
                      fontWeight: FontStyles.semiBoldFontWeight500,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.0),
                      child: Consumer<PostVisitProvider>(
                          builder: (context, model, child) =>
                              Switch(
                                  value: model.isProgressNote,
                                  onChanged: (isCheck) {
                                    FocusScope.of(context).requestFocus(
                                        FocusNode());
                                    model.setProgressNoteSwitch(isCheck);
                                  })),
                    ),
                    CustomText(
                      text: Strings.newPatient,
                      color: Colors.grey,
                      fontSize: FontStyles.normal,
                      fontWeight: FontStyles.semiBoldFontWeight500,
                    ),
                  ],
                ))
          ],
        ),
        Divider(
          height: 1.5,
          color: Colors.grey,
        ),
        SizedBox(height: 10.0),
        Consumer<PostVisitProvider>(
            builder: (context, model, child) =>
            !model.isProgressNote
                ? progressNotesField(context)
                : newPatientField(context))
      ],
    );
  }

  Widget progressNotesField(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
            text: Strings.reviewofSystems,
            fontWeight: FontStyles.boldFontWeight600),
        Padding(
            padding: EdgeInsets.only(left: 7, top: 15),
            child: CustomText(
                text: Strings.constitutional,
                fontSize: FontStyles.medium,
                fontWeight: FontStyles.semiBoldFontWeight400)),
        Container(
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: CustomColors.grey3, width: 1),
                color: CustomColors.white),
            child: Padding(
                padding: EdgeInsets.only(top: 0.0, left: 20),
                child: Consumer<PostVisitProvider>(
                    builder: (context, model, child) =>
                        TextFormField(
                            onTap: () {
                              screenTracker.stopTimer();
                              screenTracker.startTimer(context);
                            },
                            controller: model.constitutional,
                            maxLines: null,
                            //initialValue: Strings.constitutionalHint,
                            decoration: InputDecoration(
                                hintText: Strings.constitutionalHint,
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none),
                            onChanged: (text) {
                              model.doctorsNoteProgressNote.constitutional =
                                  text?.trim();
                            })))),
        Padding(
            padding: EdgeInsets.only(left: 7, top: 15),
            child: CustomText(
                text: Strings.entMouth,
                fontSize: FontStyles.medium,
                fontWeight: FontStyles.semiBoldFontWeight400)),
        Container(
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: CustomColors.grey3, width: 1),
                color: CustomColors.white),
            child: Padding(
                padding: EdgeInsets.only(top: 0.0, left: 20),
                child: Consumer<PostVisitProvider>(
                    builder: (context, model, child) =>
                        TextFormField(
                            onTap: () {
                              screenTracker.stopTimer();
                              screenTracker.startTimer(context);
                            },
                            controller: model.eNT_mouth,
                            maxLines: null,
                            //initialValue: Strings.entMouthHint,
                            decoration: InputDecoration(
                                hintText: Strings.entMouthHint,
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none),
                            onChanged: (text) {
                              model.doctorsNoteProgressNote.eNT_mouth =
                                  text?.trim();
                            })))),
        Padding(
            padding: EdgeInsets.only(left: 7, top: 15),
            child: CustomText(
                text: Strings.cardiovascular,
                fontSize: FontStyles.medium,
                fontWeight: FontStyles.semiBoldFontWeight400)),
        Container(
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: CustomColors.grey3, width: 1),
                color: CustomColors.white),
            child: Padding(
                padding: EdgeInsets.only(top: 0.0, left: 20),
                child: Consumer<PostVisitProvider>(
                    builder: (context, model, child) =>
                        TextFormField(
                            onTap: () {
                              screenTracker.stopTimer();
                              screenTracker.startTimer(context);
                            },
                            controller: model.cardiovascular,
                            maxLines: null,
                            //initialValue: Strings.cardiovascularHint,
                            decoration: InputDecoration(
                                hintText: Strings.cardiovascularHint,
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none),
                            onChanged: (text) {
                              model.doctorsNoteProgressNote.cardiovascular =
                                  text?.trim();
                            })))),
        Padding(
            padding: EdgeInsets.only(left: 7, top: 15),
            child: CustomText(
                text: Strings.respiratory,
                fontSize: FontStyles.medium,
                fontWeight: FontStyles.semiBoldFontWeight400)),
        Container(
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: CustomColors.grey3, width: 1),
                color: CustomColors.white),
            child: Padding(
                padding: EdgeInsets.only(top: 0.0, left: 20),
                child: Consumer<PostVisitProvider>(
                    builder: (context, model, child) =>
                        TextFormField(
                            onTap: () {
                              screenTracker.stopTimer();
                              screenTracker.startTimer(context);
                            },
                            controller: model.respiratory,
                            maxLines: null,
                            //initialValue: Strings.respiratoryHint,
                            decoration: InputDecoration(
                                hintText: Strings.respiratoryHint,
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none),
                            onChanged: (text) {
                              model.doctorsNoteProgressNote.respiratory =
                                  text?.trim();
                            })))),
        Padding(
            padding: EdgeInsets.only(left: 7, top: 15),
            child: CustomText(
                text: Strings.gastrointestinal,
                fontSize: FontStyles.medium,
                fontWeight: FontStyles.semiBoldFontWeight400)),
        Container(
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: CustomColors.grey3, width: 1),
                color: CustomColors.white),
            child: Padding(
                padding: EdgeInsets.only(top: 0.0, left: 20),
                child: Consumer<PostVisitProvider>(
                    builder: (context, model, child) =>
                        TextFormField(
                            onTap: () {
                              screenTracker.stopTimer();
                              screenTracker.startTimer(context);
                            },
                            controller: model.gastrointestinal,
                            maxLines: null,
                            //initialValue: Strings.gastrointestinalHint,
                            decoration: InputDecoration(
                                hintText: Strings.gastrointestinalHint,
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none),
                            onChanged: (text) {
                              model.doctorsNoteProgressNote.gastrointestinal =
                                  text?.trim();
                            })))),
        Padding(
            padding: EdgeInsets.only(left: 7, top: 15),
            child: CustomText(
                text: Strings.genitourinary,
                fontSize: FontStyles.medium,
                fontWeight: FontStyles.semiBoldFontWeight400)),
        Container(
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: CustomColors.grey3, width: 1),
                color: CustomColors.white),
            child: Padding(
                padding: EdgeInsets.only(top: 0.0, left: 20),
                child: Consumer<PostVisitProvider>(
                    builder: (context, model, child) =>
                        TextFormField(
                            onTap: () {
                              screenTracker.stopTimer();
                              screenTracker.startTimer(context);
                            },
                            controller: model.genitourinary,
                            maxLines: null,
                            //initialValue: Strings.genitourinaryHint,
                            decoration: InputDecoration(
                                hintText: Strings.genitourinaryHint,
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none),
                            onChanged: (text) {
                              model.doctorsNoteProgressNote.genitourinary =
                                  text?.trim();
                            })))),
        Padding(
            padding: EdgeInsets.only(left: 7, top: 15),
            child: CustomText(
                text: Strings.mosculoskeletan,
                fontSize: FontStyles.medium,
                fontWeight: FontStyles.semiBoldFontWeight400)),
        Container(
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: CustomColors.grey3, width: 1),
                color: CustomColors.white),
            child: Padding(
                padding: EdgeInsets.only(top: 0.0, left: 20),
                child: Consumer<PostVisitProvider>(
                    builder: (context, model, child) =>
                        TextFormField(
                            onTap: () {
                              screenTracker.stopTimer();
                              screenTracker.startTimer(context);
                            },
                            controller: model.mosculoskeletan,
                            maxLines: null,
                            //initialValue: Strings.mosculoskeletanHint,
                            decoration: InputDecoration(
                                hintText: Strings.mosculoskeletanHint,
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none),
                            onChanged: (text) {
                              model.doctorsNoteProgressNote.mosculoskeletan =
                                  text?.trim();
                            })))),
        Padding(
            padding: EdgeInsets.only(left: 7, top: 15),
            child: CustomText(
                text: Strings.skin,
                fontSize: FontStyles.medium,
                fontWeight: FontStyles.semiBoldFontWeight400)),
        Container(
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: CustomColors.grey3, width: 1),
                color: CustomColors.white),
            child: Padding(
                padding: EdgeInsets.only(top: 0.0, left: 20),
                child: Consumer<PostVisitProvider>(
                    builder: (context, model, child) =>
                        TextFormField(
                            onTap: () {
                              screenTracker.stopTimer();
                              screenTracker.startTimer(context);
                            },
                            controller: model.skin,
                            maxLines: null,
                            //initialValue: Strings.skinHint,
                            decoration: InputDecoration(
                                hintText: Strings.skinHint,
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none),
                            onChanged: (text) {
                              model.doctorsNoteProgressNote.skin = text?.trim();
                            })))),
        Padding(
            padding: EdgeInsets.only(left: 7, top: 15),
            child: CustomText(
                text: Strings.neuro,
                fontSize: FontStyles.medium,
                fontWeight: FontStyles.semiBoldFontWeight400)),
        Container(
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: CustomColors.grey3, width: 1),
                color: CustomColors.white),
            child: Padding(
                padding: EdgeInsets.only(top: 0.0, left: 20),
                child: Consumer<PostVisitProvider>(
                    builder: (context, model, child) =>
                        TextFormField(
                            onTap: () {
                              screenTracker.stopTimer();
                              screenTracker.startTimer(context);
                            },
                            controller: model.neuro,
                            maxLines: null,
                            //initialValue: Strings.neuroHint,
                            decoration: InputDecoration(
                                hintText: Strings.neuroHint,
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none),
                            onChanged: (text) {
                              model.doctorsNoteProgressNote.neuro =
                                  text?.trim();
                            })))),
        Padding(
            padding: EdgeInsets.only(left: 7, top: 15),
            child: CustomText(
                text: Strings.psych,
                fontSize: FontStyles.medium,
                fontWeight: FontStyles.semiBoldFontWeight400)),
        Container(
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: CustomColors.grey3, width: 1),
                color: CustomColors.white),
            child: Padding(
                padding: EdgeInsets.only(top: 0.0, left: 20),
                child: Consumer<PostVisitProvider>(
                    builder: (context, model, child) =>
                        TextFormField(
                            onTap: () {
                              screenTracker.stopTimer();
                              screenTracker.startTimer(context);
                            },
                            controller: model.psych,
                            maxLines: null,
                            //initialValue: Strings.psychHint,
                            decoration: InputDecoration(
                                hintText: Strings.psychHint,
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none),
                            onChanged: (text) {
                              model.doctorsNoteProgressNote.psych =
                                  text?.trim();
                            })))),
        Padding(
            padding: EdgeInsets.only(left: 7, top: 15),
            child: CustomText(
                text: Strings.hemeLymph,
                fontSize: FontStyles.medium,
                fontWeight: FontStyles.semiBoldFontWeight400)),
        Container(
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: CustomColors.grey3, width: 1),
                color: CustomColors.white),
            child: Padding(
                padding: EdgeInsets.only(top: 0.0, left: 20),
                child: Consumer<PostVisitProvider>(
                    builder: (context, model, child) =>
                        TextFormField(
                            onTap: () {
                              screenTracker.stopTimer();
                              screenTracker.startTimer(context);
                            },
                            controller: model.hemeLymph,
                            maxLines: null,
                            //initialValue: Strings.hemeLymphHint,
                            decoration: InputDecoration(
                                hintText: Strings.hemeLymphHint,
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none),
                            onChanged: (text) {
                              model.doctorsNoteProgressNote.heme_lymph =
                                  text?.trim();
                            })))),
        Padding(
            padding: EdgeInsets.only(left: 7, top: 15),
            child: CustomText(
                text: Strings.endocrine,
                fontSize: FontStyles.medium,
                fontWeight: FontStyles.semiBoldFontWeight400)),
        Container(
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: CustomColors.grey3, width: 1),
                color: CustomColors.white),
            child: Padding(
                padding: EdgeInsets.only(top: 0.0, left: 20),
                child: Consumer<PostVisitProvider>(
                    builder: (context, model, child) =>
                        TextFormField(
                            onTap: () {
                              screenTracker.stopTimer();
                              screenTracker.startTimer(context);
                            },
                            controller: model.endocrine,
                            maxLines: null,
                            //initialValue: Strings.endocrineHint,
                            decoration: InputDecoration(
                                hintText: Strings.endocrineHint,
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none),
                            onChanged: (text) {
                              model.doctorsNoteProgressNote.endocrine =
                                  text?.trim();
                            })))),
        Padding(
            padding: EdgeInsets.only(left: 7, top: 15),
            child: CustomText(
                text: Strings.assessment,
                fontSize: FontStyles.medium,
                fontWeight: FontStyles.semiBoldFontWeight400)),
        Container(
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: CustomColors.grey3, width: 1),
                color: CustomColors.white),
            child: Padding(
                padding: EdgeInsets.only(top: 0.0, left: 20),
                child: Consumer<PostVisitProvider>(
                    builder: (context, model, child) =>
                        TextFormField(
                            onTap: () {
                              screenTracker.stopTimer();
                              screenTracker.startTimer(context);
                            },
                            controller: model.assessment_progress,
                            maxLines: null,
                            decoration: InputDecoration(
                                hintText: Strings.typeHere,
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none),
                            onChanged: (text) {
                              model.doctorsNoteProgressNote.assessment =
                                  text?.trim();
                            })))),
        Padding(
            padding: EdgeInsets.only(left: 7, top: 15),
            child: CustomText(
                text: Strings.plan,
                fontSize: FontStyles.medium,
                fontWeight: FontStyles.semiBoldFontWeight400)),
        Container(
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: CustomColors.grey3, width: 1),
                color: CustomColors.white),
            child: Padding(
                padding: EdgeInsets.only(top: 0.0, left: 20),
                child: Consumer<PostVisitProvider>(
                    builder: (context, model, child) =>
                        TextFormField(
                            onTap: () {
                              screenTracker.stopTimer();
                              screenTracker.startTimer(context);
                            },
                            controller: model.plan_progress,
                            maxLines: null,
                            decoration: InputDecoration(
                                hintText: Strings.typeHere,
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none),
                            onChanged: (text) {
                              model.doctorsNoteProgressNote.plan = text?.trim();
                            })))),
      ],
    );
  }

  Widget newPatientField(context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      CustomText(
          text: Strings.progressNote + "s",
          fontWeight: FontStyles.boldFontWeight600),
      Padding(
          padding: EdgeInsets.only(left: 7, top: 15),
          child: CustomText(
              text: Strings.subjective,
              fontSize: FontStyles.medium,
              fontWeight: FontStyles.semiBoldFontWeight400)),
      Container(
          margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: CustomColors.grey3, width: 1),
              color: CustomColors.white),
          child: Padding(
              padding: EdgeInsets.only(top: 0.0, left: 20),
              child: Consumer<PostVisitProvider>(
                  builder: (context, model, child) =>
                      TextFormField(
                          onTap: () {
                            screenTracker.stopTimer();
                            screenTracker.startTimer(context);
                          },
                          controller: model.subjective,
                          maxLines: null,
                          decoration: InputDecoration(
                              hintText: Strings.typeHere,
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none),
                          onChanged: (text) {
                            model.doctorsNoteNewPatient.subjective =
                                text?.trim();
                          })))),
      Padding(
          padding: EdgeInsets.only(left: 7, top: 15),
          child: CustomText(
              text: Strings.objective,
              fontSize: FontStyles.medium,
              fontWeight: FontStyles.semiBoldFontWeight400)),
      Container(
          margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: CustomColors.grey3, width: 1),
              color: CustomColors.white),
          child: Padding(
              padding: EdgeInsets.only(top: 0.0, left: 20),
              child: Consumer<PostVisitProvider>(
                  builder: (context, model, child) =>
                      TextFormField(
                          onTap: () {
                            screenTracker.stopTimer();
                            screenTracker.startTimer(context);
                          },
                          controller: model.objective,
                          maxLines: null,
                          decoration: InputDecoration(
                              hintText: Strings.objectiveHint,
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none),
                          onChanged: (text) {
                            model.doctorsNoteNewPatient.objective =
                                text?.trim();
                          })))),
      Padding(
          padding: EdgeInsets.only(left: 7, top: 15),
          child: CustomText(
              text: Strings.generalAppearance,
              fontSize: FontStyles.medium,
              fontWeight: FontStyles.semiBoldFontWeight400)),
      Container(
          margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: CustomColors.grey3, width: 1),
              color: CustomColors.white),
          child: Padding(
              padding: EdgeInsets.only(top: 0.0, left: 20),
              child: Consumer<PostVisitProvider>(
                  builder: (context, model, child) =>
                      TextFormField(
                          onTap: () {
                            screenTracker.stopTimer();
                            screenTracker.startTimer(context);
                          },
                          controller: model.generalAppearance,
                          maxLines: null,
                          //initialValue: Strings.generalAppearanceHint,
                          decoration: InputDecoration(
                              hintText: Strings.generalAppearanceHint,
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none),
                          onChanged: (text) {
                            model.doctorsNoteNewPatient.general_appearance =
                                text?.trim();
                          })))),
      Padding(
          padding: EdgeInsets.only(left: 7, top: 15),
          child: CustomText(
              text: Strings.heent,
              fontSize: FontStyles.medium,
              fontWeight: FontStyles.semiBoldFontWeight400)),
      Container(
          margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: CustomColors.grey3, width: 1),
              color: CustomColors.white),
          child: Padding(
              padding: EdgeInsets.only(top: 0.0, left: 20),
              child: Consumer<PostVisitProvider>(
                  builder: (context, model, child) =>
                      TextFormField(
                          onTap: () {
                            screenTracker.stopTimer();
                            screenTracker.startTimer(context);
                          },
                          controller: model.heent,
                          maxLines: null,
                          //initialValue: Strings.heentHint,
                          decoration: InputDecoration(
                              hintText: Strings.heentHint,
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none),
                          onChanged: (text) {
                            model.doctorsNoteNewPatient.HEENT = text?.trim();
                          })))),
      Padding(
          padding: EdgeInsets.only(left: 7, top: 15),
          child: CustomText(
              text: Strings.neck,
              fontSize: FontStyles.medium,
              fontWeight: FontStyles.semiBoldFontWeight400)),
      Container(
          margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: CustomColors.grey3, width: 1),
              color: CustomColors.white),
          child: Padding(
              padding: EdgeInsets.only(top: 0.0, left: 20),
              child: Consumer<PostVisitProvider>(
                  builder: (context, model, child) =>
                      TextFormField(
                          onTap: () {
                            screenTracker.stopTimer();
                            screenTracker.startTimer(context);
                          },
                          controller: model.neck,
                          maxLines: null,
                          //initialValue: Strings.neckHint,
                          decoration: InputDecoration(
                              hintText: Strings.neckHint,
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none),
                          onChanged: (text) {
                            model.doctorsNoteNewPatient.neck = text?.trim();
                          })))),
      Padding(
          padding: EdgeInsets.only(left: 7, top: 15),
          child: CustomText(
              text: Strings.lungs,
              fontSize: FontStyles.medium,
              fontWeight: FontStyles.semiBoldFontWeight400)),
      Container(
          margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: CustomColors.grey3, width: 1),
              color: CustomColors.white),
          child: Padding(
              padding: EdgeInsets.only(top: 0.0, left: 20),
              child: Consumer<PostVisitProvider>(
                  builder: (context, model, child) =>
                      TextFormField(
                          onTap: () {
                            screenTracker.stopTimer();
                            screenTracker.startTimer(context);
                          },
                          controller: model.lungs,
                          maxLines: null,
                          //initialValue: Strings.lungsHint,
                          decoration: InputDecoration(
                              hintText: Strings.lungsHint,
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none),
                          onChanged: (text) {
                            model.doctorsNoteNewPatient.lungs = text?.trim();
                          })))),
      Padding(
          padding: EdgeInsets.only(left: 7, top: 15),
          child: CustomText(
              text: Strings.cardiac,
              fontSize: FontStyles.medium,
              fontWeight: FontStyles.semiBoldFontWeight400)),
      Container(
          margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: CustomColors.grey3, width: 1),
              color: CustomColors.white),
          child: Padding(
              padding: EdgeInsets.only(top: 0.0, left: 20),
              child: Consumer<PostVisitProvider>(
                  builder: (context, model, child) =>
                      TextFormField(
                          onTap: () {
                            screenTracker.stopTimer();
                            screenTracker.startTimer(context);
                          },
                          controller: model.cardiac,
                          maxLines: null,
                          //initialValue: Strings.cardiacHint,
                          decoration: InputDecoration(
                              hintText: Strings.cardiacHint,
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none),
                          onChanged: (text) {
                            model.doctorsNoteNewPatient.cardiac = text?.trim();
                          })))),
      Padding(
          padding: EdgeInsets.only(left: 7, top: 15),
          child: CustomText(
              text: Strings.abdomen,
              fontSize: FontStyles.medium,
              fontWeight: FontStyles.semiBoldFontWeight400)),
      Container(
          margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: CustomColors.grey3, width: 1),
              color: CustomColors.white),
          child: Padding(
              padding: EdgeInsets.only(top: 0.0, left: 20),
              child: Consumer<PostVisitProvider>(
                  builder: (context, model, child) =>
                      TextFormField(
                          onTap: () {
                            screenTracker.stopTimer();
                            screenTracker.startTimer(context);
                          },
                          controller: model.abdomen,
                          maxLines: null,
                          //initialValue: Strings.abdomenHint,
                          decoration: InputDecoration(
                              hintText: Strings.abdomenHint,
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none),
                          onChanged: (text) {
                            model.doctorsNoteNewPatient.abdomen = text?.trim();
                          })))),
      Padding(
          padding: EdgeInsets.only(left: 7, top: 15),
          child: CustomText(
              text: Strings.musculoskeletal,
              fontSize: FontStyles.medium,
              fontWeight: FontStyles.semiBoldFontWeight400)),
      Container(
          margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: CustomColors.grey3, width: 1),
              color: CustomColors.white),
          child: Padding(
              padding: EdgeInsets.only(top: 0.0, left: 20),
              child: Consumer<PostVisitProvider>(
                  builder: (context, model, child) =>
                      TextFormField(
                          onTap: () {
                            screenTracker.stopTimer();
                            screenTracker.startTimer(context);
                          },
                          controller: model.musculoskeletal,
                          maxLines: null,
                          //initialValue: Strings.musculoskeletalHint,
                          decoration: InputDecoration(
                              hintText: Strings.musculoskeletalHint,
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none),
                          onChanged: (text) {
                            model.doctorsNoteNewPatient.musculoskeletal =
                                text?.trim();
                          })))),
      Padding(
          padding: EdgeInsets.only(left: 7, top: 15),
          child: CustomText(
              text: Strings.extremities,
              fontSize: FontStyles.medium,
              fontWeight: FontStyles.semiBoldFontWeight400)),
      Container(
          margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: CustomColors.grey3, width: 1),
              color: CustomColors.white),
          child: Padding(
              padding: EdgeInsets.only(top: 0.0, left: 20),
              child: Consumer<PostVisitProvider>(
                  builder: (context, model, child) =>
                      TextFormField(
                          onTap: () {
                            screenTracker.stopTimer();
                            screenTracker.startTimer(context);
                          },
                          controller: model.extremities,
                          maxLines: null,
                          //initialValue: Strings.extremitiesHint,
                          decoration: InputDecoration(
                              hintText: Strings.extremitiesHint,
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none),
                          onChanged: (text) {
                            model.doctorsNoteNewPatient.extremities =
                                text?.trim();
                          })))),
      Padding(
          padding: EdgeInsets.only(left: 7, top: 15),
          child: CustomText(
              text: Strings.dermatologic,
              fontSize: FontStyles.medium,
              fontWeight: FontStyles.semiBoldFontWeight400)),
      Container(
          margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: CustomColors.grey3, width: 1),
              color: CustomColors.white),
          child: Padding(
              padding: EdgeInsets.only(top: 0.0, left: 20),
              child: Consumer<PostVisitProvider>(
                  builder: (context, model, child) =>
                      TextFormField(
                          onTap: () {
                            screenTracker.stopTimer();
                            screenTracker.startTimer(context);
                          },
                          controller: model.dermatologic,
                          maxLines: null,
                          //initialValue: Strings.dermatologicHint,
                          decoration: InputDecoration(
                              hintText: Strings.dermatologicHint,
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none),
                          onChanged: (text) {
                            model.doctorsNoteNewPatient.dermatologic =
                                text?.trim();
                          })))),
      Padding(
          padding: EdgeInsets.only(left: 7, top: 15),
          child: CustomText(
              text: Strings.neurological,
              fontSize: FontStyles.medium,
              fontWeight: FontStyles.semiBoldFontWeight400)),
      Container(
          margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: CustomColors.grey3, width: 1),
              color: CustomColors.white),
          child: Padding(
              padding: EdgeInsets.only(top: 0.0, left: 20, right: 5),
              child: Consumer<PostVisitProvider>(
                  builder: (context, model, child) =>
                      TextFormField(
                          onTap: () {
                            screenTracker.stopTimer();
                            screenTracker.startTimer(context);
                          },
                          controller: model.neurological,
                          maxLines: null,
                          //initialValue: Strings.neurologicalHint,
                          decoration: InputDecoration(
                              hintText: Strings.neurologicalHint,
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none),
                          onChanged: (text) {
                            model.doctorsNoteNewPatient.neurological =
                                text?.trim();
                          })))),
      Padding(
          padding: EdgeInsets.only(left: 7, top: 15),
          child: CustomText(
              text: Strings.psychiatry,
              fontSize: FontStyles.medium,
              fontWeight: FontStyles.semiBoldFontWeight400)),
      Container(
          margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: CustomColors.grey3, width: 1),
              color: CustomColors.white),
          child: Padding(
              padding: EdgeInsets.only(top: 0.0, left: 20, right: 5),
              child: Consumer<PostVisitProvider>(
                  builder: (context, model, child) =>
                      TextFormField(
                          onTap: () {
                            screenTracker.stopTimer();
                            screenTracker.startTimer(context);
                          },
                          controller: model.psychiatry,
                          maxLines: null,
                          //initialValue: Strings.psychiatryHint,
                          decoration: InputDecoration(
                              hintText: Strings.psychiatryHint,
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none),
                          onChanged: (text) {
                            model.doctorsNoteNewPatient.psychiatry =
                                text?.trim();
                          })))),
      Padding(
          padding: EdgeInsets.only(left: 7, top: 15),
          child: CustomText(
              text: Strings.assessment,
              fontSize: FontStyles.medium,
              fontWeight: FontStyles.semiBoldFontWeight400)),
      Container(
          margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: CustomColors.grey3, width: 1),
              color: CustomColors.white),
          child: Padding(
              padding: EdgeInsets.only(top: 0.0, left: 20),
              child: Consumer<PostVisitProvider>(
                  builder: (context, model, child) =>
                      TextFormField(
                          onTap: () {
                            screenTracker.stopTimer();
                            screenTracker.startTimer(context);
                          },
                          controller: model.assessment,
                          maxLines: null,
                          decoration: InputDecoration(
                              hintText: Strings.typeHere,
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none),
                          onChanged: (text) {
                            model.doctorsNoteNewPatient.assessment =
                                text?.trim();
                          })))),
      Padding(
          padding: EdgeInsets.only(left: 7, top: 15),
          child: CustomText(
              text: Strings.plan,
              fontSize: FontStyles.medium,
              fontWeight: FontStyles.semiBoldFontWeight400)),
      Container(
          margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: CustomColors.grey3, width: 1),
              color: CustomColors.white),
          child: Padding(
              padding: EdgeInsets.only(top: 0.0, left: 20),
              child: Consumer<PostVisitProvider>(
                  builder: (context, model, child) =>
                      TextFormField(
                          onTap: () {
                            screenTracker.stopTimer();
                            screenTracker.startTimer(context);
                          },
                          controller: model.plan,
                          maxLines: null,
                          decoration: InputDecoration(
                              hintText: Strings.typeHere,
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none),
                          onChanged: (text) {
                            model.doctorsNoteNewPatient.plan = text?.trim();
                          })))),
    ]);
  }

// Widget vitalTypes(context) {
//   return Consumer<PostVisitProvider>(
//       builder: (context, model, child) => ListView.builder(
//           physics: NeverScrollableScrollPhysics(),
//           shrinkWrap: true,
//           itemCount: model.vitalTypeControllerNew.length,
//           itemBuilder: (BuildContext context, int index) {
//             return Container(
//               margin: EdgeInsets.only(bottom: 10.0),
//               alignment: Alignment.center,
//               child: Stack(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 30.0),
//                     child: Column(
//                       children: [
//                         SizedBox(
//                           height: 33.0,
//                         ),
//                         Container(
//                             width: double.infinity,
//                             height: 50,
//                             decoration: BoxDecoration(
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(25.0)),
//                                 border: Border.all(
//                                     color: CustomColors.grey3, width: 1),
//                                 color: CustomColors.white),
//                             child: Consumer<PostVisitProvider>(
//                                 builder: (context, model, child) =>
//                                     PopupMenuButton(
//                                         offset: Offset(0.1, 0),
//                                         onSelected: (vitalType) {
//                                           FocusScope.of(context)
//                                               .requestFocus(FocusNode());
//                                           model.vitalTypeControllerNew
//                                               .elementAt(index)
//                                               .text = vitalType;
//                                           model.vitalValuesControllerNew
//                                               .elementAt(index)
//                                               .clear();
//                                         },
//                                         child: Padding(
//                                             padding: EdgeInsets.only(
//                                                 left: 20, right: 5, top: 2),
//                                             child: TextFormField(
//                                                 onTap: () {
//                                                   screenTracker.stopTimer();
//                                                   screenTracker
//                                                       .startTimer(context);
//                                                 },
//                                                 onChanged: (text) {},
//                                                 controller: model
//                                                     .vitalTypeControllerNew
//                                                     .elementAt(index),
//                                                 enabled: false,
//                                                 decoration: InputDecoration(
//                                                     hintText: Strings
//                                                         .selectVitalType,
//                                                     hintStyle: TextStyle(
//                                                       color: Colors.grey,
//                                                     ),
//                                                     suffixIcon: ImageIcon(AssetImage("assets/images/ic_drop_down1.png"),
//                                                         color: CustomColors
//                                                             .grey2),
//                                                     border: InputBorder.none),
//                                                 maxLines: 1)),
//                                         itemBuilder: (context) => Strings
//                                             .vitalTypeList
//                                             .map((vitalType) => PopupMenuItem(
//                                                 value: vitalType,
//                                                 child: Text(vitalType)))
//                                             .toList()))),
//                         Consumer<PostVisitProvider>(
//                             builder: (context, model, child) => Padding(
//                                 padding: EdgeInsets.only(top: 10),
//                                 child: CommonWidgets()
//                                     .customFormFieldController(context,
//                                         Strings.units, TextInputAction.done,
//                                         onChanged: (text) {},
//                                         inputType: TextInputType.number,
//                                         maxLines: 1,
//                                         maxLenghth: 4,
//                                         paddingLeft: 20.0,
//                                         inPutFormatters: <TextInputFormatter>[
//                                           FilteringTextInputFormatter.allow(
//                                               RegExp(r'[0-9\/]')),
//                                         ],
//                                         controller: model
//                                             .vitalValuesControllerNew
//                                             .elementAt(index)))),
//                         SizedBox(
//                           height: 10.0,
//                         ),
//                       ],
//                     ),
//                   ),
//                   model.vitalTypeControllerNew.length > 1
//                       ? Align(
//                           child: FlatButton(
//                               minWidth: 20,
//                               padding: EdgeInsets.zero,
//                               onPressed: () {
//                                 model.deleteVitalTypeNew(index);
//                               },
//                               child: Icon(
//                                 Icons.clear,
//                                 color: CustomColors.yellow1,
//                                 size: 30,
//                               )),
//                           alignment: Alignment.topRight,
//                         )
//                       : Container(),
//                 ],
//               ),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(10)),
//                   border: Border.all(
//                       color: Colors.grey.withOpacity(0.5), width: 1),
//                   color: Colors.grey.withOpacity(0.5)),
//             );
//           }));
// }
}

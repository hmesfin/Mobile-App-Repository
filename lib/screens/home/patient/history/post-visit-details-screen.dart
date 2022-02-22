import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:virtudoc_app/custom-widgets/custom-text.dart';
import 'package:virtudoc_app/custom-widgets/custom-top-bar.dart';
import 'package:virtudoc_app/screens/home/patient/appointment/appointment-provider.dart';
import 'package:virtudoc_app/utils/common-widgets.dart';
import 'package:virtudoc_app/utils/custom-colors.dart';
import 'package:virtudoc_app/utils/strings.dart';
import 'package:virtudoc_app/screens/home/patient/patientBottom_provider.dart';
import 'package:virtudoc_app/screens/home/patient/history/post-visit-list-screen.dart';
import 'package:virtudoc_app/screens/home/patient/history/history-provider.dart';
import '../../../../index.dart';
import 'package:flutter/scheduler.dart';

class PostVisitDetailsScreen extends StatefulWidget {
  final int postVisitId;

  PostVisitDetailsScreen(this.postVisitId);

  @override
  _PostVisitDetailsScreenState createState() => _PostVisitDetailsScreenState();
}

class _PostVisitDetailsScreenState extends State<PostVisitDetailsScreen> {
  AppBar appBar = AppBar();
  int appointmentId;

  String currentSelected = 'Video Call';
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  Map<String, dynamic> patientMapList;

  @override
  void initState() {
    super.initState();
    appointmentId = widget.postVisitId;

    WidgetsBinding.instance.addPostFrameCallback((_) => afterLayout());
  }

  afterLayout() {
    fetchList();
  }

  fetchList() async {
    try {
      setState(() {
        _saving = true;
      });
      SchedulerBinding.instance.addPostFrameCallback((_) {
        Provider.of<PostVisitDetailsProvider>(context, listen: false)
            .fetch(widget.postVisitId);
      });
      setState(() {
        _saving = false;
      });
    } catch (err) {
      setState(() {
        _saving = false;
      });
      CommonWidgets.showToast(context, Strings.dbError, _scaffoldKey);
    }
  }

  calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }

  var _isSaving = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: CustomColors.bg_app,
          body: _buildWidget(context),
        ));
  }

  _buildWidget(BuildContext context) {
    double appbarheight = appBar.preferredSize.height;
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height - appbarheight;
    return ModalProgressHUD(
      inAsyncCall: _isSaving,
      child: SingleChildScrollView(
        child: parentContainer(screenHeight, screenWidth, context),
      ),
    );
  }

  var _saving = false;

  parentContainer(double screenHeight, double screenWidth,
      BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _saving,
      opacity: 0.3,
      child: SingleChildScrollView(
        child: Provider
            .of<PostVisitDetailsProvider>(context, listen: true)
            .isLoading
            ? Container(
          child: Center(
            child: CommonWidgets.showLoader(context),
          ),
        )
            : Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CustomTopBar(
              context: context,
              titleText: Strings.visitForms,
            ),
            docNameAndExp(),
            middleList(screenWidth),
          ],
        ),
      ),
    );
  }

  Column middleList(screenWidth) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Container(child: purposeOfVisitTitle(screenWidth)),
      SizedBox(
        height: 5,
      ),
      singlePurposeOfVisit(
        screenWidth,
        Strings.cardiovascular,
        "${Provider
            .of<PostVisitDetailsProvider>(context, listen: false)
            .postVisitDetailsModel
            ?.doctorsNoteProgressNote
            ?.cardiovascular ?? 'NA'}",
      ),
      singlePurposeOfVisit(
        screenWidth,
        Strings.constitutional,
        "${Provider
            .of<PostVisitDetailsProvider>(context, listen: false)
            .postVisitDetailsModel
            ?.doctorsNoteProgressNote
            ?.constitutional ?? 'NA'}",
      ),
      singlePurposeOfVisit(
        screenWidth,
        Strings.endocrine,
        "${Provider
            .of<PostVisitDetailsProvider>(context, listen: false)
            .postVisitDetailsModel
            ?.doctorsNoteProgressNote
            ?.endocrine ?? 'NA'}",
      ),
      singlePurposeOfVisit(
        screenWidth,
        Strings.genitourinary,
        "${Provider
            .of<PostVisitDetailsProvider>(context, listen: false)
            .postVisitDetailsModel
            ?.doctorsNoteProgressNote
            ?.genitourinary ?? 'NA'}",
      ),
      singlePurposeOfVisit(
        screenWidth,
        Strings.gastrointestinal,
        "${Provider
            .of<PostVisitDetailsProvider>(context, listen: false)
            .postVisitDetailsModel
            ?.doctorsNoteProgressNote
            ?.gastrointestinal ?? 'NA'}",
      ),
      singlePurposeOfVisit(
        screenWidth,
        Strings.respiratory,
        "${Provider
            .of<PostVisitDetailsProvider>(context, listen: false)
            .postVisitDetailsModel
            ?.doctorsNoteProgressNote
            ?.endocrine ?? 'NA'}",
      ),
      singlePurposeOfVisit(
        screenWidth,
        Strings.skin,
        "${Provider
            .of<PostVisitDetailsProvider>(context, listen: false)
            .postVisitDetailsModel
            ?.doctorsNoteProgressNote
            ?.skin ?? 'NA'}",
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Divider(
          thickness: 1,
          color: CustomColors.grey1,
        ),
      ),
      historyAndExam(screenWidth),
    ]);
  }

  Column historyAndExam(screenWidth) {
    return Column(
      children: [
        historyAndPhysicalExaminationTitle(screenWidth),
        singlePurposeOfVisit(
          screenWidth,
          Strings.chiefCompaint,
          "${Provider
              .of<PostVisitDetailsProvider>(context, listen: false)
              .postVisitDetailsModel
              ?.historyAndPhysicalExamination
              ?.chiefComplaint ?? 'NA'}",
        ),
        singlePurposeOfVisit(
          screenWidth,
          Strings.historyofPresentillness,
          "${Provider
              .of<PostVisitDetailsProvider>(context, listen: false)
              .postVisitDetailsModel
              ?.historyAndPhysicalExamination
              ?.historyOfPresentIllness ?? 'NA'}",
        ),
        singlePurposeOfVisit(
          screenWidth,
          Strings.hospitalizationHistory,
          "${Provider
              .of<PostVisitDetailsProvider>(context, listen: false)
              .postVisitDetailsModel
              ?.historyAndPhysicalExamination
              ?.hospitalizationHistory ?? 'NA'}",
        ),
        singlePurposeOfVisit(
          screenWidth,
          Strings.medication,
          "${Provider
              .of<PostVisitDetailsProvider>(context, listen: false)
              .postVisitDetailsModel
              ?.historyAndPhysicalExamination
              ?.medication ?? 'NA'}",
        ),
        singlePurposeOfVisit(
          screenWidth,
          Strings.pastSurgicalHistory,
          "${Provider
              .of<PostVisitDetailsProvider>(context, listen: false)
              .postVisitDetailsModel
              ?.historyAndPhysicalExamination
              ?.pastSurgicalHistory ?? 'NA'}",
        ),
        singlePurposeOfVisit(
          screenWidth,
          Strings.socialHistory,
          "${Provider
              .of<PostVisitDetailsProvider>(context, listen: false)
              .postVisitDetailsModel
              ?.historyAndPhysicalExamination
              ?.socialHistory ?? 'NA'}",
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Container historyAndPhysicalExaminationTitle(screenWidth) {
    return Container(
        child: Row(
          children: [
            Container(
              width: screenWidth,
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  CustomText(
                    text: "${Strings.historyPhysicalExam}:-",
                    fontSize: 18,
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Row purposeOfVisitTitle(screenWidth) {
    return Row(
      children: [
        Container(
          width: screenWidth,
          child: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              CustomText(
                text: "${Strings.purposeOfVisit}-",
                fontSize: 18,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column singlePurposeOfVisit(double screenWidth, String title, String value) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Container(
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                CustomText(
                  width: screenWidth * 0.4,
                  maxLines: 2,
                  textAlign: TextAlign.start,
                  text: title,
                  fontSize: 14,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: CustomText(
                    maxLines: 100,
                    margin: EdgeInsets.only(right: 10),
                    textAlign: TextAlign.justify,
                    text: value,
                    fontSize: 14,
                    color: CustomColors.grey2,
                  ),
                )
              ],
            )),
      ],
    );
  }

  Container singleTile(String title, String value) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 30,
              ),
              CustomText(
                text: title,
                fontSize: 15,
              ),
              SizedBox(
                width: 10,
              ),
              CustomText(
                text: value,
                textAlign: TextAlign.start,
                fontSize: 15,
                color: CustomColors.grey2,
              )
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Divider(
              thickness: 1,
              color: CustomColors.grey1,
            ),
          )
        ],
      ),
    );
  }

  Widget doctorDetials(double screenHeight, double screenWidth) {
    return Container(
      width: screenWidth,
      child: Column(
        children: [
          topDocCard(),
        ],
      ),
    );
  }

  GestureDetector commonInteractButton(double screenwidth,
      double screenheight, {
        String imageName,
        String title,
        @required Function onTap,
      }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 30),
        // padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
        width: screenwidth * .4,
        height: screenheight * .073,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          border: Border.all(
              color: currentSelected == title
                  ? CustomColors.yellow1
                  : CustomColors.grey2),
          // color: Color(0xffe09f0e),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(right: 10),
                child: CommonWidgets().getImage(imageName,
                    color: currentSelected == title
                        ? CustomColors.yellow1
                        : CustomColors.grey2),
              ),
              Text(title,
                  style: TextStyle(
                      color: currentSelected == title
                          ? CustomColors.yellow1
                          : CustomColors.grey2,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Roboto",
                      fontStyle: FontStyle.normal,
                      fontSize: 16.0),
                  textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Provider.of<PostVisitProvider>(context, listen: false).init(
        //     doctorId: appointmentDetail.drId,
        //     appointmentId: appointmentDetail.appointmentId,
        //     patientId: appointmentDetail.patientId,
        //     age: calculateAge(DateTime(
        //         DateFormat('dd-mm-yyyy')
        //             .parse(appointmentDetail.patientDob)
        //             .year,
        //         DateFormat('dd-mm-yyyy')
        //             .parse(appointmentDetail.patientDob)
        //             .month,
        //         DateFormat('dd-mm-yyyy')
        //             .parse(appointmentDetail.patientDob)
        //             .day)),
        //     name: appointmentDetail.patientName,
        //     gender: appointmentDetail.patientGender,
        //     patient_details: appointmentDetail.additionalNote);
        // Provider.of<PlaceOrderProvider>(context, listen: false).init(
        //     doctorId: appointmentDetail.drId,
        //     appointmentId: appointmentDetail.appointmentId,
        //     patientId: appointmentDetail.patientId);
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => PostVisitFirst(),
        //     ));
      },
      child: Container(
        margin: EdgeInsets.only(top: 30, bottom: 30),
        width: 200,
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          color: Color(0xffe09f0e),
        ),
        child: Center(
          child: Text("Create Prescription".toUpperCase(),
              style: TextStyle(
                  color: Color(0xffffffff),
                  fontWeight: FontWeight.w500,
                  fontFamily: "Roboto",
                  fontStyle: FontStyle.normal,
                  fontSize: 16.0),
              textAlign: TextAlign.center),
        ),
      ),
    );
  }

  Widget historyButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PostVisitListScreen(),
            ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 30),
        width: 200,
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          color: Color(0xffe09f0e),
        ),
        child: Center(
          child: Text(Strings.history.toUpperCase(),
              style: TextStyle(
                  color: Color(0xffffffff),
                  fontWeight: FontWeight.w500,
                  fontFamily: "Roboto",
                  fontStyle: FontStyle.normal,
                  fontSize: 16.0),
              textAlign: TextAlign.center),
        ),
      ),
    );
  }

  var requestType = 'upcomming';

  Widget cancelButton(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        try {
          setState(() {
            _saving = true;
          });
          var response = await ApiRequest.postApi(ApiUrl.actionOnAppointment, {
            'appointment_id': widget.postVisitId,
            'action': 3,
          });

          Map decode = jsonDecode(response.body);

          if (decode['success']) {
            CommonWidgets.showToast(
                context, Strings.appointment_cancelled, _scaffoldKey);
            Provider
                .of<AppointmentProvider>(context, listen: false)
                .page = 1;
            Provider.of<AppointmentProvider>(context, listen: false)
                .fetchListPatient(
                requestType,
                Provider
                    .of<AppointmentProvider>(context, listen: false)
                    .page);
            Provider.of<PatientBottomProvider>(context, listen: false)
                .onItemTapped(3);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => BottomNavbar(),
              ),
            );
            setState(() {
              _saving = false;
            });
          } else {
            setState(() {
              _saving = false;
            });
          }
        } catch (err) {
          CommonWidgets.showToast(context, "$err", _scaffoldKey);
        }

        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => PostVisitFirst(),
        //     ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 30),
        width: 200,
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          color: CustomColors.red,
        ),
        child: Center(
          child: Text("Cancel".toUpperCase(),
              style: TextStyle(
                  color: Color(0xffffffff),
                  fontWeight: FontWeight.w500,
                  fontFamily: "Roboto",
                  fontStyle: FontStyle.normal,
                  fontSize: 16.0),
              textAlign: TextAlign.center),
        ),
      ),
    );
  }

  Row topDocCard() {
    return Row(
      children: [],
    );
  }

  Container docNameAndExp() {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: Provider
                .of<PostVisitDetailsProvider>(context, listen: false)
                .postVisitDetailsModel
                .name ??
                '',
            fontSize: 20.0,
          ),
          SizedBox(
            height: 10,
          ),
          CustomText(
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.justify,
            maxLines: 100,
            text: 'Patient Details:',
            fontSize: 16.0,
            fontWeight: FontWeight.normal,
          ),
          CustomText(
            overflow: TextOverflow.ellipsis,
            width: CommonWidgets().getWidth(context),
            textAlign: TextAlign.justify,
            maxLines: 200,
            text:
            "${Provider
                .of<PostVisitDetailsProvider>(context, listen: false)
                .postVisitDetailsModel
                .patientDetails}",
            fontSize: 14.0,
            fontWeight: FontWeight.normal,
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Row middleDocCard(double screenWidth) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 30, right: 10),
          child: Image.asset(
            "assets/images/ic_type2.png",
            height: 20,
            width: 20,
          ),
        ),
        CustomText(
          // text: widget.doctorModel.type2[0],
          maxLines: 4,
          width: CommonWidgets().getWidth(context) * 0.82,
          text: '',
          // "${appointmentDetail.postGrad}, ${appointmentDetail.underGrad}, ${appointmentDetail.speciality[0]}",
          color: CustomColors.grey2,
          fontSize: 16.0,
          textAlign: TextAlign.start,
        ),
        // appointmentDetail.underGrad.length == 0
        //     ? SizedBox()
        //     : CustomText(
        //         // text: widget.doctorModel.type2[0],
        //         maxLines: 5,
        //         width: CommonWidgets().getWidth(context) * 0.4,
        //         text: ", ${appointmentDetail.underGrad}",
        //         color: CustomColors.grey2,
        //         fontSize: 16.0,
        //       ),
        // appointmentDetail.speciality[0].length == 0
        //     ? SizedBox()
        //     : CustomText(
        //         // text: widget.doctorModel.type2[0],
        //         maxLines: 5,
        //         width: CommonWidgets().getWidth(context) * 0.4,
        //         text: ", ${appointmentDetail.underGrad}",
        //         color: CustomColors.grey2,
        //         fontSize: 16.0,
        //       ),
      ],
    );
  }

  Padding bottomDocCard() {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          docLocation(),
        ],
      ),
    );
  }

  Row docLocation() {
    return Row(
      children: [
        CustomText(
          text: Strings.location,
          fontSize: 15.0,
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }
}

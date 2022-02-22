// import 'dart:html';

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:virtudoc_app/custom-widgets/custom-text.dart';
import 'package:virtudoc_app/custom-widgets/custom-top-bar.dart';
import 'package:virtudoc_app/screens/home/doctor/chat/chat-detail.dart';
import 'package:virtudoc_app/screens/home/patient/appointment/appointment-model.dart';
import 'package:virtudoc_app/screens/home/patient/appointment/appointment-provider.dart';
import 'package:virtudoc_app/screens/home/patient/history/post-visit-list-screen.dart';
import 'package:virtudoc_app/screens/home/patient/patientBottom_provider.dart';
import 'package:virtudoc_app/screens/video_call/video_call_provider.dart';
import 'package:virtudoc_app/utils/common-helper.dart';
import 'package:virtudoc_app/utils/common-widgets.dart';
import 'package:virtudoc_app/utils/custom-colors.dart';
import 'package:virtudoc_app/utils/screen_tracker/screen_tracker.dart';
import 'package:virtudoc_app/utils/strings.dart';
import 'package:virtudoc_app/utils/styles.dart';

import '../../../../index.dart';

class AppointmentDetail extends StatefulWidget {
  // final DoctorModel doctorModel;
  // final TimeSlotModel timeSlotModel;
  // final DateSlotModel dateSlotModel;
  final int appointmentId;
  final bool isPatient;

  AppointmentDetail(this.appointmentId, this.isPatient);

  @override
  _AppointmentDetailState createState() => _AppointmentDetailState();
}

class _AppointmentDetailState extends State<AppointmentDetail> {
  AppBar appBar = AppBar();
  int appointmentId;
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  bool chatAvailability = false;
  bool videoCallAvaility = false;
  bool createPrescriptionAvaility = false;
  int differenceStartMinutes = 0;
  int differenceEndMinutes = 0;
  int differenceHours = 0;
  int differenceDays = 0;
  String currentSelected = 'Video Call';
  DateTime appointmentDateTimeUTC;
  DateTime appointmentDateTimeLocal;
  DateTime appointmentEndDateTimeUTC;
  DateTime appointmentEndDateTimeLocal;

  Map<String, dynamic> patientMapList;
  AppointmentDetailModel appointmentDetail = AppointmentDetailModel(
    appointmentId: 0,
    additionalNote: '',
    status: 0,
    date: '',
    drCity: '',
    drCountry: '',
    drSubCity: '',
    drRegion: '',
    drHouseNumber: '',
    drId: 0,
    drName: '',
    patientHouseNo: '',
    patientRegion: '',
    patientSubCity: '',
    patientPic: '',
    // drPic: '',
    endTime: '',
    experience: 0,
    patientDob: '',
    patientGender: '',
    patientHeight: 0,
    patientId: 0,
    patientName: '',
    patientState: '',
    drState: '',
    patientWeight: 0,
    postGrad: '',
    underGrad: '',
    purpose: '',
    speciality: [''],
    startTime: '',
    patientCity: "",
    patientCountry: "",
    patientHouseNumber: "",
    // patientPic: "",
    patientUnit: "",
  );

  @override
  void initState() {
    super.initState();
    appointmentId = widget.appointmentId;

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

      var response = await ApiRequest.getApi(
          ApiUrl.appointmentDetail + '?appointment_id=$appointmentId');
      Map decoded = jsonDecode(response.body);
      Map detail = decoded['body']['data'];
      appointmentDetail.appointmentId = detail['appointment_id'];
      appointmentDetail.isChatInitiated = detail['is_chat_initiated'] ?? false;

      appointmentDetail.status = detail['status'];

      appointmentDetail.drPic = detail['doctor']['user_profile']
      ['profile_image'] ??
          "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png";

      appointmentDetail.drId = detail['doctor_id'];

      appointmentDetail.patientId = detail['patient_id'];

      appointmentDetail.startTime = detail['start_time'] ?? '';

      appointmentDetail.endTime = detail['end_time'] ?? '';

      appointmentDetail.date = detail['date'] ?? '';

      appointmentDetail.purpose = detail['purpose'] ?? '';

      appointmentDetail.additionalNote = detail['additional_note'] ?? '';

      appointmentDetail.drName = detail['doctor']['first_name'] +
          ' ' +
          detail['doctor']['last_name'] ??
          '';

      appointmentDetail.patientName = detail['patient']['first_name'] +
          " " +
          detail['patient']['last_name'] ??
          '';

      appointmentDetail.postGrad = detail['doctor']['user_profile']
      ['enrollment_information']['post_grad'] ??
          '';

      appointmentDetail.underGrad = detail['doctor']['user_profile']
      ['enrollment_information']['under_grad'] ??
          '';

      appointmentDetail.patientDob =
          detail['patient']['user_profile']['biometrics']['dob'] ?? '';

      appointmentDetail.patientCity =
          detail['patient']['user_profile']['address']['city'] ?? "";

      appointmentDetail.patientState =
          detail['patient']['user_profile']['address']['state'] ?? "";

      appointmentDetail.patientCountry =
          detail['patient']['user_profile']['address']['country'] ?? "";

      appointmentDetail.patientHouseNo =
          detail['patient']['user_profile']['address']['house_no'] ?? "";

      appointmentDetail.patientRegion =
          detail['patient']['user_profile']['address']['region'] ?? "";

      appointmentDetail.patientSubCity =
          detail['patient']['user_profile']['address']['sub_city'] ?? "";

      appointmentDetail.patientHeight =
      detail['patient']['user_profile']['biometrics']['height'];

      appointmentDetail.patientWeight =
      detail['patient']['user_profile']['biometrics']['weight'];

      appointmentDetail.patientGender =
          detail['patient']['user_profile']['biometrics']['gender'] ?? '';

      appointmentDetail.drCity =
          detail['doctor']['user_profile']['address']['city'] ?? '';

      appointmentDetail.drSubCity =
          detail['doctor']['user_profile']['address']['sub_city'] ?? '';

      appointmentDetail.drState =
          detail['doctor']['user_profile']['address']['state'] ?? '';

      appointmentDetail.drRegion =
          detail['doctor']['user_profile']['address']['region'] ?? '';

      appointmentDetail.drCountry =
          detail['doctor']['user_profile']['address']['country'] ?? '';

      appointmentDetail.drHouseNumber =
          detail['doctor']['user_profile']['address']['house_no'] ?? '';

      appointmentDetail.speciality = detail['doctor']['user_profile']
      ['enrollment_information']['speciality'] ??
          ['N.A.'];

      appointmentDetail.subSpeciality = detail['doctor']['user_profile']
      ['enrollment_information']['sub_speciality'] ??
          '';

      appointmentDetail.experience = detail['doctor']['user_profile']
      ['enrollment_information']['years_of_experience'];

      appointmentDetail.patientUnit =
          detail['patient']['user_profile']['biometrics']['unit'] ?? '';

      appointmentDetail.patientPic =
      detail['patient']['user_profile']['profile_image'];

      appointmentDetail.fee = detail['appointment_fee'] ?? 20;

      //calculating date time of appointment
      appointmentDateTimeUTC = DateFormat('yyyy-MM-DD HH:mm').parse(
          DateFormat('yyyy-MM-DD')
              .parse(appointmentDetail.date)
              .toString()
              .split(" ")[0] +
              " " +
              DateFormat("HH:mm")
                  .parse(appointmentDetail.startTime)
                  .toString()
                  .split(" ")[1]);
      //calculating local time
      appointmentDateTimeLocal =
          DateTime.parse(appointmentDateTimeUTC.toString() + 'Z').toLocal();

      //calculating date time of appointment
      appointmentEndDateTimeUTC = DateFormat('yyyy-MM-DD HH:mm').parse(
          DateFormat('yyyy-MM-DD')
              .parse(appointmentDetail.date)
              .toString()
              .split(" ")[0] +
              " " +
              DateFormat("HH:mm")
                  .parse(appointmentDetail.endTime)
                  .toString()
                  .split(" ")[1]);
      //calculating local time
      appointmentEndDateTimeLocal =
          DateTime.parse(appointmentEndDateTimeUTC.toString() + 'Z').toLocal();

      // finding the current time
      DateTime currentTime =
      DateFormat('yyyy-MM-DD HH:mm').parse(DateTime.now().toString());

      //finding the time differences
      int differenceInMInutes =
          currentTime
              .difference(appointmentDateTimeLocal)
              .inMinutes;

      //setting the avialability of the buttons
      setAvaility(differenceInMInutes);

      setState(() {
        _saving = false;
      });

      setState(() {});
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

  var diffTime = 0;

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
    return Container(
      height: screenHeight + 30,
      width: screenWidth,
      decoration: BoxDecoration(
        color: CustomColors.bg_app,
      ),
      child: ModalProgressHUD(
        inAsyncCall: _saving,
        opacity: 0.3,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CustomTopBar(
                context: context,
                titleText: Strings.appointment_detail,
              ),
              doctorDetials(screenHeight, screenWidth),
              middleList(screenWidth),
              additionalInfo(screenWidth),

              //show the video call/chat and finish appointment and cancel button only
              //when the appointment is not finsihed and not canceled
              if (appointmentDetail.status == 2 ||
                  appointmentDetail.status == 3)
                SizedBox()
              else
                Column(
                  children: [
                    //show video call and chat button
                    if ((widget.isPatient &&
                        appointmentDetail.isChatInitiated ??
                        false))
                      commonInteractButton(
                        screenWidth,
                        screenHeight,
                        imageName: 'chat_grp.png',
                        title: 'Chat',
                        onTap: () async {
                          setState(() {
                            currentSelected = 'Chat';
                          });

                          await PreferenceUtils.putBool(
                              PreferenceKeys.IS_CHATTING, true);
                          Provider
                              .of<ChatProvider>(context, listen: false)
                              .appointmentId = appointmentDetail.appointmentId;
                          Provider
                              .of<ChatProvider>(context, listen: false)
                              .username =
                          (widget?.isPatient ?? false)
                              ? appointmentDetail.patientName
                              : appointmentDetail.drName;
                          Provider
                              .of<ChatProvider>(context, listen: false)
                              .otherUsername =
                          (widget?.isPatient ?? false)
                              ? appointmentDetail.drName
                              : appointmentDetail.patientName;
                          Provider
                              .of<ChatProvider>(context, listen: false)
                              .pic =
                          (widget?.isPatient ?? false)
                              ? appointmentDetail.patientPic
                              : appointmentDetail.drPic;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChatDetail()));
                        },
                      ),
                    if (!widget.isPatient)
                      interactButtons(context, screenWidth, screenHeight),

                    //show finish appointmetn button
                    (widget.isPatient is bool ? widget.isPatient : false)
                        ? SizedBox()
                        : true //createPrescriptionAvaility
                        ? bottomButton(context)
                        : disableButton(),
                    //show cancel button only when the appoitment is pending
                    if (widget?.isPatient ?? false) SizedBox(height: 10.0),
                    appointmentDetail.status == 0
                        ? cancelButton(context)
                        : SizedBox(),
                  ],
                ),

              //show history button
              (widget.isPatient is bool ? widget.isPatient : false)
                  ? SizedBox()
                  : historyButton(context),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container disableButton() {
    return Container(
      margin: EdgeInsets.only(top: 30, bottom: 30),
      width: 200,
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(24)),
        color: CustomColors.grey3,
      ),
      child: Center(
        child: Text(Strings.createPrescription.toUpperCase(),
            style: TextStyle(
                color: Color(0xffffffff),
                fontWeight: FontWeight.w500,
                fontFamily: "Roboto",
                fontStyle: FontStyle.normal,
                fontSize: 16.0),
            textAlign: TextAlign.center),
      ),
    );
  }

  Column middleList(screenWidth) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Container(
        margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
        child: Divider(
          thickness: 1,
          color: CustomColors.grey1,
        ),
      ),
      singleTile(Strings.purposeOfVisit, appointmentDetail.purpose),
      if (appointmentDateTimeLocal != null)
        singleTile(
          Strings.appointmentSlot,
          _saving == false
              ? (" " +
              (DateFormat("hh:mm").format(appointmentDateTimeLocal)) +
              ' - ' +
              (DateFormat("hh:mm a").format(appointmentEndDateTimeLocal)) +
              "\n" +
              (DateFormat(" EEEE, dd MMM yyyy")
                  .format(appointmentDateTimeLocal)
                  .toString()))
              : "",
        ),
      (widget.isPatient is bool ? widget.isPatient : false)
          ? singleTile(
          Strings.consultationFee, "\$${appointmentDetail.fee.toString()}")
          : SizedBox(),
      // singleTile(Strings.patientName, appointmentDetail.patientName),
      (widget.isPatient is bool ? widget.isPatient : false)
          ? Container(
          child: Row(
            children: [
              Container(
                width: screenWidth * .38,
                child: Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    CustomText(
                      text: Strings.patientName,
                      fontSize: 15,
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    CustomText(
                      text: appointmentDetail.patientName,
                      textAlign: TextAlign.start,
                      fontSize: 15,
                      color: CustomColors.grey2,
                    )
                  ],
                ),
              ),
            ],
          ))
          : SizedBox(),
      SizedBox(
        height: 5,
      ),
      Container(
          child: Row(
            children: [
              Container(
                width: screenWidth * .38,
                child: Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    CustomText(
                      text: 'Age: ',
                      fontSize: 15,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              if (appointmentDetail.patientDob != null)
                CustomText(
                  text: _saving
                      ? ""
                      : calculateAge(DateTime(
                      DateFormat('dd-mm-yyyy')
                          .parse(appointmentDetail.patientDob)
                          .year,
                      DateFormat('dd-mm-yyyy')
                          .parse(appointmentDetail.patientDob)
                          .month,
                      DateFormat('dd-mm-yyyy')
                          .parse(appointmentDetail.patientDob)
                          .day))
                      .toString() +
                      " " +
                      Strings.years,
                  textAlign: TextAlign.start,
                  fontSize: 15,
                  color: CustomColors.grey2,
                )
            ],
          )),
      SizedBox(
        height: 5,
      ),

      Container(
        width: screenWidth * .38,
        child: Row(
          children: [],
        ),
      ),

      Container(
          child: Row(
            children: [
              Container(
                width: screenWidth * .38,
                child: Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    CustomText(
                      text: 'Gender: ',
                      fontSize: 15,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              CustomText(
                text: appointmentDetail.patientGender,
                textAlign: TextAlign.start,
                fontSize: 15,
                color: CustomColors.grey2,
              )
            ],
          )),
      SizedBox(
        height: 5,
      ),
      Container(
          child: Row(
            children: [
              Container(
                width: screenWidth * .38,
                child: Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    CustomText(
                      text: 'Height: ',
                      fontSize: 15,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              CustomText(
                text: (appointmentDetail.patientUnit == "Metric")
                    ? (appointmentDetail.patientHeight.toString() + " cms")
                    : (appointmentDetail.patientHeight.toString() + " In"),
                textAlign: TextAlign.start,
                fontSize: 15,
                color: CustomColors.grey2,
              )
            ],
          )),
      SizedBox(
        height: 5,
      ),
      Container(
          child: Row(
            children: [
              Container(
                width: screenWidth * .38,
                child: Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    CustomText(
                      text: 'Weight: ',
                      fontSize: 15,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              CustomText(
                text: (appointmentDetail.patientUnit == "Metric")
                    ? (appointmentDetail.patientWeight.toString() + " kgs")
                    : (appointmentDetail.patientWeight.toString() + " lbs"),
                textAlign: TextAlign.start,
                fontSize: 15,
                color: CustomColors.grey2,
              )
            ],
          )),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Divider(
          thickness: 1,
          color: CustomColors.grey1,
        ),
      )
    ]);
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
          widget.isPatient
              ? SizedBox(
            height: 16,
          )
              : SizedBox(),
          (widget.isPatient is bool ? widget.isPatient : false)
              ? middleDocCard(screenWidth)
              : SizedBox(),
          (widget.isPatient is bool ? widget.isPatient : false)
              ? SizedBox(
            height: 17,
          )
              : SizedBox(),
          (widget.isPatient) ? bottomDocCard() : SizedBox(),
        ],
      ),
    );
  }

  Widget additionalInfo(double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(top: 10, bottom: 30, left: 30),
          child: RichText(
              text: TextSpan(children: [
                TextSpan(
                    style: TextStyle(
                        color: CustomColors.black1,
                        fontWeight: FontStyles.semiBoldFontWeight500,
                        fontSize: 15),
                    text: Strings.additional_information + ': '),
                TextSpan(
                  style: TextStyle(
                      color: CustomColors.grey2,
                      fontWeight: FontStyles.semiBoldFontWeight500,
                      fontFamily: FontStyles.fontFamly,
                      fontStyle: FontStyle.normal,
                      fontSize: 15),
                  text: appointmentDetail.additionalNote.length > 1
                      ? appointmentDetail.additionalNote
                      : "N.A.",
                )
              ])),
        ),
      ],
    );
  }

  Widget interactButtons(BuildContext context, double screenwidth,
      double screenheight) {
    return Container(
      padding: EdgeInsets.only(bottom: 30, right: 10, left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // if (videoCallAvaility)
          if (!widget.isPatient)
            commonInteractButton(
              screenwidth,
              screenheight,
              imageName: 'video_icon.png',
              title: 'Video Call',
              onTap: () async {
                String meetLink =
                    "${randomStringGenerator(3)}-${randomStringGenerator(
                    3)}-${randomStringGenerator(3)}";
                PreferenceUtils.putBool(PreferenceKeys.IS_CALLING, true);
                await Provider.of<VideoCallProvider>(context, listen: false)
                    .initiateCall(
                    appointmentId: appointmentDetail.appointmentId,
                    meetLink: meetLink);

                Provider.of<VideoCallProvider>(context, listen: false)
                    .videoCallPage(
                    link: meetLink,
                    doctorImage: appointmentDetail.patientPic,
                    doctorName: appointmentDetail.patientName);

                setState(() {
                  currentSelected = 'Video Call';
                });
              },
            ),
          SizedBox(),
          // if (chatAvailability)

          commonInteractButton(
            screenwidth,
            screenheight,
            imageName: 'chat_grp.png',
            title: 'Chat',
            onTap: () {
              setState(() {
                currentSelected = 'Chat';
              });

              Provider
                  .of<ChatProvider>(context, listen: false)
                  .appointmentId =
                  appointmentDetail.appointmentId;
              Provider
                  .of<ChatProvider>(context, listen: false)
                  .username =
              (widget?.isPatient ?? false)
                  ? appointmentDetail.patientName
                  : appointmentDetail.drName;
              Provider
                  .of<ChatProvider>(context, listen: false)
                  .otherUsername =
              (widget?.isPatient ?? false)
                  ? appointmentDetail.drName
                  : appointmentDetail.patientName;
              Provider
                  .of<ChatProvider>(context, listen: false)
                  .pic =
              (widget?.isPatient ?? false)
                  ? appointmentDetail.patientPic
                  : appointmentDetail.drPic;
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ChatDetail()));
            },
          ),
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
      onTap: () {
        onTap();
        screenTracker.stopTimer();
        screenTracker.startTimer(context);
      },
      behavior: HitTestBehavior.translucent,
      onDoubleTap: () {
        screenTracker.stopTimer();
        screenTracker.startTimer(context);
      },
      onVerticalDragStart: (dragDetails) {
        screenTracker.stopTimer();
        screenTracker.startTimer(context);
      },
      onHorizontalDragStart: (dragDetails) {
        screenTracker.stopTimer();
        screenTracker.startTimer(context);
      },
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
        Provider.of<PostVisitProvider>(context, listen: false).init(
            doctorId: appointmentDetail.drId,
            appointmentId: appointmentDetail.appointmentId,
            patientId: appointmentDetail.patientId,
            age: calculateAge(DateTime(
                DateFormat('dd-mm-yyyy')
                    .parse(appointmentDetail.patientDob)
                    .year,
                DateFormat('dd-mm-yyyy')
                    .parse(appointmentDetail.patientDob)
                    .month,
                DateFormat('dd-mm-yyyy')
                    .parse(appointmentDetail.patientDob)
                    .day)),
            name: appointmentDetail.patientName,
            gender: appointmentDetail.patientGender,
            patient_details: appointmentDetail.additionalNote);
        Provider.of<PlaceOrderProvider>(context, listen: false).init(
            doctorId: appointmentDetail.drId,
            appointmentId: appointmentDetail.appointmentId,
            patientId: appointmentDetail.patientId);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PostVisitFirst(),
              // builder: (context) => PlaceOrder(),
            ));
        screenTracker.stopTimer();
        screenTracker.startTimer(context);
      },
      behavior: HitTestBehavior.translucent,
      onDoubleTap: () {
        screenTracker.stopTimer();
        screenTracker.startTimer(context);
      },
      onVerticalDragStart: (dragDetails) {
        screenTracker.stopTimer();
        screenTracker.startTimer(context);
      },
      onHorizontalDragStart: (dragDetails) {
        screenTracker.stopTimer();
        screenTracker.startTimer(context);
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
          child: Text(Strings.createPrescription.toUpperCase(),
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
        Provider.of<PostVisitProvider>(context, listen: false).init(
            doctorId: appointmentDetail.drId,
            appointmentId: appointmentDetail.appointmentId,
            patientId: appointmentDetail.patientId,
            age: calculateAge(DateTime(
                DateFormat('dd-mm-yyyy')
                    .parse(appointmentDetail.patientDob)
                    .year,
                DateFormat('dd-mm-yyyy')
                    .parse(appointmentDetail.patientDob)
                    .month,
                DateFormat('dd-mm-yyyy')
                    .parse(appointmentDetail.patientDob)
                    .day)),
            name: appointmentDetail.patientName,
            gender: appointmentDetail.patientGender,
            patient_details: appointmentDetail.additionalNote);
        Provider.of<PlaceOrderProvider>(context, listen: false).init(
            doctorId: appointmentDetail.drId,
            appointmentId: appointmentDetail.appointmentId,
            patientId: appointmentDetail.patientId);

        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PostVisitListScreen(),
            ));
        screenTracker.stopTimer();
        screenTracker.startTimer(context);
      },
      behavior: HitTestBehavior.translucent,
      onDoubleTap: () {
        screenTracker.stopTimer();
        screenTracker.startTimer(context);
      },
      onVerticalDragStart: (dragDetails) {
        screenTracker.stopTimer();
        screenTracker.startTimer(context);
      },
      onHorizontalDragStart: (dragDetails) {
        screenTracker.stopTimer();
        screenTracker.startTimer(context);
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
        screenTracker.stopTimer();
        screenTracker.startTimer(context);
        var isTapped = false;

        return showDialog(
          context: context,
          builder: (context) =>
              Builder(
                builder: (context) =>
                    StatefulBuilder(builder: (BuildContext context,
                        StateSetter modelSetState,) {
                      return Dialog(
                        backgroundColor: CustomColors.bg_app,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: isTapped
                            ? Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(0, 50, 0, 50),
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          ],
                        )
                            : Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              margin: EdgeInsets.only(top: 40, bottom: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color:
                                //  color ??
                                CustomColors.grey,
                              ),
                              child:
                              // icon ??
                              Container(
                                margin: EdgeInsets.all(10),
                                child: Icon(Icons.delete_outline),
                              ),
                            ),
                            CustomText(
                                text: Strings.cancelled_appointment,
                                fontSize: 20),
                            SizedBox(
                              height: 7,
                            ),
                            Center(
                              child: CustomText(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  maxLines: 3,
                                  text: Strings.appointment_cancelled_question,
                                  textAlign: TextAlign.center,
                                  color: CustomColors.grey2,
                                  fontWeight: FontStyles.semiBoldFontWeight400,
                                  fontSize: 16.0),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(8),
                                    bottomLeft: Radius.circular(8),
                                  )),
                              child: Row(
                                children: [
                                  CommonWidgets.bottomButton(
                                      context: context,
                                      color: CustomColors.grey2,
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      text: Strings.no ?? Strings.reject),
                                  // model.isLoading
                                  //     ? CommonWidgets.showLoader(context)
                                  //     :
                                  CommonWidgets.bottomButton(
                                      context: context,
                                      color: CustomColors.yellow1,
                                      onTap: () async {
                                        try {
                                          // Navigator.pop(context);
                                          // CommonWidgets.showLoader(context);
                                          modelSetState(() {
                                            isTapped = true;
                                          });
                                          setState(() {
                                            _saving = true;
                                          });
                                          // await Future.delayed(
                                          //     Duration(seconds: 3));

                                          var response = await ApiRequest
                                              .postApi(
                                              ApiUrl.actionOnAppointment, {
                                            'appointment_id':
                                            widget.appointmentId,
                                            'action': 3,
                                          });

                                          Map decode = jsonDecode(
                                              response.body);

                                          if (decode['success']) {
                                            CommonWidgets.showToast(
                                                context,
                                                Strings.appointment_cancelled,
                                                _scaffoldKey);

                                            setState(() {
                                              _saving = false;
                                            });

                                            if (Provider
                                                .of<
                                                PatientBottomProvider>(
                                                context,
                                                listen: false)
                                                .fromAppointmentNav) {
                                              Provider.of<AppointmentProvider>(
                                                  context,
                                                  listen: false)
                                                  .setPageCount(1);
                                              Provider.of<AppointmentProvider>(
                                                  context,
                                                  listen: false)
                                                  .clearListPatient();
                                              Provider.of<AppointmentProvider>(
                                                  context,
                                                  listen: false)
                                                  .fetchListPatient(
                                                  requestType,
                                                  Provider
                                                      .of<AppointmentProvider>(
                                                      context,
                                                      listen: false)
                                                      .page);
                                            }

                                            // TODO changed it to 3 after added payment gateway
                                            Provider.of<AppointmentProvider>(
                                                context,
                                                listen: false)
                                                .clearListPatient();
                                            Provider.of<AppointmentProvider>(
                                              context,
                                              listen: false,
                                            ).fetchListPatient(requestType, 1);
                                            Provider.of<PatientBottomProvider>(
                                              context,
                                              listen: false,
                                            ).onItemTapped(2);

                                            Navigator.of(context).popUntil(
                                                    (route) => route.isFirst);

                                            return;
                                          } else {
                                            setState(() {
                                              _saving = false;
                                            });
                                            Navigator.pop(context);
                                            CommonWidgets.showToast(context,
                                                decode["message"],
                                                _scaffoldKey);
                                          }
                                        } on SocketException catch (err) {
                                          setState(() {
                                            _saving = false;
                                          });

                                          CommonWidgets.showToast(
                                              context, err.message,
                                              _scaffoldKey);
                                        } on HandshakeException catch (err) {
                                          setState(() {
                                            _saving = false;
                                          });

                                          CommonWidgets.showToast(
                                              context, err.message,
                                              _scaffoldKey);
                                        } catch (err) {

                                        }
                                      },
                                      text: Strings.yes ?? Strings.accept),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
        );
      },
      behavior: HitTestBehavior.translucent,
      onDoubleTap: () {
        screenTracker.stopTimer();
        screenTracker.startTimer(context);
      },
      onVerticalDragStart: (dragDetails) {
        screenTracker.stopTimer();
        screenTracker.startTimer(context);
      },
      onHorizontalDragStart: (dragDetails) {
        screenTracker.stopTimer();
        screenTracker.startTimer(context);
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
      children: [
        Container(
          margin: EdgeInsets.only(top: 20, left: 20),
          child: (widget.isPatient is bool ? widget.isPatient : false)
              ? CommonWidgets.userImgeLoader(
              imageUrl: appointmentDetail.drPic, size: 75)
              : CommonWidgets.userImgeLoader(
              imageUrl: appointmentDetail.patientPic, size: 75),
        ),
        docNameAndExp(),
      ],
    );
  }

  Container docNameAndExp() {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 20),
      width: 200,
      height: 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (widget.isPatient is bool ? widget.isPatient : false)
              ? SizedBox()
              : SizedBox(
            height: 14,
          ),
          CustomText(
            // text: widget.doctorModel.name,
            text: (widget.isPatient is bool ? widget.isPatient : false)
                ? "Dr. " + appointmentDetail.drName
                : appointmentDetail.patientName,
            fontSize: 20.0,
          ),
          SizedBox(
            height: 14,
          ),
          (widget.isPatient is bool ? widget.isPatient : false)
              ? CustomText(
            // text: widget.doctorModel.type1,
            text: _saving
                ? ""
                : (appointmentDetail.speciality.length > 1
                ? appointmentDetail.speciality[0] + ' ...'
                : appointmentDetail.speciality[0]),
            color: CustomColors.grey2,
            fontSize: 16.0,
          )
              : SizedBox(),
        ],
      ),
    );
  }

  Row middleDocCard(double screenWidth) {
    var postGrad = appointmentDetail?.postGrad ?? "";
    var degress = "${postGrad.isNotEmpty ? postGrad : ""}";
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
          maxLines: 4,
          width: CommonWidgets().getWidth(context) * 0.82,
          text: "$degress",
          color: CustomColors.grey2,
          fontSize: 16.0,
          textAlign: TextAlign.start,
        ),
      ],
    );
  }

  Padding bottomDocCard() {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: docLocation(),
    );
  }

  Row docLocation() {
    return Row(
      children: [
        CustomText(
          text: Strings.address,
          fontSize: 15.0,
        ),
        SizedBox(
          width: 10,
        ),
        CustomText(
          maxLines: 3,
          textAlign: TextAlign.start,
          text: (widget.isPatient is bool ? widget.isPatient : false)
              ?
          //  "${appointmentDetail.drHouseNumber}, ${appointmentDetail.drSubCity}, ${appointmentDetail.drCity}, ${appointmentDetail.drRegion}"+
          "${appointmentDetail.drRegion == null ? '' : appointmentDetail
              .drRegion.isEmpty ? '' : appointmentDetail.drRegion + ', '}" +
              "${appointmentDetail.drState == null ? '' : appointmentDetail
                  .drState.isEmpty ? '' : appointmentDetail.drState + ', '}" +
              "${appointmentDetail.drCountry == null ? '' : appointmentDetail
                  .drCountry.isEmpty ? '' : appointmentDetail.drCountry}"
          // "${element['user_profile']['address']['country'] == null ? '' : element['user_profile']['address']['country'].isEmpty ? '' : element['user_profile']['address']['country'] + ', '}"
          // : 'N.A'

              : "${appointmentDetail.patientRegion == null
              ? ''
              : appointmentDetail.patientRegion.isEmpty ? '' : appointmentDetail
              .patientRegion + ', '}" +
              "${appointmentDetail.patientState == null ? '' : appointmentDetail
                  .patientState.isEmpty ? '' : appointmentDetail.patientState +
                  ', '}" +
              "${appointmentDetail.patientCountry == null
                  ? ''
                  : appointmentDetail.patientCountry.isEmpty
                  ? ''
                  : appointmentDetail.patientCountry}",
          color: CustomColors.grey2,
          fontSize: 16.0,
        ),
      ],
    );
  }

  void setAvaility(int differenceInMinutes) {
    //enabling video call before 5 minnutes and disabling it after 2 hrs (120 mintues)
    if (differenceInMinutes <= 120 && differenceInMinutes >= -5) {
      videoCallAvaility = true;
    }
    //enabling chat before 5 minnutes and disabling it after 5 days (7200 mintues)
    if ((differenceInMinutes <= 7200 && differenceInMinutes >= -5)) {
      chatAvailability = true;
    }
    //enabling finish appointent before 30 minnutes
    if (differenceInMinutes >= -30) {
      createPrescriptionAvaility = true;
    }
  }
}

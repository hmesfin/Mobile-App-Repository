import 'package:flutter/material.dart';
import 'package:virtudoc_app/custom-widgets/custom-text.dart';
import 'package:virtudoc_app/custom-widgets/custom-top-bar.dart';
import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/screens/home/patient/appointment/appointment-detail.dart';
import 'package:virtudoc_app/screens/home/patient/find-doctor/time-slot/models/date-slot-model.dart';
import 'package:virtudoc_app/screens/home/patient/find-doctor/time-slot/models/time-slot-model.dart';
import 'package:virtudoc_app/utils/custom-colors.dart';
import 'package:virtudoc_app/screens/home/patient/appointment/appointment-provider.dart';
import 'package:virtudoc_app/utils/screen_tracker/screen_tracker.dart';
import 'package:virtudoc_app/utils/strings.dart';
import 'package:intl/intl.dart';
/*
The file is covered under Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. Please review the license for full details.

This program is not free software: You cannot redistribute it for any use under the terms of the Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. However the source can be modified and updated for the working of the application Design & Development of Mobile Application for “Abyssinia Technology Group” for which it was licensed.
*/

class Appointment extends StatefulWidget {
  final bool is_patient;

  Appointment(this.is_patient);

  @override
  _AppointmentState createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  AppBar appBar = AppBar();
  String currenLocation = Strings.locationList[0];
  String modalSelected = Strings.experience;
  Map<String, bool> values = {
    Strings.year_0_5: false,
    Strings.year_5_10: false,
    Strings.year_10_15: false,
    Strings.year_15_20: false,
    Strings.year20: false,
  };
  Map<String, bool> speciality = {
    Strings.dental_care: false,
    Strings.ent_care: false,
    Strings.eye_care: false,
    Strings.child_care: false,
    Strings.ortho_care: false,
    Strings.neuro_care: false,
    Strings.skin_care: false,
    Strings.women_care: false,
    Strings.general_care: false,
    Strings.sex_care: false,
  };
  Map<String, bool> gender = {
    Strings.female: false,
    Strings.male: false,
  };
  Map<String, bool> language = {
    Strings.english: false,
    Strings.amharic: false,
  };
  List<DateSlotModel> dateSlotModelList = [
    DateSlotModel(dateTime: DateTime.now(), slotAvailable: 0),
    DateSlotModel(dateTime: DateTime(2020, 8, 27), slotAvailable: 2),
    DateSlotModel(dateTime: DateTime(2020, 8, 28), slotAvailable: 4),
    DateSlotModel(dateTime: DateTime(2020, 8, 29), slotAvailable: 1),
    DateSlotModel(dateTime: DateTime(2020, 8, 30), slotAvailable: 0),
  ];

  List<TimeSlotModel> timeslotModelList = [
    TimeSlotModel(isAvailable: false, time: "10:00 AM"),
    TimeSlotModel(isAvailable: false, time: "11:00 AM"),
    TimeSlotModel(isAvailable: true, time: "11:30 AM"),
    TimeSlotModel(isAvailable: true, time: "12:00 PM"),
    TimeSlotModel(isAvailable: true, time: "12:30 PM"),
    TimeSlotModel(isAvailable: true, time: "03:00 PM"),
    TimeSlotModel(isAvailable: true, time: "03:30 PM"),
    TimeSlotModel(isAvailable: true, time: "04:00 PM"),
    TimeSlotModel(isAvailable: true, time: "04:30 PM"),
    TimeSlotModel(isAvailable: true, time: "05:00 PM"),
  ];

  List<String> modalStrings = [
    Strings.speciality,
    Strings.language,
    Strings.sex,
    Strings.experience,
  ];

  var controller = ScrollController();

  @override
  void initState() {
    super.initState();
    Provider.of<AppointmentProvider>(context, listen: false).clearListPatient();
    controller.addListener(() {
      if (controller.position.pixels >
          controller.position.maxScrollExtent + 150) {
        Provider
            .of<AppointmentProvider>(context, listen: false)
            .page++;
        Provider.of<AppointmentProvider>(context, listen: false)
            .fetchListPatient(requestType,
            Provider
                .of<AppointmentProvider>(context, listen: false)
                .page);
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) => afterLayout());
  }

  var requestType = 'upcomming';

  afterLayout() async {
    await Provider.of<AppointmentProvider>(context, listen: false)
        .clearListPatient();
    await Provider.of<AppointmentProvider>(context, listen: false)
        .setPageCount(1);
    await Provider.of<AppointmentProvider>(context, listen: false)
        .fetchListPatient(requestType,
        Provider
            .of<AppointmentProvider>(context, listen: false)
            .page);

    // fetchListPatient();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.bg_app,
        body: _buildWidget(context),
      ),
    );
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
    return SingleChildScrollView(
      child: parentContainer(screenHeight, screenWidth, context),
    );
  }

  var _saving = false;

  Container parentContainer(double screenHeight, double screenWidth,
      BuildContext context) {
    return Container(
      height: screenHeight,
      width: screenWidth,
      decoration: BoxDecoration(
        color: CustomColors.bg_app,
      ),
      child: ModalProgressHUD(
        inAsyncCall: _saving,
        opacity: 0.3,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CustomTopBar(
                    context: context,
                    titleText: Strings.appointment,
                    custonBackButton: false,
                  ),
                  docModels(screenHeight, screenWidth),
                ],
              ),
            ),
            widget.is_patient
                ? Positioned(
              bottom: screenHeight * .1,
              left: screenWidth * 0.25,
              child: CustomButton(
                buttonText: Strings.newappointment,
                ontap: () {
                  Provider.of<SelectSpecialityProvider>(context,
                      listen: false)
                      .getSpeciality();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SelectSpeciality()),
                  );
                },
              ),
            )
                : SizedBox(),
          ],
        ),
      ),
    );
  }

  bool isFetched = false;

  Widget docModels(double screenHeight,
      double screenWidth,) {
    return Expanded(
        child: Consumer<AppointmentProvider>(
            builder: (context, AppointmentProvider model, _) =>
            model.saving
                ? CommonWidgets.showLoader(context)
                : model.appointmentList.isEmpty
                ? Container(
              margin: EdgeInsets.only(
                  top: CommonWidgets().getHeight(context) * 0.3),
              child: Text("No Appointments"),
            )
                : Container(
                margin: EdgeInsets.only(
                    top: screenHeight * .02,
                    left: screenWidth * .02,
                    right: screenWidth * .02,
                    bottom: screenWidth * .085),
                child:
                // (model.appointmentList.length == 0 &&
                //         isFetched == true)
                //     ? Center(child: Text(Strings.no_appointment))
                //     :
                ListView.builder(
                    controller: controller,
                    physics: BouncingScrollPhysics(),
                    itemCount: model.appointmentList.length,
                    itemBuilder: (context, index) =>
                        docModelBuilder(model, context, index,
                            screenHeight, screenWidth)))));
  }

  Widget docModelBuilder(AppointmentProvider model,
      BuildContext context,
      int index,
      double screenHeight,
      double screenWidth,) {
    return docCard(model, index, screenWidth, screenHeight);
  }

  Container docCard(AppointmentProvider model, int index, double screenWidth,
      double screenHeight) {
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    AppointmentDetail(
                        model.appointmentList[index].appointmentId,
                        widget.is_patient),
              ));
          screenTracker.stopTimer();
          screenTracker.startTimer(context);
        },
        behavior: HitTestBehavior.translucent,
        child: Container(
          margin: EdgeInsets.only(bottom: 20),
          width: 355,
          height: screenHeight / 2.7,
          decoration: docCardDecoration(),
          child: Column(
            children: [
              topDocCard(model, index, screenWidth),
              SizedBox(
                height: 16,
              ),
              bottomDocCard(model, index),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration docCardDecoration() {
    return BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
              color: CustomColors.grey1,
              offset: Offset(1.8369701987210297e-16, 3),
              blurRadius: 7,
              spreadRadius: 0)
        ],
        color: Color(0xffffffff));
  }

  Row topDocCard(AppointmentProvider model, int index, screenwidth) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 10),
          child: !widget.is_patient
              ? CommonWidgets.userImgeLoader(
              imageUrl: model.appointmentList[index].patientPic)
              : CommonWidgets.userImgeLoader(
              imageUrl: model.appointmentList[index].drPic),
        ),
        docNameAndExp(model, index, screenwidth),
      ],
    );
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

  Container docNameAndExp(AppointmentProvider model, int index, screenWidth) {
    String txt = '';
    for (var i in model.appointmentList[index].speciality) {
      if ((model.appointmentList[index].speciality ?? []).length > 1) {
        txt = txt + '$i, ';
      }
    }
    if (txt.length > 0) {
      txt = txt.substring(0, txt.length - 2);
    }
    return Container(
      margin: EdgeInsets.only(left: 20, top: 30),
      width: screenWidth * .60,
      height: 75,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            // text: docModelList[index].name,
            text: widget.is_patient
                ? "Dr. " + model.appointmentList[index].drName
                : model.appointmentList[index].patientName,
            color: CustomColors.grey2,
            fontSize: 16.0,
          ),
          SizedBox(
            height: 14,
          ),
          // if ((appointmentList[index].speciality ?? []).length > 0)
          //   CustomText(
          //     maxLines: 2,
          //     textAlign: TextAlign.left,
          //     // text: docModelList[index].type1,
          //     text: widget.is_patient
          //         ? ((appointmentList[index].speciality ?? []).length > 1
          //             ? appointmentList[index].speciality[0].toString() + ' ...'
          //             : appointmentList[index].speciality[0].toString())
          //         : appointmentList[index].gender +
          //             ", " +
          //             ((appointmentList[index].patientDob.length > 1)
          //                 ? (calculateAge(DateTime(
          //                             DateFormat('dd-mm-yyyy')
          //                                 .parse(
          //                                     appointmentList[index].patientDob)
          //                                 .year,
          //                             DateFormat('dd-mm-yyyy')
          //                                 .parse(
          //                                     appointmentList[index].patientDob)
          //                                 .month,
          //                             DateFormat('dd-mm-yyyy')
          //                                 .parse(
          //                                     appointmentList[index].patientDob)
          //                                 .day))
          //                         .toString() +
          //                     " " +
          //                     Strings.years)
          //                 : ""),
          //     color: CustomColors.grey2,
          //     fontSize: 16.0,
          //   ),

          (model.appointmentList[index].speciality ?? []).length == 1
              ? CustomText(
            maxLines: 2,
            textAlign: TextAlign.left,
            // text: docModelList[index].type1,
            text: widget.is_patient
                ? model.appointmentList[index].speciality[0].toString()
                : model.appointmentList[index].gender +
                ", " +
                ((model.appointmentList[index].patientDob.length > 1)
                    ? (calculateAge(DateTime(
                    DateFormat('dd-mm-yyyy')
                        .parse(model
                        .appointmentList[index]
                        .patientDob)
                        .year,
                    DateFormat('dd-mm-yyyy')
                        .parse(model
                        .appointmentList[index]
                        .patientDob)
                        .month,
                    DateFormat('dd-mm-yyyy')
                        .parse(model
                        .appointmentList[index]
                        .patientDob)
                        .day))
                    .toString() +
                    " " +
                    Strings.years)
                    : ""),
            color: CustomColors.grey2,
            fontSize: 16.0,
          )
              : CustomText(
            maxLines: 2,
            textAlign: TextAlign.left,
            // text: docModelList[index].type1,
            text: widget.is_patient
                ? txt
                : model.appointmentList[index].gender +
                ", " +
                ((model.appointmentList[index].patientDob.length > 1)
                    ? (calculateAge(DateTime(
                    DateFormat('dd-mm-yyyy')
                        .parse(model
                        .appointmentList[index]
                        .patientDob)
                        .year,
                    DateFormat('dd-mm-yyyy')
                        .parse(model
                        .appointmentList[index]
                        .patientDob)
                        .month,
                    DateFormat('dd-mm-yyyy')
                        .parse(model
                        .appointmentList[index]
                        .patientDob)
                        .day))
                    .toString() +
                    " " +
                    Strings.years)
                    : ""),
            color: CustomColors.grey2,
            fontSize: 16.0,
          ),

          // CustomText(
          //   text: "${docModelList[index].exp} ${Strings.yearsExperience}",
          //   color: CustomColors.grey2,
          //   fontSize: 16.0,
          // ),
        ],
      ),
    );
  }

  Padding bottomDocCard(AppointmentProvider model, int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          docLocation(model, index),
          SizedBox(
            height: 13,
          ),
          docTime(model, index),
        ],
      ),
    );
  }

  Row docLocation(AppointmentProvider model, int index) {
    return Row(
      children: [
        Text(widget.is_patient ? Strings.address : Strings.purpose,
            style: TextStyle(
                color: Color(0xff606060),
                fontWeight: FontWeight.w400,
                fontFamily: "Roboto",
                fontStyle: FontStyle.normal,
                fontSize: 15.0),
            textAlign: TextAlign.left),
        SizedBox(
          width: 10,
        ),
        CustomText(
          width: CommonWidgets().getWidth(context) * 0.7,
          textAlign: TextAlign.start,
          maxLines: 3,
          text: widget.is_patient
              ? (model.appointmentList[index].region.isEmpty
              ? ''
              : model.appointmentList[index].region + ', ') +
              (model.appointmentList[index].state.isEmpty
                  ? ''
                  : model.appointmentList[index].state + ', ') +
              (model.appointmentList[index].country.isEmpty
                  ? ''
                  : model.appointmentList[index].country)
              : model.appointmentList[index].purpose,
          color: CustomColors.grey2,
          fontSize: 16.0,
        ),
      ],
    );
  }

  Row docTime(AppointmentProvider model, int index) {
    //calculating date time of appointment
    var appointmentDateTimeUTC = DateFormat('yyyy-MM-DD HH:mm').parse(
        DateFormat('yyyy-MM-DD')
            .parse(model.appointmentList[index].date)
            .toString()
            .split(" ")[0] +
            " " +
            DateFormat("HH:mm")
                .parse(model.appointmentList[index].startTime)
                .toString()
                .split(" ")[1]);
    //calculating local time
    var appointmentDateTimeLocal =
    DateTime.parse(appointmentDateTimeUTC.toString() + 'Z').toLocal();

    //calculating date time of appointment
    var appointmentEndDateTimeUTC = DateFormat('yyyy-MM-DD HH:mm').parse(
        DateFormat('yyyy-MM-DD')
            .parse(model.appointmentList[index].date)
            .toString()
            .split(" ")[0] +
            " " +
            DateFormat("HH:mm")
                .parse(model.appointmentList[index].endTime)
                .toString()
                .split(" ")[1]);
    //calculating local time
    var appointmentEndDateTimeLocal =
    DateTime.parse(appointmentEndDateTimeUTC.toString() + 'Z').toLocal();
    return Row(
      children: [
        Text(
            widget.is_patient ? Strings.date_and_time : Strings.appointmentSlot,
            style: TextStyle(
                color: Color(0xff606060),
                fontWeight: FontWeight.w400,
                fontFamily: "Roboto",
                fontStyle: FontStyle.normal,
                fontSize: 15.0),
            textAlign: TextAlign.left),
        SizedBox(
          width: 10,
        ),
        Flexible(
          child: CustomText(
            text: " " +
                (DateFormat("hh:mm").format(appointmentDateTimeLocal) +
                    " - " +
                    (DateFormat("hh:mm a").format(appointmentEndDateTimeLocal) +
                        "\n" +
                        (DateFormat("EEEE, dd MMM yyyy")
                            .format(appointmentDateTimeLocal)
                            .toString()))),
            maxLines: 3,
            textAlign: TextAlign.left,
            color: CustomColors.grey2,
            fontSize: 16.0,
          ),
          // child: AutoSizeText(
          //   // DateTime.now(appointmentList[index].date.to).toString(),
          //   // DateTime(appointmentList[index].date).toString(),
          //   (DateTime.parse(appointmentList[index].date).year).toString(),
          //   // "${appointmentList[index].date}PM Thursday, 14 May",
          //   overflow: TextOverflow.ellipsis,
          //   wrapWords: true,
          //   maxLines: 3,
          //   textAlign: TextAlign.left,
          // ),
        ),
        // CustomText(
        //   text: "${appointmentList[index].date}PM Thursday, 14 May",
        //   color: CustomColors.grey2,
        //   fontSize: 16.0,
        // ),
      ],
    );
  }
}

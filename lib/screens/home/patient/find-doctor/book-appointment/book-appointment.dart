import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:virtudoc_app/custom-widgets/custom-text.dart';
import 'package:virtudoc_app/custom-widgets/custom-top-bar.dart';
import 'package:virtudoc_app/screens/home/patient/appointment/appointment-provider.dart';
import 'package:virtudoc_app/screens/home/patient/appointment/paypal_web_view.dart';
import 'package:virtudoc_app/screens/home/patient/doctor-detail/model/request/book_appointment_body.dart';
import 'package:virtudoc_app/screens/home/patient/find-doctor/book-appointment/is-booking-provider.dart';
import 'package:virtudoc_app/screens/home/patient/patientBottom_provider.dart';
import 'package:virtudoc_app/screens/orders/model/get_payment_uri_response.dart';
import 'package:virtudoc_app/utils/custom-colors.dart';
import 'package:virtudoc_app/utils/screen_tracker/screen_tracker.dart';
import 'package:virtudoc_app/utils/strings.dart';
import 'package:virtudoc_app/screens/home/patient/wallet/add-balance/booking-provider.dart';

import '../../../../../index.dart';
/*
The file is covered under Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. Please review the license for full details.

This program is not free software: You cannot redistribute it for any use under the terms of the Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. However the source can be modified and updated for the working of the application Design & Development of Mobile Application for “Abyssinia Technology Group” for which it was licensed.
*/

enum Choice { success, failure, none }

class BookAppointment extends StatefulWidget {
  @override
  _BookAppointmentState createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  AppBar appBar = AppBar();
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  var purposeOfVisitController = TextEditingController();
  var requestType = 'upcomming';

  bool _isSaving = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<DoctorDetailProvider>(
          builder: (context, model, child) =>
              ModalProgressHUD(
                child: Scaffold(
                  key: _scaffoldKey,
                  backgroundColor: CustomColors.bg_app,
                  body: _buildWidget(context),
                ),
                inAsyncCall: model.isLoading,
                progressIndicator: CircularProgressIndicator(
                  valueColor:
                  new AlwaysStoppedAnimation<Color>(CustomColors.blue),
                ),
              )),
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
    return parentContainer(screenHeight, screenWidth, context);
  }

  Widget parentContainer(double screenHeight, double screenWidth,
      BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CustomTopBar(
                context: context,
                titleText: Strings.bookAppointment,
              ),
              doctorDetials(screenHeight, screenWidth),
              middleList(),
              additionalInfo(screenWidth),
              bottomButton(context),
            ],
          ),
          if (_isSaving) CommonWidgets.showLoader(context)
        ],
      ),
    );
  }

  Widget middleList() {
    return Consumer<DoctorDetailProvider>(builder: (context, model, child) {
      var doctorDetail = model?.doctorDetailData;
      return Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
          margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
          child: Divider(
            thickness: 1,
            color: CustomColors.grey1,
          ),
        ),
        Row(
          children: [
            SizedBox(
              width: 30,
            ),
            CustomText(
              text: Strings.purposeOfVisit,
              fontSize: 15,
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  border: Border.all(color: CustomColors.grey3, width: 1),
                  color: CustomColors.white),
              child: Container(
                child: Container(
                    width: double.infinity,
                    child: InkWell(
                      onTap: () {},
                      child: PopupMenuButton(
                        offset: Offset(0.1, 0),
                        onSelected: (visit) {
                          purposeOfVisitController.text = visit;
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: 14, right: 5, top: 2),
                          child: Focus(
                            onFocusChange: (hasFocus) {},
                            child: TextFormField(
                              onTap: () {
                                screenTracker.stopTimer();
                                screenTracker.startTimer(context);
                              },
                              controller: purposeOfVisitController,
                              enabled: false,
                              decoration: InputDecoration(
                                hintText: Strings.selectPurpose,
                                suffixIcon: IconButton(
                                  icon: ImageIcon(
                                    AssetImage(
                                        "assets/images/ic_drop_down1.png"),
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
                            Strings.purposeOfVisitList
                                .map((visit) =>
                                PopupMenuItem(value: visit, child: Text(visit)))
                                .toList(),
                      ),
                    )),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Consumer<TimeSlotProvider>(builder: (context, timeSlots, child) {
          var timeSlot = timeSlots.selectedStartTimeSlot.replaceRange(
              timeSlots.selectedStartTimeSlot
                  .toString()
                  .length - 3,
              timeSlots.selectedStartTimeSlot
                  .toString()
                  .length,
              "");

          var dt = DateTime.parse(
              timeSlots.selectedDateSlot + ' ' + timeSlot + ':00' + '.000Z')
              .toLocal();
          var converted12hr = DateFormat('h:mm a').format(dt);
          var timeSlotEnd = timeSlots.selectedEndTimeSlot.replaceRange(
              timeSlots.selectedEndTimeSlot
                  .toString()
                  .length - 3,
              timeSlots.selectedEndTimeSlot
                  .toString()
                  .length,
              "");

          var dt2 = DateTime.parse(timeSlots.selectedDateSlot +
              ' ' +
              timeSlotEnd +
              ':00' +
              '.000Z')
              .toLocal();
          var converted12hr2 = DateFormat('h:mm a').format(dt2);

          return singleTile(Strings.appointmentSlot,
              "$converted12hr - $converted12hr2\n${DateFormat(
                  'EEEE, dd MMMM yyyy').format(dt)}");
        }),
        singleTile(Strings.consultationFee,
            "\$${(doctorDetail?.consultationFee ?? 0).toString()}"),
        Consumer<UserProvider>(
            builder: (context, user, child) =>
                singleTile(Strings.patientName,
                    "${user?.firstname ?? "N/A"} ${user?.lastname ?? ""}")),
      ]);
    });
  }

  Container singleTile(String title, String value) {
    return Container(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
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
              Flexible(
                child: CustomText(
                  text: value,
                  textAlign: TextAlign.start,
                  fontSize: 15,
                  color: CustomColors.grey2,
                ),
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
    return Consumer<DoctorDetailProvider>(builder: (context, model, child) {
      var doctorDetail = model?.doctorDetailData;

      var region = doctorDetail?.userProfile?.address?.region ?? "";
      var state = doctorDetail?.userProfile?.address?.state ?? "";
      var country = doctorDetail?.userProfile?.address?.country ?? "";

      var address = (region.isEmpty ? "" : "$region, ") +
          (state.isEmpty ? "" : "$state, ") +
          (country.isEmpty ? "" : "$country");
      return Container(
        width: screenWidth,
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                CommonWidgets.userImgeLoader(
                    imageUrl: doctorDetail?.userProfile?.profileImage),
                Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          CustomText(
                            text:
                            'Dr. ${doctorDetail?.firstName ?? ""} ${doctorDetail
                                ?.lastName ?? ''} ',
                            color: CustomColors.black1,
                            fontSize: FontStyles.size,
                          ),
                          SizedBox(
                            height: FontStyles.vsmall,
                          ),
                          CustomText(
                            text:
                            '${doctorDetail?.userProfile?.enrollmentInformation
                                ?.speciality?.length != 0 ? doctorDetail
                                ?.userProfile?.enrollmentInformation?.speciality
                                ?.join(', ') : "Speciality: N/A" ??
                                "Speciality: N/a"}',
                            color: CustomColors.grey2,
                            fontSize: FontStyles.size16,
                            maxLines: 3,
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(
                            height: FontStyles.vsmall,
                          ),
                        ],
                      ),
                    )),
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 30, top: 13),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/degree.png",
                    height: 20.0,
                    width: 20.0,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CustomText(
                    width: CommonWidgets().getWidth(context) * 0.70,
                    textAlign: TextAlign.start,
                    maxLines: 2,
                    text:
                    '${doctorDetail?.userProfile?.enrollmentInformation
                        ?.postGrad ?? ''}',
                    color: CustomColors.grey2,
                    fontSize: FontStyles.size16,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 30, top: 13),
              child: Row(
                children: [
                  CustomText(
                    text: Strings.address,
                    color: CustomColors.black2,
                    fontSize: FontStyles.size16,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: CustomText(
                        width: CommonWidgets().getWidth(context) * 0.70,
                        textAlign: TextAlign.start,
                        maxLines: 3,
                        text: "${address?.trim() ?? "N/A"}",
                        color: CustomColors.grey2,
                        fontSize: FontStyles.size15,
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 17,
            ),
          ],
        ),
      );
    });
  }

  Widget additionalInfo(double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 10, left: 30),
          child: CustomText(
            text: Strings.preovideAdditionalInfo,
            fontSize: 15,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 33),
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            border: Border.all(color: CustomColors.white, width: 1),
            color: CustomColors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 20),
            child: Consumer<DoctorDetailProvider>(
                builder: (context, model, child) =>
                    TextFormField(
                      onTap: () {
                        screenTracker.stopTimer();
                        screenTracker.startTimer(context);
                      },
                      maxLines: 5,
                      decoration: InputDecoration(
                          hintText: "Type here...", border: InputBorder.none),
                      onChanged: (text) {
                        model.additionalInfo = text.trim();
                      },
                    )),
          ),
        ),
      ],
    );
  }

  Widget bottomButton(BuildContext context) {
    return Consumer<TimeSlotProvider>(
      builder: (context, timeSlots, child) =>
          Consumer<DoctorDetailProvider>(
            builder: (context, model, child) =>
                CustomButton(
                    ontap: () {
                      try {
                        FocusScope.of(context).requestFocus(FocusNode());
                        if (purposeOfVisitController.text.trim() == "") {
                          return CommonWidgets.showToast(
                              context,
                              Strings.pleaseSelect(
                                  "Select " + Strings.purposeOfVisit),
                              _scaffoldKey);
                        }

                        Provider.of<BookingProvider>(context, listen: false)
                            .setPurposeVisit(purposeOfVisitController.text);
                        Provider.of<BookingProvider>(context, listen: false)
                            .setAdditionalInfo(model.additionalInfo);

                        if (Provider
                            .of<BookingProvider>(context, listen: false)
                            .purposeVisit
                            .trim() ==
                            "") {
                          setState(() {
                            _isSaving = false;
                          });
                          return CommonWidgets.showToast(
                              context,
                              Strings.pleaseSelect(
                                  "Select " + Strings.purposeOfVisit),
                              _scaffoldKey);
                        }
                        model.getPaymentUri(
                          success: (GetPaymentUriResponse result) async {
                            var tokenId = result.body.data.orderId;
                            BookAppointmentBody bookAppointmentBody =
                            new BookAppointmentBody();
                            bookAppointmentBody
                              ..doctorId = model.doctorId
                              ..startTime = timeSlots.selectedStartTimeSlot
                              ..endTime = timeSlots.selectedEndTimeSlot
                              ..date = DateFormat(Strings.utcFormat).format(
                                  DateTime.parse(timeSlots.selectedDateSlot)) +
                                  "Z"
                              ..additionalNote = model.additionalInfo
                              ..token = tokenId
                              ..purpose =
                              Provider
                                  .of<BookingProvider>(context, listen: false)
                                  .purposeVisit
                                  .trim();

                            //print("order_id :$tokenId");
                            final choiceResult = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PaypalWebView(
                                        getPaymentUriResponse: result,
                                      )),
                            );
                            if (choiceResult == result.body.data.successUrl) {
                              model.bookAppoinment(
                                  success: () async {
                                    CommonWidgets.showToast(context,
                                        Strings.booking_successful,
                                        _scaffoldKey);
                                    Provider.of<IsBookingProvider>(context,
                                        listen: false)
                                        .comingFromBookingPage(false);
                                    Provider.of<BookingProvider>(
                                        context, listen: false)
                                        .setAdditionalInfo('');
                                    Provider.of<BookingProvider>(
                                        context, listen: false)
                                        .setPurposeVisit('');
                                    Provider.of<BookingProvider>(
                                        context, listen: false)
                                        .setPurposeVisit('');
                                    CommonWidgets.showToast(
                                        context, 'Appointment Booked',
                                        _scaffoldKey);
                                    setState(() {
                                      _isSaving = false;
                                    });
                                    if (Provider
                                        .of<PatientBottomProvider>(context,
                                        listen: false)
                                        .fromAppointmentNav) {
                                      //print("....................");
                                      Provider.of<AppointmentProvider>(context,
                                          listen: false)
                                          .clearListPatient();
                                      Provider.of<AppointmentProvider>(context,
                                          listen: false)
                                          .setPageCount(1);
                                      await Provider.of<AppointmentProvider>(
                                          context,
                                          listen: false)
                                          .fetchListPatient(
                                          requestType,
                                          Provider
                                              .of<AppointmentProvider>(context,
                                              listen: false)
                                              .page);
                                    }

                                    //TODO change the number to 3 after adding payment page
                                    Provider.of<PatientBottomProvider>(context,
                                        listen: false)
                                        .onItemTapped(2);
                                    setState(() {});
                                    Navigator.of(context)
                                        .popUntil((route) => route.isFirst);
                                    return;
                                  },
                                  error: (mess) {
                                    CommonWidgets.showToast(
                                        context, mess, _scaffoldKey);
                                  },
                                  bookAppointmentBody: bookAppointmentBody);
                            }
                            if (choiceResult == result.body.data.cancelUrl) {
                              // CommonWidgets.showToast(
                              //     context, '$result.body.data.cancelUrl', _scaffoldKey);
                            }
                          },
                          error: (message) {
                            CommonWidgets.showToast(
                                context, message, _scaffoldKey);
                          },
                        );
                      } catch (err) {}
                    },
                    buttonText: Strings.confBooking,
                    margin: EdgeInsets.only(top: 20, bottom: 20)),
          ),
    );
  }
}

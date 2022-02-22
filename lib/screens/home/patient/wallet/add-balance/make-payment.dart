import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:virtudoc_app/custom-widgets/custom-top-bar.dart';
import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/screens/home/patient/appointment/appointment-provider.dart';
import 'package:virtudoc_app/screens/home/patient/wallet/wallet_provider.dart';
import 'package:virtudoc_app/screens/home/patient/find-doctor/book-appointment/is-booking-provider.dart';
import 'package:virtudoc_app/utils/custom-colors.dart';
import 'package:virtudoc_app/utils/strings.dart';
import 'package:virtudoc_app/custom-widgets/custom-text.dart';
import 'package:virtudoc_app/screens/home/patient/doctor-detail/model/request/book_appointment_body.dart';
import 'package:virtudoc_app/screens/home/patient/patientBottom_provider.dart';
import 'package:virtudoc_app/screens/home/patient/wallet/add-balance/add-balance.dart';
import 'package:virtudoc_app/screens/home/patient/wallet/add-balance/booking-provider.dart';
import '../../../../../index.dart';
import 'package:virtudoc_app/utils/styles.dart';

class MakePayment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MakePaymentState();
}

class _MakePaymentState extends State<MakePayment> {
  bool isPasswordFocused = false;
  String dropdownValue = "93";

  @override
  void initState() {
    super.initState();
  }

  AppBar appBar = AppBar(
    title: Text(Strings.appName),
  );
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: CustomColors.blue, //or set color with: Color(0xFF0000FF)
    ));

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: CustomColors.bg_app,
        body: _buildWidget(context),
      ),
    );
  }

  var _isSaving = false;

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
    return Stack(
      children: [
        SingleChildScrollView(
          child: Container(
            height: screenHeight,
            width: screenWidth,
            decoration: BoxDecoration(
              color: CustomColors.bg_app,
            ),
            child: Column(
              children: <Widget>[
                // Header

                CustomTopBar(context: context, titleText: Strings.makePayment),

                Padding(
                  padding:
                  EdgeInsets.only(top: 24, bottom: 27, left: 20, right: 20),
                  child: Text(Strings.available_balance,
                      style: const TextStyle(
                          color: CustomColors.black1,
                          fontWeight: FontStyles.semiBoldFontWeight400,
                          fontFamily: FontStyles.fontFamly,
                          package: FontStyles.package,
                          fontStyle: FontStyle.normal,
                          fontSize: FontStyles.large),
                      textAlign: TextAlign.center),
                ),

                Container(
                  child: Text(
                    "\$${Provider
                        .of<WalletProvider>(context, listen: true)
                        .balance
                        .toStringAsFixed(2) ?? ''}",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                        color: CustomColors.blue3,
                        fontWeight: FontStyles.semiBoldFontWeight500,
                        fontSize: FontStyles.size65,
                        fontFamily: FontStyles.fontFamly),
                    textAlign: TextAlign.center,
                  ),
                ),

                Divider(
                  height: screenHeight / 15,
                  thickness: 1.5,
                  indent: screenWidth / 10,
                  endIndent: screenWidth / 10,
                ),
                Consumer<DoctorDetailProvider>(
                  builder: (context, model, child) =>
                      Padding(
                        padding: EdgeInsets.only(
                            top: 24, bottom: 25, left: 20, right: 20),
                        child: CustomText(
                            maxLines: 2,
                            text: Strings.payingText +
                                "${model?.doctorDetailData?.firstName} ${model
                                    ?.doctorDetailData?.lastName}",
                            color: CustomColors.black1,
                            fontWeight: FontStyles.semiBoldFontWeight400,
                            fontFamily: FontStyles.fontFamly,
                            // package: FontStyles.package,
                            // fontStyle: FontStyle.normal,
                            fontSize: FontStyles.large,
                            textAlign: TextAlign.center),
                      ),
                ),

                Consumer<DoctorDetailProvider>(
                  builder: (context, model, child) =>
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: CustomText(
                          text: "\$${model?.doctorDetailData?.consultationFee}",
                          fontSize: 24,
                        ),
                      ),
                ),

                bottomButton(context)
              ],
            ),
          ),
        ),
        if (_isSaving) CommonWidgets.showLoader(context)
      ],
    );
  }

  var requestType = 'upcomming';

  Widget bottomButton(BuildContext context) {
    return Consumer<TimeSlotProvider>(
        builder: (context, timeSlots, child) =>
            Consumer<DoctorDetailProvider>(
                builder: (context, model, child) =>
                    CustomButton(
                        ontap: () {
                          setState(() {
                            _isSaving = true;
                          });

                          try {
                            double drFees =
                            model?.doctorDetailData?.consultationFee
                                ?.toDouble();
                            double balance =
                                Provider
                                    .of<WalletProvider>(context, listen: false)
                                    .balance;

                            if (drFees.compareTo(balance) > 0) {
                              Provider.of<IsBookingProvider>(
                                  context, listen: false)
                                  .comingFromBookingPage(true);
                              setState(() {
                                _isSaving = false;
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddBalance(),
                                ),
                              );

                              // Provider.of<PatientBottomProvider>(context, listen: false)
                              //     .onItemTapped(2);
                              // setState(() {});
                              // Navigator.of(context).popUntil((route) => route.isFirst);
                              return;
                              // Navigator.of(context).pushAndRemoveUntil(
                              //     MaterialPageRoute(
                              //       builder: (context) => PatientBottomNavbar(
                              //         selectedTab: 2,
                              //       ),
                              //     ),
                              //     (Route<dynamic> route) => false);
                              // return;
                            }
                            FocusScope.of(context).requestFocus(FocusNode());
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
                              ..purpose =
                              Provider
                                  .of<BookingProvider>(context, listen: false)
                                  .purposeVisit
                                  .trim();

                            model.bookAppoinment(
                                success: () {
                                  Provider.of<IsBookingProvider>(
                                      context, listen: false)
                                      .comingFromBookingPage(false);
                                  Provider.of<BookingProvider>(
                                      context, listen: false)
                                      .setAdditionalInfo('');
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
                                    Provider.of<AppointmentProvider>(context,
                                        listen: false)
                                        .setPageCount(1);
                                    Provider.of<AppointmentProvider>(context,
                                        listen: false)
                                        .clearListPatient();
                                    Provider.of<AppointmentProvider>(context,
                                        listen: false)
                                        .fetchListPatient(
                                        requestType,
                                        Provider
                                            .of<AppointmentProvider>(context,
                                            listen: false)
                                            .page);
                                  }
                                  Provider.of<PatientBottomProvider>(context,
                                      listen: false)
                                      .onItemTapped(3);

                                  setState(() {});
                                  Navigator.of(context)
                                      .popUntil((route) => route.isFirst);

                                  return;

                                  // Navigator.pushReplacement(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //       builder: (context) => MakePayment(),
                                  //     ));
                                },
                                error: (mess) {
                                  CommonWidgets.showToast(
                                      context, mess, _scaffoldKey);
                                },
                                bookAppointmentBody: bookAppointmentBody);
                            setState(() {
                              _isSaving = false;
                            });
                          } catch (err) {
                            setState(() {
                              _isSaving = false;
                            });
                          }
                        },
                        buttonText: Strings.paymentButtonText,
                        margin: EdgeInsets.only(top: 20, bottom: 20))));
  }
}

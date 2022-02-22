import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:virtudoc_app/custom-widgets/custom-text.dart';
import 'package:virtudoc_app/custom-widgets/custom-top-bar.dart';
import 'package:virtudoc_app/screens/home/patient/find-doctor/book-appointment/book-appointment.dart';
import 'package:virtudoc_app/screens/home/patient/find-doctor/time-slot/models/time_slot_response/time_slot_response.dart';
import 'package:virtudoc_app/utils/custom-colors.dart';
import 'package:virtudoc_app/utils/strings.dart';

import '../../../../../index.dart';

class SelectTimeSlot extends StatefulWidget {
  @override
  _SelectTimeSlotState createState() => _SelectTimeSlotState();
}

AppBar appBar = AppBar();
int currentSelectedBox = 0;
int currentTimeSelected = 3;

class _SelectTimeSlotState extends State<SelectTimeSlot> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TimeSlotProvider>(
        builder: (context, model, child) =>
            ModalProgressHUD(
              child: SafeArea(
                  child: Scaffold(
                    resizeToAvoidBottomInset: false,
                    body: _buildWidget(context),
                  )),
              inAsyncCall: model.isLoading,
              progressIndicator: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(CustomColors.blue),
              ),
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
    return SingleChildScrollView(
      child: parentContainer(screenHeight, screenWidth, context),
    );
  }

  Container parentContainer(double screenHeight, double screenWidth,
      BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomColors.bg_app,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CustomTopBar(
            titleText: Strings.selectTimesSlot,
            context: context,
          ),
          Consumer<TimeSlotProvider>(
              builder: (context, model, child) =>
              model.noData
                  ? Flexible(
                  child: Container(
                    child: Center(
                      child: CustomText(
                        text: Strings.noSLotsAvailble,
                        color: Colors.black,
                        fontSize: FontStyles.large,
                      ),
                    ),
                    margin: EdgeInsets.only(top: 40),
                  ))
                  : Column(
                children: [
                  middleList(screenWidth),
                  selectedDate(),
                  divider(),
                  gridView(screenHeight),
                  SizedBox(
                    height: 10.0,
                  )
                ],
              ))
        ],
      ),
    );
  }

  Widget gridView(double screenHeight) {
    return Consumer<TimeSlotProvider>(
        builder: (context, model, child) =>
            GridView.count(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              childAspectRatio: 2.0,
              crossAxisCount: 3,
              children: List.generate(model.timeSlotList.length,
                      (index) =>
                      timeSlotCard(index, model.timeSlotList, model)),
            ));
  }

  Container divider() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Divider(
          color: CustomColors.grey1,
          thickness: 1,
        ));
  }

  Widget selectedDate() {
    return Consumer<TimeSlotProvider>(builder: (context, model, child) {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: CustomText(
          text: (model?.dateSlotList?.length ?? 0) > 0
              ? DateFormat('EEEE, dd MMM')
              .format(
              DateTime.parse(model?.dateSlotList[model.atIndex] ?? ""))
              .toString()
              : '',
          fontSize: 20,
        ),
      );
    });
  }

  Widget middleList(double screenWidth) {
    return Consumer<TimeSlotProvider>(
        builder: (context, model, child) =>
            Container(
              width: screenWidth,
              height: 100,
              decoration: BoxDecoration(color: CustomColors.grey1),
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: model.dateSlotList.length,
                  itemBuilder: (context, index) =>
                      GestureDetector(
                        onTap: () {
                          model.selectedDateSlot =
                              model.dateSlotList.elementAt(index);
                          model.setTimeSlots(atIndex: index);
                        },
                        child: Row(
                          children: [
                            Container(
                              height: 60,
                              width: 150,
                              margin: EdgeInsets.only(
                                  top: 20, bottom: 20, left: 5, right: 5),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: model.atIndex == index
                                          ? CustomColors.blue
                                          : CustomColors.grey1),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                                  color: CustomColors.white),
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CustomText(
                                      text: DateFormat('EEEE, dd MMM')
                                          .format(DateTime.parse(model
                                          .dateSlotList
                                          .elementAt(index)))
                                          .toString(),
                                      color: CustomColors.black1,
                                      fontSize: 16,
                                    ),
                                    CustomText(
                                      fontSize: 13,
                                      text:
                                      "${model?.slotAvailableList?.elementAt(
                                          index) == 0 ? "No" : model
                                          ?.slotAvailableList?.elementAt(
                                          index)}  slots Available",
                                      color: model?.slotAvailableList
                                          ?.elementAt(index) ==
                                          0
                                          ? CustomColors.grey1
                                          : CustomColors.green,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            index == model.dateSlotList.length - 1
                                ? model.hasNext
                                ? GestureDetector(
                              child: Container(
                                padding: EdgeInsets.all(5.0),
                                child: Icon(
                                  Icons.arrow_right,
                                  size: 70,
                                  color: Colors.lightBlueAccent,
                                ),
                              ),
                              onTap: () {
                                var dateM = DateFormat('MM').format(
                                    DateTime.parse(model.dateSlotList
                                        .elementAt(index))
                                        .toLocal());
                                var dateY =
                                DateFormat(Strings.dateFormatYY)
                                    .format(DateTime.parse(model
                                    .dateSlotList
                                    .elementAt(index))
                                    .toLocal());
                                var dateD =
                                DateFormat(Strings.dateFormatDD)
                                    .format(DateTime.parse(model
                                    .dateSlotList
                                    .elementAt(index))
                                    .toLocal());
                                model.getDoctorAvailability(
                                    dateStamp:
                                    "$dateY-$dateM-${int.parse(dateD) + 1}");
                              },
                            )
                                : Container()
                                : Container()
                          ],
                        ),
                      )),
            ));
  }

  Widget timeSlotCard(int index, List<TimeSlotDataItem> timeslotModelList,
      TimeSlotProvider model) {
    return Consumer<TimeSlotProvider>(builder: (context, model, child) {
      var timeSlot = timeslotModelList[index].slot_start.replaceRange(
          timeslotModelList[index].slot_start
              .toString()
              .length - 3,
          timeslotModelList[index].slot_start
              .toString()
              .length,
          "");

      var dt = DateTime.parse(model.dateSlotList[model.atIndex] +
          ' ' +
          timeSlot +
          ':00' +
          '.000Z')
          .toLocal();
      var converted12hr = DateFormat('h:mm a').format(dt);

      return GestureDetector(
        onTap: timeslotModelList[index].available == "Yes"
            ? () {
          model.selectedStartTimeSlot =
              timeslotModelList
                  .elementAt(index)
                  .slot_start;
          model.selectedEndTimeSlot =
              timeslotModelList
                  .elementAt(index)
                  .slot_end;
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => BookAppointment()),
          );
        }
            : null,
        child: Container(
            margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Center(
              child: CustomText(
                color: timeslotModelList[index].available == "No"
                    ? CustomColors.grey1
                    : null,
                text: "$converted12hr",
                fontSize: 16,
                textAlign: TextAlign.center,
              ),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                    color: timeslotModelList[index].available == "No"
                        ? CustomColors.grey1
                        : CustomColors.blue),
                color: CustomColors.white)),
      );
    });
  }
}

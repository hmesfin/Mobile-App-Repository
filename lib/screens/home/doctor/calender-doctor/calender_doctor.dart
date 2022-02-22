import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:virtudoc_app/custom-widgets/custom-text.dart';
import 'package:virtudoc_app/custom-widgets/custom-top-bar.dart';
import 'package:virtudoc_app/custom-widgets/custom_button.dart';
import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/screens/home/doctor/calender-doctor/selected-model.dart';
import 'package:virtudoc_app/utils/common-widgets.dart';
import 'package:virtudoc_app/utils/custom-colors.dart';
import 'package:virtudoc_app/utils/strings.dart';
import 'package:virtudoc_app/utils/styles.dart';
/*
The file is covered under Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. Please review the license for full details.

This program is not free software: You cannot redistribute it for any use under the terms of the Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. However the source can be modified and updated for the working of the application Design & Development of Mobile Application for “Abyssinia Technology Group” for which it was licensed.
*/

class CalenderDoctor extends StatefulWidget {
  @override
  _CalenderDoctorState createState() => _CalenderDoctorState();
}

class _CalenderDoctorState extends State<CalenderDoctor> {
  CalendarController _calendarController;
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: CustomColors.bg_app,
      body: Consumer<CalenderProvider>(
          builder: (context, model, child) =>
              ModalProgressHUD(
                child: SafeArea(
                  child: Column(
                    children: [
                      CustomTopBar(
                        context: context,
                        titleText: Strings.myCalendar,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: CustomColors.white),
                        child: TableCalendar(
                          builders: buildCalendarBuilders(),
                          calendarController: _calendarController,
                          daysOfWeekStyle: buildDaysOfWeekStyle(),
                          startingDayOfWeek: StartingDayOfWeek.sunday,
                          calendarStyle: buildCalendarStyle(),
                          onDaySelected: (day, events, holidays) {
                            if (day.isAfter(DateTime.now()) ||
                                day.month == DateTime
                                    .now()
                                    .month &&
                                    day.day == DateTime
                                        .now()
                                        .day)
                              showDaySelected(context, day, events);
                          },
                          headerStyle: buildHeaderStyle(),
                        ),
                      ),
                    ],
                  ),
                ),
                inAsyncCall: model.isLoading,
                progressIndicator: CircularProgressIndicator(
                  valueColor:
                  new AlwaysStoppedAnimation<Color>(CustomColors.blue),
                ),
              )),
    );
  }

  CalendarBuilders buildCalendarBuilders() {
    return CalendarBuilders(
      dowWeekdayBuilder: (context, weekday) =>
          Container(
            margin: EdgeInsets.only(bottom: 15),
            child: Center(
                child: Text(
                  weekday,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
          ),
      dayBuilder: (context, date, events) =>
          dayBuilder(date, _calendarController),
    );
  }

  HeaderStyle buildHeaderStyle() {
    return HeaderStyle(
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: FontStyles.medium,
      ),
      centerHeaderTitle: true,
      formatButtonVisible: false,
    );
  }

  Widget dayBuilder(DateTime date, CalendarController calendarController) {
    return Consumer<CalenderProvider>(builder: (context, model, child) {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(color: CustomColors.grey1, width: 0.5),
          color: model.selectedList.any((element) =>
          DateFormat(Strings.yyyyMMDD).format(date) ==
              DateFormat(Strings.yyyyMMDD).format(element.dateTime) &&
              element.available)
              ? CustomColors.green
              : date.day == DateTime
              .now()
              .day &&
              date.month == DateTime
                  .now()
                  .month
              ? CustomColors.blue
              : model.selectedList.any((element) =>
          DateFormat(Strings.yyyyMMDD).format(date) ==
              DateFormat(Strings.yyyyMMDD)
                  .format(element.dateTime) &&
              element.available == false)
              ? CustomColors.white
              : CustomColors.white,
        ),
        child: Center(child: dayWidget(date)),
      );
    });
  }

  Widget dayWidget(DateTime date) {
    return Consumer<CalenderProvider>(
        builder: (context, model, child) =>
            Text(
              date.day.toString(),
              style: TextStyle(
                color: model.selectedList.any((element) =>
                DateFormat(Strings.yyyyMMDD).format(date) ==
                    DateFormat(Strings.yyyyMMDD)
                        .format(element.dateTime) &&
                    element.available)
                    ? CustomColors.white
                    : model.selectedList.any((element) =>
                element.dateTime == date &&
                    element.available == false)
                    ? CustomColors.black1
                    : date.day == DateTime
                    .now()
                    .day &&
                    date.month == DateTime
                        .now()
                        .month
                    ? CustomColors.white
                    : CustomColors.black1,
              ),
            ));
  }

  CalendarStyle buildCalendarStyle() {
    return CalendarStyle(
      outsideWeekendStyle: TextStyle(
        color: Colors.black38,
      ),
      weekendStyle: TextStyle(
        color: CustomColors.black1,
      ),
      selectedColor: CustomColors.blue2,
      todayColor: CustomColors.blue5,
      outsideDaysVisible: true,
    );
  }

  void showDaySelected(BuildContext context, DateTime day, List events) {
    showDialog(
        context: context,
        builder: (context) =>
            Builder(
                builder: (context) =>
                    Dialog(
                      backgroundColor: CustomColors.bg_app,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: column(day, context),
                    )));
  }

  Column column(DateTime day, BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 50,
          height: 50,
          margin: EdgeInsets.only(top: 40, bottom: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: CustomColors.greenDark,
          ),
          child: Container(
            margin: EdgeInsets.all(10),
            child: Image.asset(
              'assets/images/ic_calender_2.png',
            ),
          ),
        ),
        CustomText(
          text: Strings.selectText,
          fontSize: 20,
        ),
        SizedBox(
          height: 20,
        ),
        CustomText(
            text: DateFormat('dd MMMM yyyy').format(day),
            color: CustomColors.grey2,
            fontWeight: FontStyles.semiBoldFontWeight400,
            fontSize: 16.0),
        SizedBox(
          height: 20,
        ),
        Consumer<CalenderProvider>(builder: (context, model, child) {
          bool showUnavailableButton = true;
          bool showAvailableButton = true;
          if (model.selectedList.isEmpty) {
            showUnavailableButton = false;
          } else {
            for (var item in model.selectedList) {
              if (DateFormat(Strings.yyyyMMDD).format(day) ==
                  DateFormat(Strings.yyyyMMDD).format(item.dateTime)) {
                showUnavailableButton = item.available;
                showAvailableButton = !item.available;
                break;
              } else {
                showUnavailableButton = false;
                showAvailableButton = true;
              }
            }
          }
          return availableButtons(
              day, context, showUnavailableButton, showAvailableButton);
        })
      ],
    );
  }

  Column availableButtons(DateTime day, BuildContext context,
      showUnavailableButton, showAvailableButton) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        showAvailableButton
            ? Consumer<CalenderProvider>(
            builder: (context, model, child) =>
                CustomButton(
                    margin: EdgeInsets.all(1),
                    ontap: () {
                      CommonWidgets().navigateBack(context);
                      Provider.of<SetAvailabilityProvider>(context,
                          listen: false)
                          .init();
                      Provider.of<SetAvailabilityProvider>(context,
                          listen: false)
                          .setStartDate(day);
                      CommonWidgets().navigateTO(context,
                          pageName: SetAvailability(
                            success: () {},
                          ));
                    },
                    buttonText: Strings.available.toUpperCase()))
            : Container(),
        showUnavailableButton
            ? Consumer<CalenderProvider>(
            builder: (context, model, child) =>
                CustomButton(
                    color: CustomColors.grey2,
                    margin: EdgeInsets.all(20),
                    ontap: () {
                      CommonWidgets().navigateBack(context);
                      model.markUnavailble(day, success: () {
                        SelectedModel selectedModel;
                        var eventId;
                        model.selectedList.forEach((element) {
                          if (DateFormat(Strings.yyyyMMDD).format(day) ==
                              DateFormat(Strings.yyyyMMDD)
                                  .format(element.dateTime)) {
                            selectedModel = element;
                            eventId = element.eventd;
                          }
                        });
                        model.selectedList.remove(selectedModel);
                        model.selectedList
                            .add(SelectedModel(false, day, eventId));
                      }, failure: (message) {
                        CommonWidgets.showToast(context, message, _scaffoldKey);
                      });
                    },
                    buttonText: Strings.unavailable.toUpperCase()))
            : Container(
          padding: EdgeInsets.only(bottom: 20),
        )
      ],
    );
  }

  DaysOfWeekStyle buildDaysOfWeekStyle() {
    return DaysOfWeekStyle(
      weekdayStyle: TextStyle(
        color: CustomColors.black1,
        fontWeight: FontWeight.bold,
      ),
      weekendStyle: TextStyle(
        color: CustomColors.black1,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

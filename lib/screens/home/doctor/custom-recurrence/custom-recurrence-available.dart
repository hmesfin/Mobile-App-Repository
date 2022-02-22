import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:virtudoc_app/custom-widgets/custom-text.dart';
import 'package:virtudoc_app/custom-widgets/custom-top-bar.dart';
import 'package:virtudoc_app/custom-widgets/custom_button.dart';
import 'package:virtudoc_app/utils/common-widgets.dart';
import 'package:virtudoc_app/utils/custom-colors.dart';
import 'package:virtudoc_app/utils/strings.dart';
import 'package:virtudoc_app/utils/styles.dart';

import '../../../../index.dart';

class CustomRecurrenceAvailable extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CustomRecurrenceAvailableState();
  }
}

class CustomRecurrenceAvailableState extends State<CustomRecurrenceAvailable> {
  String selectedDay = '';
  List<String> selectedDays = [];
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    selectedDays.clear();
    selectedDay = getDay(-1);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: CustomColors.bg_app,
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomTopBar(
                  context: context, titleText: Strings.customRecurrence),
              Container(
                margin: EdgeInsets.only(left: 30),
                alignment: Alignment.topLeft,
                child: CustomText(
                  text: Strings.recurringType,
                  fontSize: FontStyles.size15,
                  color: CustomColors.black1,
                  fontWeight: FontStyles.semiBoldFontWeight400,
                ),
              ),
              Consumer<SetAvailabilityProvider>(
                  builder: (context, model, child) =>
                      singleRadio2(
                        value: true,
                        groupVal: model.isDailyBool,
                        text: Strings.daily,
                      )),
              Consumer<SetAvailabilityProvider>(
                  builder: (context, model, child) =>
                      singleRadio2(
                        value: false,
                        groupVal: model.isDailyBool,
                        text: Strings.weekly,
                      )),
              Consumer<SetAvailabilityProvider>(
                  builder: (context, model, child) =>
                  model.isDailyBool ? Container() : repeatOn()),
              Consumer<SetAvailabilityProvider>(
                  builder: (context, model, child) =>
                  model.isDailyBool ? Container() : buildDays()),
              Consumer<SetAvailabilityProvider>(
                  builder: (context, model, child) =>
                  model.isDailyBool
                      ? Container()
                      : Container(
                    margin: EdgeInsets.only(
                        top: 15, bottom: 10, left: 30, right: 30),
                    child: CustomText(
                      maxLines: 3,
                      text: selectedDays.length != 0
                          ? selectedDays.join(", ")
                          : getDay(-1),
                      fontSize: FontStyles.size15,
                      color: CustomColors.grey2,
                      fontWeight: FontStyles.semiBoldFontWeight400,
                    ),
                  )),
              CommonWidgets.divider,
              Container(
                margin: EdgeInsets.only(left: 30, top: 15),
                alignment: Alignment.topLeft,
                child: CustomText(
                  text: Strings.repeatEnd,
                  fontSize: FontStyles.size15,
                  color: CustomColors.black1,
                  fontWeight: FontStyles.semiBoldFontWeight400,
                ),
              ),
              Consumer<SetAvailabilityProvider>(
                  builder: (context, model, child) =>
                      singleRadio(
                        value: true,
                        groupVal: model.isNeverBool,
                        text: Strings.never,
                      )),
              Consumer<SetAvailabilityProvider>(
                  builder: (context, model, child) =>
                      singleRadio(
                        value: false,
                        groupVal: model.isNeverBool,
                        text: Strings.onADay,
                      )),
              Consumer<SetAvailabilityProvider>(
                  builder: (context, model, child) =>
                  model.isNeverBool
                      ? Container()
                      : Consumer<SetAvailabilityProvider>(
                      builder: (context, model, child) =>
                          GestureDetector(
                            child: CommonWidgets().customTextFormField(
                                context, Strings.endDate,
                                iconData: Icons.calendar_today,
                                isEnable: false,
                                controller: model.endDateController),
                            onTap: () async {
                              await CommonWidgets().datePicker(context,
                                  onSelected: (utcDate) {
                                    model.setEndDate(utcDate.toLocal());
                                  });
                            },
                            behavior: HitTestBehavior.opaque,
                          ))),
              SizedBox(
                height: 10,
              ),
              CommonWidgets.divider,
              Consumer<SetAvailabilityProvider>(
                  builder: (context, model, child) =>
                      CustomButton(
                        ontap: () {
                          model.setCustomRecurrence(success: () {
                            Provider
                                .of<SetAvailabilityProvider>(context,
                                listen: false)
                                .repeatAvailability = true;
                            CommonWidgets().navigateBack(context);
                          }, failure: (msg) {
                            CommonWidgets.showToast(context, msg, _scaffoldKey);
                          });
                        },
                        buttonText: Strings.done.toUpperCase(),
                      ))
            ],
          ),
          scrollDirection: Axis.vertical,
        ),
      ),
    );
  }

  Container repeatOn() {
    return Container(
      margin: EdgeInsets.only(left: 30),
      alignment: Alignment.topLeft,
      child: CustomText(
        text: Strings.repeatOn,
        fontSize: FontStyles.size15,
        color: CustomColors.black1,
        fontWeight: FontStyles.semiBoldFontWeight400,
      ),
    );
  }

  Container buildDays() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:
        Strings.daysList.map((day) => buildGestureDetector(day)).toList(),
      ),
    );
  }

  Widget buildGestureDetector(int day) {
    return Consumer<SetAvailabilityProvider>(
        builder: (context, model, child) =>
            GestureDetector(
              onTap: () {
                if (selectedDays.contains(getDay(day))) {
                  selectedDays.remove(getDay(day));
                  model.selectedDaysInt.remove(day);
                  model.selectedDays.remove(getDay(day));
                } else {
                  selectedDays.add(getDay(day));
                  model.selectedDaysInt.add(day);
                  model.selectedDays.add(getDay(day));
                }
                setState(() {});
              },
              child: buildContainer(day),
            ));
  }

  Container buildContainer(int day) {
    return Container(
      height: 40,
      width: 40,
      margin: EdgeInsets.only(left: 3, right: 3),
      decoration: buildBoxDecoration(getDay(day)),
      child: Center(
          child: Text(
            getDay(day)[0],
            style: buildTextStyle(day),
          )),
    );
  }

  BoxDecoration buildBoxDecoration(String day) {
    return BoxDecoration(
        border: Border.all(color: CustomColors.grey1),
        color:
        selectedDays.contains(day) ? CustomColors.blue : CustomColors.white,
        borderRadius: BorderRadius.circular(100));
  }

  TextStyle buildTextStyle(int day) {
    return TextStyle(
      fontSize: FontStyles.size,
      color: selectedDays.contains(getDay(day))
          ? CustomColors.white
          : CustomColors.grey2,
    );
  }

  Widget singleRadio({
    String text,
    bool groupVal,
    bool value,
  }) {
    return Consumer<SetAvailabilityProvider>(
        builder: (context, model, child) =>
            Container(
              margin: EdgeInsets.only(left: 60),
              child: Row(
                children: [
                  Radio(
                      value: value,
                      groupValue: groupVal,
                      onChanged: (value) {
                        model.isNeverBool = value;
                        setState(() {});
                      }),
                  CustomText(
                    text: text,
                    fontSize: FontStyles.size15,
                    color: CustomColors.grey2,
                    fontWeight: FontStyles.semiBoldFontWeight400,
                  ),
                ],
              ),
            ));
  }

  Widget singleRadio2({
    String text,
    bool groupVal,
    bool value,
  }) {
    return Consumer<SetAvailabilityProvider>(
        builder: (context, model, child) =>
            Container(
              margin: EdgeInsets.only(left: 60),
              child: Row(
                children: [
                  Radio(
                      value: value,
                      groupValue: groupVal,
                      onChanged: (value) {
                        model.isDailyBool = value;
                        setState(() {});
                      }),
                  CustomText(
                    text: text,
                    fontSize: FontStyles.size15,
                    color: CustomColors.grey2,
                    fontWeight: FontStyles.semiBoldFontWeight400,
                  ),
                ],
              ),
            ));
  }

  String getDay(int index) {
    if (index == 0) {
      return "Sunday";
    }
    if (index == 1) {
      return "Monday";
    }
    if (index == 2) {
      return "Tuesday";
    }
    if (index == 3) {
      return "Wednesday";
    }
    if (index == 4) {
      return "Thursday";
    }
    if (index == 5) {
      return "Friday";
    }
    if (index == 6) {
      return "Saturday";
    } else
      return "Select A Day";
  }
}

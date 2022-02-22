import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:virtudoc_app/custom-widgets/custom-text.dart';
import 'package:virtudoc_app/custom-widgets/custom-top-bar.dart';
import 'package:virtudoc_app/custom-widgets/custom_button.dart';
import 'package:virtudoc_app/utils/common-widgets.dart';
import 'package:virtudoc_app/utils/custom-colors.dart';
import 'package:virtudoc_app/utils/strings.dart';
import 'package:virtudoc_app/utils/styles.dart';

class CustomRecurrenceUnAvailable extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CustomRecurrenceUnAvailableState();
  }
}

class CustomRecurrenceUnAvailableState
    extends State<CustomRecurrenceUnAvailable> {
  bool groupValue = false;
  String selectedDay = '';
  List<String> selectedDays = [];

  @override
  void initState() {
    super.initState();
    selectedDay = getDay(-1);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.bg_app,
        body: Column(
          children: [
            CustomTopBar(context: context, titleText: Strings.customRecurrence),
            repeatOn(),
            buildDays(),
            Container(
              margin: EdgeInsets.only(top: 15, bottom: 10, left: 30, right: 30),
              child: CustomText(
                text: selectedDays.length != 0
                    ? selectedDays.join(", ")
                    : getDay(-1),
                fontSize: FontStyles.size15,
                color: CustomColors.grey2,
                fontWeight: FontStyles.semiBoldFontWeight400,
              ),
            ),
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
            singleRadio(
              value: true,
              groupVal: groupValue,
              text: Strings.never,
            ),
            singleRadio(
              value: false,
              groupVal: groupValue,
              text: Strings.onADay,
            ),
            SizedBox(
              height: 10,
            ),
            CommonWidgets.divider,
            CustomButton(
              ontap: () {
                CommonWidgets().navigateBack(context);
              },
              buttonText: Strings.done.toUpperCase(),
            )
          ],
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

  GestureDetector buildGestureDetector(int day) {
    return GestureDetector(
      onTap: () {
        if (selectedDays.contains(getDay(day))) {
          selectedDays.remove(getDay(day));
        } else {
          selectedDays.add(getDay(day));
        }
        setState(() {});
      },
      child: buildContainer(day),
    );
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
    return Container(
      margin: EdgeInsets.only(left: 60),
      child: Row(
        children: [
          Radio(
              value: value,
              groupValue: groupValue,
              onChanged: (value) {
                groupValue = value;
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
    );
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
      return "WednesDay";
    }
    if (index == 4) {
      return "Thrusday";
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:virtudoc_app/utils/custom-colors.dart';
/*
The file is covered under Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. Please review the license for full details.

This program is not free software: You cannot redistribute it for any use under the terms of the Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. However the source can be modified and updated for the working of the application Design & Development of Mobile Application for “Abyssinia Technology Group” for which it was licensed.
*/

class SetUnAvailability extends StatefulWidget {
  @override
  _SetUnAvailabilityState createState() => _SetUnAvailabilityState();
}

class _SetUnAvailabilityState extends State<SetUnAvailability> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.bg_app,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /*        CustomTopBar(
                context: context,
                titleText: Strings.setUnavailability,
              ),
              CustomText(
                text: Strings.enterStartDateTime,
                fontWeight: FontStyles.semiBoldFontWeight400,
                fontSize: FontStyles.size15,
              ),
              CommonWidgets().customTextFormField(context, Strings.startDate,
                  iconData: Icons.calendar_today),
              CommonWidgets().customTextFormField(context, Strings.startTime,
                  iconData: Icons.access_time),
              SizedBox(
                height: 20,
              ),
              CustomText(
                text: Strings.enterEndDateTime,
                fontWeight: FontStyles.semiBoldFontWeight400,
                fontSize: FontStyles.size15,
              ),
              CommonWidgets().customTextFormField(context, Strings.endDate,
                  iconData: Icons.calendar_today),
              CommonWidgets().customTextFormField(context, Strings.endTime,
                  iconData: Icons.access_time),
              Divider(
                indent: 20,
                endIndent: 20,
                color: CustomColors.grey1,
                thickness: 1,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomText(
                    text: Strings.repeatAvailability,
                    fontWeight: FontStyles.semiBoldFontWeight400,
                    fontSize: FontStyles.size16,
                  ),
                  CupertinoSwitch(
                      activeColor: CustomColors.yellow1,
                      value: switchValue,
                      onChanged: (value) {
                        switchValue = value;
                        setState(() {});
                        if (switchValue == true)
                          CommonWidgets().navigateTO(context,
                              pageName: CustomRecurrenceUnAvailable());
                      })
                ],
              ),
              CommonWidgets().customTextFormField(
                context,
                Strings.unavailableOn,
                height: CommonWidgets().getHeight(context) * 0.1,
                width: CommonWidgets().getWidth(context) * 0.8,
                readOnly: false,
                radius: 25,
                maxlines: 4,
                showCursor: true,
              ),
              CustomButton(
                ontap: () {
                  CommonWidgets().navigateBack(context);
                },
                buttonText: Strings.save,
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}

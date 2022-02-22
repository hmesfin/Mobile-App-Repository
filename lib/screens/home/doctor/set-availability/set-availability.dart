import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:virtudoc_app/custom-widgets/custom-text.dart';
import 'package:virtudoc_app/custom-widgets/custom-top-bar.dart';
import 'package:virtudoc_app/custom-widgets/custom_button.dart';
import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/screens/home/doctor/custom-recurrence/custom-recurrence-available.dart';
import 'package:virtudoc_app/utils/common-widgets.dart';
import 'package:virtudoc_app/utils/custom-colors.dart';
import 'package:virtudoc_app/utils/strings.dart';
import 'package:virtudoc_app/utils/styles.dart';
/*
The file is covered under Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. Please review the license for full details.

This program is not free software: You cannot redistribute it for any use under the terms of the Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. However the source can be modified and updated for the working of the application Design & Development of Mobile Application for “Abyssinia Technology Group” for which it was licensed.
*/

class SetAvailability extends StatefulWidget {
  final Function success;

  const SetAvailability({this.success});

  @override
  _SetAvailabilityState createState() => _SetAvailabilityState();
}

class _SetAvailabilityState extends State<SetAvailability> {
  bool switchValue = false;
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<SetAvailabilityProvider>(
        builder: (context, model, child) =>
            ModalProgressHUD(
              child: SafeArea(
                child: Scaffold(
                  key: _scaffoldKey,
                  backgroundColor: CustomColors.bg_app,
                  body: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomTopBar(
                          context: context,
                          titleText: Strings.setAvailability,
                        ),
                        CustomText(
                          text: Strings.enterStartDateTime,
                          fontWeight: FontStyles.semiBoldFontWeight400,
                          fontSize: FontStyles.size15,
                        ),
                        Consumer<SetAvailabilityProvider>(
                            builder: (context, model, child) =>
                                CommonWidgets()
                                    .customTextFormField(
                                    context, Strings.startDate,
                                    iconData: Icons.calendar_today,
                                    isEnable: false,
                                    controller: model.startDateController)),
                        Consumer<SetAvailabilityProvider>(
                            builder: (context, model, child) =>
                                GestureDetector(
                                  child: CommonWidgets().customTextFormField(
                                      context, Strings.startTime,
                                      iconData: Icons.access_time,
                                      isEnable: false,
                                      controller: model.startTimeController),
                                  onTap: () async {
                                    var time = await CommonWidgets()
                                        .slotTimePicker(context);
                                    Provider
                                        .of<SetAvailabilityProvider>(
                                        context,
                                        listen: false)
                                        .startTimeForComp = time;
                                    model?.setStartTime(time
                                        ?.toString()
                                        ?.substring("TimeOfDay(".length,
                                        time
                                            .toString()
                                            .length - 1));
                                  },
                                  behavior: HitTestBehavior.opaque,
                                )),
                        SizedBox(
                          height: 20,
                        ),
                        CustomText(
                          text: Strings.enterEndDateTime,
                          fontWeight: FontStyles.semiBoldFontWeight400,
                          fontSize: FontStyles.size15,
                        ),
                        Consumer<SetAvailabilityProvider>(
                            builder: (context, model, child) =>
                                GestureDetector(
                                  child: CommonWidgets().customTextFormField(
                                      context, Strings.endTime,
                                      iconData: Icons.access_time,
                                      isEnable: false,
                                      controller: model.endTimeController),
                                  onTap: () async {
                                    var time = await CommonWidgets()
                                        .slotTimePicker(context);
                                    Provider
                                        .of<SetAvailabilityProvider>(
                                        context,
                                        listen: false)
                                        .endTimeForComp = time;
                                    model.setEndTime(time
                                        ?.toString()
                                        ?.substring("TimeOfDay(".length,
                                        time
                                            .toString()
                                            .length - 1));
                                  },
                                  behavior: HitTestBehavior.opaque,
                                )),
                        Consumer<SetAvailabilityProvider>(
                            builder: (context, model, child) =>
                                CommonWidgets().customTextFormField(
                                    context, Strings.slotDuration,
                                    inputformatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]')),
                                    ],
                                    iconData: Icons.timelapse_outlined,
                                    controller: model.slotDuration,
                                    readOnly: false,
                                    showCursor: true,
                                    inputType: TextInputType.numberWithOptions(
                                        signed: false,
                                        decimal: false),
                                    onChanged: (str) {
                                      model.setSlotDuration(str);
                                    })),
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
                            Consumer<SetAvailabilityProvider>(
                                builder: (context, model, child) =>
                                    CupertinoSwitch(
                                        activeColor: CustomColors.yellow1,
                                        value: model.repeatAvailability,
                                        onChanged: (value) {
                                          FocusScope.of(context)
                                              .requestFocus(FocusNode());
                                          model.initCustomRecurrence();
                                          if (value == false) {
                                            model.repeatAvailability = value;
                                          }
                                          if (value)
                                            CommonWidgets().navigateTO(context,
                                                pageName:
                                                CustomRecurrenceAvailable());
                                        }))
                          ],
                        ),
                        Consumer<SetAvailabilityProvider>(
                            builder: (context, model, child) =>
                            model
                                .repeatAvailability
                                ? CommonWidgets().customTextFormField(
                                context, Strings.availableOn,
                                height: 85.0,
                                width:
                                CommonWidgets().getWidth(context) * 0.8,
                                readOnly: false,
                                radius: 25,
                                maxlines: 4,
                                showCursor: true,
                                controller: model.availabilityText)
                                : Container()),
                        Consumer<SetAvailabilityProvider>(
                            builder: (context, model, child) =>
                                CustomButton(
                                  ontap: () {
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());
                                    model.setAvailability(success: () {
                                      Provider.of<CalenderProvider>(context,
                                          listen: false)
                                          .getCalenderView();
                                      widget?.success();
                                      CommonWidgets().navigateBack(context);
                                    }, failure: (msg) {
                                      CommonWidgets.showToast(
                                          context, msg, _scaffoldKey);
                                    });
                                  },
                                  buttonText: Strings.save,
                                )),
                      ],
                    ),
                  ),
                ),
              ),
              inAsyncCall: model.isLoading,
              progressIndicator: CircularProgressIndicator(
                valueColor:
                new AlwaysStoppedAnimation<Color>(CustomColors.blue),
              ),
            ));
  }
}

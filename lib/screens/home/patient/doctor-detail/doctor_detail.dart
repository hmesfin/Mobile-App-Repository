import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:virtudoc_app/custom-widgets/custom-text.dart';
import 'package:virtudoc_app/custom-widgets/custom-top-bar.dart';
import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/screens/home/patient/find-doctor/time-slot/time_slot.dart';
import 'package:virtudoc_app/utils/custom-colors.dart';
import 'package:virtudoc_app/utils/strings.dart';
import 'package:virtudoc_app/utils/styles.dart';
/*
The file is covered under Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. Please review the license for full details.

This program is not free software: You cannot redistribute it for any use under the terms of the Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. However the source can be modified and updated for the working of the application Design & Development of Mobile Application for “Abyssinia Technology Group” for which it was licensed.
*/

class DoctorDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DoctorDetailState();
}

class _DoctorDetailState extends State<DoctorDetail> {
  bool isDobFocused = false;
  bool isGenderFocused = false;
  bool isHeightFocused = false;
  bool isWeightFocused = false;
  String dropdownValue = "Male";

  bool isPasswordFocused = false;
  File profileImage;

  AppBar appBar = AppBar(
    title: Text(Strings.appName),
  );

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: CustomColors.blue, //or set color with: Color(0xFF0000FF)
    ));
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.bg_app,
        body: _buildWidget(context),
      ),
    );
  }

  _buildWidget(BuildContext context) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    return Stack(
      children: [
        Column(
          children: <Widget>[
            CustomTopBar(context: context, titleText: Strings.doctor_detail),
            expandedDetailView(screenWidth, screenHeight),
          ],
        ),
        bookAppointmentBtn(context, screenWidth),
      ],
    );
  }

  Expanded expandedDetailView(double screenWidth, double screenHeight) {
    return Expanded(
        child: Stack(
          children: [
            Consumer<DoctorDetailProvider>(builder: (context, model, child) {
              var doctorDetail = model?.doctorDetailData;
              //address
              // var houseNo = doctorDetail?.userProfile?.address?.houseNo ?? "";
              // var subCity = doctorDetail?.userProfile?.address?.subCity ?? "";
              // var city = doctorDetail?.userProfile?.address?.city ?? "";
              var region = doctorDetail?.userProfile?.address?.region ?? "";
              var state = doctorDetail?.userProfile?.address?.state ?? "";
              var country = doctorDetail?.userProfile?.address?.country ?? "";

              var address = (region.isEmpty ? "" : "$region, ") +
                  (state.isEmpty ? "" : "$state, ") +
                  (country.isEmpty ? "" : "$country");
              return Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 40,
                      ),

                      // added user image
                      CommonWidgets.userImgeLoader(
                          imageUrl: doctorDetail?.userProfile?.profileImage),
                      Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 20, right: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                CustomText(
                                  text:
                                  'Dr. ${doctorDetail?.firstName ??
                                      ""} ${doctorDetail?.lastName ?? ''} ',
                                  color: CustomColors.black1,
                                  fontSize: FontStyles.size,
                                ),
                                SizedBox(
                                  height: FontStyles.vsmall,
                                ),
                                CustomText(
                                  text:
                                  '${doctorDetail?.userProfile
                                      ?.enrollmentInformation?.speciality
                                      ?.length != 0 ? doctorDetail?.userProfile
                                      ?.enrollmentInformation?.speciality?.join(
                                      ', ') : "Speciality: N/A" ??
                                      "Speciality: N/A"}',
                                  color: CustomColors.grey2,
                                  fontSize: FontStyles.size16,
                                  maxLines: 3,
                                  overflow: TextOverflow.clip,
                                  textAlign: TextAlign.start,
                                ),
                                SizedBox(
                                  height: FontStyles.vsmall,
                                ),
                                // CustomText(
                                //   text:
                                //       '${doctorDetail?.userProfile?.enrollmentInformation?.yearsOfExperience ?? "N/a"} Years Experience',
                                //   color: CustomColors.grey2,
                                //   fontSize: FontStyles.size16,
                                // ),
                              ],
                            ),
                          )),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 35, top: 13),
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
                          width: CommonWidgets().getWidth(context) * 0.8,
                          textAlign: TextAlign.start,
                          maxLines: 2,
                          text:
                          '${doctorDetail?.userProfile?.enrollmentInformation
                              ?.postGrad?.isEmpty ?? true ? '' : doctorDetail
                              ?.userProfile?.enrollmentInformation?.postGrad}',
                          color: CustomColors.grey2,
                          fontSize: FontStyles.size16,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 35, top: 13),
                    child: Row(
                      children: [
                        CustomText(
                          text: Strings.consultationfee,
                          color: CustomColors.black2,
                          fontSize: FontStyles.size16,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CustomText(
                          text: "\$${doctorDetail?.consultationFee ?? 0}",
                          color: CustomColors.grey2,
                          fontSize: FontStyles.size15,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 35, top: 13),
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
                              width: CommonWidgets().getWidth(context) * 0.7,
                              textAlign: TextAlign.start,
                              maxLines: 3,
                              text: "${address?.trim() ?? "N/A"}",
                              color: CustomColors.grey2,
                              fontSize: FontStyles.size15,
                            )),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 35, top: 13),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: Strings.briefdescription,
                          color: CustomColors.black2,
                          fontSize: FontStyles.size16,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: CustomText(
                            text:
                            "${doctorDetail?.userProfile?.enrollmentInformation
                                ?.additionalInfo?.isEmpty ?? true
                                ? "N/A"
                                : doctorDetail?.userProfile
                                ?.enrollmentInformation?.additionalInfo}",
                            color: CustomColors.grey2,
                            fontSize: FontStyles.size15,
                            maxLines: 5,
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 1.5,
                    indent: screenWidth / 10,
                    endIndent: screenWidth / 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: 35,
                    ),
                    child: Column(
                      children: [
                        CustomText(
                          text:
                          "${doctorDetail?.userProfile?.avgRating?.toString() ??
                              "0"}",
                          color: CustomColors.grey2,
                          fontSize: FontStyles.size24,
                        ),
                        RatingBarIndicator(
                          rating:
                          doctorDetail?.userProfile?.avgRating?.toDouble() ??
                              0.0,
                          itemCount: 5,
                          itemSize: 30.0,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, _) =>
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1.5,
                    indent: screenWidth / 10,
                    endIndent: screenWidth / 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 35, top: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        model?.feedbackList?.length == 0
                            ? Container()
                            : CustomText(
                          text: Strings.feedbacks,
                          color: CustomColors.black1,
                          fontSize: FontStyles.size,
                        ),
                        Expanded(child: SizedBox()),
                        model.feedbackList.length > 2
                            ? GestureDetector(
                          child: CustomText(
                            text: Strings.showAll,
                            color: CustomColors.blue3,
                            fontSize: FontStyles.size16,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Feedbacks()),
                            );
                          },
                          behavior: HitTestBehavior.opaque,
                        )
                            : Container(),
                        SizedBox(
                          width: 35,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenHeight / 30,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  model?.feedbackList?.length == 0
                      ? Container(
                    child: Center(
                      child: CustomText(
                        text: Strings.noFeedbacks,
                        color: CustomColors.black1,
                        fontSize: FontStyles.size16,
                      ),
                    ),
                  )
                      : feedBackListView(context)
                ],
              );
            }),
            Consumer<DoctorDetailProvider>(
                builder: (context, provider, child) =>
                    Center(
                      child: provider.isLoading
                          ? CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation<Color>(
                            CustomColors.blue),
                      )
                          : Container(),
                    ))
          ],
        ));
  }

  Widget bookAppointmentBtn(context, screenWidth) {
    return Container(
      alignment: Alignment(0, 1),
      child: CustomButton(
          ontap: () {
            Provider.of<TimeSlotProvider>(context, listen: false).initData();
            Provider.of<TimeSlotProvider>(context, listen: false)
                .getDoctorAvailability(
                doctorId: Provider
                    .of<DoctorDetailProvider>(context,
                    listen: false)
                    .doctorId);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SelectTimeSlot()),
            );
          },
          buttonText: Strings.bookAppointment.toUpperCase()),
    );
  }

  Widget feedBackListView(context) {
    return Consumer<DoctorDetailProvider>(builder: (context, model, child) {
      return ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: (model?.feedbackList?.length ?? 0) >= 2
              ? 2
              : (model?.feedbackList?.length ?? 0) == 1
              ? 1
              : 0,
          itemBuilder: (context, int index) {
            var item = model?.feedbackList?.elementAt(index);
            var timeDiff = CommonWidgets.timeAgoSinceDate(item?.createdAt);
            return singleRatingCard(item, timeDiff, context);
          });
    });
  }

  Padding singleRatingCard(FeedbackListRow item, String timeDiff,
      BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonWidgets.userImgeLoader(
              size: 60, imageUrl: item?.review_by?.user_profile?.profile_image),
          SizedBox(
            width: 14.0,
          ),
          Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  row(item, timeDiff),
                  SizedBox(
                    height: 2.0,
                  ),
                  RatingBarIndicator(
                    rating: item?.rating?.toDouble(),
                    itemCount: 5,
                    itemSize: 18.0,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, _) =>
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 5.0),
                    width: CommonWidgets().getWidth(context) * 0.69,
                    child: Text(item?.review ?? 'N/A',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: CustomColors.grey2,
                          fontWeight: FontStyles.semiBoldFontWeight500,
                          fontSize: FontStyles.size15,
                        ),
                        textAlign: TextAlign.start),
                  ),
                  SizedBox(
                    height: 10.0,
                  )
                ],
              )),
        ],
      ),
    );
  }

  Row row(FeedbackListRow item, String timeDiff) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text:
          "${item?.review_by?.first_name?.isEmpty ?? true ? "N/A" : item
              ?.review_by?.first_name ?? 'N/A'}",
          color: CustomColors.black2,
          fontSize: FontStyles.large,
        ),
        CustomText(
          text: "$timeDiff",
          color: CustomColors.grey2,
          fontSize: FontStyles.size15,
        ),
      ],
    );
  }
}

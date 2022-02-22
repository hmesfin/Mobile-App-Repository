import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:virtudoc_app/custom-widgets/custom-text.dart';
import 'package:virtudoc_app/custom-widgets/custom-top-bar.dart';
import 'package:virtudoc_app/utils/common-widgets.dart';
import 'package:virtudoc_app/utils/custom-colors.dart';
import 'package:virtudoc_app/utils/strings.dart';
import 'package:virtudoc_app/utils/styles.dart';

import '../../../index.dart';
/*
The file is covered under Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. Please review the license for full details.

This program is not free software: You cannot redistribute it for any use under the terms of the Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. However the source can be modified and updated for the working of the application Design & Development of Mobile Application for “Abyssinia Technology Group” for which it was licensed.
*/

class Feedbacks extends StatefulWidget {
  @override
  _FeedbacksState createState() => _FeedbacksState();
}

class _FeedbacksState extends State<Feedbacks> {
  AppBar appBar = AppBar();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: CustomColors.bg_app,
      body: _buildWidget(context),
    ));
  }

  _buildWidget(BuildContext context) {
    double appbarheight = appBar.preferredSize.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height - appbarheight;
    return SingleChildScrollView(
      child: parentContainer(screenHeight, screenWidth, context, appbarheight),
    );
  }

  Container parentContainer(double screenHeight, double screenWidth,
      BuildContext context, appbarheight) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CustomTopBar(
            context: context,
            titleText: Strings.feedbacks,
          ),
          Divider(
            height: screenHeight / 15,
            thickness: 1,
            indent: screenWidth / 10,
            endIndent: screenWidth / 10,
          ),
          Container(
            // padding: EdgeInsets.only(
            //   left: 35,
            // ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AutoSizeText(
                  Strings.avgRating,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    fontWeight: FontStyles.regularFontWeight300,
                    fontFamily: FontStyles.fontFamly,
                    package: FontStyles.package,
                    // color: CustomColors.yellow1,
                    fontStyle: FontStyle.normal,
                  ),
                  presetFontSizes: [16, 15, 14],
                  // textAlign: TextAlign.center,
                ),
                SizedBox(
                  width: screenWidth / 30,
                ),
                Consumer<DoctorDetailProvider>(
                    builder: (context, model, child) {
                  var doctorDetail = model?.doctorDetailData;
                  return CustomText(
                    text:
                        "${doctorDetail?.userProfile?.avgRating.toString() ?? "0"}",
                    color: CustomColors.grey2,
                    fontSize: FontStyles.size24,
                  );
                }),
                SizedBox(
                  width: screenWidth / 30,
                ),
                Consumer<DoctorDetailProvider>(
                    builder: (context, model, child) {
                  var doctorDetail = model?.doctorDetailData;
                  return RatingBarIndicator(
                    rating:
                        doctorDetail?.userProfile?.avgRating?.toDouble() ?? 0.0,
                    itemCount: 5,
                    itemSize: 30.0,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                  );
                }),
              ],
            ),
          ),
          Divider(
            height: screenHeight / 15,
            thickness: 1,
            indent: screenWidth / 10,
            endIndent: screenWidth / 10,
          ),
          Container(
            height: screenHeight - appbarheight * 1.5,
            width: screenWidth,
            child: paginatedListView(context),
          ),
        ],
      ),
    );
  }

  Widget paginatedListView(context) {
    return Consumer<DoctorDetailProvider>(
      builder: (context, model, child) => SmartRefresher(
        enablePullDown: false,
        enablePullUp: true,
        header: WaterDropHeader(),
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus mode) {
            Widget body;
            if (mode == LoadStatus.idle) {
              body = CustomText(
                text: '',
              );
            } else if (mode == LoadStatus.loading) {
              body = Container();
            } else if (mode == LoadStatus.failed) {
              body = CustomText(
                text: '',
              );
            } else if (mode == LoadStatus.canLoading) {
              body = Container();
            } else {
              body = CustomText(
                text: '',
              );
            }
            return Container(
              height: 55.0,
              child: Center(child: body),
            );
          },
        ),
        controller: model.refreshController,
        onRefresh: model.refreshList,
        onLoading: () => model.getFeedbackList(),
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemCount: model.feedbackList.length,
            itemBuilder: (context, int index) {
              var item = model?.feedbackList?.elementAt(index);
              var timeDiff = CommonWidgets.timeAgoSinceDate(item?.createdAt);
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonWidgets.userImgeLoader(
                        imageUrl: item?.review_by?.user_profile?.profile_image,
                        size: 60),
                    SizedBox(
                      width: 14.0,
                    ),
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text:
                                  "${item.review_by.first_name.isEmpty ? "N/A" : item?.review_by?.first_name ?? 'N/A'}",
                              color: CustomColors.black2,
                              fontSize: FontStyles.large,
                            ),
                            CustomText(
                              text: "$timeDiff",
                              color: CustomColors.grey2,
                              fontSize: FontStyles.size15,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2.0,
                        ),
                        RatingBarIndicator(
                          rating: item?.rating?.toDouble(),
                          itemCount: 5,
                          itemSize: 18.0,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, _) => Icon(
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
            }),
      ),
    );
  }
}

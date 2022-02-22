import 'package:flutter/gestures.dart';
import 'package:flutter/scheduler.dart';
import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/screens/home/doctor/rating-feedback/report-feedback.dart';
/*
The file is covered under Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. Please review the license for full details.

This program is not free software: You cannot redistribute it for any use under the terms of the Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. However the source can be modified and updated for the working of the application Design & Development of Mobile Application for “Abyssinia Technology Group” for which it was licensed.
*/

class RatingFeedback extends StatefulWidget {
  RatingFeedback({Key key}) : super(key: key);

  @override
  _RatingFeedbackState createState() => _RatingFeedbackState();
}

class _RatingFeedbackState extends State<RatingFeedback> {
  var controller = ScrollController();

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      Provider.of<RatingFeedbackProvider>(context, listen: false)
          .getFeedbackList(
          Provider
              .of<UserProvider>(context, listen: false)
              .doctorId,
          Provider
              .of<RatingFeedbackProvider>(context, listen: false)
              .page);
    });

    controller.addListener(() {
      if (controller.position.pixels >
          controller.position.maxScrollExtent + 150) {
        Provider
            .of<RatingFeedbackProvider>(context, listen: false)
            .page++;
        Provider.of<RatingFeedbackProvider>(context, listen: false)
            .getFeedbackList(
            Provider
                .of<UserProvider>(context, listen: false)
                .doctorId,
            Provider
                .of<RatingFeedbackProvider>(context, listen: false)
                .page);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.bg_app,
        body: _buildWidget(context),
      ),
    );
  }

  _buildWidget(BuildContext context) {
    return Column(
      children: <Widget>[
        CustomTopBar(
          context: context,
          titleText: Strings.reviewFeedBack,
        ),
        Container(
          height: 56,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              border: Border.symmetric(
                  horizontal: BorderSide(width: 1, color: CustomColors.grey1))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: "Average Rating: ",
                color: CustomColors.grey2,
                fontSize: 16.0,
              ),
              CustomText(
                text: Provider
                    .of<UserProvider>(context)
                    .rating
                    .toString(),
                color: CustomColors.black1,
                fontSize: 18.0,
              ),
              SizedBox(
                width: 10,
              ),
              RatingBarIndicator(
                rating: Provider
                    .of<UserProvider>(context)
                    .rating,
                itemBuilder: (context, index) =>
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                itemCount: 5,
                itemSize: 16.0,
                direction: Axis.horizontal,
              ),
            ],
          ),
        ),
        Expanded(
          child: Consumer<RatingFeedbackProvider>(
            builder: (context, feedback, _) =>
            feedback.isLoading
                ? CommonWidgets.showLoader(context)
                : feedback.list.isEmpty
                ? Container(
              margin: EdgeInsets.only(
                  top: CommonWidgets().getHeight(context) * 0.3),
              child: Text("No feedbacks"),
            )
                : ListView.builder(
              controller: controller,
              physics: BouncingScrollPhysics(),
              itemCount: feedback.list.length,
              itemBuilder: (context, index) =>
                  Dismissible(
                    resizeDuration: Duration(milliseconds: 500),
                    dismissThresholds: {DismissDirection.endToStart: 0.7},
                    key: Key(feedback.list[index].reviewId.toString()),
                    confirmDismiss: (dis) async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ReportFeedback(
                                    feedback: feedback.list[index]),
                          ));
                      return true;
                    },
                    background: Container(
                      alignment: Alignment.centerRight,
                      color: CustomColors.grey2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.only(
                                  right: 20.0, bottom: 10),
                              child:
                              Image.asset("assets/images/alert.png")),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: CustomText(
                              text: "Report",
                              textAlign: TextAlign.right,
                              fontSize: 16,
                              color: CustomColors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    direction: DismissDirection.endToStart,
                    onDismissed: (disVal) {
                      // feedback.list.remove(feedback.list[index]);
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => ReportFeedback(feedback: feedback.list[index]),));
                    },
                    dragStartBehavior: DragStartBehavior.down,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          margin:
                          const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10),
                                child: CommonWidgets.userImgeLoader(
                                    imageUrl: feedback
                                        .list[index]
                                        .reviewBy
                                        .userProfile
                                        .profileImage,
                                    size: 50),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          CustomText(
                                            text:
                                            "${feedback.list[index].reviewBy
                                                .firstName}  ${feedback
                                                .list[index].reviewBy
                                                .lastName}",
                                            color: CustomColors.black1,
                                            fontSize: 18.0,
                                            fontWeight: FontStyles
                                                .semiBoldFontWeight400,
                                          ),
                                          CustomText(
                                            text:
                                            "${feedback.list[index].dateAgo}",
                                            color: CustomColors.grey2,
                                            fontSize: 14.0,
                                            fontWeight: FontStyles
                                                .semiBoldFontWeight400,
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding:
                                        const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: RatingBarIndicator(
                                          rating: feedback
                                              .list[index].rating
                                              .toDouble(),
                                          itemBuilder: (context, index) =>
                                              Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                          itemCount: 5,
                                          itemSize: 16.0,
                                          direction: Axis.horizontal,
                                        ),
                                      ),
                                      CustomText(
                                        text:
                                        "${feedback.list[index].review}",
                                        color: CustomColors.grey2,
                                        textAlign: TextAlign.start,
                                        maxLines: 3,
                                        fontSize: 15.0,
                                        fontWeight: FontStyles
                                            .semiBoldFontWeight400,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin:
                          const EdgeInsets.symmetric(horizontal: 30),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  width: 1, color: CustomColors.grey1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
            ),
          ),
        )
      ],
    );
  }
}

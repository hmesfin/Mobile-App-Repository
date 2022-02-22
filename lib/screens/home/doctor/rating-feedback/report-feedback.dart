import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:virtudoc_app/custom-widgets/custom-top-bar.dart';
import 'package:virtudoc_app/custom-widgets/custom_button.dart';
import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/utils/common-widgets.dart';
import 'package:virtudoc_app/utils/custom-colors.dart';
import 'package:virtudoc_app/utils/strings.dart';
import 'package:virtudoc_app/utils/styles.dart';

import 'rating-feedback-model.dart';

class ReportFeedback extends StatefulWidget {
  final RatingFeedbackModel feedback;

  ReportFeedback({Key key, @required this.feedback}) : super(key: key);

  @override
  _ReportFeedbackState createState() => _ReportFeedbackState();
}

class _ReportFeedbackState extends State<ReportFeedback> {
  AppBar appBar = AppBar();
  String reportReason;
  String additionalNote;
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: CustomColors.bg_app,
        body: Consumer<RatingFeedbackProvider>(
            builder: (context, model, child) =>
                ModalProgressHUD(
                  child: _buildWidget(context),
                  inAsyncCall: model.isLoading,
                  progressIndicator: CircularProgressIndicator(
                    valueColor:
                    new AlwaysStoppedAnimation<Color>(CustomColors.yellow1),
                  ),
                )),
      ),
    );
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
            titleText: Strings.reportFeedback,
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30.0),
            alignment: Alignment.center,
            padding: EdgeInsets.only(
                left: screenWidth / 20, right: screenWidth / 20),
            child: AutoSizeText(
              "What was the reason to report?",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontStyles.boldFontWeight600,
                fontFamily: FontStyles.fontFamly,
                package: FontStyles.package,
                fontStyle: FontStyle.normal,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              presetFontSizes: [18, 17, 16],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Divider(
            height: screenHeight / 15,
            thickness: 1,
            indent: screenWidth / 10,
            endIndent: screenWidth / 10,
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: widget.feedback.rating.toString(),
                  fontSize: FontStyles.size24,
                ),
                SizedBox(
                  width: screenWidth / 30,
                ),
                RatingBar(
                  initialRating: widget.feedback.rating.toDouble(),
                  direction: Axis.horizontal,
                  ignoreGestures: true,
                  allowHalfRating: true,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  onRatingUpdate: (value) {},
                  ratingWidget: RatingWidget(
                    full: Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    half: Icon(
                      Icons.star_half,
                      color: Colors.amber,
                    ),
                    empty: Icon(
                      Icons.star,
                      color: Colors.white,
                    ),
                  ),
                  itemCount: 5,
                ),
              ],
            ),
          ),
          Divider(
            height: screenHeight / 15,
            thickness: 1,
            indent: screenWidth / 10,
            endIndent: screenWidth / 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 33.0),
            child: CommonWidgets().customFormFieldController(
              context,
              "Report Reason...",
              TextInputAction.done,
              maxLenghth: 150,
              maxLines: 2,
              onChanged: (text) {
                reportReason = text;
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 33.0),
            child: CommonWidgets().customFormFieldController(
              context,
              "Addtional Note...",
              TextInputAction.done,
              maxLenghth: 250,
              maxLines: 5,
              onChanged: (text) {
                additionalNote = text;
              },
            ),
          ),
          CustomButton(
            ontap: () async {
              if (reportReason == null)
                CommonWidgets.showToast(
                    context, "Enter the Report Reason", _scaffoldKey);
              else {
                final response = await Provider.of<RatingFeedbackProvider>(
                    context,
                    listen: false)
                    .reportFeedBack(ReportFeedbackModel(
                  reviewId: widget.feedback.reviewId,
                  additionalNote: additionalNote,
                  reportReason: reportReason,
                ));
                if (!response.success) {
                  CommonWidgets.showToast(
                      context, response.message, _scaffoldKey);
                } else
                  Navigator.pop(context);
              }
            },
            buttonText: Strings.submit,
          ),
        ],
      ),
    );
  }
}

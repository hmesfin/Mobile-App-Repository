import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:virtudoc_app/custom-widgets/custom-top-bar.dart';
import 'package:virtudoc_app/custom-widgets/custom_button.dart';
import 'package:virtudoc_app/screens/home/feedback/give_feedback_provider.dart';
import 'package:virtudoc_app/utils/common-widgets.dart';
import 'package:virtudoc_app/utils/custom-colors.dart';
import 'package:virtudoc_app/utils/strings.dart';
import 'package:virtudoc_app/utils/styles.dart';

import '../../../index.dart';

class GiveFeedback extends StatefulWidget {
  @override
  _GiveFeedbackState createState() => _GiveFeedbackState();
}

class _GiveFeedbackState extends State<GiveFeedback> {
  AppBar appBar = AppBar();
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: _scaffoldKey,
      backgroundColor: CustomColors.bg_app,
      body: Consumer<GiveFeedbackProvider>(
          builder: (context, model, child) => ModalProgressHUD(
                child: _buildWidget(context),
                inAsyncCall: model.isLoading,
                progressIndicator: CircularProgressIndicator(
                  valueColor:
                      new AlwaysStoppedAnimation<Color>(CustomColors.blue),
                ),
              )),
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
            titleText: Strings.give_feedbacks,
          ),
          SizedBox(
            height: 20.0,
          ),
          Consumer<GiveFeedbackProvider>(
              builder: (context, model, child) => Container(
                    margin: EdgeInsets.symmetric(horizontal: 30.0),
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(
                        left: screenWidth / 20, right: screenWidth / 20),
                    child: AutoSizeText(
                      Strings.feedback_text(model?.doctor_name ?? ""),
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
                  )),
          SizedBox(
            height: 20.0,
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
                Consumer<GiveFeedbackProvider>(
                    builder: (context, model, child) => CustomText(
                          text: model.rating?.toString(),
                          fontSize: FontStyles.size24,
                        )),
                SizedBox(
                  width: screenWidth / 30,
                ),
                Consumer<GiveFeedbackProvider>(
                    builder: (context, model, child) => RatingBar(
                          initialRating: 0,
                          direction: Axis.horizontal,
                          allowHalfRating: false,
                          itemCount: 5,
                          itemSize: 30.0,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          onRatingUpdate: (rating) {
                            model.setRating(rating.toInt());
                          },
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
                        ))
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
            margin: EdgeInsets.only(left: 20.0, bottom: 10.0),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(
                left: screenWidth / 20, right: screenWidth / 20),
            child: AutoSizeText(
              Strings.enterFeedback,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontStyles.semiBoldFontWeight400,
                fontFamily: FontStyles.fontFamly,
                package: FontStyles.package,
                fontStyle: FontStyle.normal,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              presetFontSizes: [18, 17, 16],
            ),
          ),
          Consumer<GiveFeedbackProvider>(
              builder: (context, model, child) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 33.0),
                    child: CommonWidgets().customFormFieldController(
                        context, Strings.typeHere, TextInputAction.done,
                        maxLenghth: 250, maxLines: 5, onChanged: (text) {
                      model.setReview(text);
                    }),
                  )),
          Consumer<GiveFeedbackProvider>(
              builder: (context, model, child) => CustomButton(
                    ontap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      model.submitFeedback(success: () {
                        Provider.of<PrescriptionProvider>(context,
                                listen: false)
                            .getPrescriptions(
                                pageSize: '10', request: 'past', page: 1);
                        CommonWidgets().navigateBack(context);
                      }, failure: (msg) {
                        CommonWidgets.showToast(context, msg, _scaffoldKey);
                      });
                    },
                    buttonText: Strings.submit,
                  )),
        ],
      ),
    );
  }
}

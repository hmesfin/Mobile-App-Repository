import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:virtudoc_app/custom-widgets/custom-text.dart';
import 'package:virtudoc_app/custom-widgets/custom-top-bar.dart';
import 'package:virtudoc_app/custom-widgets/custom_button.dart';
import 'package:virtudoc_app/utils/custom-colors.dart';
import 'package:virtudoc_app/utils/strings.dart';
import 'package:virtudoc_app/utils/styles.dart';
import 'package:share/share.dart';
/*
The file is covered under Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. Please review the license for full details.

This program is not free software: You cannot redistribute it for any use under the terms of the Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. However the source can be modified and updated for the working of the application Design & Development of Mobile Application for “Abyssinia Technology Group” for which it was licensed.
*/

class InviteAFriend extends StatefulWidget {
  @override
  _InviteAFriendState createState() => _InviteAFriendState();
}

class _InviteAFriendState extends State<InviteAFriend> {
  int paymentStatus = 1;

  void handlepaymentStatus(int value) {
    setState(() {
      paymentStatus = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.bg_app,
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomTopBar(
                  context: context, titleText: Strings.invite_a_friend),
              // CustomText(
              //   text: Strings.payment_methods_text,
              //   fontSize: 18,
              // ),
              Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Image.asset('assets/images/virtuDoc.png')),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: AutoSizeText(
                  'Enjoying the VirtuDoc app? Share it with your friends and family!',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                  style: TextStyle(
                      color: CustomColors.grey2,
                      fontWeight: FontStyles.regularFontWeight300,
                      fontFamily: FontStyles.fontFamly,
                      package: FontStyles.package,
                      fontStyle: FontStyle.normal,
                      fontSize: FontStyles.large),
                  textAlign: TextAlign.center,
                  presetFontSizes: [17, 16, 15],
                ),
              ),

              SizedBox(
                height: 90,
              ),
              // Rounded Rectangle 4

              // Padding(
              //   padding: EdgeInsets.fromLTRB(0, 0, screenWidth / 2, 0),
              //   child: AutoSizeText(
              //     'Application Link:',
              //     overflow: TextOverflow.ellipsis,
              //     maxLines: 4,
              //     style: TextStyle(
              //         // color: CustomColors.grey2,
              //         fontWeight: FontStyles.regularFontWeight300,
              //         fontFamily: FontStyles.fontFamly,
              //         package: FontStyles.package,
              //         fontStyle: FontStyle.normal,
              //         fontSize: FontStyles.large),
              //     textAlign: TextAlign.center,
              //     presetFontSizes: [17, 16, 15],
              //   ),
              // ),

              // Padding(
              //   padding: EdgeInsets.fromLTRB(30, 10, 30, 30),
              //   child: AutoSizeText(
              //     'https://virtudoc.com/application/sample',
              //     overflow: TextOverflow.ellipsis,
              //     maxLines: 4,
              //     style: TextStyle(
              //         color: CustomColors.blue2,
              //         decoration: TextDecoration.underline,
              //         fontWeight: FontStyles.regularFontWeight300,
              //         fontFamily: FontStyles.fontFamly,
              //         package: FontStyles.package,
              //         fontStyle: FontStyle.normal,
              //         fontSize: FontStyles.large),
              //     textAlign: TextAlign.center,
              //     presetFontSizes: [17, 16, 15],
              //   ),
              // ),

              CustomButton(
                ontap: () {
                  // showPaymentPopUp(context);
                  Share.share('Check out the app https://example.com',
                      subject: 'Download VirtuDoc App');
                },
                buttonText: Strings.share.toUpperCase(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showPaymentPopUp(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) =>
            Dialog(
              backgroundColor: CustomColors.bg_app,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
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
                        'assets/images/ic_dollar.png',
                      ),
                    ),
                  ),
                  CustomText(
                    text: Strings.paymentRequest,
                    fontSize: 20,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 30),
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            style: TextStyle(
                                color: CustomColors.grey2,
                                fontWeight: FontStyles.semiBoldFontWeight400,
                                fontFamily: "Roboto",
                                fontStyle: FontStyle.normal,
                                fontSize: 16.0),
                            text: Strings.dialogText1),
                        TextSpan(
                            style: TextStyle(
                                color: CustomColors.black1,
                                fontWeight: FontStyles.semiBoldFontWeight400,
                                fontFamily: "Roboto",
                                fontSize: 16.0),
                            text: "\$69.50 "),
                        TextSpan(
                            style: const TextStyle(
                                color: CustomColors.grey2,
                                fontWeight: FontStyles.semiBoldFontWeight400,
                                fontFamily: "Roboto",
                                fontStyle: FontStyle.normal,
                                fontSize: 16.0),
                            text: Strings.dialogText2)
                      ]),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                        )),
                    child: Row(
                      children: [
                        bottomButton(
                            context: context,
                            color: CustomColors.grey2,
                            ontap: () {
                              Navigator.pop(context);
                            },
                            text: Strings.reject),
                        bottomButton(
                            context: context,
                            color: CustomColors.yellow1,
                            ontap: () {
                              Navigator.pop(context);
                            },
                            text: Strings.accept),
                      ],
                    ),
                  )
                ],
              ),
            ));
  }

  Widget bottomButton({
    BuildContext context,
    Color color,
    Null Function() ontap,
    String text,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          height: 50,
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.only(
                bottomRight: text == Strings.accept
                    ? Radius.circular(8)
                    : Radius.circular(0),
                bottomLeft: text == Strings.reject
                    ? Radius.circular(8)
                    : Radius.circular(0),
              )),
          child: Center(
            child: CustomText(
              text: text,
              color: CustomColors.white,
              fontSize: 16,
              fontWeight: FontStyles.semiBoldFontWeight500,
            ),
          ),
        ),
      ),
    );
  }
}

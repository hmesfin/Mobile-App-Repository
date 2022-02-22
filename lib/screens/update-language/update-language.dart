import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:virtudoc_app/custom-widgets/custom-text.dart';
import 'package:virtudoc_app/custom-widgets/custom-top-bar.dart';
import 'package:virtudoc_app/screens/choose-role/choose-role-screen.dart';
import 'package:virtudoc_app/utils/common-widgets.dart';
import 'package:virtudoc_app/utils/custom-colors.dart';
import 'package:virtudoc_app/utils/strings.dart';
import 'package:virtudoc_app/utils/styles.dart';

class UpdateLanguage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UpdateLanguageState();
}

class _UpdateLanguageState extends State<UpdateLanguage> {
  var isEnglish = true;
  var isAmharic = false;

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

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
//        body: ModalProgressHUD(
//          child: _buildWidget(context),
//          inAsyncCall: _loading,
//          progressIndicator: CircularProgressIndicator(
//            valueColor: new AlwaysStoppedAnimation<Color>(CustomColors.yellow),
//          ),
//        ),
      ),
    );
  }

  _buildWidget(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight,
      width: screenWidth,
      decoration: BoxDecoration(
        color: CustomColors.bg_app,
      ),
      child: Column(
        children: <Widget>[
          // Header

          CustomTopBar(context: context, titleText: Strings.update_lang),

          CustomText(
            text: "Continue with:",
            fontWeight: FontStyles.semiBoldFontWeight400,
            fontSize: FontStyles.large,
          ),
          SizedBox(
            height: CommonWidgets().getHeight(context) * 0.05,
          ),

          // Rounded Rectangle 4

          InkWell(
            focusColor: isAmharic ? CustomColors.white : CustomColors.bg_app,
            onTap: () {
              setState(() {
                isEnglish = !isEnglish;
                if (isAmharic) {
                  isAmharic = !isAmharic;
                }
              });
            },
            child: Container(
              height: CommonWidgets().getHeight(context) * 0.1,
              decoration: BoxDecoration(
                color: isEnglish ? CustomColors.white : CustomColors.bg_app,
                border: Border.all(color: CustomColors.white, width: 2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Ellipse 2
                  Container(
                    width: 100,
                    height: 100,
                    child: Image.asset("assets/images/amharic.png"),
                  ),
                  // Patient
                  Padding(
                      padding: EdgeInsets.only(left: 29),
                      child: isEnglish
                          ? AutoSizeText(
                              Strings.amharic,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                fontWeight: FontStyles.semiBoldFontWeight400,
                                fontFamily: FontStyles.fontFamly,
                                package: FontStyles.package,
                                color: CustomColors.yellow1,
                                fontStyle: FontStyle.normal,
                              ),
                              presetFontSizes: [18, 16, 14],
                              textAlign: TextAlign.center,
                            )
                          : AutoSizeText(
                              Strings.amharic,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                fontWeight: FontStyles.semiBoldFontWeight400,
                                fontFamily: FontStyles.fontFamly,
                                package: FontStyles.package,
                                color: CustomColors.grey2,
                                fontStyle: FontStyle.normal,
                              ),
                              presetFontSizes: [18, 16, 14],
                              textAlign: TextAlign.center,
                            ))
                ],
              ),
            ),
          ),

          InkWell(
            focusColor: isEnglish ? CustomColors.white : CustomColors.bg_app,
            onTap: () {
              setState(() {
                isAmharic = !isAmharic;
                if (isEnglish) {
                  isEnglish = !isEnglish;
                }
              });
            },
            child: Container(
              height: CommonWidgets().getHeight(context) * 0.1,
              decoration: BoxDecoration(
                color: isAmharic ? CustomColors.white : CustomColors.bg_app,
                border: Border.all(color: CustomColors.white, width: 2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  // Ellipse 2
                  Container(
                    width: 100,
                    height: 100,
                    child: Image.asset("assets/images/english.png"),
                  ),
                  // Patient
                  Padding(
                      padding: EdgeInsets.only(left: 29),
                      child: isAmharic
                          ? AutoSizeText(
                              Strings.english,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                // color: CustomColors.grey2,
                                fontWeight: FontStyles.semiBoldFontWeight400,
                                fontFamily: FontStyles.fontFamly,
                                package: FontStyles.package,
                                color: CustomColors.yellow1,
                                fontStyle: FontStyle.normal,
                              ),
                              presetFontSizes: [18, 16, 14],
                              textAlign: TextAlign.center,
                            )
                          : AutoSizeText(
                              Strings.english,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                fontWeight: FontStyles.semiBoldFontWeight400,
                                fontFamily: FontStyles.fontFamly,
                                package: FontStyles.package,
                                color: CustomColors.grey2,
                                fontStyle: FontStyle.normal,
                              ),
                              presetFontSizes: [18, 16, 14],
                              textAlign: TextAlign.center,
                            ))
                ],
              ),
            ),
          ),

          // Rounded Rectangle 4
          Padding(
              padding: EdgeInsets.only(top: screenHeight / 10),
              child: SizedBox(
                width: 200,
                height: 48,
                child: RaisedButton(
                  child: // CONTINUE

                      AutoSizeText(
                    Strings.update.toUpperCase(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      // color: CustomColors.grey2,
                      fontWeight: FontStyles.semiBoldFontWeight400,
                      fontFamily: FontStyles.fontFamly,
                      package: FontStyles.package,
                      color: CustomColors.white,
                      fontStyle: FontStyle.normal,
                    ),
                    presetFontSizes: [18, 16, 14],
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChooseRoleScreen()),
                    );
                  },
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(24.0)),
                  color: CustomColors.yellow1,
                ),
              )),
          Spacer(),
        ],
      ),
    );
  }
}

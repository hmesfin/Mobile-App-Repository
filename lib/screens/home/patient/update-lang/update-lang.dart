import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:virtudoc_app/custom-widgets/custom-text.dart';
import 'package:virtudoc_app/custom-widgets/custom-top-bar.dart';
import 'package:virtudoc_app/screens/home/patient/update-lang/update-lang-model.dart';
import 'package:virtudoc_app/screens/home/patient/update-lang/update-lang-provider.dart';
import 'package:virtudoc_app/screens/home/user/user_provider.dart';
import 'package:virtudoc_app/utils/common-widgets.dart';
import 'package:virtudoc_app/utils/custom-colors.dart';
import 'package:virtudoc_app/utils/strings.dart';
import 'package:virtudoc_app/utils/styles.dart';
/*
The file is covered under Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. Please review the license for full details.

This program is not free software: You cannot redistribute it for any use under the terms of the Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. However the source can be modified and updated for the working of the application Design & Development of Mobile Application for “Abyssinia Technology Group” for which it was licensed.
*/

class UpdateLang extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UpdateLangState();
}

class _UpdateLangState extends State<UpdateLang> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();

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
      child: Stack(
        children: [
          Scaffold(
            key: _scaffoldKey,
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
          _isLoading
              ? Container(
            color: Colors.black45,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
              : Container()
        ],
      ),
    );
  }

  var _isLoading = false;

  _buildWidget(BuildContext context) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    return Consumer<UserProvider>(
      builder: (context, user, child) =>
          Container(
            height: screenHeight,
            width: screenWidth,
            decoration: BoxDecoration(
              color: CustomColors.bg_app,
            ),
            child: Column(
              children: <Widget>[
                // Header

                CustomTopBar(context: context, titleText: Strings.choose_lang),

                CustomText(
                  text: Strings.continueWith,
                  fontWeight: FontStyles.semiBoldFontWeight400,
                  fontSize: FontStyles.large,
                ),
                SizedBox(
                  height: CommonWidgets().getHeight(context) * 0.05,
                ),

                // Rounded Rectangle 4

                InkWell(
                  focusColor: user.language == Strings.amharic
                      ? CustomColors.white
                      : CustomColors.bg_app,
                  onTap: () {
                    setState(() {
                      user.language = Strings.amharic;
                    });
                  },
                  child: Container(
                    height: CommonWidgets().getHeight(context) * 0.1,
                    decoration: BoxDecoration(
                      color: user.language == Strings.amharic
                          ? CustomColors.white
                          : CustomColors.bg_app,
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
                            child: user.language == Strings.amharic
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
                  focusColor: user.language == Strings.english
                      ? CustomColors.white
                      : CustomColors.bg_app,
                  onTap: () {
                    setState(() {
                      user.language = Strings.english;
                    });
                  },
                  child: Container(
                    height: CommonWidgets().getHeight(context) * 0.1,
                    decoration: BoxDecoration(
                      color: user.language == Strings.english
                          ? CustomColors.white
                          : CustomColors.bg_app,
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
                            child: user.language == Strings.english
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
                          Strings.update,
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
                        onPressed: () async {
                          setState(() {
                            _isLoading = true;
                          });

                          final response = await Provider.of<
                              UpdateLangProvider>(
                              context,
                              listen: false)
                              .updateLanguage(UpdateLangModel(lang: user
                              .language));
                          setState(() {
                            _isLoading = false;
                          });

                          if (!response.success) {
                            CommonWidgets.showToast(
                                context, response.message, _scaffoldKey);
                          } else {
                            CommonWidgets().navigateBack(context);
                          }
                        },
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(24.0)),
                        color: CustomColors.yellow1,
                      ),
                    )),
                Spacer(),
              ],
            ),
          ),
    );
  }
}

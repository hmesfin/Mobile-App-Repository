import 'package:auto_size_text/auto_size_text.dart';
import 'package:virtudoc_app/custom-widgets/custom-top-bar.dart';
import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/utils/common-helper.dart';
import 'package:virtudoc_app/utils/custom-colors.dart';
import 'package:virtudoc_app/utils/screen_tracker/screen_tracker.dart';
import 'package:virtudoc_app/utils/strings.dart';
import 'package:virtudoc_app/utils/styles.dart';

import 'change-pasword-model.dart';
/*
The file is covered under Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. Please review the license for full details.

This program is not free software: You cannot redistribute it for any use under the terms of the Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. However the source can be modified and updated for the working of the application Design & Development of Mobile Application for “Abyssinia Technology Group” for which it was licensed.
*/

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  var _currentpassController = TextEditingController();
  var _newpassController = TextEditingController();
  var _isLoading = false;
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            key: _scaffoldKey,
            backgroundColor: CustomColors.bg_app,
            body: SingleChildScrollView(
              child: _buildWidget(context),
            ),
          ),
          _isLoading
              ? Container(
                  height: double.infinity,
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

  _buildWidget(BuildContext context) {
    double appbarheight = appBar.preferredSize.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Container(
        color: CustomColors.bg_app,
        height: screenHeight + appbarheight,
        width: screenWidth,
        child: Column(
          children: <Widget>[
            CustomTopBar(
              context: context,
              custonBackButton: true,
              titleText: Strings.changePassword,
            ),
            Container(
              padding: EdgeInsets.only(
                  left: screenWidth / 20,
                  right: screenWidth / 20,
                  bottom: 45,
                  top: 27),
              child: AutoSizeText(
                Strings.changepass,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  fontWeight: FontStyles.regularFontWeight300,
                  fontFamily: FontStyles.fontFamly,
                  package: FontStyles.package,
                  fontSize: 18,
                  // color: CustomColors.yellow1,
                  fontStyle: FontStyle.normal,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            PasswordTextField(
              controller: _currentpassController,
              string: Strings.currentPassword,
            ),
            PasswordTextField(
              controller: _newpassController,
              string: Strings.newPassword,
            ),
            Padding(
                padding: EdgeInsets.only(top: 31),
                child: SizedBox(
                  width: 200,
                  height: 48,
                  child: RaisedButton(
                    child: // CONTINUE
                        Text(Strings.update,
                            style: const TextStyle(
                              color: CustomColors.white,
                              fontWeight: FontStyles.semiBoldFontWeight500,
                              fontFamily: "Roboto",
                              package: 'assets/fonts/Roboto-Medium',
                              fontStyle: FontStyle.normal,
                              fontSize: FontStyles.medium,
                            ),
                            textAlign: TextAlign.center),
                    onPressed: () async {
                      FocusScope.of(context).unfocus();
                      if (_currentpassController.text.isEmpty) {
                        CommonWidgets.showToast(context,
                            Strings.enterCurrentPassword, _scaffoldKey);
                      } else if (validatePassword(
                          _currentpassController.text)) {
                        CommonWidgets.showToast(
                            context, Strings.passValidation, _scaffoldKey);
                      } else if (_newpassController.text.isEmpty) {
                        CommonWidgets.showToast(
                            context, Strings.enterNewPassword, _scaffoldKey);
                      } else if (validatePassword(_newpassController.text)) {
                        CommonWidgets.showToast(
                            context, Strings.passValidation, _scaffoldKey);
                      } else {
                        setState(() {
                          _isLoading = true;
                        });

                        final response = await Provider.of<
                                ChangePasswordProvider>(context, listen: false)
                            .setPassword(ChangePasswordModel(
                                currentPassword: _currentpassController.text,
                                newPassword: _newpassController.text));
                        setState(() {
                          _isLoading = false;
                        });

                        CommonWidgets.showToast(
                            context, response.message, _scaffoldKey);

                        if (response.success) {
                          CommonWidgets().navigateBack(context);
                        }
                      }
                    },
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(24.0)),
                    color: CustomColors.yellow1,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class PasswordTextField extends StatefulWidget {
  final String string;

  final TextEditingController controller;
  PasswordTextField({Key key, @required this.controller, @required this.string})
      : super(key: key);

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: 19),
        child: FractionallySizedBox(
          widthFactor: 0.683,
          child: Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                border: Border.all(color: CustomColors.grey3, width: 1),
                color: CustomColors.white),
            child: Container(
              child: Padding(
                padding: EdgeInsets.only(left: 5, right: 5, top: 2),
                child: Focus(
                  onFocusChange: (hasFocus) {
                    // setState(() {
                    //   // isPasswordFocused = hasFocus;
                    // });
                  },
                  child: TextFormField(
                    onTap: () {
                      screenTracker.stopTimer();
                      screenTracker.startTimer(context);
                    },
                    obscureText: !_showPassword,
                    controller: widget.controller,
                    decoration: InputDecoration(
                      hintText: "${widget.string}",
                      prefixIcon: ImageIcon(
                        AssetImage("assets/images/ic_password.png"),
                        color: CustomColors.grey2,
                      ),
                      suffixIcon: IconButton(
                        icon: ImageIcon(
                          AssetImage(_showPassword
                              ? "assets/images/ic_password_show.png"
                              : "assets/images/ic_password_hide.png"),
                          color: CustomColors.grey2,
                        ),
                        onPressed: () {
                          setState(
                              () => this._showPassword = !this._showPassword);
                        },
                      ),
                      border: InputBorder.none,
                    ),
                    maxLines: 1,
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}

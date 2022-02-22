import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:virtudoc_app/apimanager/api_request.dart';
import 'package:virtudoc_app/apimanager/api_url.dart';
import 'package:virtudoc_app/custom-widgets/custom-top-bar.dart';
import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/utils/common-helper.dart';
import 'package:virtudoc_app/utils/custom-colors.dart';
import 'package:virtudoc_app/utils/strings.dart';
import 'package:virtudoc_app/utils/styles.dart';

class ForgetSetPassword extends StatefulWidget {
  ForgetSetPassword();
  @override
  State<StatefulWidget> createState() => _ForgetSetPasswordState();
}

class _ForgetSetPasswordState extends State<ForgetSetPassword> {
  bool _showPassword = false;
  bool isPasswordFocused = false;
  bool isPhoneFocused = true;
  String dropdownValue = "+91";
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  var _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  AppBar appBar = AppBar(
    title: Text(Strings.appName),
  );
  var _saving = false;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: CustomColors.blue, //or set color with: Color(0xFF0000FF)
    ));
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: CustomColors.bg_app,
        body: _buildWidget(context),
      ),
    );
  }

  _buildWidget(BuildContext context) {
    double appbarheight = appBar.preferredSize.height;

    double screenHeight = MediaQuery.of(context).size.height - appbarheight;
    return Stack(
      children: [
        Column(
          children: <Widget>[
            // Header
            CustomTopBar(context: context, titleText: Strings.setPassword),

            Padding(
              padding: EdgeInsets.only(top: 2, bottom: 27, left: 20, right: 20),
              child: AutoSizeText(
                Strings.newPasswordText,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  // color: CustomColors.grey2,
                  fontWeight: FontStyles.semiBoldFontWeight500,
                  fontFamily: FontStyles.fontFamly,
                  package: FontStyles.package,
                  color: CustomColors.black1,
                  fontStyle: FontStyle.normal,
                ),
                presetFontSizes: [18, 14, 14],
                textAlign: TextAlign.center,
              ),
            ),

            // Rounded Rectangle 1
            Padding(
                padding: EdgeInsets.only(bottom: 19, top: 30),
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
                            setState(() {
                              isPasswordFocused = hasFocus;
                            });
                          },
                          child: TextFormField(
                            obscureText: !this._showPassword,
                            // focusNode: _passwordFocus,
                            controller: _passwordController,
                            decoration: InputDecoration(
                              hintText: Strings.password,
                              prefixIcon: ImageIcon(
                                AssetImage("assets/images/ic_password.png"),
                                color: CustomColors.grey2,
                              ),
                              suffixIcon: IconButton(
                                icon: ImageIcon(
                                  AssetImage(this._showPassword
                                      ? "assets/images/ic_password_show.png"
                                      : "assets/images/ic_password_hide.png"),
                                  color: CustomColors.grey2,
                                ),
                                onPressed: () {
                                  setState(() =>
                                      this._showPassword = !this._showPassword);
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
                )),

            // Rounded Rectangle 4
            Padding(
                padding: EdgeInsets.only(top: screenHeight / 100),
                child: SizedBox(
                  width: 200,
                  height: 48,
                  child: RaisedButton(
                    child: // CONTINUE
                        Text(Strings.submit,
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
                      if (_passwordController.text.isEmpty) {
                        CommonWidgets.showToast(
                            context, Strings.enterPassword, _scaffoldKey);
                      } else if (validatePassword(_passwordController.text)) {
                        CommonWidgets.showToast(
                            context, Strings.passValidation, _scaffoldKey);
                      } else {
                        setState(() {
                          _saving = true;
                        });
                        try {
                          Map<String, dynamic> data = {
                            "action": "set_password",
                            "password": _passwordController.text.toString(),
                          };
                          var res = await ApiRequest.postApi(
                              ApiUrl.updateDetails, data);
                          Map resBody = await json.decode(res.body);

                          if (resBody.containsKey('error')) {
                            if (resBody.containsKey('error')) {
                              setState(() {
                                _saving = false;
                              });

                              CommonWidgets.showToast(
                                  context,
                                  resBody['error']['message'].toString(),
                                  _scaffoldKey);
                            } else {
                              setState(() {
                                _saving = false;
                              });
                            }
                          } else {
                            setState(() {
                              _saving = false;
                            });

                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ),
                                (Route<dynamic> route) => false);
                          }
                        } catch (err) {
                          setState(() {
                            _saving = false;
                          });
                          CommonWidgets.showToast(
                              context, err.toString(), _scaffoldKey);
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
        if (_saving) CommonWidgets.showLoader(context)
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _passwordController.clear();
  }
}

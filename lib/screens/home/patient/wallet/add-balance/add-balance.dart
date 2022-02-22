import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:virtudoc_app/custom-widgets/custom-top-bar.dart';
import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/screens/home/patient/payment-method/payment-method.dart';
import 'package:virtudoc_app/screens/home/patient/wallet/wallet_provider.dart';
import 'package:virtudoc_app/utils/custom-colors.dart';
import 'package:virtudoc_app/utils/screen_tracker/screen_tracker.dart';
import 'package:virtudoc_app/utils/strings.dart';
import 'package:virtudoc_app/utils/styles.dart';

class AddBalance extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddBalanceState();
}

class _AddBalanceState extends State<AddBalance> {
  bool isPasswordFocused = false;

  // bool isPhoneFocused = true;
  String dropdownValue = "93";
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  var _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      // Provider.of<GetSupportedPaymentMethods>(context, listen: false).fetch();
      // Provider.of<GetSupportedPaymentMethods>(context, listen: false).fetch();
      // Provider.of<ListPaymentMethod>(context, listen: false).fetch();
      setState(() {});
    });
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
      child: Container(
        height: screenHeight,
        width: screenWidth,
        decoration: BoxDecoration(
          color: CustomColors.bg_app,
        ),
        child: Column(
          children: <Widget>[
            // Header

            CustomTopBar(context: context, titleText: Strings.add_balance),

            Padding(
              padding:
              EdgeInsets.only(top: 24, bottom: 27, left: 20, right: 20),
              child: Text(Strings.available_balance,
                  style: const TextStyle(
                      color: CustomColors.black1,
                      fontWeight: FontStyles.semiBoldFontWeight400,
                      fontFamily: FontStyles.fontFamly,
                      package: FontStyles.package,
                      fontStyle: FontStyle.normal,
                      fontSize: FontStyles.large),
                  textAlign: TextAlign.center),
            ),

            Container(
              child: Text(
                "\$${Provider
                    .of<WalletProvider>(context, listen: true)
                    .balance
                    .toStringAsFixed(2) ?? ''}",
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                    color: CustomColors.blue3,
                    fontWeight: FontStyles.semiBoldFontWeight500,
                    fontSize: FontStyles.size65,
                    fontFamily: FontStyles.fontFamly),
                textAlign: TextAlign.center,
              ),
            ),

            Divider(
              height: screenHeight / 15,
              thickness: 1.5,
              indent: screenWidth / 10,
              endIndent: screenWidth / 10,
            ),
            Padding(
              padding:
              EdgeInsets.only(top: 24, bottom: 25, left: 20, right: 20),
              child: Text(Strings.enter_amount_text,
                  style: const TextStyle(
                      color: CustomColors.black1,
                      fontWeight: FontStyles.semiBoldFontWeight400,
                      fontFamily: FontStyles.fontFamly,
                      package: FontStyles.package,
                      fontStyle: FontStyle.normal,
                      fontSize: FontStyles.large),
                  textAlign: TextAlign.center),
            ),

            // Rounded Rectangle 1
            Padding(
              padding: EdgeInsets.only(bottom: 5),
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
                    decoration: isPasswordFocused
                        ? BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        border:
                        Border.all(color: CustomColors.blue3, width: 1),
                        color: CustomColors.white)
                        : null,
                    child: Padding(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: Focus(
                        onFocusChange: (hasFocus) {
                          setState(() {
                            // isPasswordFocused = hasFocus;
                          });
                        },
                        child: TextFormField(
                          onTap: () {
                            screenTracker.stopTimer();
                            screenTracker.startTimer(context);
                          },
                          keyboardType: TextInputType.number,
                          controller: _passwordController,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(10),
                            NumberCheck()
                          ],
                          onChanged: (value) {
                            setState(() {});
                          },
                          decoration: InputDecoration(
                            hintText: Strings.amount,
                            prefixIcon: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: screenWidth / 50,
                                ),
                                Text(
                                  '\$',
                                  style: TextStyle(fontSize: FontStyles.large),
                                ),
                              ],
                            ),

                            border: InputBorder.none,
//                            focusedBorder: OutlineInputBorder(
//                              borderSide: BorderSide(color: CustomColors.blue3),
//                              borderRadius: BorderRadius.circular(25),
//                            ),
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 10,
            ),

            Padding(
              padding: EdgeInsets.only(top: 30),
              child: SizedBox(
                width: 200,
                height: 50,
                child: RaisedButton(
                  child: // CONTINUE
                  Text(Strings.add_money.toUpperCase(),
                      style: const TextStyle(
                        color: CustomColors.white,
                        fontWeight: FontStyles.semiBoldFontWeight500,
                        fontFamily: FontStyles.fontFamly,
                        package: FontStyles.package,
                        fontStyle: FontStyle.normal,
                        fontSize: FontStyles.medium,
                      ),
                      textAlign: TextAlign.center),
                  onPressed: (_passwordController.text.trim() == '')
                      ? null
                      : (double.tryParse(_passwordController.text.trim())
                  is double
                      ? () {
                    Provider
                        .of<WalletProvider>(context,
                        listen: false)
                        .amountToBeAdded =
                        int.tryParse(_passwordController.text.trim())
                            .toDouble();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PaymentMethod()),
                      // MaterialPageRoute(builder: (context) => InviteAFriend()),
                    );
                  }
                      : () {
                    CommonWidgets.showToast(
                        context, 'Enter number', _scaffoldKey);
                  }),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(24.0)),
                  color: CustomColors.yellow1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NumberCheck extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue,
      TextEditingValue newValue) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = new StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
        buffer.write(''); // Add double spaces.
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: new TextSelection.collapsed(offset: string.length));
  }
}

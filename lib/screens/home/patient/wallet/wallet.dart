import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:virtudoc_app/custom-widgets/custom-top-bar.dart';
import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/screens/home/doctor/doctor-transactions/doctor-transactions.dart';
import 'package:virtudoc_app/screens/home/patient/patient-transactions/patient-transactions.dart';
import 'package:virtudoc_app/screens/home/patient/payment-method/payment-method.dart';
import 'package:virtudoc_app/screens/home/patient/payment-method/payment-provider.dart';
import 'package:virtudoc_app/screens/home/patient/wallet/add-balance/add-balance.dart';
import 'package:virtudoc_app/screens/home/patient/wallet/wallet_provider.dart';
import 'package:virtudoc_app/utils/custom-colors.dart';
import 'package:virtudoc_app/screens/home/patient/find-doctor/book-appointment/is-booking-provider.dart';
import 'package:virtudoc_app/utils/screen_tracker/screen_tracker.dart';
import 'package:virtudoc_app/utils/strings.dart';
import 'package:virtudoc_app/utils/styles.dart';
import 'package:flutter/scheduler.dart';
import 'package:virtudoc_app/screens/home/user/user_provider.dart';

class Wallet extends StatefulWidget {
  final bool isPatient;

  Wallet([this.isPatient = false]);

  @override
  State<StatefulWidget> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  bool isPasswordFocused = false;
  bool isPhoneFocused = true;
  String dropdownValue = "93";
  String walletId;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      Provider.of<IsBookingProvider>(context, listen: false)
          .comingFromBookingPage(false);
      walletId = Provider
          .of<UserProvider>(context, listen: false)
          .walletId;
      Provider.of<ListPaymentMethod>(context, listen: false).fetch();
    });
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
          body: SingleChildScrollView(
            child: _buildWidget(context),
          )),
    );
  }

  _buildWidget(BuildContext context) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;

    return Container(
      height: screenHeight,
      width: screenWidth,
      color: CustomColors.bg_app,
      child: Column(
        children: <Widget>[
          CustomTopBar(
            context: context,
            titleText: Strings.wallet,
            custonBackButton: false,
          ),

          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 27, left: 20, right: 20),
            child: Text(
                widget.isPatient
                    ? Strings.wallet_balance
                    : Strings.amount_earned,
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
              // "\$${Provider.of<WalletProvider>(context, listen: true).balance ?? ''}",
              "\$${Provider
                  .of<WalletProvider>(context, listen: true)
                  .balance
                  ?.toStringAsFixed(2) ?? '0.00'}",
              // "$balance",
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

          // Rounded Rectangle 4
          widget.isPatient
              ? Padding(
              padding: EdgeInsets.only(top: 30),
              child: SizedBox(
                // width: 200,
                // height: 48,
                child: RaisedButton(
                  padding: EdgeInsets.fromLTRB(
                      screenWidth * .13,
                      screenHeight * .021,
                      screenWidth * .13,
                      screenHeight * .021),
                  child: // CONTINUE
                  Text(Strings.add_balance.toUpperCase(),
                      style: const TextStyle(
                        color: CustomColors.white,
                        fontWeight: FontStyles.semiBoldFontWeight500,
                        fontFamily: FontStyles.fontFamly,
                        package: FontStyles.package,
                        fontStyle: FontStyle.normal,
                        fontSize: FontStyles.medium,
                      ),
                      textAlign: TextAlign.center),
                  onPressed: () {
                    screenTracker.stopTimer();
                    screenTracker.startTimer(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddBalance()),
                    );
                  },
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(24.0)),
                  color: CustomColors.yellow1,
                ),
              ))
              : SizedBox(),
          widget.isPatient
              ? Padding(
              padding: EdgeInsets.only(top: 40),
              child: SizedBox(
                // width: 200,
                // height: 48,
                child: RaisedButton(
                  padding: EdgeInsets.fromLTRB(
                      screenWidth * .13,
                      screenHeight * .021,
                      screenWidth * .13,
                      screenHeight * .021),
                  child: // CONTINUE
                  Text(Strings.manage_cards.toUpperCase(),
                      style: const TextStyle(
                        color: CustomColors.white,
                        fontWeight: FontStyles.semiBoldFontWeight500,
                        fontFamily: FontStyles.fontFamly,
                        package: FontStyles.package,
                        fontStyle: FontStyle.normal,
                        fontSize: FontStyles.medium,
                      ),
                      textAlign: TextAlign.center),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PaymentMethod(true)),
                    );
                  },
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(24.0)),
                  color: CustomColors.yellow1,
                ),
              ))
              : SizedBox(),

          widget.isPatient
              ? SizedBox(
            height: 45,
          )
              : SizedBox(),

          Padding(
            padding: EdgeInsets.only(top: 24, bottom: 15, left: 20, right: 20),
            child: Text(Strings.see_your_recent_transactions,
                style: const TextStyle(
                    color: CustomColors.black1,
                    fontWeight: FontStyles.semiBoldFontWeight400,
                    fontFamily: FontStyles.fontFamly,
                    package: FontStyles.package,
                    fontStyle: FontStyle.normal,
                    fontSize: FontStyles.large),
                textAlign: TextAlign.center),
          ),

          Padding(
              padding: EdgeInsets.only(top: 30),
              child: SizedBox(
                // width: 300,
                // height: 50,
                child: RaisedButton(
                  padding: EdgeInsets.fromLTRB(
                      screenWidth * .13,
                      screenHeight * .021,
                      screenWidth * .13,
                      screenHeight * .021),
                  child: // CONTINUE
                  Text(Strings.transaction_history.toUpperCase(),
                      style: const TextStyle(
                        color: CustomColors.white,
                        fontWeight: FontStyles.semiBoldFontWeight500,
                        fontFamily: "Roboto",
                        package: 'assets/fonts/Roboto-Medium',
                        fontStyle: FontStyle.normal,
                        fontSize: FontStyles.medium,
                      ),
                      textAlign: TextAlign.center),
                  onPressed: () {
                    screenTracker.stopTimer();
                    screenTracker.startTimer(context);

                    if (widget.isPatient) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PatientTransactions()),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DoctorTransactions()),
                      );
                    }
                  },
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(24.0)),
                  color: CustomColors.yellow1,
                ),
              )),
        ],
      ),
    );
  }
}

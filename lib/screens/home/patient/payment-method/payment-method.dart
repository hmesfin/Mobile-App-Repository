import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:virtudoc_app/custom-widgets/custom-text.dart';
import 'package:virtudoc_app/custom-widgets/custom-top-bar.dart';
import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/screens/home/patient/payment-method/payment-provider.dart';
import 'package:virtudoc_app/screens/home/patient/payment-method/add-new-payment.dart';
import 'package:virtudoc_app/screens/home/patient/wallet/wallet_provider.dart';
import 'package:virtudoc_app/screens/home/patient/wallet/add-balance/make-payment.dart';
import 'package:virtudoc_app/utils/common-widgets.dart';
import 'package:virtudoc_app/utils/custom-colors.dart';
import 'package:virtudoc_app/utils/strings.dart';
import 'package:virtudoc_app/utils/styles.dart';
import 'package:virtudoc_app/screens/home/patient/find-doctor/book-appointment/is-booking-provider.dart';
import 'package:virtudoc_app/screens/home/patient/patientBottom_provider.dart';
import 'package:flutter/scheduler.dart';
/*
The file is covered under Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. Please review the license for full details.

This program is not free software: You cannot redistribute it for any use under the terms of the Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. However the source can be modified and updated for the working of the application Design & Development of Mobile Application for “Abyssinia Technology Group” for which it was licensed.
*/

class PaymentMethod extends StatefulWidget {
  final bool manageCard;
  PaymentMethod([this.manageCard = false]);
  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  int paymentStatus;
  List<Widget> listWidget = [];
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  void handlepaymentStatus(int value) {
    setState(() {
      paymentStatus = value;
    });
  }

  int selectedCard;
  var lists;
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) async {});
    setState(() {});
  }

  paymentMethod(screenWidth) {
    try {
      double screenWidth = MediaQuery.of(context).size.width;
      if (Provider.of<ListPaymentMethod>(context, listen: false)
                  .listPaymentMethodsModel
                  .body
                  .data
                  .status
                  .status ==
              'SUCCESS' &&
          Provider.of<ListPaymentMethod>(context, listen: false)
                  .listPaymentMethodsModel
                  ?.body
                  ?.data
                  ?.dataNested !=
              null) {
        var element = Provider.of<ListPaymentMethod>(context, listen: false)
            .listPaymentMethodsModel
            .body
            .data
            .dataNested;

        lists = List.generate(
            Provider.of<ListPaymentMethod>(context, listen: true)
                .listPaymentMethodsModel
                .body
                .data
                .dataNested
                .length, (index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio(
                value: index,
                groupValue: paymentStatus,
                onChanged: (int val) {
                  setState(() {
                    paymentStatus = val;
                  });
                  selectedCard = paymentStatus;
                },
              ),
              Container(
                width: screenWidth / 1.25,
                height: 100,
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          color: CustomColors.grey,
                          offset: Offset(1.8369701987210297e-16, 3),
                          blurRadius: 7,
                          spreadRadius: 0)
                    ],
                    color: Colors.white),
                child: Row(
                  children: [
                    // Rounded Rectangle 4 copy
                    Container(
                      width: 60,
                      height: 60,
                      padding: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: const Color(0x80dddddd),
                            offset: Offset(1.8369701987210297e-16, 3),
                            blurRadius: 7,
                            spreadRadius: 0)
                      ], color: Colors.white),
                      child: Image.asset(
                        element[index].type == Strings.usatmdebitcard
                            ? "assets/images/debit.png"
                            : element[index].type == Strings.usmastercard
                                ? "assets/images/master.png"
                                : element[index].type ==
                                        Strings.usdebitiscovercard
                                    ? "assets/images/discover.png"
                                    : "assets/images/visa.png",
                      ),
                    ),
                    Expanded(
                        child: Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 27,
                          ),
                          AutoSizeText(
                            ".......${element[index].last4}",
                            overflow: TextOverflow.ellipsis,
                            // maxLines: 2,
                            style: TextStyle(
                                // color: CustomColors.grey2,
                                fontWeight: FontStyles.semiBoldFontWeight400,
                                fontFamily: FontStyles.fontFamly,
                                package: FontStyles.package,
                                fontStyle: FontStyle.normal,
                                fontSize: FontStyles.large),
                            textAlign: TextAlign.center,
                            presetFontSizes: [20, 18, 18],
                          ),
                          AutoSizeText(
                            "${element[index].expirationMonth}/${element[index].expirationYear}",
                            overflow: TextOverflow.ellipsis,
                            // maxLines: 2,
                            style: TextStyle(
                                // color: CustomColors.grey2,
                                fontWeight: FontStyles.regularFontWeight300,
                                fontFamily: FontStyles.fontFamly,
                                package: FontStyles.package,
                                fontStyle: FontStyle.normal,
                                fontSize: FontStyles.large),
                            textAlign: TextAlign.center,
                            presetFontSizes: [16, 15, 13],
                          ),
                        ],
                      ),
                    )),
                  ],
                ),
              ),
            ],
          );
        });
      }
    } catch (err) {}

    return Provider.of<ListPaymentMethod>(context, listen: true)
                .listPaymentMethodsModel
                .body
                .data
                .dataNested
                .length ==
            0
        ? SizedBox()
        : Column(mainAxisAlignment: MainAxisAlignment.center, children: lists);
  }

  var _isSaving = false;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: CustomColors.bg_app,
        body: ModalProgressHUD(
          inAsyncCall: _isSaving,
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  CustomTopBar(
                      context: context, titleText: Strings.payment_methods),

                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: AutoSizeText(
                      Strings.payment_methods_text,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                          // color: CustomColors.grey2,
                          fontWeight: FontStyles.semiBoldFontWeight400,
                          fontFamily: FontStyles.fontFamly,
                          package: FontStyles.package,
                          fontStyle: FontStyle.normal,
                          fontSize: FontStyles.large),
                      textAlign: TextAlign.center,
                      presetFontSizes: [18, 16, 14],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  (widget?.manageCard ?? false)
                      ? SizedBox()
                      : Padding(
                          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                          child: AutoSizeText(
                            "\$${Provider.of<WalletProvider>(context, listen: true).amountToBeAdded ?? ''}",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: CustomColors.grey2,
                                fontWeight: FontStyles.semiBoldFontWeight400,
                                fontFamily: FontStyles.fontFamly,
                                package: FontStyles.package,
                                fontStyle: FontStyle.normal,
                                fontSize: FontStyles.large),
                            textAlign: TextAlign.center,
                            presetFontSizes: [22, 20, 18],
                          ),
                        ),

                  SizedBox(
                    height: 30,
                  ),
                  // Rounded Rectangle 4
                  paymentMethod(screenWidth),
                  // SizedBox(
                  //   height: 15,
                  // ),

                  // SizedBox(
                  //   height: 15,
                  // ),

                  GestureDetector(
                    onTap: () {
                      CommonWidgets().navigateTO(context,
                          pageName: AddNewPaymentMethod(widget.manageCard));
                    },
                    child: Padding(
                      // padding: EdgeInsets.fromLTRB(0, 10, screenWidth / 5, 30),
                      padding: EdgeInsets.fromLTRB(
                          0, screenWidth * 0.08, 0, screenWidth * 0.04),
                      child: AutoSizeText(
                        '+ Add New Payment Method:',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                        style: TextStyle(
                            color: CustomColors.blue2,
                            decoration: TextDecoration.underline,
                            fontWeight: FontStyles.boldFontWeight600,
                            fontFamily: FontStyles.fontFamly,
                            package: FontStyles.package,
                            fontStyle: FontStyle.normal,
                            fontSize: FontStyles.large),
                        textAlign: TextAlign.center,
                        presetFontSizes: [17, 16, 15],
                      ),
                    ),
                  ),

                  Provider.of<ListPaymentMethod>(context, listen: true)
                              .listPaymentMethodsModel
                              .body
                              .data
                              .dataNested
                              .length ==
                          0
                      ? SizedBox()
                      : RaisedButton(
                          child: // CONTINUE
                              Text(
                                  widget.manageCard
                                      ? Strings.delete
                                      : Strings.submit,
                                  style: const TextStyle(
                                    color: CustomColors.white,
                                    fontWeight:
                                        FontStyles.semiBoldFontWeight500,
                                    fontFamily: FontStyles.fontFamly,
                                    package: FontStyles.package,
                                    fontStyle: FontStyle.normal,
                                    fontSize: FontStyles.medium,
                                  ),
                                  textAlign: TextAlign.center),
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(24.0)),
                          color: CustomColors.yellow1,
                          onPressed: () async {
                            try {
                              if (widget.manageCard) {
                                if (selectedCard != null) {
                                  var isTapped = false;
                                  return showDialog(
                                    context: context,
                                    builder: (context) => Builder(
                                      builder: (context) =>
                                          StatefulBuilder(builder: (
                                        BuildContext context,
                                        StateSetter modelSetState,
                                      ) {
                                        return Dialog(
                                          backgroundColor: CustomColors.bg_app,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: isTapped
                                              ? Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Container(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              0, 50, 0, 50),
                                                      child: Center(
                                                        child:
                                                            CircularProgressIndicator(),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              : Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: 50,
                                                      height: 50,
                                                      margin: EdgeInsets.only(
                                                          top: 40, bottom: 20),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50),
                                                        color:
                                                            //  color ??
                                                            CustomColors.grey,
                                                      ),
                                                      child:
                                                          // icon ??
                                                          Container(
                                                        margin:
                                                            EdgeInsets.all(10),
                                                        child: Icon(Icons
                                                            .delete_outline),
                                                      ),
                                                    ),
                                                    CustomText(
                                                        text:
                                                            '${Strings.delete_payment_method}',
                                                        fontSize: 20),
                                                    SizedBox(
                                                      height: 7,
                                                    ),
                                                    Center(
                                                      child: CustomText(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      20),
                                                          maxLines: 3,
                                                          text:
                                                              "${Strings.delete_payment_method_txt}",
                                                          textAlign:
                                                              TextAlign.center,
                                                          color: CustomColors
                                                              .grey2,
                                                          fontWeight: FontStyles
                                                              .semiBoldFontWeight400,
                                                          fontSize: 16.0),
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Container(
                                                      height: 50,
                                                      decoration: BoxDecoration(
                                                          color: Colors.green,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomRight:
                                                                Radius.circular(
                                                                    8),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    8),
                                                          )),
                                                      child: Row(
                                                        children: [
                                                          CommonWidgets
                                                              .bottomButton(
                                                                  context:
                                                                      context,
                                                                  color:
                                                                      CustomColors
                                                                          .grey2,
                                                                  onTap: () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  text: Strings
                                                                          .cancel ??
                                                                      Strings
                                                                          .reject),
                                                          CommonWidgets
                                                              .bottomButton(
                                                                  context:
                                                                      context,
                                                                  color: CustomColors
                                                                      .yellow1,
                                                                  onTap:
                                                                      () async {
                                                                    var item = Provider.of<ListPaymentMethod>(
                                                                            context,
                                                                            listen:
                                                                                false)
                                                                        .listPaymentMethodsModel
                                                                        .body
                                                                        .data
                                                                        .dataNested[selectedCard];

                                                                    modelSetState(
                                                                        () {
                                                                      isTapped =
                                                                          true;
                                                                    });
                                                                    var response =
                                                                        await ApiRequest.postApi(
                                                                            ApiUrl.deletePayment,
                                                                            {
                                                                          'card_token':
                                                                              "${item.id}",
                                                                        });
                                                                    Map decode =
                                                                        jsonDecode(
                                                                            response.body);
                                                                    CommonWidgets.showToast(
                                                                        context,
                                                                        decode[
                                                                            'message'],
                                                                        _scaffoldKey);
                                                                    if (decode[
                                                                        'success']) {
                                                                      setState(
                                                                          () {
                                                                        _isSaving =
                                                                            false;
                                                                      });
                                                                      Provider.of<ListPaymentMethod>(
                                                                              context,
                                                                              listen: false)
                                                                          .fetch();
                                                                      Provider.of<WalletProvider>(
                                                                              context,
                                                                              listen: false)
                                                                          .amountToBeAdded = 0;
                                                                      CommonWidgets.showToast(
                                                                          context,
                                                                          Strings
                                                                              .card_deleted_success,
                                                                          _scaffoldKey);
                                                                      Provider.of<PatientBottomProvider>(
                                                                              context,
                                                                              listen:
                                                                                  false)
                                                                          .onItemTapped(
                                                                              2);
                                                                      setState(
                                                                          () {});
                                                                      modelSetState(
                                                                          () {
                                                                        isTapped =
                                                                            false;
                                                                      });
                                                                      Provider.of<PatientBottomProvider>(
                                                                              context,
                                                                              listen:
                                                                                  false)
                                                                          .onItemTapped(
                                                                              2);

                                                                      Navigator.of(
                                                                              context)
                                                                          .popUntil((route) =>
                                                                              route.isFirst);
                                                                    } else {
                                                                      modelSetState(
                                                                          () {
                                                                        isTapped =
                                                                            false;
                                                                      });
                                                                      Provider.of<PatientBottomProvider>(
                                                                              context,
                                                                              listen:
                                                                                  false)
                                                                          .onItemTapped(
                                                                              2);

                                                                      Navigator.of(
                                                                              context)
                                                                          .popUntil((route) =>
                                                                              route.isFirst);
                                                                    }
                                                                  },
                                                                  text: Strings
                                                                          .delete ??
                                                                      Strings
                                                                          .accept),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                        );
                                      }),
                                    ),
                                  );
                                }
                              } else
                                FocusScope.of(context).unfocus();
                              if (selectedCard == null) {
                                CommonWidgets.showToast(
                                    context, 'Select Card', _scaffoldKey);
                                return;
                              }
                              if (selectedCard != null) {
                                var item = Provider.of<ListPaymentMethod>(
                                        context,
                                        listen: false)
                                    .listPaymentMethodsModel
                                    .body
                                    .data
                                    .dataNested[selectedCard];
                                setState(() {
                                  _isSaving = true;
                                });
                                var response = await ApiRequest.postApi(
                                    ApiUrl.addMoneyToWallet, {
                                  'amount':
                                      "${Provider.of<WalletProvider>(context, listen: false).amountToBeAdded ?? ''}",
                                  'card_token': "${item.id}",
                                  'card_type': 'existing',
                                });
                                Map decode = jsonDecode(response.body);

                                CommonWidgets.showToast(
                                    context, decode['message'], _scaffoldKey);
                                if (decode['success']) {
                                  setState(() {
                                    _isSaving = false;
                                  });
                                  Provider.of<WalletProvider>(context,
                                          listen: false)
                                      .getWalletAmount();
                                  Provider.of<WalletProvider>(context,
                                          listen: false)
                                      .amountToBeAdded = 0;

                                  CommonWidgets.showToast(
                                      context, Strings.success, _scaffoldKey);

                                  if (Provider.of<IsBookingProvider>(context,
                                              listen: false)
                                          .isBooking ==
                                      false) {
                                    Provider.of<PatientBottomProvider>(context,
                                            listen: false)
                                        .onItemTapped(2);
                                    setState(() {});
                                    Navigator.of(context)
                                        .popUntil((route) => route.isFirst);
                                  } else if (Provider.of<IsBookingProvider>(
                                          context,
                                          listen: false)
                                      .isBooking) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MakePayment(),
                                      ),
                                    );
                                  }
                                }
                              }
                              setState(() {
                                _isSaving = false;
                              });
                            } catch (err) {
                              setState(() {
                                _isSaving = false;
                              });
                            }
                          }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showPaymentPopUp(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Dialog(
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

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:virtudoc_app/custom-widgets/custom-text.dart';
import 'package:virtudoc_app/custom-widgets/custom-top-bar.dart';
import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/screens/home/patient/payment-method/payment-provider.dart';
import 'package:virtudoc_app/screens/home/patient/wallet/wallet_provider.dart';
import 'package:virtudoc_app/screens/home/patient/wallet/add-balance/make-payment.dart';
import 'package:virtudoc_app/utils/common-widgets.dart';
import 'package:virtudoc_app/utils/custom-colors.dart';
import 'package:virtudoc_app/utils/screen_tracker/screen_tracker.dart';
import 'package:virtudoc_app/utils/strings.dart';
import 'package:virtudoc_app/screens/home/patient/find-doctor/book-appointment/is-booking-provider.dart';
import 'package:virtudoc_app/utils/styles.dart';
import 'package:virtudoc_app/screens/home/patient/patientBottom_provider.dart';
import 'package:flutter/scheduler.dart';

class AddNewPaymentMethod extends StatefulWidget {
  final bool onlyAddCard;
  AddNewPaymentMethod([this.onlyAddCard = true]);
  @override
  _AddNewPaymentMethodState createState() => _AddNewPaymentMethodState();
}

class _AddNewPaymentMethodState extends State<AddNewPaymentMethod> {
  int paymentStatus = 1;
  List<Row> listWidget = [];
  var _cardNameController = TextEditingController();
  var _cardNumberController = TextEditingController();
  var _cardCvvController = TextEditingController();
  var _cardExpirationYearController = TextEditingController();
  var _cardExpirationMonthController = TextEditingController();
  var currentYear = DateTime.now().year;

  FocusNode isFocus1 = FocusNode();
  FocusNode isFocus2 = FocusNode();
  FocusNode isFocus3 = FocusNode();
  FocusNode isFocus4 = FocusNode();
  FocusNode isFocus5 = FocusNode();
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  bool saveLater = false;

  void handlepaymentStatus(int value) {
    setState(() {
      paymentStatus = value;
    });
  }

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) async {});
    setState(() {});
  }

  paymentMethod(screenWidth) {
    return listWidget.length == 0 ? SizedBox() : listWidget;
  }

  var selectedCard;
  var selectedType;
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
            child: Column(
              children: [
                CustomTopBar(context: context, titleText: Strings.add_card),

                //  Consumer<GetSupportedPaymentMethods>(
                //     builder: (context, model, child) =>

                // ),

                Consumer<GetSupportedPaymentMethods>(
                    builder: (context, model, child) => GridView.count(
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          childAspectRatio: 2.0,
                          padding: const EdgeInsets.all(2.0),
                          mainAxisSpacing: 3.0,
                          crossAxisSpacing: 3.0,
                          children: List<Widget>.generate(
                              model.getSupportedPaymentMethodsModel?.body?.data
                                      ?.dataNested?.length ??
                                  0, (index) {
                            var item = model.getSupportedPaymentMethodsModel
                                .body.data.dataNested
                                .elementAt(index);

                            var type = model.getSupportedPaymentMethodsModel
                                .body.data.dataNested
                                .elementAt(index)
                                .type;

                            return GridTile(
                                child: GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                selectedCard = item;
                                selectedType = type;
                                setState(() {});
                              },
                              child: Center(
                                child: Stack(
                                  children: [
                                    Container(
                                      color: (selectedCard == item)
                                          ? CustomColors.blue
                                          : Colors.transparent,
                                      child: Card(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10.0),
                                              child: Image(
                                                  height: 50.0,
                                                  width: 50.0,
                                                  image: AssetImage(item.name ==
                                                          "Visa"
                                                      ? "assets/images/visa1.png"
                                                      : item.name ==
                                                              "Mastercard"
                                                          ? "assets/images/master.png"
                                                          : item.name ==
                                                                  "Discover"
                                                              ? "assets/images/discover.png"
                                                              : "assets/images/debit.png"),
                                                  fit: BoxFit.contain),
                                            ),
                                          ],
                                        ),
                                        elevation: 3,
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          side: BorderSide(
                                            color: Colors.white,
                                            width: 2.0,
                                          ),
                                        ),
                                      ),
                                      height: 80.0,
                                      width: MediaQuery.of(context).size.width *
                                          0.45,
                                    )
                                  ],
                                ),
                              ),
                            ));
                          }),
                        )),

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
                widget.onlyAddCard
                    ? SizedBox()
                    : SizedBox(
                        height: 10,
                      ),
                widget.onlyAddCard
                    ? SizedBox()
                    : Padding(
                        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        child: AutoSizeText(
                          "\$${Provider.of<WalletProvider>(context, listen: false).amountToBeAdded ?? ''}",
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

                paymentMethod(screenWidth),

                Padding(
                    padding: EdgeInsets.only(top: 19),
                    child: FractionallySizedBox(
                      widthFactor: 0.833,
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            border:
                                Border.all(color: CustomColors.grey3, width: 1),
                            color: CustomColors.white),
                        child: Container(
                          child: Padding(
                            padding: EdgeInsets.only(left: 5, right: 5, top: 2),
                            child: TextFormField(
                              onTap: () {
                                screenTracker.stopTimer();
                                screenTracker.startTimer(context);
                              },
                              focusNode: isFocus1,
                              controller: _cardNameController,
                              maxLength: 50,
                              decoration: InputDecoration(
                                counterText: '',
                                hintText: Strings.card_holder_name,
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                                prefixIcon: SizedBox(
                                  width: screenWidth / 200,
                                ),
                                border: InputBorder.none,
                              ),
                              maxLines: 1,
                            ),
                          ),
                        ),
                      ),
                    )),

                Padding(
                    padding: EdgeInsets.only(top: 19),
                    child: FractionallySizedBox(
                      widthFactor: 0.833,
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            border:
                                Border.all(color: CustomColors.grey3, width: 1),
                            color: CustomColors.white),
                        child: Container(
                          child: Padding(
                            padding: EdgeInsets.only(left: 5, right: 5, top: 2),
                            child: TextFormField(
                              onTap: () {
                                screenTracker.stopTimer();
                                screenTracker.startTimer(context);
                              },
                              focusNode: isFocus2,
                              controller: _cardNumberController,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                new LengthLimitingTextInputFormatter(16),
                                CardNumberInputFormatter()
                              ],
                              decoration: InputDecoration(
                                counterText: '',
                                hintText: Strings.card_number,
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                                prefixIcon: SizedBox(
                                  width: screenWidth / 200,
                                ),
                                border: InputBorder.none,
                              ),
                              maxLines: 1,
                            ),

                            //  TextFormField(
                            //   focusNode: isFocus1,
                            //   controller: _cardNameController,
                            //   keyboardType: TextInputType.name,
                            //   maxLength: 30,
                            //   decoration: InputDecoration(
                            //     counterText: '',
                            //     hintStyle: TextStyle(
                            //       color: Colors.grey,
                            //     ),
                            //     hintText: Strings.fname,
                            //     prefixIcon: SizedBox(
                            //       width: screenWidth / 200,
                            //     ),
                            //     // ImageIcon(
                            //     //   AssetImage("assets/images/profile.png"),
                            //     //   color: CustomColors.grey2,
                            //     // ),
                            //     // border: InputBorder.none,
                            //   ),
                            //   maxLines: 1,
                            // ),
                          ),
                        ),
                      ),
                    )),

                Padding(
                    padding: EdgeInsets.only(top: 19, bottom: 19),
                    child: FractionallySizedBox(
                      widthFactor: 0.833,
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            border:
                                Border.all(color: CustomColors.grey3, width: 1),
                            color: CustomColors.white),
                        child: Container(
                          child: Padding(
                            padding: EdgeInsets.only(left: 5, right: 5, top: 2),
                            child: TextFormField(
                              onTap: () {
                                screenTracker.stopTimer();
                                screenTracker.startTimer(context);
                              },
                              focusNode: isFocus3,
                              controller: _cardCvvController,
                              keyboardType: TextInputType.number,
                              // maxLength: 3,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(3),
                                NumberCheck()
                              ],
                              decoration: InputDecoration(
                                counterText: '',
                                hintText: Strings.cvv,
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                                prefixIcon: SizedBox(
                                  width: screenWidth / 200,
                                ),
                                border: InputBorder.none,
                              ),
                              maxLines: 1,
                            ),
                          ),
                        ),
                      ),
                    )),

                Padding(
                    padding: EdgeInsets.only(),
                    child: FractionallySizedBox(
                      widthFactor: 0.833,
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            border:
                                Border.all(color: CustomColors.grey3, width: 1),
                            color: CustomColors.white),
                        child: Container(
                            width: double.infinity,
                            child: PopupMenuButton(
                              offset: Offset(0.1, 0),
                              onSelected: (month) {
                                // clearFocus();
                                FocusManager.instance.primaryFocus.unfocus();
                                _cardExpirationMonthController.text = month;
                              },
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: 5, right: 5, top: 2),
                                child: TextFormField(
                                  onTap: () {
                                    screenTracker.stopTimer();
                                    screenTracker.startTimer(context);
                                  },
                                  controller: _cardExpirationMonthController,
                                  enabled: false,
                                  decoration: InputDecoration(
                                    hintText: Strings.expiration_month,
                                    prefixIcon: SizedBox(
                                      width: screenWidth / 200,
                                    ),
                                    suffixIcon: IconButton(
                                      icon: ImageIcon(
                                        AssetImage(
                                            "assets/images/ic_drop_down1.png"),
                                        color: CustomColors.grey2,
                                      ),
                                      onPressed: () {},
                                    ),
                                    border: InputBorder.none,
                                  ),
                                  maxLines: 1,
                                ),
                              ),
                              itemBuilder: (context) => Strings.months
                                  .map((months) => PopupMenuItem(
                                      value: months, child: Text(months)))
                                  .toList(),
                            )),
                      ),
                    )),

                // dropdown expiration

                Padding(
                    padding: EdgeInsets.only(top: 19),
                    child: FractionallySizedBox(
                      widthFactor: 0.833,
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            border:
                                Border.all(color: CustomColors.grey3, width: 1),
                            color: CustomColors.white),
                        child: Container(
                            width: double.infinity,
                            child: PopupMenuButton(
                              offset: Offset(0.1, 0),
                              onSelected: (year) {
                                FocusManager.instance.primaryFocus.unfocus();
                                _cardExpirationYearController.text = year;
                              },
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: 5, right: 5, top: 2),
                                child: TextFormField(
                                  onTap: () {
                                    screenTracker.stopTimer();
                                    screenTracker.startTimer(context);
                                  },
                                  controller: _cardExpirationYearController,
                                  enabled: false,
                                  decoration: InputDecoration(
                                    hintText: Strings.expiration_year,
                                    prefixIcon: SizedBox(
                                      width: screenWidth / 200,
                                    ),
                                    suffixIcon: IconButton(
                                      icon: ImageIcon(
                                        AssetImage(
                                            "assets/images/ic_drop_down1.png"),
                                        color: CustomColors.grey2,
                                      ),
                                      onPressed: () {},
                                    ),
                                    border: InputBorder.none,
                                  ),
                                  maxLines: 1,
                                ),
                              ),
                              itemBuilder: (context) => [
                                "$currentYear",
                                "${currentYear + 1}",
                                "${currentYear + 2}",
                                "${currentYear + 3}",
                                "${currentYear + 4}",
                                "${currentYear + 5}",
                                "${currentYear + 6}",
                                "${currentYear + 7}",
                                "${currentYear + 8}",
                                "${currentYear + 9}"
                              ]
                                  .map((months) => PopupMenuItem(
                                      value: months, child: Text(months)))
                                  .toList(),
                            )),
                      ),
                    )),

                widget.onlyAddCard
                    ? SizedBox(
                        height: 19,
                      )
                    : Padding(
                        padding: EdgeInsets.only(top: 19, bottom: 19),
                        child: FractionallySizedBox(
                          widthFactor: 0.833,
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                            ),
                            child: Row(
                              children: [
                                Checkbox(
                                    activeColor: CustomColors.blue,
                                    value: saveLater,
                                    onChanged: (newValue) {
                                      setState(() {
                                        saveLater = newValue;
                                      });
                                    }),
                                CustomText(
                                    text: Strings.save_for_later,
                                    fontSize: FontStyles.header_back,
                                    color: CustomColors.grey2,
                                    fontWeight:
                                        FontStyles.semiBoldFontWeight500)
                              ],
                            ),
                          ),
                        ),
                      ),

                RaisedButton(
                    child: // CONTINUE
                        Text(Strings.submit,
                            style: const TextStyle(
                              color: CustomColors.white,
                              fontWeight: FontStyles.semiBoldFontWeight500,
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
                      FocusScope.of(context).unfocus();
                      try {
                        if (selectedType == null) {
                          CommonWidgets.showToast(
                              context, 'Select Card Type', _scaffoldKey);
                          return;
                        } else if (_cardNameController.text.toString().trim() ==
                            '') {
                          CommonWidgets.showToast(
                              context, 'Enter Card Holder Name', _scaffoldKey);
                          return;
                        } else if (_cardNumberController.text
                                .replaceAll(RegExp(r"\s+"), "")
                                .trim() ==
                            '') {
                          CommonWidgets.showToast(
                              context, 'Enter Card Number', _scaffoldKey);
                          return;
                        } else if (_cardNumberController.text
                                .replaceAll(RegExp(r"\s+"), "")
                                .length !=
                            16) {
                          CommonWidgets.showToast(context,
                              'Please enter valid card number', _scaffoldKey);
                          return;
                        } else if (_cardCvvController.text.toString().trim() ==
                            '') {
                          CommonWidgets.showToast(
                              context, 'Enter CVV Number', _scaffoldKey);
                          return;
                        } else if (_cardCvvController.text.toString().length <
                            3) {
                          CommonWidgets.showToast(
                              context, 'Please enter valid CVV', _scaffoldKey);
                          return;
                        } else if (_cardExpirationMonthController.text
                                .toString()
                                .trim() ==
                            '') {
                          CommonWidgets.showToast(
                              context, 'Enter Expiration Month', _scaffoldKey);
                          return;
                        } else if (_cardExpirationYearController.text
                                .toString()
                                .trim() ==
                            '') {
                          CommonWidgets.showToast(
                              context, 'Enter Expiration Year', _scaffoldKey);
                          return;
                        } else if (int.tryParse(
                                _cardExpirationYearController.text) <
                            DateTime.now().year) {
                          CommonWidgets.showToast(
                              context, 'Card is expired', _scaffoldKey);
                          return;
                        } else if (int.tryParse(
                                _cardExpirationYearController.text) <=
                            DateTime.now().year) {
                          if (int.tryParse(
                                  _cardExpirationMonthController.text) <
                              DateTime.now().month) {
                            CommonWidgets.showToast(
                                context, 'Card is expired', _scaffoldKey);
                            return;
                          }

                          // return;
                        } else if (int.tryParse(
                                _cardExpirationYearController.text) >
                            2099) {
                          CommonWidgets.showToast(
                              context,
                              'Please enter valid expiration year',
                              _scaffoldKey);
                          return;
                        }
                        var response;
                        if (widget.onlyAddCard) {
                          setState(() {
                            _isSaving = true;
                          });
                          response = await ApiRequest.postApi(
                              ApiUrl.addPaymentMethod, {
                            'method_type': "$selectedType",
                            'fields': {
                              'name': "${_cardNameController.text}",
                              'number':
                                  "${_cardNumberController.text.replaceAll(RegExp(r"\s+"), "").trim()}",
                              'expiration_month':
                                  "${_cardExpirationMonthController.text}",
                              'expiration_year':
                                  "${_cardExpirationYearController.text}",
                              'cvv': "${_cardCvvController.text}"
                            },
                          });
                        } else {
                          setState(() {
                            _isSaving = true;
                          });
                          response = await ApiRequest.postApi(
                              ApiUrl.addMoneyToWallet, {
                            'amount':
                                "${Provider.of<WalletProvider>(context, listen: false).amountToBeAdded ?? ''}",
                            'card_type': 'new',
                            'method_type': "$selectedType",
                            'fields': {
                              'name': "${_cardNameController.text}",
                              'number':
                                  "${_cardNumberController.text.replaceAll(RegExp(r"\s+"), "").trim()}",
                              'expiration_month':
                                  "${_cardExpirationMonthController.text}",
                              'expiration_year':
                                  "${_cardExpirationYearController.text}",
                              'cvv': "${_cardCvvController.text}"
                            },
                            'save_for_later': saveLater
                          });
                        }

                        Map decode = jsonDecode(response.body);

                        CommonWidgets.showToast(
                            context, decode['message'], _scaffoldKey);
                        if (decode['success']) {
                          Provider.of<ListPaymentMethod>(context, listen: false)
                              .fetch();
                          Provider.of<WalletProvider>(context, listen: false)
                              .getWalletAmount();
                          Provider.of<WalletProvider>(context, listen: false)
                              .amountToBeAdded = 0;
                          CommonWidgets.showToast(
                              context,
                              widget.onlyAddCard
                                  ? Strings.card_added_success
                                  : Strings.success,
                              _scaffoldKey);

                          if (Provider.of<IsBookingProvider>(context,
                                  listen: false)
                              .isBooking) {
                            setState(() {
                              _isSaving = false;
                            });

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MakePayment(),
                              ),
                            );

                            return;
                          }

                          Provider.of<PatientBottomProvider>(context,
                                  listen: false)
                              .onItemTapped(2);
                          setState(() {
                            _isSaving = false;
                          });
                          Navigator.of(context)
                              .popUntil((route) => route.isFirst);
                        } else
                          setState(() {
                            _isSaving = false;
                          });
                      } catch (err) {
                        setState(() {
                          _isSaving = false;
                        });
                      }
                      // showPaymentPopUp(context);
                    }),
              ],
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

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = new StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
        buffer.write('  '); // Add double spaces.
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: new TextSelection.collapsed(offset: string.length));
  }
}

class NumberCheck extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
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

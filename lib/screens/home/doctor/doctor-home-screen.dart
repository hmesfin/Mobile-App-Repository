import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:virtudoc_app/custom-widgets/moving_text_widget.dart';
import 'package:virtudoc_app/screens/home/doctor/calender-doctor/calender_doctor.dart';
import 'package:virtudoc_app/screens/home/doctor/enrollment-details-update/enrollment-detail-update.dart';
import 'package:virtudoc_app/screens/home/doctor/rating-feedback/rating-feedback.dart';
import 'package:virtudoc_app/screens/home/patient/payment-method/payment-provider.dart';
import 'package:virtudoc_app/screens/home/patient/wallet/wallet_provider.dart';
import 'package:virtudoc_app/screens/orders/orders_listing.dart';
import 'package:virtudoc_app/screens/orders/orders_listing_provider.dart';
import 'package:virtudoc_app/utils/common-widgets.dart';
import 'package:virtudoc_app/utils/custom-colors.dart';
import 'package:virtudoc_app/utils/strings.dart';
import 'package:virtudoc_app/utils/styles.dart';

import '../../../index.dart';
import 'enrollment-details-update/enrollment-provider-update.dart';

class DoctorHomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DoctorHomeScreenState();
}

class _DoctorHomeScreenState extends State<DoctorHomeScreen>
    with AfterLayoutMixin {
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  var isPatientEnable = false;
  var isDoctorEnable = false;
  String accountStatusText = 'Pending';
  Color statusColor = Colors.yellow;

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      Provider.of<OrdersListingProvider>(context, listen: false)
          .getOpenOrderCount();
      var walletId = Provider
          .of<UserProvider>(context, listen: false)
          .walletId;
      Provider.of<ListPaymentMethod>(context, listen: false).fetch();
      Provider.of<GetSupportedPaymentMethods>(context, listen: false).fetch();

      if (walletId == '') {
        var res = await ApiRequest.getApi(ApiUrl.setupPaymentWallet);
        var resBody = jsonDecode(res.body);
        Provider
            .of<UserProvider>(context, listen: false)
            .walletId =
        resBody['body']['data']['wallet_id'];
        walletId = Provider
            .of<UserProvider>(context, listen: false)
            .walletId;
        Provider.of<WalletProvider>(context, listen: false).getWalletAmount();
      } else {
        Provider.of<WalletProvider>(context, listen: false).getWalletAmount();
        Provider.of<GetSupportedPaymentMethods>(context, listen: false).fetch();
        Provider.of<ListPaymentMethod>(context, listen: false).fetch();
      }
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
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: CustomColors.blue,
          flexibleSpace: Container(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: doctorName(context),
            ),
          ),
          title: Padding(
            padding: EdgeInsets.only(
                bottom: CommonWidgets().getHeight(context) * 0.035),
            child: Text(Strings.dashboard),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.only(
                  bottom: CommonWidgets().getHeight(context) * 0.035,
                  right: 10),
              child: notificationWidget(),
            ),
          ],
          toolbarHeight: CommonWidgets().getHeight(context) * 0.15,
        ),
        backgroundColor: CustomColors.bg_app,
        body: _buildWidget(context),
      ),
    );
  }

  _buildWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: [
              SizedBox(height: CommonWidgets().getHeight(context) * 0.05),
              // set availability
              CommonWidgets.singleField(
                context: context,
                imageAssetAddress: "assets/images/ic_availability.png",
                title: Strings.set_availability.toUpperCase(),
                ontap: () {
                  Provider.of<CalenderProvider>(context, listen: false)
                      .getCalenderView();
                  Provider.of<SetAvailabilityProvider>(context, listen: false)
                      .init();
                  CommonWidgets()
                      .navigateTO(context, pageName: CalenderDoctor());
                },
              ),

              // update documents
              CommonWidgets.singleField(
                context: context,
                imageAssetAddress: "assets/images/ic_documents.png",
                title: Strings.update_documents.toUpperCase(),
                ontap: () async {
                  Provider
                      .of<EnrollmentProviderUpdate>(context, listen: false)
                      .index = 3;

                  CommonWidgets().navigateTO(
                    context,
                    pageName: EnrollmentDetailUpdate(),
                  );
                  await Provider.of<UserProvider>(context, listen: false)
                      .getUser();
                },
              ),

              // review feedbacks
              CommonWidgets.singleField(
                context: context,
                imageAssetAddress: "assets/images/ic_feedback.png",
                title: Strings.review_feedback.toUpperCase(),
                ontap: () {
                  CommonWidgets()
                      .navigateTO(context, pageName: RatingFeedback());
                },
              ),

              //pending orders
              CommonWidgets.singleField(
                context: context,
                imageAssetAddress: "assets/images/pharmacy_order.png",
                title: Strings.pastOrders.toUpperCase(),
                subTitle: Strings.pastOrdersSub.toUpperCase(),
                activeOrders:
                "${Provider
                    .of<OrdersListingProvider>(context, listen: true)
                    .openOrderCount} Active Orders",
                ontap: () {
                  if (Provider
                      .of<OrdersListingProvider>(context, listen: false)
                      .openOrderCount !=
                      0) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OrdersListing()));
                  } else {
                    //print("no order");
                  }
                },
              )
            ],
          ),
          SizedBox(height: CommonWidgets().getHeight(context) * 0.02),
          // account status
          accountStatus(context),
          SizedBox(height: CommonWidgets().getHeight(context) * 0.02),
          // questions
          questions(),
          // contact support
          contactSupport(),
        ],
      ),
    );
  }

  Container doctorName(BuildContext context) {
    return Container(
      height: FontStyles.large,
      child: ScrollingText(
          textStyle: const TextStyle(
              color: CustomColors.white,
              fontWeight: FontStyles.semiBoldFontWeight400,
              fontFamily: FontStyles.fontFamly,
              package: FontStyles.package,
              fontStyle: FontStyle.normal,
              fontSize: FontStyles.large),
          text: Strings.header_home +
              " Dr. " +
              (Provider
                  .of<UserProvider>(context, listen: true)
                  ?.lastname
                  ?.toUpperCase() ??
                  "N.A.") +
              "!"),
    );
  }

  Widget contactSupport() {
    return GestureDetector(
      onTap: () async {
        try {
          await launch(
            'mailto:${Strings.supportEmail}',
          );
        } on PlatformException catch (e) {
          CommonWidgets.showToast(context, e.message, _scaffoldKey);
        }
      },
      child: Padding(
          padding: EdgeInsets.only(top: 9, left: 20, right: 20, bottom: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        style: const TextStyle(
                            color: CustomColors.black2,
                            fontWeight: FontStyles.semiBoldFontWeight500,
                            fontFamily: FontStyles.fontFamly,
                            fontStyle: FontStyle.normal,
                            fontSize: FontStyles.small),
                        text: Strings.contactSupportText),
                    TextSpan(
                        style: const TextStyle(
                            color: CustomColors.blue3,
                            fontWeight: FontStyles.semiBoldFontWeight500,
                            fontFamily: FontStyles.fontFamly,
                            fontStyle: FontStyle.normal,
                            fontSize: FontStyles.small),
                        text: Strings.supportEmail)
                  ]))
            ],
          )),
    );
  }

  Padding questions() {
    return Padding(
        padding: EdgeInsets.only(top: 23, left: 20, right: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Questions?",
                style: const TextStyle(
                    color: CustomColors.black3,
                    fontWeight: FontStyles.semiBoldFontWeight500,
                    fontFamily: FontStyles.fontFamly,
                    fontStyle: FontStyle.normal,
                    fontSize: 16.0),
                textAlign: TextAlign.left)
          ],
        ));
  }

  Widget accountStatus(BuildContext context) {
    if (Provider
        .of<UserProvider>(context, listen: false)
        .accountRequestStatus ==
        1 &&
        Provider
            .of<UserProvider>(context, listen: false)
            .accountRequestStatus ==
            1) {
      accountStatusText = Strings.active;
      statusColor = Colors.green;
    }
    if (Provider
        .of<UserProvider>(context, listen: false)
        .accountRequestStatus ==
        0) {
      accountStatusText = Strings.pending;
      statusColor = Colors.yellow;
    }
    if (Provider
        .of<UserProvider>(context, listen: false)
        .accountRequestStatus ==
        2) {
      accountStatusText = Strings.rejected;
      statusColor = Colors.red;
    }
    if (Provider
        .of<UserProvider>(context, listen: false)
        .accountStatus == 2) {
      accountStatusText = Strings.inactive;
      statusColor = Colors.red;
    }
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 0, left: 20, right: 30),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Account Status :
              Text("Account Status :",
                  style: const TextStyle(
                      color: CustomColors.grey2,
                      fontWeight: FontStyles.semiBoldFontWeight500,
                      fontFamily: FontStyles.fontFamly,
                      fontStyle: FontStyle.normal,
                      fontSize: FontStyles.large),
                  textAlign: TextAlign.left),

              // Active

              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(
                  children: [
                    Text(accountStatusText.toUpperCase(),
                        style: TextStyle(
                            color: statusColor,
                            fontWeight: FontStyles.semiBoldFontWeight500,
                            fontFamily: "Roboto",
                            fontStyle: FontStyle.normal,
                            fontSize: FontStyles.large),
                        textAlign: TextAlign.right),
                  ],
                ),
              )
            ],
          ),
        ),
        if (accountStatusText == Strings.rejected)
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  "Reason of Rejection :",
                  style: const TextStyle(
                      color: CustomColors.grey2,
                      fontWeight: FontStyles.semiBoldFontWeight500,
                      fontFamily: FontStyles.fontFamly,
                      fontStyle: FontStyle.normal,
                      fontSize: FontStyles.small),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 0, left: 20, right: 20),
                child: Text(
                    Provider
                        .of<UserProvider>(context, listen: false)
                        .rejectedReason ??
                        "",
                    style: TextStyle(
                        color: statusColor,
                        fontFamily: "Roboto",
                        fontStyle: FontStyle.normal,
                        fontSize: FontStyles.small),
                    textAlign: TextAlign.justify),
              ),
            ],
          ),
      ],
    );
  }

  Padding notitification(double screenHeight, double screenWidth) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: InkWell(
        child: Stack(
          children: [
            SizedBox(
              width: screenHeight / 60,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(Strings.dashboard,
                  style: const TextStyle(
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w500,
                      fontFamily: FontStyles.fontFamly,
                      package: FontStyles.package,
                      fontStyle: FontStyle.normal,
                      fontSize: FontStyles.size24),
                  textAlign: TextAlign.left),
            ),
            SizedBox(
              width: screenWidth / 17,
            ),
          ],
        ),
      ),
    );
  }

  Align notificationWidget() {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () =>
        {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DoctorNotification(),
              ))
        },
        child: Consumer<DoctorNotificationProvider>(
          builder: (context, notify, _) =>
              Container(
                height: 22,
                width: 20,
                child: Stack(
                  children: [
                    CommonWidgets().getImage('ic_notification.png',
                        height: 22, width: 20, color: CustomColors.white),
                    FutureBuilder(
                      future: notify.getunreadNotification(),
                      builder: (context, snapshot) =>
                      snapshot.connectionState == ConnectionState.waiting
                          ? Container()
                          : notify.count < 1
                          ? Container()
                          : Align(
                        alignment: Alignment(1, -0.9),
                        child: Container(
                          alignment: Alignment.center,
                          height: 12,
                          width: 12,
                          decoration: BoxDecoration(
                            color: CustomColors.red,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: CustomText(
                            text: "${notify.count}",
                            fontSize: 8,
                            color: CustomColors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
        ),
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) async {
    await Provider.of<OrdersListingProvider>(context, listen: false)
        .getOpenOrderCount();
  }
}

import 'package:after_layout/after_layout.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:virtudoc_app/custom-widgets/moving_text_widget.dart';
import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/screens/home/patient/patientBottom_provider.dart';
import 'package:virtudoc_app/screens/home/patient/payment-method/payment-provider.dart';
import 'package:virtudoc_app/screens/home/patient/select-speciality/select-speciality.dart';
import 'package:virtudoc_app/screens/home/patient/wallet/wallet_provider.dart';
import 'package:virtudoc_app/screens/orders/orders_listing.dart';
import 'package:virtudoc_app/screens/orders/orders_listing_provider.dart';
import 'package:virtudoc_app/utils/common-widgets.dart';
import 'package:virtudoc_app/utils/custom-colors.dart';
import 'package:virtudoc_app/utils/strings.dart';
import 'package:virtudoc_app/utils/styles.dart';

class PatientHomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PatientHomeScreenState();
}

class _PatientHomeScreenState extends State<PatientHomeScreen>
    with AfterLayoutMixin {
  var isPatientEnable = false;
  var isDoctorEnable = false;
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      var walletId = Provider.of<UserProvider>(context, listen: false).walletId;
      Provider.of<ListPaymentMethod>(context, listen: false).fetch();
      Provider.of<GetSupportedPaymentMethods>(context, listen: false).fetch();

      if (walletId == '') {
        var res = await ApiRequest.getApi(ApiUrl.setupPaymentWallet);
        var resBody = jsonDecode(res.body);
        Provider.of<UserProvider>(context, listen: false).walletId =
            resBody['body']['data']['wallet_id'];
        walletId = Provider.of<UserProvider>(context, listen: false).walletId;
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
    title: AutoSizeText(Strings.appName),
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
        appBar: AppBar(
          backgroundColor: CustomColors.blue,
          flexibleSpace: Container(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: patientName(context),
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
                  bottom: CommonWidgets().getHeight(context) * 0.035),
              child: notificatonBuilder(context),
            ),
          ],
          toolbarHeight: CommonWidgets().getHeight(context) * 0.15,
        ),
        body: _buildWidget(context),
      ),
    );
  }

  _buildWidget(BuildContext context) {
    return Container(
      height: CommonWidgets().getHeight(context),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            child: medicalEmergency(),
          ),
          Column(
            children: <Widget>[
              // make appointments
              SizedBox(
                height: CommonWidgets().getHeight(context) * 0.1,
              ),
              CommonWidgets.singleField(
                  imageAssetAddress: "assets/images/ic_appointment.png",
                  title: Strings.make_appointments.toUpperCase(),
                  context: context,
                  ontap: () {
                    Provider.of<SelectSpecialityProvider>(context,
                            listen: false)
                        .getSpeciality();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SelectSpeciality()),
                    );
                  }),

              SizedBox(height: 30),
              // make payment
              CommonWidgets.singleField(
                  imageAssetAddress: "assets/images/ic_make_payment.png",
                  title: Strings.make_payment.toUpperCase(),
                  context: context,
                  ontap: () {
                    //TODO remove this toast after payment gateway integration
                    CommonWidgets.showToast(
                        context, Strings.commingSoon, _scaffoldKey);
                    //TODO uncoment with new oayment integration
                    Provider.of<PatientBottomProvider>(context, listen: false)
                        .onItemTapped(2);
                  }),

              SizedBox(height: 30),
              // pending orders
              CommonWidgets.singleField(
                  imageAssetAddress: "assets/images/pharmacy_order.png",
                  title: Strings.pastOrders.toUpperCase(),
                  subTitle: Strings.pastOrdersSub.toUpperCase(),
                  activeOrders:
                      "${Provider.of<OrdersListingProvider>(context, listen: false).openOrderCount} Active Orders",
                  context: context,
                  ontap: () {
                    if (Provider.of<OrdersListingProvider>(context,
                                listen: false)
                            .openOrderCount !=
                        0) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OrdersListing()));
                    }
                  }),
              SizedBox(height: 30),
              //medical emergency
            ],
          ),
        ],
      ),
    );
  }

  Widget medicalEmergency() {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(left: 10, bottom: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(Strings.medicalEmergency,
                  style: TextStyle(
                      color: CustomColors.red,
                      fontWeight: FontStyles.semiBoldFontWeight500,
                      fontFamily: "Roboto",
                      fontStyle: FontStyle.normal,
                      fontSize: 14.0),
                  textAlign: TextAlign.left),
              SizedBox(
                height: 2,
              ),
              Text(Strings.emergencyText,
                  style: const TextStyle(
                      color: CustomColors.grey2,
                      fontWeight: FontStyles.semiBoldFontWeight500,
                      fontFamily: "Roboto",
                      fontStyle: FontStyle.normal,
                      fontSize: 10),
                  textAlign: TextAlign.left),
            ],
          ),
        ),
      ],
    );
  }

  Widget patientName(BuildContext context) {
    return Container(
      height: FontStyles.large,
      child: ScrollingText(
        text: Strings.header_home_patient +
            (Provider.of<UserProvider>(context, listen: true)
                    ?.firstname
                    ?.toUpperCase() ??
                "N.A.") +
            "!",
        textStyle: const TextStyle(
            color: CustomColors.white,
            fontWeight: FontStyles.semiBoldFontWeight400,
            fontFamily: FontStyles.fontFamly,
            package: FontStyles.package,
            fontStyle: FontStyle.normal,
            fontSize: FontStyles.large),
      ),
    );
  }

  Align dashBoardText() {
    return Align(
      alignment: Alignment.center,
      child: Text(Strings.dashboard,
          style: TextStyle(
              color: Color(0xffffffff),
              fontWeight: FontWeight.w500,
              fontFamily: FontStyles.fontFamly,
              package: FontStyles.package,
              fontStyle: FontStyle.normal,
              fontSize: FontStyles.size24),
          textAlign: TextAlign.left),
    );
  }

  Widget notificatonBuilder(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () => {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PatietnNotification(),
              ))
        },
        child: Consumer<PatientNotificationProvider>(
          builder: (context, notify, _) => Container(
            height: 22,
            width: 20,
            margin: EdgeInsets.only(right: 15),
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

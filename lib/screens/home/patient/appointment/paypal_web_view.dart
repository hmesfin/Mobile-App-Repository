import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtudoc_app/screens/home/patient/doctor-detail/doctor_detail_provider.dart';
import 'package:virtudoc_app/screens/home/patient/find-doctor/book-appointment/book-appointment.dart';
import 'package:virtudoc_app/screens/home/patient/patientBottom_provider.dart';
import 'package:virtudoc_app/screens/orders/model/get_payment_uri_response.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:virtudoc_app/utils/common-widgets.dart';

class PaypalWebView extends StatefulWidget {
  final GetPaymentUriResponse getPaymentUriResponse;

  const PaypalWebView({Key key, this.getPaymentUriResponse}) : super(key: key);

  @override
  PaypalWebViewState createState() => PaypalWebViewState();
}

class PaypalWebViewState extends State<PaypalWebView> with AfterLayoutMixin {
  @override
  void afterFirstLayout(BuildContext context) {
    final flutterWebViewPlugin = new FlutterWebviewPlugin();
    flutterWebViewPlugin.onStateChanged.listen((WebViewStateChanged state) {
      if (state.type == WebViewState.startLoad) {
        if (state.url
            .toString()
            .contains(widget.getPaymentUriResponse.body.data.cancelUrl)) {
          flutterWebViewPlugin.close();
          Provider.of<PatientBottomProvider>(context, listen: false)
              .setFromAppointmentNav(false);
          Navigator.pop(
              context, widget.getPaymentUriResponse.body.data.cancelUrl);
        } else if (state.url
            .toString()
            .contains(widget.getPaymentUriResponse.body.data.successUrl)) {
          flutterWebViewPlugin.close();
          Provider.of<PatientBottomProvider>(context, listen: false)
              .setFromAppointmentNav(true);
          Navigator.pop(
              context, widget.getPaymentUriResponse.body.data.successUrl);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DoctorDetailProvider>(
      builder: (context, model, child) =>
          SafeArea(
              child: Scaffold(
                appBar: AppBar(),
                body: bodyWidget(context),
              )),
    );
  }

  Widget bodyWidget(context) =>
      WillPopScope(
        onWillPop: () async {
          Navigator.pop(context, false);
          return false;
        },
        child: Consumer<DoctorDetailProvider>(builder: (context, model, child) {
          return WebviewScaffold(
              url: widget.getPaymentUriResponse.body.data.redirectUrl);
        }),
      );
}

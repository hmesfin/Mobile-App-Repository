import 'package:flutter/scheduler.dart';
import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/screens/home/doctor/doctor-transactions/doctor-transactions.dart';
import 'package:virtudoc_app/screens/home/doctor/enrollment-details-update/enrollment-detail-update.dart';
import 'package:virtudoc_app/screens/home/patient/appointment/appointment-detail.dart';

import 'doctor-notification-model.dart';
/*
The file is covered under Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. Please review the license for full details.

This program is not free software: You cannot redistribute it for any use under the terms of the Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. However the source can be modified and updated for the working of the application Design & Development of Mobile Application for “Abyssinia Technology Group” for which it was licensed.
*/

class DoctorNotification extends StatefulWidget {
  @override
  _DoctorNotificationState createState() => _DoctorNotificationState();
}

class _DoctorNotificationState extends State<DoctorNotification> {
  var controller = ScrollController();
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      //clearing the notifications list of previous fields
      Provider
          .of<DoctorNotificationProvider>(context, listen: false)
          .list
          .clear();
      Provider.of<DoctorNotificationProvider>(context, listen: false)
          .getNotification(
          Provider
              .of<DoctorNotificationProvider>(context, listen: false)
              .poge);
      controller.addListener(() {
        if (controller.position.pixels >
            controller.position.maxScrollExtent + 100) {
          Provider
              .of<DoctorNotificationProvider>(context, listen: false)
              .poge++;

          Provider.of<DoctorNotificationProvider>(context, listen: false)
              .getNotification(Provider
              .of<DoctorNotificationProvider>(context,
              listen: false)
              .poge);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: CustomColors.bg_app,
        body: SingleChildScrollView(
          child: _buildWidget(context),
        ),
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
        .height;
    return SingleChildScrollView(
      child: Container(
        color: CustomColors.bg_app,
        height: screenHeight + appbarheight,
        width: screenWidth,
        child: Column(
          children: <Widget>[
            customTopBar(context),
            Container(
              height: screenHeight - 180,
              child: Consumer<DoctorNotificationProvider>(
                builder: (context, notify, _) =>
                notify.isloading && notify.list.length == 0
                    ? Center(
                  child: CircularProgressIndicator(),
                )
                    : notify.list.isEmpty
                    ? Center(
                  child: Text(
                    "No New Notification",
                  ),
                )
                    : (!notify.isloading && notify.list.length != 0 ||
                    notify.isloading && notify.list.length != 0)
                    ? ListView.builder(
                  controller: controller,
                  physics: BouncingScrollPhysics(),
                  itemCount: notify.list.length,
                  itemBuilder: (context, index) =>
                      singleNotification(
                          context, notify.list[index]),
                )
                    : Container(),
              ),
            ),
            Divider(color: CustomColors.grey2.withOpacity(0.1))
          ],
        ),
      ),
    );
  }

  CustomTopBar customTopBar(BuildContext context,) {
    return CustomTopBar(
      context: context,
      titleText: Strings.notification,
      traling: Provider
          .of<DoctorNotificationProvider>(context, listen: false)
          .list
          .length ==
          0
          ? null
          : Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () async {
              CommonWidgets.showCustomDialog(
                  context,
                  Strings.clearNotifications,
                  Strings.clearNotificationText,
                  iconData: Icons.delete, onYes: () async {
                final response =
                await Provider.of<DoctorNotificationProvider>(context,
                    listen: false)
                    .clearNotification();

                if (!response.success)
                  CommonWidgets.showToast(
                      context, response.message, _scaffoldKey);
                Navigator.pop(context);
              });
            },
            child: CustomText(
              margin: EdgeInsets.only(right: 20, bottom: 20),
              alignment: Alignment.centerRight,
              text: Strings.clearAll,
              color: CustomColors.white,
              fontSize: FontStyles.header_back,
              fontWeight: FontStyles.semiBoldFontWeight400,
            ),
          ),
        ],
      ),
    );
  }

  Widget singleNotification(BuildContext context,
      DoctorNotificationModel notify) {
    return GestureDetector(
      onTap: () async {
        //GOTO Appointment
        if (notify.gotoScreen == 'Appointments') {
          var res = await ApiRequest.postApi(ApiUrl.updateNotification, {
            'notification_id': notify.notificationId,
            'receiver_id': notify.receiverId,
            'read_Status': true
          });
          if (res.statusCode == 200) {
            Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (context) =>
                        AppointmentDetail(notify.appointmentId, false)));
          }
        }
        //GOTO Profile

        else if (notify.gotoScreen == 'Profile') {
          var res = await ApiRequest.postApi(ApiUrl.updateNotification, {
            'notification_id': notify.notificationId,
            'receiver_id': notify.receiverId,
            'read_Status': true
          });
          if (res.statusCode == 200) {
            Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (context) => EnrollmentDetailUpdate()));
          }
        }

        //GOTO Doctor Transactions

        else if (notify.gotoScreen == 'Home') {
          var res = await ApiRequest.postApi(ApiUrl.updateNotification, {
            'notification_id': notify.notificationId,
            'receiver_id': notify.receiverId,
            'read_Status': true
          });
          if (res.statusCode == 200) {
            Navigator.push(context,
                CupertinoPageRoute(builder: (context) => DoctorTransactions()));
          }
        }
        //GOTO new screen

        else {
          await ApiRequest.postApi(ApiUrl.updateNotification, {
            'notification_id': notify.notificationId,
            'receiver_id': notify.receiverId,
            'read_Status': true
          });
        }
        Provider
            .of<DoctorNotificationProvider>(context, listen: false)
            .poge =
        1;
        Provider.of<DoctorNotificationProvider>(context, listen: false)
            .getNotification(
            Provider
                .of<DoctorNotificationProvider>(context, listen: false)
                .poge);
        Provider.of<DoctorNotificationProvider>(context, listen: false)
            .getunreadNotification();
      },
      child: Column(
        children: [
          Container(
            color: notify.readStatus ? CustomColors.bg_app : CustomColors.grey,
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: CircleAvatar(
                    backgroundColor: CustomColors.blue,
                    radius: 25,
                    child: Icon(
                      Icons.mail,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                          width: CommonWidgets().getWidth(context) * 0.6,
                          padding: EdgeInsets.only(bottom: 5),
                          maxLines: 2,
                          textAlign: TextAlign.left,
                          fontSize: FontStyles.normal,
                          color: CustomColors.black1,
                          fontWeight: FontStyles.semiBoldFontWeight400,
                          text: notify.notificationBody),
                      CustomText(
                        fontSize: FontStyles.small,
                        color: CustomColors.grey2,
                        fontWeight: FontStyles.semiBoldFontWeight400,
                        text: notify.dateAgo,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          // CommonWidgets.divider
        ],
      ),
    );
  }
}

import 'package:flutter/scheduler.dart';
import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/screens/home/doctor/chat/chat-detail.dart';
import 'package:virtudoc_app/screens/home/feedback/give-feedback.dart';
import 'package:virtudoc_app/screens/home/patient/appointment/appointment-detail.dart';
import 'package:virtudoc_app/screens/home/patient/patient-notification/patient-notification-provider.dart';
import 'package:virtudoc_app/screens/home/patient/patient-transactions/patient-transactions.dart';
import 'package:virtudoc_app/screens/home/patient/prescription/history-detail.dart';
import 'package:virtudoc_app/screens/home/patient/wallet/wallet.dart';
/*
The file is covered under Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. Please review the license for full details.

This program is not free software: You cannot redistribute it for any use under the terms of the Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. However the source can be modified and updated for the working of the application Design & Development of Mobile Application for “Abyssinia Technology Group” for which it was licensed.
*/

class PatietnNotification extends StatefulWidget {
  @override
  _PatietnNotificationState createState() => _PatietnNotificationState();
}

class _PatietnNotificationState extends State<PatietnNotification> {
  var controller = ScrollController();
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      //clearing the notifications list of previous fields
      Provider.of<PatientNotificationProvider>(context, listen: false)
          .notificationModelList
          .clear();

      Provider.of<PatientNotificationProvider>(context, listen: false)
          .getNotifications(
              Provider.of<PatientNotificationProvider>(context, listen: false)
                  .page);
    });

    controller.addListener(() {
      if (controller.position.pixels >
          controller.position.maxScrollExtent + 150) {
        Provider.of<PatientNotificationProvider>(context, listen: false).page++;
        Provider.of<PatientNotificationProvider>(context, listen: false)
            .getNotifications(
                Provider.of<PatientNotificationProvider>(context, listen: false)
                    .page);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: CustomColors.bg_app,
        body: body(context),
      ),
    );
  }

  Widget body(BuildContext context) {
    return Consumer<PatientNotificationProvider>(
        builder: (context, provider, widget) {
      return Stack(
        children: [
          Column(
            children: [
              customTopBar(context, provider),
              if (provider.notificationModelList.length == 0 &&
                  !provider.isLoading)
                Container(
                  margin: EdgeInsets.only(
                      top: CommonWidgets().getHeight(context) * 0.35),
                  child: Text("No New Notification"),
                ),
              if (!provider.isLoading &&
                      provider.notificationModelList.length != 0 ||
                  provider.isLoading &&
                      provider.notificationModelList.length != 0)
                Expanded(
                  child: ListView.builder(
                    controller: controller,
                    physics: BouncingScrollPhysics(),
                    itemCount: provider.notificationModelList.length ?? 0,
                    itemBuilder: (context, index) =>
                        singleNotification(context, index, provider),
                  ),
                ),
            ],
          ),
          if (provider.isLoading) CommonWidgets.showLoader(context)
        ],
      );
    });
  }

  CustomTopBar customTopBar(
      BuildContext context, PatientNotificationProvider provider) {
    return CustomTopBar(
      context: context,
      titleText: Strings.notification,
      traling: provider.notificationModelList.length == 0
          ? null
          : GestureDetector(
              onTap: () {
                CommonWidgets.showCustomDialog(context,
                    Strings.clearNotifications, Strings.clearNotificationText,
                    iconData: Icons.delete, onYes: () async {
                  var res = await provider.clearNotification();
                  if (!res.success)
                    CommonWidgets.showToast(context, res.message, _scaffoldKey);
                  CommonWidgets().navigateBack(context);
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
    );
  }

  Widget singleNotification(
      BuildContext context, int index, PatientNotificationProvider provider) {
    return GestureDetector(
      onTap: () async {
        var appointmentID = provider.notificationModelList[index].appointmentId;

        //GOTO Appointment

        if (provider.notificationModelList[index].goToScreen ==
            'Appointments') {
          var res = await ApiRequest.postApi(ApiUrl.updateNotification, {
            'notification_id':
                provider.notificationModelList[index].notificationId,
            'receiver_id': provider.notificationModelList[index].receiverId,
            'read_Status': true
          });
          if (res.statusCode == 200) {
            Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (context) =>
                        AppointmentDetail(appointmentID, true)));
          }
        }

        //GOTO Profile

        else if (provider.notificationModelList[index].goToScreen ==
            'Profile') {
          var res = await ApiRequest.postApi(ApiUrl.updateNotification, {
            'notification_id':
                provider.notificationModelList[index].notificationId,
            'receiver_id': provider.notificationModelList[index].receiverId,
            'read_Status': true
          });
          if (res.statusCode == 200) {
            Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (context) => EditProfile(
                        biometrics:
                            Provider.of<UserProvider>(context, listen: false)
                                .biometrics,
                        email: Provider.of<UserProvider>(context, listen: false)
                            .email,
                        firstname:
                            Provider.of<UserProvider>(context, listen: false)
                                .firstname,
                        lastname:
                            Provider.of<UserProvider>(context, listen: false)
                                .lastname)));
          }
        }

        //GOTO History

        else if (provider.notificationModelList[index].goToScreen ==
            'History') {
          var res = await ApiRequest.postApi(ApiUrl.updateNotification, {
            'notification_id':
                provider.notificationModelList[index].notificationId,
            'receiver_id': provider.notificationModelList[index].receiverId,
            'read_Status': true
          });
          if (res.statusCode == 200) {
            await Provider.of<PrescriptionProvider>(context, listen: false)
                .getAppoinmentDetail(appointmentID);
            Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (context) => PatientHistoryDetails(
                        historyModel: Provider.of<PrescriptionProvider>(context,
                                listen: false)
                            .historyModel)));
          }
        }
        //GOTO Chat

        else if (provider.notificationModelList[index].goToScreen == 'Chat') {
          var res = await ApiRequest.postApi(ApiUrl.updateNotification, {
            'notification_id':
                provider.notificationModelList[index].notificationId,
            'receiver_id': provider.notificationModelList[index].receiverId,
            'read_Status': true
          });

          if (res.statusCode == 200) {
            Provider.of<ChatProvider>(context, listen: false).appointmentId =
                provider.notificationModelList[index].appointmentId;
            Provider.of<ChatProvider>(context, listen: false).username =
                provider.notificationModelList[index].username;

            Provider.of<ChatProvider>(context, listen: false).otherUsername =
                provider.notificationModelList[index].doctorname;

            Provider.of<ChatProvider>(context, listen: false).pic =
                provider.notificationModelList[index].userpic ?? '';
            await PreferenceUtils.putBool(PreferenceKeys.IS_CHATTING, true);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ChatDetail()));
          }
        }

        //GOTO review

        else if (provider.notificationModelList[index].goToScreen == 'Review') {
          var res = await ApiRequest.postApi(ApiUrl.updateNotification, {
            'notification_id':
                provider.notificationModelList[index].notificationId,
            'receiver_id': provider.notificationModelList[index].receiverId,
            'read_Status': true
          });
          if (res.statusCode == 200) {
            await Provider.of<PrescriptionProvider>(context, listen: false)
                .getAppoinmentDetail(appointmentID);

            Provider.of<GiveFeedbackProvider>(context, listen: false).init(
                appointment_id: appointmentID ?? 0,
                doctor_id:
                    Provider.of<PrescriptionProvider>(context, listen: false)
                            ?.historyModel
                            ?.doctorId ??
                        0,
                doctor_name:
                    Provider.of<PrescriptionProvider>(context, listen: false)
                            ?.historyModel
                            ?.doctor
                            ?.firstName ??
                        'N.A.' + " " + 'N.A.');
            Navigator.push(context,
                CupertinoPageRoute(builder: (context) => GiveFeedback()));
          }
        }

        //GOTO Transaction history

        else if (provider.notificationModelList[index].goToScreen == 'Home') {
          var res = await ApiRequest.postApi(ApiUrl.updateNotification, {
            'notification_id':
                provider.notificationModelList[index].notificationId,
            'receiver_id': provider.notificationModelList[index].receiverId,
            'read_Status': true
          });
          if (res.statusCode == 200) {
            Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (context) => PatientTransactions()));
          }
        }

        //GOTO new screen

        else {
          await ApiRequest.postApi(ApiUrl.updateNotification, {
            'notification_id':
                provider.notificationModelList[index].notificationId,
            'receiver_id': provider.notificationModelList[index].receiverId,
            'read_Status': true
          });
        }

        Provider.of<PatientNotificationProvider>(context, listen: false).page =
            1;
        Provider.of<PatientNotificationProvider>(context, listen: false)
            .getNotifications(
                Provider.of<PatientNotificationProvider>(context, listen: false)
                    .page);
        Provider.of<PatientNotificationProvider>(context, listen: false)
            .getunreadNotification();
      },
      child: Column(
        children: [
          Container(
            color: provider.notificationModelList[index].readStatus
                ? CustomColors.bg_app
                : CustomColors.grey,
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
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                          width: CommonWidgets().getWidth(context) * 0.7,
                          padding: EdgeInsets.only(bottom: 5),
                          textAlign: TextAlign.left,
                          maxLines: 2,
                          fontSize: FontStyles.normal,
                          color: CustomColors.black1,
                          fontWeight: FontStyles.semiBoldFontWeight400,
                          text: provider
                              .notificationModelList[index].notificationBody),
                      CustomText(
                        fontSize: FontStyles.small,
                        color: CustomColors.grey2,
                        fontWeight: FontStyles.semiBoldFontWeight400,
                        text: provider.notificationModelList[index].dateAgo,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

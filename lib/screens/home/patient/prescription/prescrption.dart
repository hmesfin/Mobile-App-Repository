import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/screens/home/feedback/give-feedback.dart';
import 'package:virtudoc_app/screens/home/patient/prescription/history-detail.dart';
/*
The file is covered under Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. Please review the license for full details.

This program is not free software: You cannot redistribute it for any use under the terms of the Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. However the source can be modified and updated for the working of the application Design & Development of Mobile Application for “Abyssinia Technology Group” for which it was licensed.
*/

class PatientPrescription extends StatefulWidget {
  @override
  _PatientPrescriptionState createState() => _PatientPrescriptionState();
}

class _PatientPrescriptionState extends State<PatientPrescription> {
  var controller = ScrollController();

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<PrescriptionProvider>(context, listen: false)
          .getPrescriptions(request: 'past');
      controller.addListener(() {
        if (controller.position.pixels >
            (controller.position.maxScrollExtent + 150)) {
          Provider
              .of<PrescriptionProvider>(context, listen: false)
              .page++;

          Provider.of<PrescriptionProvider>(context, listen: false)
              .getPrescriptions(
            request: 'past',
            page:
            Provider
                .of<PrescriptionProvider>(context, listen: false)
                .page,
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.bg_app,
        body: _buildWidget(context, controller),
      ),
    );
  }

  _buildWidget(BuildContext context, ScrollController controller) {
    return Consumer<PrescriptionProvider>(
        builder: (context, provider, child) =>
            Stack(children: [
              Column(children: [
                CustomTopBar(
                  context: context,
                  titleText: Strings.history,
                ),
                if (provider.prescriptionModelList.length == 0 &&
                    !provider.isLoading)
                  Container(
                    margin: EdgeInsets.only(
                        top: CommonWidgets().getHeight(context) * 0.35),
                    child: Text("No History"),
                  ),
                if (provider.prescriptionModelList.length != 0 &&
                    provider.isLoading ||
                    !provider.isLoading &&
                        provider.prescriptionModelList.length != 0)
                  Expanded(
                    child: ListView.builder(
                      controller: controller,
                      physics: BouncingScrollPhysics(),
                      itemCount: provider.prescriptionModelList.length ?? 0,
                      itemBuilder: (context, index) =>
                          HistoryListTile(
                            historyModel: provider.prescriptionModelList[index],
                          ),
                    ),
                  )
              ]),
              if (provider.prescriptionModelList.length < 0)
                Center(
                  child: Text('No New Data'),
                ),
              if (provider.isLoading) CommonWidgets.showLoader(context),
            ]));
  }
}

class HistoryListTile extends StatelessWidget {
  final HistoryModel historyModel;

  HistoryListTile({@required this.historyModel});

  @override
  Widget build(BuildContext context) {
    //calculating date time of appointment
    var appointmentDateTimeUTC = DateFormat('yyyy-MM-DD HH:mm').parse(
        DateFormat('yyyy-MM-DD')
            .parse(historyModel.date)
            .toString()
            .split(" ")[0] +
            " " +
            DateFormat("HH:mm")
                .parse(historyModel.startTime)
                .toString()
                .split(" ")[1]);
    //calculating local time
    var appointmentDateTimeLocal =
    DateTime.parse(appointmentDateTimeUTC.toString() + 'Z').toLocal();
    return FlatButton(
      onPressed: () {
        CommonWidgets().navigateTO(context,
            pageName: PatientHistoryDetails(
              historyModel: historyModel,
            ));
      },
      padding: const EdgeInsets.all(0),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 21),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonWidgets.userImgeLoader(
                    size: 70,
                    imageUrl:
                    historyModel?.doctor?.userProfile?.profileImage ?? ''),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    AutoSizeText(
                      'Dr. ' +
                          (historyModel?.doctor?.firstName ?? 'N.A.') +
                          " " +
                          (historyModel?.doctor?.lastName ?? 'N.A.'),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontWeight: FontStyles.semiBoldFontWeight400,
                        fontFamily: FontStyles.fontFamly,
                        package: FontStyles.package,
                        color: CustomColors.black1,
                        fontStyle: FontStyle.normal,
                      ),
                      presetFontSizes: [18, 17, 16],
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    AutoSizeText(
                      "Date: " +
                          DateFormat('MMM dd, yyyy')
                              .format(appointmentDateTimeLocal),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                          fontWeight: FontStyles.semiBoldFontWeight500,
                          fontFamily: FontStyles.fontFamly,
                          package: FontStyles.package,
                          color: CustomColors.grey2,
                          fontStyle: FontStyle.normal,
                          fontSize: 14),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    AutoSizeText(
                      Strings.purposeOfVisit + " " + historyModel?.purpose ??
                          'N.A.',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                          fontWeight: FontStyles.semiBoldFontWeight500,
                          fontFamily: FontStyles.fontFamly,
                          package: FontStyles.package,
                          color: CustomColors.grey2,
                          fontStyle: FontStyle.normal,
                          fontSize: 14),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    GestureDetector(
                        onTap: historyModel?.rating != null
                            ? null
                            : () {
                          Provider.of<GiveFeedbackProvider>(context,
                              listen: false)
                              .init(
                              appointment_id:
                              historyModel?.appointmentId ?? 0,
                              doctor_id: historyModel?.doctorId ?? 0,
                              doctor_name:
                              historyModel?.doctor?.firstName ??
                                  'N.A.' +
                                      " " +
                                      historyModel
                                          ?.doctor?.lastName ??
                                  'N.A.');
                          CommonWidgets().navigateTO(context,
                              pageName: GiveFeedback());
                        },
                        child: historyModel?.rating == null
                            ? AutoSizeText(
                          "Rate this Visit",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              fontWeight:
                              FontStyles.semiBoldFontWeight500,
                              fontFamily: FontStyles.fontFamly,
                              package: FontStyles.package,
                              color: CustomColors.yellow1,
                              fontStyle: FontStyle.normal,
                              fontSize: 14),
                          textAlign: TextAlign.start,
                        )
                            : RatingBarIndicator(
                          rating: historyModel?.rating,
                          itemBuilder: (context, index) =>
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                          itemCount: 5,
                          itemSize: 16.0,
                          direction: Axis.horizontal,
                        )),
                  ],
                ),
              ],
            ),
            Divider()
          ],
        ),
      ),
    );
  }
}

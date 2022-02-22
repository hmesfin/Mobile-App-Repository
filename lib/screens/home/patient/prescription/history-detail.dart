import 'package:flutter/scheduler.dart';
import 'package:virtudoc_app/index.dart'
    hide LabOrderItem, ImagingOrderItem, Imaging;
import 'package:virtudoc_app/screens/home/patient/prescription/prescription_detail_model.dart';

class PatientHistoryDetails extends StatefulWidget {
  final HistoryModel historyModel;

  PatientHistoryDetails({@required this.historyModel});

  @override
  _PatientHistoryDetailsState createState() => _PatientHistoryDetailsState();
}

class _PatientHistoryDetailsState extends State<PatientHistoryDetails> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      Provider.of<PrescriptionProvider>(context, listen: false)
          .getDetailPrescriptions(widget.historyModel.appointmentId, (error) {
        CommonWidgets.showToast(context, error, _scaffoldKey);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: CustomColors.bg_app,
        body: _buildWidget(context),
      ),
    );
  }

  _buildWidget(BuildContext context) {
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    return Consumer<PrescriptionProvider>(
      builder: (context, provider, child) =>
          Stack(
            children: [
              Column(
                children: [
                  CustomTopBar(
                    context: context,
                    titleText: Strings.visitHistoryDetail,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          doctorDetials(
                              screenHeight, CommonWidgets().getWidth(context)),
                          middleList(),
                          prescription(
                              prescriptionDetailModel:
                              provider.prescriptionDetailModel),
                          //removed referal
                          // singleTile(
                          //     "Referal:",
                          //     provider.prescriptionDetailModel?.data?.referral
                          //                 ?.referralComment ==
                          //             null
                          //         ? 'N.A.'
                          //         : provider.prescriptionDetailModel.data.referral
                          //                 .referralComment.isEmpty
                          //             ? 'N.A.'
                          //             : provider.prescriptionDetailModel?.data
                          //                 ?.referral?.referralComment),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              if (provider.isLoading) CommonWidgets.showLoader(context)
            ],
          ),
    );
  }

  Widget prescription({PrescriptionDetailModel prescriptionDetailModel}) {
    return Column(
      children: List.generate(
        prescriptionDetailModel?.data?.prescriptions?.length ?? 0,
            (index) =>
            singlePresciptionModel(
                pharmacyOrderItem: prescriptionDetailModel
                    ?.data?.prescriptions[index].pharmacyOrderItem,
                imagingOrderItem: prescriptionDetailModel
                    ?.data?.prescriptions[index].imagingOrderItem,
                labOrderItem: prescriptionDetailModel
                    ?.data?.prescriptions[index].labOrderItem,
                prescriptions: prescriptionDetailModel
                    ?.data?.prescriptions[index].pharmacyOrderItem
                    .prescribedDrugs,
                requisitionType: prescriptionDetailModel
                    ?.data?.prescriptions[index].requisition.requisitionType ??
                    'N.A.',
                referral: prescriptionDetailModel?.data?.referral),
      ),
    );
  }

  Column singlePresciptionModel({List<PrescribedDrugs> prescriptions,
    ImagingOrderItem imagingOrderItem,
    LabOrderItem labOrderItem,
    String requisitionType,
    PharmacyOrderItem1 pharmacyOrderItem,
    Referral referral}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        singleTile('Requisition Type:', requisitionType),
        if (labOrderItem.laboratory.isNotEmpty)
          Column(
            children: [
              labColumnTitle(),
              labColumnTitle(labOrderItem: labOrderItem),
              labColumnTitle1(),
              labColumnTitle1(labOrderItem: labOrderItem),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        if (imagingOrderItem.imaging[0].bodyPart.isNotEmpty)
          Column(
            children: [
              imagingColumnTitle(),
              if (imagingOrderItem.imaging.length > 0)
                Column(
                  children: List.generate(
                      imagingOrderItem.imaging.length,
                          (index) =>
                          imagingColumnTitle(
                              imaging: imagingOrderItem.imaging[index],
                              facility: imagingOrderItem.imagingFacility,
                              additionalClinicalData:
                              imagingOrderItem.additionalClinicalData)),
                ),
              imagingColumnTitle1(),
              if (imagingOrderItem.imaging.length > 0)
                Column(
                  children: [
                    imagingColumnTitle1(
                      //imaging: imagingOrderItem.imaging[index],
                      // facility: imagingOrderItem.imagingFacility,
                        additionalClinicalData:
                        imagingOrderItem.additionalClinicalData)
                  ],
                ),
            ],
          ),
        if (prescriptions[0].drugName.isNotEmpty)
          Column(
            children: [
              prescColumnTitle(),
              if (prescriptions.length > 0)
                Column(
                  children: List.generate(
                      prescriptions.length,
                          (index) =>
                          prescColumnTitle(
                              medicineModel: prescriptions[index])),
                ),
              prescColumnTitle1(),
              if (prescriptions.length > 0)
                Column(
                  children: [
                    prescColumnTitle1(pharmacyOrderItem: pharmacyOrderItem)
                  ],
                ),
            ],
          ),
        CommonWidgets.divider,
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Column middleList() {
    //calculating date time of appointment
    var appointmentDateTimeUTC = DateFormat('yyyy-MM-DD HH:mm').parse(
        DateFormat('yyyy-MM-DD')
            .parse(widget.historyModel.date)
            .toString()
            .split(" ")[0] +
            " " +
            DateFormat("HH:mm")
                .parse(widget.historyModel.startTime)
                .toString()
                .split(" ")[1]);
    //calculating local time
    var appointmentDateTimeLocal =
    DateTime.parse(appointmentDateTimeUTC.toString() + 'Z').toLocal();

    //calculating date time of appointment
    var appointmentEndDateTimeUTC = DateFormat('yyyy-MM-DD HH:mm').parse(
        DateFormat('yyyy-MM-DD')
            .parse(widget.historyModel.date)
            .toString()
            .split(" ")[0] +
            " " +
            DateFormat("HH:mm")
                .parse(widget.historyModel.endTime)
                .toString()
                .split(" ")[1]);
    //calculating local time
    var appointmentEndDateTimeLocal =
    DateTime.parse(appointmentEndDateTimeUTC.toString() + 'Z').toLocal();
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Container(
        margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
        child: Divider(
          thickness: 1,
          color: CustomColors.grey1,
        ),
      ),
      singleTile(Strings.purposeOfVisit, widget.historyModel.purpose),
      singleTile(
        Strings.appointmentSlot,
        " " +
            (DateFormat("hh:mm").format(appointmentDateTimeLocal)) +
            ' - ' +
            (DateFormat("hh:mm a").format(appointmentEndDateTimeLocal)) +
            "\n" +
            DateFormat(" EEEE, dd MMM yyyy").format(appointmentDateTimeLocal),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                patientTitleColumn(),
                patientValueColumn(),
              ],
            ),
          ),
        ],
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Divider(
          thickness: 1,
          color: CustomColors.grey1,
        ),
      )
    ]);
  }

  patientTitleColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: Strings.patientName,
          fontSize: 15,
          margin: EdgeInsets.only(bottom: 5),
        ),
        CustomText(
          text: Strings.patientAge,
          fontSize: 15,
          margin: EdgeInsets.only(bottom: 5),
        ),
        CustomText(
          text: Strings.patientGender,
          fontSize: 15,
          margin: EdgeInsets.only(bottom: 5),
        ),
        CustomText(
          text: Strings.patientHeight,
          fontSize: 15,
          margin: EdgeInsets.only(bottom: 5),
        ),
        CustomText(
          text: Strings.weight,
          fontSize: 15,
          margin: EdgeInsets.only(bottom: 5),
        ),
      ],
    );
  }

  patientValueColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          margin: EdgeInsets.only(bottom: 5),
          text: Provider
              .of<UserProvider>(context, listen: false)
              .firstname +
              " " +
              Provider
                  .of<UserProvider>(context, listen: false)
                  .lastname,
          textAlign: TextAlign.start,
          fontSize: 15,
          color: CustomColors.grey2,
        ),
        CustomText(
          margin: EdgeInsets.only(bottom: 5),
          text: (DateTime
              .now()
              .year -
              int.parse(
                  Provider
                      .of<UserProvider>(context, listen: false)
                      .biometrics
                      .dob
                      .split('-')[2]))
              .toString() +
              " " +
              Strings.years,
          textAlign: TextAlign.start,
          fontSize: 15,
          color: CustomColors.grey2,
        ),
        CustomText(
          margin: EdgeInsets.only(bottom: 5),
          text: Provider
              .of<UserProvider>(context, listen: false)
              .biometrics
              .gender,
          textAlign: TextAlign.start,
          fontSize: 15,
          color: CustomColors.grey2,
        ),
        CustomText(
          margin: EdgeInsets.only(bottom: 5),
          text: Provider
              .of<UserProvider>(context, listen: false)
              .biometrics
              .height
              .toString() +
              ((Provider
                  .of<UserProvider>(context, listen: false)
                  .biometrics
                  .unit ==
                  Strings.metric)
                  ? Strings.cms
                  : Strings.ins),
          textAlign: TextAlign.start,
          fontSize: 15,
          color: CustomColors.grey2,
        ),
        CustomText(
          margin: EdgeInsets.only(bottom: 5),
          text: Provider
              .of<UserProvider>(context, listen: false)
              .biometrics
              .weight
              .toString() +
              ((Provider
                  .of<UserProvider>(context, listen: false)
                  .biometrics
                  .unit ==
                  Strings.metric)
                  ? Strings.kgs
                  : Strings.lbs),
          textAlign: TextAlign.start,
          fontSize: 15,
          color: CustomColors.grey2,
        ),
      ],
    );
  }

  Container singleTile(String title, String value, {bool isvisivle = true}) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 30,
              ),
              CustomText(
                text: title,
                fontSize: 15,
              ),
              SizedBox(
                width: 10,
              ),
              CustomText(
                text: value,
                textAlign: TextAlign.start,
                fontSize: 15,
                color: CustomColors.grey2,
              )
            ],
          ),
          if (isvisivle)
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Divider(
                thickness: 1,
                color: CustomColors.grey1,
              ),
            )
        ],
      ),
    );
  }

  Padding bottomDocCard() {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 5,
          ),
          docLocation(),
        ],
      ),
    );
  }

  Row docLocation() {
    return Row(
      children: [
        CustomText(
          text: Strings.address,
          fontSize: 15.0,
        ),
        SizedBox(
          width: 10,
        ),
        Flexible(
          child: CustomText(
            margin: EdgeInsets.only(right: 3),
            textAlign: TextAlign.left,
            maxLines: 3,
            text:
            ((widget.historyModel.doctor.userProfile.address.region ?? "")
                .length ==
                0 &&
                (widget.historyModel.doctor.userProfile.address.state ??
                    "")
                    .length ==
                    0 &&
                (widget.historyModel.doctor.userProfile.address
                    .country ??
                    "")
                    .length ==
                    0)
                ? 'N.A'
                : ("${widget.historyModel.doctor.userProfile.address.state
                ?.isEmpty ?? true ? '' : widget.historyModel.doctor.userProfile
                .address.state + ', '}${widget.historyModel.doctor.userProfile
                .address.region?.isEmpty ?? true ? '' : widget.historyModel
                .doctor.userProfile.address.region + ', '}${widget?.historyModel
                ?.doctor?.userProfile?.address?.country?.isEmpty ?? true
                ? ''
                : widget.historyModel.doctor.userProfile.address.country}"),
            color: CustomColors.grey2,
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }

  Widget doctorDetials(double screenHeight, double screenWidth) {
    return Container(
      width: screenWidth,
      child: Column(
        children: [
          topDocCard(screenWidth),
          SizedBox(height: 20),
          bottomDocCard(),
        ],
      ),
    );
  }

  Container docNameAndExp(screenWidth) {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 30),
      // width: screenWidth * .68,
      height: CommonWidgets().getHeight(context) * 0.1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            width: screenWidth * .66,
            textAlign: TextAlign.left,
            text: "Dr. " +
                widget.historyModel.doctor.firstName +
                " " +
                widget.historyModel.doctor.lastName,
            fontSize: 20.0,
          ),
          SizedBox(
            height: 5,
          ),
          CustomText(
            maxLines: 2,
            textAlign: TextAlign.left,
            text: widget.historyModel.doctor.userProfile.enrollmentInformation
                .speciality[0],
            color: CustomColors.grey2,
            fontSize: 16.0,
          ),
          SizedBox(
            height: 2,
          ),
          CustomText(
            text: widget.historyModel.doctor.email,
            width: screenWidth * .66,
            textAlign: TextAlign.left,
            color: CustomColors.grey2,
            fontSize: 14.0,
          )
        ],
      ),
    );
  }

  Row topDocCard(screenWidth) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(top: 20, left: 20),
          child: CommonWidgets.userImgeLoader(
              imageUrl: widget.historyModel.doctor.userProfile.profileImage,
              size: 75),
        ),
        docNameAndExp(screenWidth),
      ],
    );
  }

  Widget prescColumnTitle({PrescribedDrugs medicineModel}) {
    return Padding(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            margin: EdgeInsets.only(left: 30),
            maxLines: 3,
            width: 70,
            text: medicineModel != null
                ? medicineModel.drugName.isEmpty
                ? 'N.A.'
                : medicineModel.drugName
                : Strings.drugName,
            textAlign: TextAlign.left,
            fontSize: FontStyles.small,
            color: medicineModel == null
                ? CustomColors.black1
                : CustomColors.grey2,
            fontWeight: medicineModel == null
                ? FontWeight.bold
                : FontStyles.semiBoldFontWeight400,
          ),
          Center(
            child: CustomText(
              textAlign: TextAlign.left,
              text: medicineModel != null
                  ? medicineModel.unit.toString()
                  : Strings.drugUnit,
              fontSize: FontStyles.small,
              color: medicineModel == null
                  ? CustomColors.black1
                  : CustomColors.grey2,
              fontWeight: medicineModel == null
                  ? FontWeight.bold
                  : FontStyles.semiBoldFontWeight400,
            ),
          ),
          CustomText(
            maxLines: 3,
            margin: EdgeInsets.only(left: 30, right: 10),
            width: 70,
            text: medicineModel != null
                ? medicineModel.dosage.isEmpty
                ? 'N.A.'
                : medicineModel.dosage
                : Strings.drugdosage,
            color: medicineModel == null
                ? CustomColors.black1
                : CustomColors.grey2,
            fontSize: FontStyles.small,
            textAlign: TextAlign.left,
            fontWeight: medicineModel == null
                ? FontWeight.bold
                : FontStyles.semiBoldFontWeight400,
          ),
        ],
      ),
    );
  }

  // prescriptionDetailModel
  //                 ?.data?.prescriptions[index].pharmacyOrderItem

  Widget prescColumnTitle1({PharmacyOrderItem1 pharmacyOrderItem}) {
    return Padding(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            margin: EdgeInsets.only(left: 30),
            maxLines: 3,
            width: 70,
            text: pharmacyOrderItem != null
                ? pharmacyOrderItem.remarks.isEmpty
                ? 'N.A.'
                : pharmacyOrderItem.remarks
                : Strings.remarks,
            textAlign: TextAlign.left,
            fontSize: FontStyles.small,
            color: pharmacyOrderItem == null
                ? CustomColors.black1
                : CustomColors.grey2,
            fontWeight: pharmacyOrderItem == null
                ? FontWeight.bold
                : FontStyles.semiBoldFontWeight400,
          ),
        ],
      ),
    );
  }

  Widget imagingColumnTitle(
      {Imaging imaging, String facility, String additionalClinicalData}) {
    return Padding(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: CustomText(
                  margin: EdgeInsets.only(left: 30),
                  maxLines: 3,
                  text: imaging != null
                      ? ((facility?.isEmpty ?? true) ? 'N.A.' : facility)
                      : 'Imaging Facility',
                  textAlign: TextAlign.left,
                  fontSize: FontStyles.small,
                  color: imaging == null
                      ? CustomColors.black1
                      : CustomColors.grey2,
                  fontWeight: imaging == null
                      ? FontWeight.bold
                      : FontStyles.semiBoldFontWeight400,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 2,
                child: CustomText(
                  maxLines: 2,
                  textAlign: TextAlign.left,
                  text: imaging != null
                      ? ((imaging?.bodyPart?.isEmpty ?? true)
                      ? 'N.A.'
                      : imaging.bodyPart)
                      : 'Body Part',
                  fontSize: FontStyles.small,
                  color: imaging == null
                      ? CustomColors.black1
                      : CustomColors.grey2,
                  fontWeight: imaging == null
                      ? FontWeight.bold
                      : FontStyles.semiBoldFontWeight400,
                ),
              ),
              Expanded(
                flex: 2,
                child: CustomText(
                  maxLines: 3,
                  margin: EdgeInsets.only(left: 30, right: 10),
                  text: imaging != null
                      ? ((imaging?.imagingType?.isEmpty ?? true)
                      ? 'N.A.'
                      : imaging.imagingType) ??
                      'N.A.'
                      : 'Imaging Type',
                  color: imaging == null
                      ? CustomColors.black1
                      : CustomColors.grey2,
                  fontSize: FontStyles.small,
                  textAlign: TextAlign.left,
                  fontWeight: imaging == null
                      ? FontWeight.bold
                      : FontStyles.semiBoldFontWeight400,
                ),
              ),
              Expanded(
                flex: 2,
                child: CustomText(
                  maxLines: 3,
                  margin: EdgeInsets.only(left: 30, right: 10),
                  text: imaging != null
                      ? ((imaging?.withContrast == null)
                      ? 'N.A.'
                      : imaging.withContrast.toString()) ??
                      'N.A.'
                      : 'With Contrast',
                  color: imaging == null
                      ? CustomColors.black1
                      : CustomColors.grey2,
                  fontSize: FontStyles.small,
                  textAlign: TextAlign.left,
                  fontWeight: imaging == null
                      ? FontWeight.bold
                      : FontStyles.semiBoldFontWeight400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget imagingColumnTitle1(
      {Imaging imaging, String facility, String additionalClinicalData}) {
    return Padding(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                //  flex: 2,
                child: CustomText(
                  margin: EdgeInsets.only(left: 30),
                  maxLines: 3,
                  text: additionalClinicalData != null
                      ? ((additionalClinicalData?.isEmpty ?? true)
                      ? 'N.A.'
                      : additionalClinicalData)
                      : 'Additional Clinical Data',
                  textAlign: TextAlign.left,
                  fontSize: FontStyles.small,
                  color: additionalClinicalData == null
                      ? CustomColors.black1
                      : CustomColors.grey2,
                  fontWeight: additionalClinicalData == null
                      ? FontWeight.bold
                      : FontStyles.semiBoldFontWeight400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget labColumnTitle({LabOrderItem labOrderItem}) {
    return Padding(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      child: Row(
        children: [
          CustomText(
            width: 70,
            margin: EdgeInsets.only(left: 30),
            maxLines: 3,
            text: labOrderItem != null
                ? (labOrderItem?.laboratory?.isEmpty ?? true)
                ? 'N.A'
                : labOrderItem?.laboratory
                : 'Laboratory',
            textAlign: TextAlign.left,
            fontSize: FontStyles.small,
            color:
            labOrderItem == null ? CustomColors.black1 : CustomColors.grey2,
            fontWeight: labOrderItem == null
                ? FontWeight.bold
                : FontStyles.semiBoldFontWeight400,
          ),
          if (labOrderItem == null)
            Expanded(
              child: CustomText(
                width: 70,
                margin: EdgeInsets.only(left: 30),
                maxLines: 3,
                text: 'Lab Tests',
                textAlign: TextAlign.left,
                fontSize: FontStyles.small,
                color: labOrderItem == null
                    ? CustomColors.black1
                    : CustomColors.grey2,
                fontWeight: labOrderItem == null
                    ? FontWeight.bold
                    : FontStyles.semiBoldFontWeight400,
              ),
            ),
          if (labOrderItem != null)
            Column(
              children: [
                for (int i = 0;
                i < labOrderItem.labRequisition.labTests.length;
                i++)
                  CustomText(
                    margin: EdgeInsets.only(left: 30, right: 20, bottom: 5),
                    width: MediaQuery
                        .of(context)
                        .size
                        .width / 2,
                    maxLines: 10,
                    text: labOrderItem.labRequisition.labTests[i],
                    textAlign: TextAlign.left,
                    fontSize: FontStyles.small,
                    color: labOrderItem == null
                        ? CustomColors.black1
                        : CustomColors.grey2,
                    fontWeight: labOrderItem == null
                        ? FontWeight.bold
                        : FontStyles.semiBoldFontWeight400,
                  ),
              ],
            )
        ],
      ),
    );
  }

  Widget labColumnTitle1({LabOrderItem labOrderItem}) {
    return Padding(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      child: Row(
        children: [
          CustomText(
            width: 150,
            margin: EdgeInsets.only(left: 30),
            maxLines: 3,
            text: labOrderItem != null
                ? (labOrderItem?.laboratory?.isEmpty ?? true)
                ? 'N.A'
                : labOrderItem?.additionalClinicalData
                : 'Additional Clinical Data:',
            textAlign: TextAlign.left,
            fontSize: FontStyles.small,
            color:
            labOrderItem == null ? CustomColors.black1 : CustomColors.grey2,
            fontWeight: labOrderItem == null
                ? FontWeight.bold
                : FontStyles.semiBoldFontWeight400,
          ),
        ],
      ),
    );
  }
}

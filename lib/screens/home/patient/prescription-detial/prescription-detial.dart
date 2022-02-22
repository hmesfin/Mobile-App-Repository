// import 'package:virtudoc_app/index.dart';

// class PrescriptionDetial extends StatefulWidget {
//   final PrescriptionModel prescriptionModel;

//   const PrescriptionDetial({Key key, this.prescriptionModel}) : super(key: key);
//   @override
//   _PrescriptionDetialState createState() => _PrescriptionDetialState();
// }

// class _PrescriptionDetialState extends State<PrescriptionDetial> {
//   @override
//   void initState() {
//     super.initState();
//     print(widget.prescriptionModel.prescription.length);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: CustomColors.bg_app,
//         body: prescriptionDetailBody(context),
//       ),
//     );
//   }

//   Widget prescriptionDetailBody(BuildContext context) {
//     return Column(
//       children: [
//         CustomTopBar(
//             context: context, titleText: Strings.prescriptionDetailhead),
//         CustomText(
//           fontSize: FontStyles.size24,
//           fontWeight: FontStyles.semiBoldFontWeight400,
//           text: Strings.consultDetials,
//         ),
//         CustomText(
//           fontSize: FontStyles.large,
//           fontWeight: FontStyles.semiBoldFontWeight400,
//           text: widget.prescriptionModel.doctorName,
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         CommonWidgets.divider,
//         SizedBox(
//           height: 10,
//         ),
//         pharmacyDetials(context),
//         SizedBox(
//           height: 10,
//         ),
//         CommonWidgets.divider,
//         SizedBox(
//           height: 10,
//         ),
//         CustomText(
//           width: CommonWidgets().getWidth(context) * 0.87,
//           alignment: Alignment.centerLeft,
//           fontSize: FontStyles.medium,
//           fontWeight: FontStyles.semiBoldFontWeight400,
//           text: Strings.prescDetails,
//         ),
//         columnTitle(),
//         prescriptionList()
//       ],
//     );
//   }

//   Column pharmacyDetials(BuildContext context) {
//     return Column(
//       children: [
//         CustomText(
//           width: CommonWidgets().getWidth(context) * 0.87,
//           fontSize: FontStyles.medium,
//           alignment: Alignment.centerLeft,
//           fontWeight: FontStyles.semiBoldFontWeight400,
//           text: Strings.pharmacyDetials,
//         ),
//         CustomText(
//           margin: EdgeInsets.symmetric(vertical: 5),
//           width: CommonWidgets().getWidth(context) * 0.87,
//           alignment: Alignment.centerLeft,
//           fontSize: FontStyles.normal,
//           fontWeight: FontStyles.semiBoldFontWeight400,
//           text: widget.prescriptionModel.pharmacyName,
//         ),
//         contact(),
//         address(),
//       ],
//     );
//   }

//   Widget contact() {
//     return Container(
//       width: CommonWidgets().getWidth(context) * 0.87,
//       alignment: Alignment.centerLeft,
//       child: RichText(
//         text: TextSpan(children: [
//           TextSpan(
//               style: const TextStyle(
//                 color: CustomColors.black1,
//                 fontWeight: FontStyles.semiBoldFontWeight400,
//                 fontSize: FontStyles.normal,
//               ),
//               text: Strings.contact),
//           TextSpan(
//               style: const TextStyle(
//                 color: CustomColors.grey2,
//                 fontWeight: FontStyles.semiBoldFontWeight400,
//                 fontSize: FontStyles.normal,
//               ),
//               text: widget.prescriptionModel.phoneNumber)
//         ]),
//       ),
//     );
//   }

//   Widget address() {
//     return Container(
//       width: CommonWidgets().getWidth(context) * 0.87,
//       margin: EdgeInsets.only(top: 5),
//       child: RichText(
//         text: TextSpan(children: [
//           TextSpan(
//               style: const TextStyle(
//                 color: CustomColors.black1,
//                 fontWeight: FontStyles.semiBoldFontWeight400,
//                 fontSize: FontStyles.normal,
//               ),
//               text: Strings.address),
//           TextSpan(
//               style: const TextStyle(
//                 color: CustomColors.grey2,
//                 fontWeight: FontStyles.semiBoldFontWeight400,
//                 fontSize: FontStyles.normal,
//               ),
//               text: widget.prescriptionModel.address)
//         ]),
//       ),
//     );
//   }

//   Expanded prescriptionList() {
//     return Expanded(
//       child: ListView.builder(
//         physics: BouncingScrollPhysics(),
//         itemCount: widget.prescriptionModel.prescription.length,
//         shrinkWrap: true,
//         itemBuilder: (context, index) => columnTitle(
//             medicineModel: widget.prescriptionModel.prescription[index]),
//       ),
//     );
//   }

//   Padding columnTitle({MedicineModel medicineModel}) {
//     return Padding(
//       padding: EdgeInsets.only(left: 25, right: 10, top: 10, bottom: 10),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           CustomText(
//             width: 70,
//             text: medicineModel != null
//                 ? medicineModel.medName
//                 : Strings.drugName,
//             textAlign: TextAlign.left,
//             fontSize: FontStyles.small,
//             color: medicineModel == null
//                 ? CustomColors.black1
//                 : CustomColors.grey2,
//             fontWeight: FontStyles.semiBoldFontWeight400,
//           ),
//           Center(
//             child: CustomText(
//               textAlign: TextAlign.left,
//               text:
//                   medicineModel != null ? medicineModel.unit : Strings.drugUnit,
//               fontSize: FontStyles.small,
//               color: medicineModel == null
//                   ? CustomColors.black1
//                   : CustomColors.grey2,
//               fontWeight: FontStyles.semiBoldFontWeight400,
//             ),
//           ),
//           CustomText(
//             width: 70,
//             text: medicineModel != null
//                 ? medicineModel.dosage
//                 : Strings.drugdosage,
//             color: medicineModel == null
//                 ? CustomColors.black1
//                 : CustomColors.grey2,
//             fontSize: FontStyles.small,
//             textAlign: TextAlign.left,
//             fontWeight: FontStyles.semiBoldFontWeight400,
//           ),
//         ],
//       ),
//     );
//   }
// }

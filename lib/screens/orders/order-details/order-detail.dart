import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/screens/home/patient/patientBottom_provider.dart';
import 'package:virtudoc_app/screens/orders/model/orders_listing_response.dart';
import 'package:virtudoc_app/utils/screen_tracker/screen_tracker.dart';
import '../../../.../../index.dart';

class OrderDetail extends StatefulWidget {
  final OrderListingItem item;
  OrderDetail(this.item);
  // imaging pharmacy lab
  @override
  _OrderDetailState createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  var _additionalClinicalController = TextEditingController();
  var _additionalClinicalLabController = TextEditingController();
  var _additionalClinicalPharmacyController = TextEditingController();
  var searchController = TextEditingController();
  List<String> selectedLabs = [];
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Provider.of<PlaceOrderProvider>(context, listen: false).init(
          doctorId: widget.item.order.doctor_id,
          appointmentId: widget.item.order.appointment_id,
          patientId: widget.item.order.patient_id);
      Provider.of<PlaceOrderProvider>(context, listen: false).setLabSelected(
          (widget.item.requisition.requisition_type ==
              Strings.lab.toLowerCase()));
      Provider.of<PlaceOrderProvider>(context, listen: false)
          .setImagingSelected((widget.item.requisition.requisition_type ==
              Strings.imaging_txt.toLowerCase()));
      Provider.of<PlaceOrderProvider>(context, listen: false)
          .setPharmacySelected((widget.item.requisition.requisition_type ==
              Strings.pharmacy.toLowerCase()));

      if (Provider.of<PlaceOrderProvider>(context, listen: false)
          .isImagingSelected) {
        _additionalClinicalController.text =
            widget.item.imaging_order_item.additional_clinical_data;
        Provider.of<PlaceOrderProvider>(context, listen: false)
            .selectImagingController
            .text = widget.item.imaging_order_item.imaging_facility;

        Provider.of<PlaceOrderProvider>(context, listen: false)
            .setImagingTypeController(widget.item);
      }
      if (Provider.of<PlaceOrderProvider>(context, listen: false)
          .isLabSelected) {
        selectedLabs = widget.item.lab_order_item.lab_requisition.lab_tests;

        _additionalClinicalLabController.text =
            widget.item.lab_order_item.additional_clinical_data;

        Provider.of<PlaceOrderProvider>(context, listen: false)
            .setLabTypeController(widget.item);
      }
      if (Provider.of<PlaceOrderProvider>(context, listen: false)
          .isPharmacySelected) {
        _additionalClinicalPharmacyController.text =
            widget.item.pharmacy_order_item.remarks;

        Provider.of<PlaceOrderProvider>(context, listen: false)
            .setPharmacyTypeController(widget.item);
      }

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    double appbarheight = appBar.preferredSize.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height - appbarheight;
    return SafeArea(
        child: Scaffold(
      backgroundColor: CustomColors.bg_app,
      body: Consumer<PlaceOrderProvider>(
          builder: (context, model, child) => ModalProgressHUD(
                child: SingleChildScrollView(
                  child: parentContainer(screenHeight, screenWidth, context),
                ),
                inAsyncCall: model.isLoading,
                progressIndicator: CircularProgressIndicator(
                  valueColor:
                      new AlwaysStoppedAnimation<Color>(CustomColors.blue),
                ),
              )),
    ));
  }

  var requestType = 'upcomming';
  Container parentContainer(
      double screenHeight, double screenWidth, BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CustomTopBar(
            context: context,
            titleText: Strings.placeOrderHeading,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
            child: form(context),
          ),
          SizedBox(height: 10),
          Consumer<PlaceOrderProvider>(
              builder: (context, model, child) => Center(
                      child: CommonWidgets().roundButton(
                          Strings.submit, context, onTap: () async {
                    model.imaging_order_item.additional_clinical_data =
                        _additionalClinicalController.text;
                    model.lab_order_item.additional_clinical_data =
                        _additionalClinicalLabController.text;
                    model.lab_order_item.lab_requisition.lab_tests =
                        selectedLabs;
                    model.pharmacy_order_item.doctors_note =
                        _additionalClinicalPharmacyController.text;

                    FocusScope.of(context).requestFocus(FocusNode());
                    model.placeOrder(
                        item: widget.item,
                        masterOrderId: widget.item.master_order_id,
                        fromEditOrder: true,
                        failure: (message) {
                          CommonWidgets.showToast(
                              context, message, _scaffoldKey);
                        },
                        success: (isempty, message) {
                          if (isempty) {
                            CommonWidgets().showOkPopup(
                                context,
                                Strings.orderEditedSuccessHeader,
                                message, onTapp: () {
                              Provider.of<PatientBottomProvider>(context,
                                      listen: false)
                                  .onItemTapped(0);
                              Navigator.of(context)
                                  .popUntil((route) => route.isFirst);
                            });
                          } else {
                            Provider.of<PatientBottomProvider>(context,
                                    listen: false)
                                .onItemTapped(0);
                            Navigator.of(context)
                                .popUntil((route) => route.isFirst);
                          }
                        });
                  }))),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget form(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
            text: Strings.prescriptionOrRequisition,
            fontWeight: FontStyles.boldFontWeight600),
        SizedBox(height: 10.0),
        Consumer<PlaceOrderProvider>(
            builder: (context, model, child) => FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      // imaging pharmacy lab
                      // if (widget.item.requisition.requisition_type ==
                      // Strings.pharmacy.toLowerCase())
                      if (widget.item.requisition.requisition_type ==
                          Strings.pharmacy.toLowerCase())
                        GestureDetector(
                          child: Row(
                            children: [
                              Checkbox(
                                  activeColor: CustomColors.blue,
                                  value: model.isPharmacySelected,
                                  onChanged: (newValue) {
                                    // model.setPharmacy();
                                  }),
                              CustomText(
                                  text: Strings.pharmacy,
                                  fontSize: FontStyles.header_back,
                                  color: CustomColors.grey2,
                                  fontWeight: FontStyles.semiBoldFontWeight500)
                            ],
                          ),
                          onTap: () {
                            // model.setPharmacy();
                          },
                        ),
                      // if (widget.item.requisition.requisition_type ==
                      //     Strings.lab.toLowerCase())
                      if (widget.item.requisition.requisition_type ==
                          Strings.lab.toLowerCase())
                        GestureDetector(
                          child: Row(
                            children: [
                              Checkbox(
                                  activeColor: CustomColors.blue,
                                  value: model.isLabSelected,
                                  onChanged: (newValue) {
                                    // model.setLab();
                                  }),
                              CustomText(
                                  text: Strings.lab,
                                  fontSize: FontStyles.header_back,
                                  color: CustomColors.grey2,
                                  fontWeight: FontStyles.semiBoldFontWeight500)
                            ],
                          ),
                          onTap: () {
                            // model.setLab();
                          },
                        ),
                      // if (widget.item.requisition.requisition_type ==
                      //     Strings.imaging_txt.toLowerCase())
                      if (widget.item.requisition.requisition_type ==
                          Strings.imaging_txt.toLowerCase())
                        GestureDetector(
                          child: Row(
                            children: [
                              Checkbox(
                                  activeColor: CustomColors.blue,
                                  value: model.isImagingSelected,
                                  onChanged: (newValue) {
                                    // model.setImaging();
                                  }),
                              CustomText(
                                  text: Strings.imaging,
                                  fontSize: FontStyles.header_back,
                                  color: CustomColors.grey2,
                                  fontWeight: FontStyles.semiBoldFontWeight500)
                            ],
                          ),
                          onTap: () {
                            // model.setImaging();
                          },
                        )
                    ],
                  ),
                )),
        Divider(
          height: 1.5,
          color: Colors.grey,
        ),
        Consumer<PlaceOrderProvider>(
            builder: (context, model, child) => model.isPharmacySelected
                ? pharmacyWidget(context)
                : Container()),
        Consumer<PlaceOrderProvider>(
            builder: (context, model, child) =>
                model.isLabSelected ? labWidget(context) : Container()),
        Consumer<PlaceOrderProvider>(
            builder: (context, model, child) =>
                model.isImagingSelected ? imagingWidget(context) : Container()),
      ],
    );
  }

  Widget pharmacyWidget(context) {
    return Consumer<PlaceOrderProvider>(
        builder: (context, model, child) => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                CustomText(
                    text: Strings.selectPharmacy,
                    fontSize: FontStyles.large,
                    fontWeight: FontStyles.semiBoldFontWeight500),
                Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0)),
                            border:
                                Border.all(color: CustomColors.grey3, width: 1),
                            color: CustomColors.white),
                        child: Consumer<PlaceOrderProvider>(
                            builder: (context, model, child) => PopupMenuButton(
                                offset: Offset(0.1, 0),
                                onSelected: (item) {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                  model.selectPharmacyController.text =
                                      item.requisition_name;
                                  model.pharmacy_order_item.pharmacy =
                                      item.requisition_name;
                                  model.pharmacy_order_item.requisition_id =
                                      item.id;
                                  model.pharmacy_order_item.type = 0;
                                },
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 20, right: 5, top: 2),
                                    child: TextFormField(
                                        onTap: () {
                                          screenTracker.stopTimer();
                                          screenTracker.startTimer(context);
                                        },
                                        onChanged: (text) {},
                                        controller:
                                            model.selectPharmacyController,
                                        enabled: false,
                                        decoration: InputDecoration(
                                            hintText: Strings.selectPharmacy,
                                            hintStyle: TextStyle(
                                              color: Colors.grey,
                                            ),
                                            suffixIcon: ImageIcon(
                                                AssetImage(
                                                    "assets/images/ic_drop_down1.png"),
                                                color: CustomColors.grey2),
                                            border: InputBorder.none),
                                        maxLines: 1)),
                                itemBuilder: (context) => model.pharmacyTypeList
                                    .map((item) => PopupMenuItem(
                                        value: item,
                                        child:
                                            Text(item.requisition_name ?? "")))
                                    .toList())))),
                Padding(
                    padding: EdgeInsets.only(left: 7, top: 15, bottom: 10.0),
                    child: CustomText(
                        text: Strings.prescribedDrugs,
                        fontSize: FontStyles.large,
                        fontWeight: FontStyles.boldFontWeight600)),
                Container(
                  padding: EdgeInsets.only(
                      left: 10.0, right: 10.0, top: 5.0, bottom: 10.0),
                  alignment: Alignment.center,
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: model.drugsNameControllers.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SizedBox(
                              height: 10.0,
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonWidgets().customFormFieldController(
                                  context,
                                  Strings.drugMedicineName,
                                  TextInputAction.done,
                                  readOnly: true,
                                  onChanged: (text) {
                                    // model.pharmacy_order_item.prescribed_drugs
                                    //     .elementAt(index)
                                    //     .drug_name = text.toString().trim();
                                  },
                                  inputType: TextInputType.text,
                                  controller: model.drugsNameControllers
                                      .elementAt(index),
                                ),
                                SizedBox(
                                  width: 10.0,
                                  height: 3,
                                ),
                                CommonWidgets().customFormFieldController(
                                    context,
                                    Strings.units,
                                    TextInputAction.done,
                                    readOnly: true, onChanged: (text) {
                                  // model.pharmacy_order_item.prescribed_drugs
                                  //         .elementAt(index)
                                  //         .unit =
                                  //     int.parse(text.toString().trim());
                                },
                                    maxLenghth: 3,
                                    inPutFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]')),
                                    ],
                                    inputType: TextInputType.number,
                                    controller: model.unitsControllers
                                        .elementAt(index)),
                                SizedBox(width: 10.0, height: 3),
                                CommonWidgets().customFormFieldController(
                                    context,
                                    Strings.dossage,
                                    TextInputAction.done,
                                    readOnly: true, onChanged: (text) {
                                  // model.pharmacy_order_item.prescribed_drugs
                                  //     .elementAt(index)
                                  //     .dosage = text.toString().trim();
                                },
                                    inputType: TextInputType.text,
                                    controller: model.dosageControllers
                                        .elementAt(index)),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                            // index + 1 == model.drugsNameControllers.length
                            //     ? Consumer<PlaceOrderProvider>(
                            //         builder: (context, model, child) =>
                            //             FlatButton(
                            //               padding: EdgeInsets.zero,
                            //               onPressed: () {
                            //                 model.addPrescribedDrugs();
                            //               },
                            //               child: Container(
                            //                 child: Row(
                            //                   children: [
                            //                     Icon(
                            //                       Icons.add,
                            //                       color: Colors.blueAccent,
                            //                       size: 20,
                            //                     ),
                            //                     CustomText(
                            //                       text: Strings.addRowS,
                            //                       fontSize: FontStyles.size15,
                            //                       fontWeight: FontWeight.w500,
                            //                       color: Colors.blueAccent,
                            //                     )
                            //                   ],
                            //                 ),
                            //                 padding: EdgeInsets.all(10.0),
                            //               ),
                            //             ))
                            //     : Container()
                          ],
                        );
                      }),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                          color: Colors.grey.withOpacity(0.5), width: 1),
                      color: Colors.grey.withOpacity(0.5)),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 7, top: 15),
                    child: CustomText(
                        text: Strings.remarks,
                        fontSize: FontStyles.medium,
                        fontWeight: FontStyles.semiBoldFontWeight400)),
                Container(
                    margin: EdgeInsets.only(top: 10),
                    height: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(color: CustomColors.grey3, width: 1),
                        color: CustomColors.white),
                    child: Padding(
                        padding: EdgeInsets.only(top: 10.0, left: 20),
                        child: Consumer<PlaceOrderProvider>(
                            builder: (context, model, child) => TextFormField(
                                onTap: () {
                                  screenTracker.stopTimer();
                                  screenTracker.startTimer(context);
                                },
                                maxLines: 5,
                                readOnly: true,
                                decoration: InputDecoration(
                                    hintText: Strings.typeHere,
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none),
                                controller:
                                    _additionalClinicalPharmacyController,
                                onChanged: (text) {
                                  model.pharmacy_order_item.doctors_note =
                                      text.trim();
                                })))),
              ],
            ));
  }

  Widget labWidget(context) {
    return Consumer<PlaceOrderProvider>(
        builder: (context, model, child) => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                CustomText(
                    text: Strings.selectLaboratory,
                    fontSize: FontStyles.large,
                    fontWeight: FontStyles.semiBoldFontWeight500),
                Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0)),
                            border:
                                Border.all(color: CustomColors.grey3, width: 1),
                            color: CustomColors.white),
                        child: Consumer<PlaceOrderProvider>(
                            builder: (context, model, child) => PopupMenuButton(
                                offset: Offset(0.1, 0),
                                onSelected: (item) {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                  model.selectLabController.text =
                                      item.requisition_name;
                                  model.lab_order_item.laboratory =
                                      item.requisition_name;
                                  model.lab_order_item.requisition_id = item.id;
                                  model.lab_order_item.type = 1;
                                },
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 20, right: 5, top: 2),
                                    child: TextFormField(
                                        onTap: () {
                                          screenTracker.stopTimer();
                                          screenTracker.startTimer(context);
                                        },
                                        onChanged: (text) {},
                                        controller: model.selectLabController,
                                        enabled: false,
                                        decoration: InputDecoration(
                                            hintText: Strings.selectLaboratory,
                                            hintStyle: TextStyle(
                                              color: Colors.grey,
                                            ),
                                            suffixIcon: ImageIcon(
                                                AssetImage(
                                                    "assets/images/ic_drop_down1.png"),
                                                color: CustomColors.grey2),
                                            border: InputBorder.none),
                                        maxLines: 1)),
                                itemBuilder: (context) => model.labTypeList
                                    .map((item) => PopupMenuItem(
                                        value: item,
                                        child:
                                            Text(item.requisition_name ?? "")))
                                    .toList())))),
                // Padding(
                //     padding: EdgeInsets.only(top: 20),
                //     child: Container(
                //       width: double.infinity,
                //       height: 50,
                //       decoration: BoxDecoration(
                //           borderRadius: BorderRadius.all(Radius.circular(25.0)),
                //           border:
                //               Border.all(color: CustomColors.grey3, width: 1),
                //           color: CustomColors.white),
                //       child: Container(
                //         child: CommonWidgets().roundButton(
                //           'Lab Lists',
                //           context,
                //           onTap: () async {
                //             FocusScope.of(context).requestFocus(FocusNode());
                //             await showDialog(
                //               //Your Dialog Code
                //               barrierDismissible: true,
                //               context: context,
                //               child: Consumer<LabTestProvider>(
                //                 builder: (context, model, child) => Builder(
                //                   builder: (context) => Dialog(
                //                     backgroundColor: CustomColors.bg_app,
                //                     shape: RoundedRectangleBorder(
                //                       borderRadius: BorderRadius.circular(8.0),
                //                     ),
                //                     child: Expanded(
                //                       // height: MediaQuery.of(context).size.height,
                //                       child: Column(
                //                         children: [
                //                           SizedBox(
                //                             height: 5,
                //                           ),
                //                           Container(
                //                             margin: EdgeInsets.symmetric(
                //                                 horizontal: 10.0,
                //                                 vertical: 10.0),
                //                             alignment: Alignment.centerLeft,
                //                             decoration: BoxDecoration(
                //                                 borderRadius: BorderRadius.all(
                //                                     Radius.circular(25)),
                //                                 border: Border.all(
                //                                     color: CustomColors.grey3,
                //                                     width: 1),
                //                                 color: CustomColors.white),
                //                             padding: EdgeInsets.symmetric(
                //                                 horizontal: 15),
                //                             child: TextFormField(
                //                               controller: searchController,
                //                               textAlign: TextAlign.start,
                //                               decoration: InputDecoration(
                //                                 hintText: Strings.search_here,
                //                                 hintStyle: TextStyle(
                //                                   color: Colors.grey,
                //                                 ),
                //                                 border: InputBorder.none,
                //                               ),
                //                               onChanged: (txt) {
                //                                 model.filterResults(
                //                                     searchController.text);
                //                               },
                //                             ),
                //                           ),
                //                           Expanded(
                //                             child: ListView(
                //                               children:
                //                                   // values.map((key, value) => ),
                //                                   model.filteredResults.map(
                //                                       (Map<String, String>
                //                                           element) {
                //                                 return Column(
                //                                   crossAxisAlignment:
                //                                       CrossAxisAlignment.center,
                //                                   children: [
                //                                     CheckboxListTile(
                //                                       title: Text(
                //                                           element['test_name']),
                //                                       value: model.values[
                //                                           element['test_name']],
                //                                       onChanged: (bool value) {
                //                                         selectedLabs =
                //                                             model.selectedItems;
                //                                         setState(() {
                //                                           model.values[element[
                //                                                   'test_name']] =
                //                                               value;
                //                                         });
                //                                         setState(() {});
                //                                         model.toggleCheckbox(
                //                                             element[
                //                                                 'test_name'],
                //                                             value);
                //                                       },
                //                                     ),
                //                                     Divider(
                //                                         height: 1.0,
                //                                         color: Colors.grey),
                //                                     SizedBox(height: 5.0)
                //                                   ],
                //                                 );
                //                               }).toList(),
                //                             ),
                //                           ),
                //                           Padding(
                //                               padding: EdgeInsets.symmetric(
                //                                   vertical: 10.0),
                //                               child: Center(
                //                                   child: CommonWidgets()
                //                                       .roundButton(
                //                                           Strings.ok, context,
                //                                           onTap: () async {
                //                                 Navigator.pop(context);
                //                               })))
                //                         ],
                //                       ),
                //                     ),
                //                   ),
                //                 ),
                //               ),
                //             ).then((val) {
                //               // Navigator.pop(context);
                //             });
                //           },
                //         ),
                //       ),
                //     )),

                SizedBox(
                  height: 20,
                ),
                CustomText(
                  maxLines: 10,
                  textAlign: TextAlign.left,
                  alignment: Alignment.topLeft,
                  fontSize: 14,
                  text: selectedLabs.length == 0
                      ? ''
                      : selectedLabs.reduce(
                          (value, element) => value = value + ', ' + element),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 7, top: 15, bottom: 10.0),
                    child: CustomText(
                        text: Strings.additional_clinical_data,
                        fontSize: FontStyles.large,
                        fontWeight: FontStyles.boldFontWeight600)),
                Container(
                  padding: EdgeInsets.only(
                      left: 10.0, right: 10.0, top: 5.0, bottom: 10.0),
                  alignment: Alignment.center,
                  child: Container(
                    child: TextFormField(
                      onTap: () {
                        screenTracker.stopTimer();
                        screenTracker.startTimer(context);
                      },
                      maxLength: 500,
                      readOnly: true,
                      controller: _additionalClinicalLabController,
                      // keyboardType: TextInputType.emailAddress,
                      // enabled: isSocial ? false : true,
                      decoration: InputDecoration(
                        hintText: "${Strings.additional_clinical_data}...",
                        // prefixIcon: ImageIcon(
                        //   AssetImage("assets/images/mail.png"),
                        //   color: CustomColors.grey2,
                        // ),
                        border: InputBorder.none,
                      ),
                      maxLines: 5,
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(
                        color: Colors.grey.withOpacity(0.5), width: 1),
                    // color: Colors.grey.withOpacity(0.5)
                  ),
                ),
              ],
            ));
  }

  var myGroup = AutoSizeGroup();

  Widget imagingWidget(context) {
    return Consumer<PlaceOrderProvider>(
        builder: (context, model, child) => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                CustomText(
                    text: Strings.selectImaging,
                    fontSize: FontStyles.large,
                    fontWeight: FontStyles.semiBoldFontWeight500),
                Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0)),
                            border:
                                Border.all(color: CustomColors.grey3, width: 1),
                            color: CustomColors.white),
                        child: Consumer<PlaceOrderProvider>(
                            builder: (context, model, child) => PopupMenuButton(
                                offset: Offset(0.1, 0),
                                onSelected: (item) {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                  model.selectImagingController.text =
                                      item.requisition_name;
                                  model.imaging_order_item.imaging_facility =
                                      item.requisition_name;
                                  model.imaging_order_item.requisition_id =
                                      item.id;
                                  model.imaging_order_item.type = 2;
                                },
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 20, right: 5, top: 2),
                                    child: TextFormField(
                                        onTap: () {
                                          screenTracker.stopTimer();
                                          screenTracker.startTimer(context);
                                        },
                                        onChanged: (text) {},
                                        controller:
                                            model.selectImagingController,
                                        enabled: false,
                                        decoration: InputDecoration(
                                            hintText: Strings.selectImaging,
                                            hintStyle: TextStyle(
                                              color: Colors.grey,
                                            ),
                                            suffixIcon: ImageIcon(
                                                AssetImage(
                                                    "assets/images/ic_drop_down1.png"),
                                                color: CustomColors.grey2),
                                            border: InputBorder.none),
                                        maxLines: 1)),
                                itemBuilder: (context) => model.imagingTypeList
                                    .map((item) => PopupMenuItem(
                                        value: item,
                                        child:
                                            Text(item.requisition_name ?? "")))
                                    .toList())))),
                Padding(
                    padding: EdgeInsets.only(left: 7, top: 15, bottom: 10.0),
                    child: CustomText(
                        text: Strings.imagingRequisition,
                        fontSize: FontStyles.large,
                        fontWeight: FontStyles.boldFontWeight600)),
                Container(
                  padding: EdgeInsets.only(
                      left: 10.0, right: 10.0, top: 5.0, bottom: 10.0),
                  alignment: Alignment.center,
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: model.imagingTypeControllers.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SizedBox(
                              height: 10.0,
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Flexible(
                                //   child:
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(25.0)),
                                        border: Border.all(
                                            color: CustomColors.grey3,
                                            width: 1),
                                        color: CustomColors.white),
                                    child: PopupMenuButton(
                                        offset: Offset(0.1, 0),
                                        enabled: false,
                                        onSelected: (item) {
                                          FocusScope.of(context)
                                              .requestFocus(FocusNode());
                                          // model.imagingTypeControllers
                                          //     .elementAt(index)
                                          //     .text = item;
                                          // model.imaging_order_item.imaging
                                          //     .elementAt(index)
                                          //     .imaging_type = item;
                                          // model.imaging_order_item.type = 2;

                                          if (item == "CT-Scan" ||
                                              item == "MRI") {}
                                        },
                                        child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 20, right: 5, top: 2),
                                            child: TextFormField(
                                                onTap: () {
                                                  screenTracker.stopTimer();
                                                  screenTracker
                                                      .startTimer(context);
                                                },
                                                onChanged: (text) {},
                                                readOnly: true,
                                                controller: model
                                                    .imagingTypeControllers
                                                    .elementAt(index),
                                                enabled: false,
                                                decoration: InputDecoration(
                                                    hintText:
                                                        Strings.imagingType,
                                                    hintStyle: TextStyle(
                                                      color: Colors.grey,
                                                    ),
                                                    suffixIcon:
                                                        ImageIcon(AssetImage("assets/images/ic_drop_down1.png"),
                                                            color: CustomColors
                                                                .grey2),
                                                    border: InputBorder.none),
                                                maxLines: 1)),
                                        itemBuilder: (context) => Strings
                                            .imageingTypeList
                                            .map((item) => PopupMenuItem(
                                                value: item,
                                                child: Text(item ?? "")))
                                            .toList())),
                                // flex: 5,
                                // ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                // Flexible(

                                // child:
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(25.0)),
                                        border: Border.all(
                                            color: CustomColors.grey3,
                                            width: 1),
                                        color: CustomColors.white),
                                    child: PopupMenuButton(
                                        offset: Offset(0.1, 0),
                                        enabled: false,
                                        onSelected: (item) {
                                          FocusScope.of(context)
                                              .requestFocus(FocusNode());
                                          // model.bodyPartControllers
                                          //     .elementAt(index)
                                          //     .text = item;
                                          // model.imaging_order_item.imaging
                                          //     .elementAt(index)
                                          //     .body_part = item;
                                          // model.imaging_order_item.type = 2;
                                        },
                                        child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 20, right: 5, top: 2),
                                            child: TextFormField(
                                                onTap: () {
                                                  screenTracker.stopTimer();
                                                  screenTracker
                                                      .startTimer(context);
                                                },
                                                onChanged: (text) {},
                                                readOnly: true,
                                                controller: model.bodyPartControllers
                                                    .elementAt(index),
                                                enabled: false,
                                                decoration: InputDecoration(
                                                    hintText: Strings.bodyPart,
                                                    hintStyle: TextStyle(
                                                      color: Colors.grey,
                                                    ),
                                                    suffixIcon: ImageIcon(
                                                        AssetImage(
                                                            "assets/images/ic_drop_down1.png"),
                                                        color:
                                                            CustomColors.grey2),
                                                    border: InputBorder.none),
                                                maxLines: 1)),
                                        itemBuilder: (context) => Strings.bodyPartList
                                            .map((item) => PopupMenuItem(
                                                value: item,
                                                child: Text(item ?? "")))
                                            .toList())),
                                // flex: 5,
                                // ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                model.imagingTypeControllers
                                                .elementAt(index)
                                                .text ==
                                            "CT-Scan" ||
                                        model.imagingTypeControllers
                                                .elementAt(index)
                                                .text ==
                                            "MRI"
                                    ?
                                    //  Flexible(
                                    //     // flex: 2,
                                    //     child:
                                    Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25.0)),
                                            border: Border.all(
                                                color: CustomColors.grey3,
                                                width: 1),
                                            color: CustomColors.white),
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child: Center(
                                            child: Row(
                                              children: [
                                                CustomText(
                                                  text: Strings.withContrast,
                                                  fontSize: FontStyles.medium,
                                                  color: CustomColors.black1,
                                                  fontWeight: FontStyles
                                                      .semiBoldFontWeight400,
                                                ),
                                                Expanded(
                                                  child: SizedBox(),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      10, 0.5, 10, 0.5),
                                                  child: Switch(
                                                      value: model
                                                              .contrastController[
                                                          index],
                                                      onChanged: (isCheck) {
                                                        // model.setContrast(
                                                        //     isCheck, index);
                                                        // model
                                                        //         .imaging_order_item
                                                        //         .imaging[index]
                                                        //         .with_contrast =
                                                        //     isCheck;
                                                      }),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    // )
                                    : SizedBox(),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                            // index + 1 == model.imagingTypeControllers.length
                            //     ? Consumer<PlaceOrderProvider>(
                            //         builder: (context, model, child) =>
                            //             FlatButton(
                            //               padding: EdgeInsets.zero,
                            //               onPressed: () {
                            //                 model.addImaging();
                            //               },
                            //               child: Container(
                            //                 child: Row(
                            //                   children: [
                            //                     Icon(
                            //                       Icons.add,
                            //                       color: Colors.blueAccent,
                            //                       size: 20,
                            //                     ),
                            //                     CustomText(
                            //                       text: Strings.addRowS,
                            //                       fontSize: FontStyles.size15,
                            //                       fontWeight: FontWeight.w500,
                            //                       color: Colors.blueAccent,
                            //                     )
                            //                   ],
                            //                 ),
                            //                 padding: EdgeInsets.all(10.0),
                            //               ),
                            //             ))
                            //     : Container()
                          ],
                        );
                      }),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                          color: Colors.grey.withOpacity(0.5), width: 1),
                      color: Colors.grey.withOpacity(0.5)),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 7, top: 15, bottom: 10.0),
                    child: CustomText(
                        text: Strings.additional_clinical_data,
                        fontSize: FontStyles.large,
                        fontWeight: FontStyles.boldFontWeight600)),
                Container(
                  padding: EdgeInsets.only(
                      left: 10.0, right: 10.0, top: 5.0, bottom: 10.0),
                  alignment: Alignment.center,
                  child: Container(
                    child: TextFormField(
                      onTap: () {
                        screenTracker.stopTimer();
                        screenTracker.startTimer(context);
                      },
                      readOnly: true,
                      maxLength: 500,
                      controller: _additionalClinicalController,
                      // keyboardType: TextInputType.emailAddress,
                      // enabled: isSocial ? false : true,
                      decoration: InputDecoration(
                        hintText: "${Strings.additional_clinical_data}...",
                        // prefixIcon: ImageIcon(
                        //   AssetImage("assets/images/mail.png"),
                        //   color: CustomColors.grey2,
                        // ),
                        border: InputBorder.none,
                      ),
                      maxLines: 5,
                    ),
                  ),
                  // ListView.builder(
                  //     physics: const NeverScrollableScrollPhysics(),
                  //     shrinkWrap: true,
                  //     itemCount: model.imagingTypeControllers.length,
                  //     itemBuilder: (BuildContext context, int index) {
                  //       return Column(
                  //         mainAxisSize: MainAxisSize.max,
                  //         children: [
                  //           SizedBox(
                  //             height: 10.0,
                  //           ),
                  //           Row(
                  //             mainAxisSize: MainAxisSize.max,
                  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: [
                  //               Flexible(
                  //                 child: Container(
                  //                     decoration: BoxDecoration(
                  //                         borderRadius: BorderRadius.all(
                  //                             Radius.circular(25.0)),
                  //                         border: Border.all(
                  //                             color: CustomColors.grey3,
                  //                             width: 1),
                  //                         color: CustomColors.white),
                  //                     child: PopupMenuButton(
                  //                         offset: Offset(0.1, 0),
                  //                         onSelected: (item) {
                  //                           FocusScope.of(context)
                  //                               .requestFocus(FocusNode());
                  //                           model.imagingTypeControllers
                  //                               .elementAt(index)
                  //                               .text = item;
                  //                           model.imaging_order_item.imaging
                  //                               .elementAt(index)
                  //                               .imaging_type = item;
                  //                           model.imaging_order_item.type = 2;
                  //                         },
                  //                         child: Padding(
                  //                             padding: EdgeInsets.only(
                  //                                 left: 20, right: 5, top: 2),
                  //                             child: TextFormField(
                  //                                 onChanged: (text) {},
                  //                                 controller: model
                  //                                     .imagingTypeControllers
                  //                                     .elementAt(index),
                  //                                 enabled: false,
                  //                                 decoration: InputDecoration(
                  //                                     hintText:
                  //                                         Strings.imagingType,
                  //                                     hintStyle: TextStyle(
                  //                                       color: Colors.grey,
                  //                                     ),
                  //                                     suffixIcon: ImageIcon(AssetImage("assets/images/ic_drop_down1.png"),
                  //                                         color: CustomColors
                  //                                             .grey2),
                  //                                     border: InputBorder.none),
                  //                                 maxLines: 1)),
                  //                         itemBuilder: (context) => Strings
                  //                             .imageingTypeList
                  //                             .map((item) => PopupMenuItem(
                  //                                 value: item,
                  //                                 child: Text(item ?? "")))
                  //                             .toList())),
                  //                 flex: 5,
                  //               ),
                  //               SizedBox(
                  //                 width: 10.0,
                  //               ),
                  //               Flexible(
                  //                 child: Container(
                  //                     decoration: BoxDecoration(
                  //                         borderRadius: BorderRadius.all(
                  //                             Radius.circular(25.0)),
                  //                         border: Border.all(
                  //                             color: CustomColors.grey3,
                  //                             width: 1),
                  //                         color: CustomColors.white),
                  //                     child: PopupMenuButton(
                  //                         offset: Offset(0.1, 0),
                  //                         onSelected: (item) {
                  //                           FocusScope.of(context)
                  //                               .requestFocus(FocusNode());
                  //                           model.bodyPartControllers
                  //                               .elementAt(index)
                  //                               .text = item;
                  //                           model.imaging_order_item.imaging
                  //                               .elementAt(index)
                  //                               .body_part = item;
                  //                           model.imaging_order_item.type = 2;
                  //                         },
                  //                         child: Padding(
                  //                             padding: EdgeInsets.only(
                  //                                 left: 20, right: 5, top: 2),
                  //                             child: TextFormField(
                  //                                 onChanged: (text) {},
                  //                                 controller: model
                  //                                     .bodyPartControllers
                  //                                     .elementAt(index),
                  //                                 enabled: false,
                  //                                 decoration: InputDecoration(
                  //                                     hintText:
                  //                                         Strings.bodyPart,
                  //                                     hintStyle: TextStyle(
                  //                                       color: Colors.grey,
                  //                                     ),
                  //                                     suffixIcon:
                  //                                         ImageIcon(AssetImage("assets/images/ic_drop_down1.png"),
                  //                                             color:
                  //                                                 CustomColors
                  //                                                     .grey2),
                  //                                     border: InputBorder.none),
                  //                                 maxLines: 1)),
                  //                         itemBuilder: (context) => Strings
                  //                             .bodyPartList
                  //                             .map((item) => PopupMenuItem(
                  //                                 value: item,
                  //                                 child: Text(item ?? "")))
                  //                             .toList())),
                  //                 flex: 5,
                  //               ),
                  //             ],
                  //           ),
                  //           index + 1 == model.imagingTypeControllers.length
                  //               ? Consumer<PlaceOrderProvider>(
                  //                   builder: (context, model, child) =>
                  //                       FlatButton(
                  //                         padding: EdgeInsets.zero,
                  //                         onPressed: () {
                  //                           model.addImaging();
                  //                         },
                  //                         child: Container(
                  //                           child: Row(
                  //                             children: [
                  //                               Icon(
                  //                                 Icons.add,
                  //                                 color: Colors.blueAccent,
                  //                                 size: 20,
                  //                               ),
                  //                               CustomText(
                  //                                 text: Strings.addRowS,
                  //                                 fontSize: FontStyles.size15,
                  //                                 fontWeight: FontWeight.w500,
                  //                                 color: Colors.blueAccent,
                  //                               )
                  //                             ],
                  //                           ),
                  //                           padding: EdgeInsets.all(10.0),
                  //                         ),
                  //                       ))
                  //               : Container()
                  //         ],
                  //       );
                  //     }),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(
                        color: Colors.grey.withOpacity(0.5), width: 1),
                    // color: Colors.grey.withOpacity(0.5)
                  ),
                ),
              ],
            ));
  }
}

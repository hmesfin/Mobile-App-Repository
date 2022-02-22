import 'package:virtudoc_app/index.dart';
import './../../../orders/model/orders_listing_response.dart' as R;
import 'model/place_order_request.dart';

class PlaceOrderProvider with ChangeNotifier {
  bool isLoading = false;
  bool isPharmacySelected = false;
  bool isLabSelected = false;
  bool isImagingSelected = false;

  bool isBloodSugar = false;
  bool isCholesterol = false;
  bool isStool = false;

  int doctorId;
  int appointmentId;
  int patientId;

  var selectPharmacyController = TextEditingController();
  var selectLabController = TextEditingController();
  var selectImagingController = TextEditingController();

  List<RequisitionRow> pharmacyTypeList = [];
  List<RequisitionRow> labTypeList = [];
  List<RequisitionRow> imagingTypeList = [];

  PlaceOrderRequest placeOrderRequest = new PlaceOrderRequest();
  PharmacyOrderItem pharmacy_order_item = new PharmacyOrderItem();
  LabOrderItem lab_order_item = new LabOrderItem();
  ImagingOrderItem imaging_order_item = new ImagingOrderItem();

  List<TextEditingController> drugsNameControllers = <TextEditingController>[];
  List<TextEditingController> unitsControllers = <TextEditingController>[];
  List<TextEditingController> dosageControllers = <TextEditingController>[];

  List<TextEditingController> imagingTypeControllers =
  <TextEditingController>[];
  List<TextEditingController> bodyPartControllers = <TextEditingController>[];
  List<bool> contrastController = <bool>[];

  setImagingTypeController(R.OrderListingItem item) {
    try {
      imagingTypeControllers.clear();
      bodyPartControllers.clear();
      // contrast controller added
      contrastController.clear();
      imaging_order_item.imaging.clear();
      for (var i = 0; i <= item.imaging_order_item.imaging.length - 1; i++) {
        var defImaginTypr = new TextEditingController(
            text: item.imaging_order_item.imaging[i].imaging_type);
        var defBodyPart = new TextEditingController(
            text: item.imaging_order_item.imaging[i].body_part);
        imagingTypeControllers.add(defImaginTypr);
        bodyPartControllers.add(defBodyPart);
        contrastController
            .add(item.imaging_order_item.imaging[i].with_contrast);

        imaging_order_item.imaging.add(Imaging(
            body_part: item.imaging_order_item.imaging[i].body_part,
            imaging_type: item.imaging_order_item.imaging[i].imaging_type,
            with_contrast: item.imaging_order_item.imaging[i].with_contrast));

        // imaging_order_item.imaging[i].body_part =
        //     item.imaging_order_item.imaging[i].body_part;

        // imaging_order_item.imaging[i].imaging_type =
        //     item.imaging_order_item.imaging[i].imaging_type;

        // imaging_order_item.imaging[i].with_contrast =
        //     item.imaging_order_item.imaging[i].with_contrast;
      }
      imaging_order_item.imaging_facility =
          item.imaging_order_item.imaging_facility;
      imaging_order_item.additional_clinical_data =
          item.imaging_order_item.additional_clinical_data;

      imaging_order_item.type = 2;
      imaging_order_item.requisition_id = item.requisition_id;
    } catch (err) {}
    notifyListeners();
  }

  setLabTypeController(R.OrderListingItem item) {
    try {
      imagingTypeControllers.clear();
      bodyPartControllers.clear();

      contrastController.clear();
      for (var i = 0;
      i <= item.lab_order_item.lab_requisition.lab_tests.length - 1;
      i++) {
        selectLabController.text = item.lab_order_item.laboratory;
      }
      selectLabController.text = item.lab_order_item.laboratory;
      // item.requisition_name;
      lab_order_item.laboratory = item.lab_order_item.laboratory;
      lab_order_item.requisition_id = item.requisition_id;
      lab_order_item.type = 1;
    } catch (err) {}
    notifyListeners();
  }

  setPharmacyTypeController(R.OrderListingItem item) {
    try {
      drugsNameControllers.clear();
      unitsControllers.clear();
      dosageControllers.clear();
      // contrast controller added
      pharmacy_order_item.prescribed_drugs.clear();
      contrastController.clear();
      for (var i = 0;
      i <= item.pharmacy_order_item.prescribed_drugs.length - 1;
      i++) {
        var defDrugName = new TextEditingController(
            text: item.pharmacy_order_item.prescribed_drugs[i].drug_name);
        var defUnir = new TextEditingController(
            text: item.pharmacy_order_item.prescribed_drugs[i].unit.toString());
        var defDosage = new TextEditingController(
            text: item.pharmacy_order_item.prescribed_drugs[i].dosage);
        drugsNameControllers.add(defDrugName);
        unitsControllers.add(defUnir);
        dosageControllers.add(defDosage);

        // pharmacy_order_item.prescribed_drugs[i].dosage =
        //     item.pharmacy_order_item.prescribed_drugs[i].dosage;

        // pharmacy_order_item.prescribed_drugs[i].drug_name =
        //     item.pharmacy_order_item.prescribed_drugs[i].drug_name;

        // pharmacy_order_item.prescribed_drugs[i].unit =
        //     item.pharmacy_order_item.prescribed_drugs[i].unit;

        pharmacy_order_item.prescribed_drugs.add(PrescribedDrug(
            dosage: item.pharmacy_order_item.prescribed_drugs[i].dosage,
            drug_name: item.pharmacy_order_item.prescribed_drugs[i].drug_name,
            unit: item.pharmacy_order_item.prescribed_drugs[i].unit));
      }

      // imaging_order_item.imaging_facility =
      //     item.imaging_order_item.imaging_facility;
      // imaging_order_item.additional_clinical_data =
      //     item.imaging_order_item.additional_clinical_data;

      // imaging_order_item.type = 2;
      // imaging_order_item.requisition_id = item.requisition_id;

      selectPharmacyController.text = item.pharmacy_order_item.pharmacy;
      pharmacy_order_item.pharmacy = item.pharmacy_order_item.pharmacy;
      pharmacy_order_item.requisition_id = item.requisition_id;
      pharmacy_order_item.type = 0;
    } catch (err) {}
    notifyListeners();
  }

  Future setPharmacy() async {
    isPharmacySelected = !isPharmacySelected;
    notifyListeners();
  }

  Future setLab() async {
    isLabSelected = !isLabSelected;
    notifyListeners();
  }

  Future setImaging() async {
    isImagingSelected = !isImagingSelected;
    notifyListeners();
  }

  Future setBloodSugar(isCheck) async {
    isBloodSugar = isCheck;
    // lab_order_item.lab_requisition.blood_sugar = isCheck;
    notifyListeners();
  }

  Future setContrast(isCheck, index) async {
    contrastController[index] = isCheck;

    notifyListeners();
  }

  Future setCholesterol(isCheck) async {
    isCholesterol = isCheck;

    notifyListeners();
  }

  Future setStool(isCheck) async {
    isStool = isCheck;

    notifyListeners();
  }

  setLabSelected(bool val) {
    isLabSelected = val;
    notifyListeners();
  }

  setImagingSelected(bool val) {
    isImagingSelected = val;
    notifyListeners();
  }

  setPharmacySelected(bool val) {
    isPharmacySelected = val;
    notifyListeners();
  }

  init({doctorId = 52, appointmentId = 1, patientId = 51}) {
    isLoading = false;
    isPharmacySelected = true;
    isLabSelected = false;
    isImagingSelected = false;

    selectPharmacyController.text = Strings.selectPharmacy;
    selectLabController.text = Strings.selectLaboratory;
    selectImagingController.text = Strings.selectImaging;

    pharmacyTypeList.clear();
    labTypeList.clear();
    imagingTypeList.clear();

    this.doctorId = doctorId;
    this.appointmentId = appointmentId;
    this.patientId = patientId;

    placeOrderRequest = new PlaceOrderRequest();
    pharmacy_order_item = new PharmacyOrderItem();
    lab_order_item = new LabOrderItem();
    imaging_order_item = new ImagingOrderItem();

    drugsNameControllers.clear();
    unitsControllers.clear();
    dosageControllers.clear();

    imagingTypeControllers.clear();
    bodyPartControllers.clear();
    // contrast controller added
    contrastController.clear();

    var defDrugName = new TextEditingController();
    var defUnir = new TextEditingController();
    var defDosage = new TextEditingController();
    drugsNameControllers.add(defDrugName);
    unitsControllers.add(defUnir);
    dosageControllers.add(defDosage);

    pharmacy_order_item.prescribed_drugs = [];
    var prescribedDrugs = new PrescribedDrug();
    prescribedDrugs.drug_name = "";
    prescribedDrugs.unit = 0;
    prescribedDrugs.dosage = "";
    pharmacy_order_item.prescribed_drugs.add(prescribedDrugs);

    isBloodSugar = false;
    isCholesterol = false;
    isStool = false;
    var labRequisition = new LabRequisition();
    // labRequisition.blood_sugar = isBloodSugar;
    // labRequisition.cholestrol = isCholesterol;
    // labRequisition.stool = isStool;
    lab_order_item.lab_requisition = labRequisition;

    imaging_order_item.imaging = [];
    var imaging = new Imaging();
    imaging.imaging_type = "";
    imaging.body_part = "";
    imaging_order_item.imaging.add(imaging);
    var defImaginTypr = new TextEditingController();
    var defBodyPart = new TextEditingController();
    imagingTypeControllers.add(defImaginTypr);
    bodyPartControllers.add(defBodyPart);
    // contrast controller added
    contrastController.add(false);

    notifyListeners();
    requisitionTypes();
    notifyListeners();
  }

  Future placeOrder({Function failure,
    Function(bool, String) success,
    bool fromEditOrder = false,
    int masterOrderId,
    R.OrderListingItem item}) async {
    if (!isPharmacySelected && !isLabSelected && !isImagingSelected) {
      //If No order is selected simply finish appointment
      isLoading = true;
      notifyListeners();
      Map decoded;
      try {
        Map map = {
          "appointment_id": appointmentId,
          "action": 2,
        };
        var response =
        await ApiRequest.postApi(ApiUrl.actionOnAppointment, map);

        decoded = jsonDecode(response.body);

        notifyListeners();
        isLoading = false;
        return success(false, decoded['message']);
      } catch (e) {
        notifyListeners();
        isLoading = false;
        return failure(decoded['message']);
      }
    } else {
      // else add order and then finish appointment
      if (isPharmacySelected) {
        if (selectPharmacyController.text == Strings.selectPharmacy) {
          return failure(Strings.pleaseSelect(Strings.selectPharmacy));
        } else if (pharmacy_order_item.doctors_note == null ||
            pharmacy_order_item.doctors_note == "") {
          return failure(Strings.pleaseEnter(Strings.doctorsNote));
        } else {
          for (var item in pharmacy_order_item.prescribed_drugs) {
            if (item.drug_name == null || item.drug_name == "") {
              return failure(Strings.pleaseEnter(Strings.drugMedicineName));
            } else if (item.unit == null || item.unit == 0) {
              return failure(Strings.pleaseEnter(Strings.unit));
            } else if (item.dosage == null || item.dosage == "") {
              return failure(Strings.pleaseEnter(Strings.dossage));
            }
          }
        }
      }

      if (isLabSelected) {
        if (selectLabController.text == Strings.selectLaboratory) {
          return failure(Strings.pleaseSelect(Strings.selectLaboratory));
        } else if (lab_order_item.lab_requisition.lab_tests.length == 0) {
          return failure(Strings.pleaseSelect(Strings.labRequisitionselect));
        }
      }

      if (isImagingSelected) {
        if (selectImagingController.text == Strings.selectImaging) {
          return failure(Strings.pleaseSelect(Strings.selectImaging));
        } else {
          if (fromEditOrder) imaging_order_item.type = 2;
          for (var item in imaging_order_item.imaging) {
            if (item.imaging_type == null ||
                item.imaging_type.trim() == "" ||
                item.imaging_type.trim() == Strings.imagingType) {
              return failure(Strings.pleaseSelect(Strings.imagingType));
            } else if (item.body_part == null ||
                item.body_part.trim() == "" ||
                item.body_part.trim() == Strings.bodyPart) {
              return failure(Strings.pleaseSelect(Strings.bodyPart));
            } else if (item.imaging_type == "CT-Scan" ||
                item.imaging_type == "MRI") {
              if (item.with_contrast == null) {
                item.with_contrast = false;
              }
            } else if (item.imaging_type != "CT-Scan" ||
                item.imaging_type != "MRI") {
              item.with_contrast = false;
            }
          }
        }
      }

      Map placeOrderMap = {
        if (!fromEditOrder) "doctor_id": doctorId,
        "patient_id": patientId,
        "appointment_id": appointmentId,
        if (isPharmacySelected && !fromEditOrder)
          "pharmacy_order_item": pharmacy_order_item.toJson(),
        if (isPharmacySelected && fromEditOrder)
          "pharmacy_order_item": {
            ...pharmacy_order_item.toJson(),
            "requisition_order_id": item.requisition_order_id
          },
        if (isLabSelected && !fromEditOrder)
          "lab_order_item": lab_order_item.toJson(),
        if (isLabSelected && fromEditOrder)
          "lab_order_item": {
            ...lab_order_item.toJson(),
            "requisition_order_id": item.requisition_order_id
          },
        if (isImagingSelected && !fromEditOrder)
          "imaging_order_item": imaging_order_item.toJson(),
        if (isImagingSelected && fromEditOrder)
          "imaging_order_item": {
            ...imaging_order_item.toJson(),
            "requisition_order_id": item.requisition_order_id
          },
      };

      var connected = await CommonWidgets().internetCheck();
      if (!connected) {
        return failure(Strings.not_connected);
      }
      isLoading = true;
      notifyListeners();
      var response = await ApiRequest.postApi(
          fromEditOrder
              ? ApiUrl.editOrderRequisition(masterOrderId)
              : ApiUrl.postPlaceOrder,
          placeOrderMap);
      isLoading = false;
      Map decode = jsonDecode(response.body);
      if (response.statusCode == 200) {
        notifyListeners();
        Map map = {
          "appointment_id": appointmentId,
          "action": 2,
        };
        await ApiRequest.postApi(ApiUrl.actionOnAppointment, map);
        return success(true, decode['message']);
      } else {
        notifyListeners();
        return failure(decode['message']);
      }
    }
  }

  Future requisitionTypes() async {
    isLoading = true;
    notifyListeners();
    var response1 =
    await ApiRequest.getApi(ApiUrl.getRequisitionType('pharmacy'));
    Map decode1 = jsonDecode(response1.body);
    RequisitionTypeListResponse result1 =
    new RequisitionTypeListResponse.fromJson(decode1);
    pharmacyTypeList.addAll(result1.body.data.rows);
    notifyListeners();

    var response2 = await ApiRequest.getApi(ApiUrl.getRequisitionType('lab'));
    Map decode2 = jsonDecode(response2.body);
    RequisitionTypeListResponse result2 =
    new RequisitionTypeListResponse.fromJson(decode2);
    labTypeList.addAll(result2.body.data.rows);
    notifyListeners();

    var response3 =
    await ApiRequest.getApi(ApiUrl.getRequisitionType('imaging'));
    Map decode3 = jsonDecode(response3.body);
    RequisitionTypeListResponse result3 =
    new RequisitionTypeListResponse.fromJson(decode3);
    imagingTypeList.addAll(result3.body.data.rows);
    notifyListeners();

    isLoading = false;
    notifyListeners();
  }

  Future addPrescribedDrugs() async {
    var defDrugName = new TextEditingController();
    var defUnir = new TextEditingController();
    var defDosage = new TextEditingController();

    drugsNameControllers.add(defDrugName);
    unitsControllers.add(defUnir);
    dosageControllers.add(defDosage);

    var prescribedDrugs = new PrescribedDrug();
    prescribedDrugs.drug_name = "";
    prescribedDrugs.unit = 0;
    prescribedDrugs.dosage = "";

    pharmacy_order_item.prescribed_drugs.add(prescribedDrugs);

    notifyListeners();
  }

  Future addImaging() async {
    var defImaginTypr = new TextEditingController();
    var defBodyPart = new TextEditingController();
    imagingTypeControllers.add(defImaginTypr);
    bodyPartControllers.add(defBodyPart);
    // contrast toggle added
    contrastController.add(false);

    var imaging = new Imaging();
    imaging.imaging_type = "";
    imaging.body_part = "";

    imaging_order_item.imaging.add(imaging);

    notifyListeners();
  }
}

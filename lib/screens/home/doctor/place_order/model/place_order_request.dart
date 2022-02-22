class PlaceOrderRequest {
  int appointment_id;
  int doctor_id;
  int patient_id;
  ImagingOrderItem imaging_order_item;
  LabOrderItem lab_order_item;
  PharmacyOrderItem pharmacy_order_item;

  PlaceOrderRequest({this.appointment_id,
    this.doctor_id,
    this.imaging_order_item,
    this.lab_order_item,
    this.patient_id,
    this.pharmacy_order_item});

  factory PlaceOrderRequest.fromJson(Map<String, dynamic> json) {
    return PlaceOrderRequest(
      appointment_id: json['appointment_id'],
      doctor_id: json['doctor_id'],
      imaging_order_item: json['imaging_order_item'] != null
          ? ImagingOrderItem.fromJson(json['imaging_order_item'])
          : null,
      lab_order_item: json['lab_order_item'] != null
          ? LabOrderItem.fromJson(json['lab_order_item'])
          : null,
      patient_id: json['patient_id'],
      pharmacy_order_item: json['pharmacy_order_item'] != null
          ? PharmacyOrderItem.fromJson(json['pharmacy_order_item'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appointment_id'] = this.appointment_id;
    data['doctor_id'] = this.doctor_id;
    data['patient_id'] = this.patient_id;
    if (this.imaging_order_item != null) {
      data['imaging_order_item'] = this.imaging_order_item.toJson();
    }
    if (this.lab_order_item != null) {
      data['lab_order_item'] = this.lab_order_item.toJson();
    }
    if (this.pharmacy_order_item != null) {
      data['pharmacy_order_item'] = this.pharmacy_order_item.toJson();
    }
    return data;
  }
}

class PharmacyOrderItem {
  String doctors_note;
  String pharmacy;
  List<PrescribedDrug> prescribed_drugs;
  int requisition_id;
  int type;

  PharmacyOrderItem({this.doctors_note,
    this.pharmacy,
    this.prescribed_drugs,
    this.requisition_id,
    this.type});

  factory PharmacyOrderItem.fromJson(Map<String, dynamic> json) {
    return PharmacyOrderItem(
      doctors_note: json['remarks'],
      pharmacy: json['pharmacy'],
      prescribed_drugs: json['prescribed_drugs'] != null
          ? (json['prescribed_drugs'] as List)
          .map((i) => PrescribedDrug.fromJson(i))
          .toList()
          : null,
      requisition_id: json['requisition_id'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['remarks'] = this.doctors_note;
    data['pharmacy'] = this.pharmacy;
    data['requisition_id'] = this.requisition_id;
    data['type'] = this.type;
    if (this.prescribed_drugs != null) {
      data['prescribed_drugs'] =
          this.prescribed_drugs.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PrescribedDrug {
  String dosage;
  String drug_name;
  int unit;

  PrescribedDrug({this.dosage, this.drug_name, this.unit});

  factory PrescribedDrug.fromJson(Map<String, dynamic> json) {
    return PrescribedDrug(
      dosage: json['dosage'],
      drug_name: json['drug_name'],
      unit: json['unit'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dosage'] = this.dosage;
    data['drug_name'] = this.drug_name;
    data['unit'] = this.unit;
    return data;
  }
}

class LabOrderItem {
  LabRequisition lab_requisition;
  String additional_clinical_data;
  String laboratory;
  int requisition_id;
  int type;

  LabOrderItem({this.lab_requisition,
    this.laboratory,
    this.requisition_id,
    this.type,
    this.additional_clinical_data});

  factory LabOrderItem.fromJson(Map<String, dynamic> json) {
    return LabOrderItem(
      lab_requisition: json['lab_requisition'] != null
          ? LabRequisition.fromJson(json['lab_requisition'])
          : null,
      laboratory: json['laboratory'],
      requisition_id: json['requisition_id'],
      type: json['type'],
      additional_clinical_data: json['additional_clinical_data'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['laboratory'] = this.laboratory;
    data['requisition_id'] = this.requisition_id;
    data['type'] = this.type;
    data['additional_clinical_data'] = this.additional_clinical_data;
    if (this.lab_requisition != null) {
      data['lab_requisition'] = this.lab_requisition.toJson();
    }
    return data;
  }
}

class LabRequisition {
  // bool blood_sugar;
  // bool cholestrol;
  // bool stool;
  List<String> lab_tests;

  LabRequisition({
    this.lab_tests,
  });

  factory LabRequisition.fromJson(Map<String, dynamic> json) =>
      LabRequisition(
        lab_tests: List<String>.from(json["lab_tests"].map((x) => x)),
      );

  Map<String, dynamic> toJson() =>
      {
        "lab_tests": List<dynamic>.from(lab_tests.map((x) => x)),
      };

// LabRequisition({this.blood_sugar, this.cholestrol, this.stool});

// factory LabRequisition.fromJson(Map<String, dynamic> json) {
//   return LabRequisition(
//     blood_sugar: json['blood_sugar'],
//     cholestrol: json['cholestrol'],
//     stool: json['stool'],
//   );
// }

// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//   data['blood_sugar'] = this.blood_sugar;
//   data['cholestrol'] = this.cholestrol;
//   data['stool'] = this.stool;
//   return data;
// }
}

class ImagingOrderItem {
  String additional_clinical_data;
  List<Imaging> imaging;
  String imaging_facility;
  int requisition_id;
  int type;

  ImagingOrderItem({this.imaging,
    this.imaging_facility,
    this.requisition_id,
    this.type,
    this.additional_clinical_data});

  factory ImagingOrderItem.fromJson(Map<String, dynamic> json) {
    return ImagingOrderItem(
      imaging: json['imaging'] != null
          ? (json['imaging'] as List).map((i) => Imaging.fromJson(i)).toList()
          : null,
      imaging_facility: json['imaging_facility'],
      requisition_id: json['requisition_id'],
      type: json['type'],
      additional_clinical_data: json['additional_clinical_data'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imaging_facility'] = this.imaging_facility;
    data['requisition_id'] = this.requisition_id;
    data['additional_clinical_data'] = this.additional_clinical_data;
    data['type'] = this.type;
    if (this.imaging != null) {
      data['imaging'] = this.imaging.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Imaging {
  String body_part;
  String imaging_type;
  bool with_contrast;

  Imaging({this.body_part, this.imaging_type, this.with_contrast});

  factory Imaging.fromJson(Map<String, dynamic> json) {
    return Imaging(
      body_part: json['body_part'],
      imaging_type: json['imaging_type'],
      with_contrast: json['with_contrast'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['body_part'] = this.body_part;
    data['imaging_type'] = this.imaging_type;
    data['with_contrast'] = this.with_contrast;
    return data;
  }
}

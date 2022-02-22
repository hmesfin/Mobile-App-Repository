class PrescriptionDetailModel {
  Data data;

  PrescriptionDetailModel({this.data});

  PrescriptionDetailModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int orderId;
  int doctorId;
  int patientId;
  int appointmentId;
  Referral referral;
  Admission admission;
  DoctorNotes doctorNotes;
  String createdAt;
  String updatedAt;
  Doctor doctor;
  List<Prescriptions> prescriptions;

  Data({this.orderId,
    this.doctorId,
    this.patientId,
    this.appointmentId,
    this.referral,
    this.admission,
    this.doctorNotes,
    this.createdAt,
    this.updatedAt,
    this.doctor,
    this.prescriptions});

  Data.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    doctorId = json['doctor_id'];
    patientId = json['patient_id'];
    appointmentId = json['appointment_id'];
    referral = json['referral'] != null
        ? new Referral.fromJson(json['referral'])
        : null;
    admission = json['admission'] != null
        ? new Admission.fromJson(json['admission'])
        : null;
    doctorNotes = json['doctor_notes'] != null
        ? new DoctorNotes.fromJson(json['doctor_notes'])
        : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    doctor =
    json['doctor'] != null ? new Doctor.fromJson(json['doctor']) : null;
    if (json['prescriptions'] != null) {
      prescriptions = new List<Prescriptions>();
      json['prescriptions'].forEach((v) {
        prescriptions.add(new Prescriptions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['doctor_id'] = this.doctorId;
    data['patient_id'] = this.patientId;
    data['appointment_id'] = this.appointmentId;
    if (this.referral != null) {
      data['referral'] = this.referral.toJson();
    }
    if (this.admission != null) {
      data['admission'] = this.admission.toJson();
    }
    if (this.doctorNotes != null) {
      data['doctor_notes'] = this.doctorNotes.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.doctor != null) {
      data['doctor'] = this.doctor.toJson();
    }
    if (this.prescriptions != null) {
      data['prescriptions'] =
          this.prescriptions.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Referral {
  String specialistReferral;
  String referralComment;
  String specialistName;
  String specialistPhone;

  Referral({this.specialistReferral,
    this.referralComment,
    this.specialistName,
    this.specialistPhone});

  Referral.fromJson(Map<String, dynamic> json) {
    specialistReferral = json['specialist_referral'];
    referralComment = json['referral_comment'];
    specialistName = json['specialist_name'];
    specialistPhone = json['specialist_phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['specialist_referral'] = this.specialistReferral;
    data['referral_comment'] = this.referralComment;
    data['specialist_name'] = this.specialistName;
    data['specialist_phone'] = this.specialistPhone;
    return data;
  }
}

class Admission {
  String admitTo;
  String nameOfAcceptingPhysician;
  String admissionComment;
  String acceptingPhysicianPhone;

  Admission({this.admitTo,
    this.nameOfAcceptingPhysician,
    this.admissionComment,
    this.acceptingPhysicianPhone});

  Admission.fromJson(Map<String, dynamic> json) {
    admitTo = json['admit_to'];
    nameOfAcceptingPhysician = json['name_of_accepting_physician'];
    admissionComment = json['admission_comment'];
    acceptingPhysicianPhone = json['accepting_physician_phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['admit_to'] = this.admitTo;
    data['name_of_accepting_physician'] = this.nameOfAcceptingPhysician;
    data['admission_comment'] = this.admissionComment;
    data['accepting_physician_phone'] = this.acceptingPhysicianPhone;
    return data;
  }
}

class DoctorNotes {
  List<ExcuseType> excuseType;
  String startingDate;
  String endingDate;
  String notes;

  DoctorNotes(
      {this.excuseType, this.startingDate, this.endingDate, this.notes});

  DoctorNotes.fromJson(Map<String, dynamic> json) {
    if (json['excuse_type'] != null) {
      excuseType = new List<ExcuseType>();
      json['excuse_type'].forEach((v) {
        excuseType.add(new ExcuseType.fromJson(v));
      });
    }
    startingDate = json['starting_date'];
    endingDate = json['ending_date'];
    notes = json['notes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.excuseType != null) {
      data['excuse_type'] = this.excuseType.map((v) => v.toJson()).toList();
    }
    data['starting_date'] = this.startingDate;
    data['ending_date'] = this.endingDate;
    data['notes'] = this.notes;
    return data;
  }
}

class ExcuseType {
  bool rest;
  bool contagious;
  bool hospitalization;

  ExcuseType({this.rest, this.contagious, this.hospitalization});

  ExcuseType.fromJson(Map<String, dynamic> json) {
    rest = json['rest'];
    contagious = json['contagious'];
    hospitalization = json['hospitalization'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rest'] = this.rest;
    data['contagious'] = this.contagious;
    data['hospitalization'] = this.hospitalization;
    return data;
  }
}

class Doctor {
  int userId;
  int status;
  int consultationFee;
  int accountRequestStatus;
  String firstName;
  String lastName;
  String email;
  String countryCode;
  String phone;
  String role;
  bool isEmailVerified;
  bool isPhoneVerified;
  String socialId;
  String createdAt;
  String walletId;
  String customerId;
  String rejectedRemark;
  String timezone;
  double percentageProfileComplete;

  Doctor({this.userId,
    this.status,
    this.consultationFee,
    this.accountRequestStatus,
    this.firstName,
    this.lastName,
    this.email,
    this.countryCode,
    this.phone,
    this.role,
    this.isEmailVerified,
    this.isPhoneVerified,
    this.socialId,
    this.createdAt,
    this.walletId,
    this.customerId,
    this.rejectedRemark,
    this.timezone,
    this.percentageProfileComplete});

  Doctor.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    status = json['status'];
    consultationFee = json['consultation_fee'];
    accountRequestStatus = json['account_request_status'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    countryCode = json['country_code'];
    phone = json['phone'];
    role = json['role'];
    isEmailVerified = json['is_email_verified'];
    isPhoneVerified = json['is_phone_verified'];
    socialId = json['social_id'];
    createdAt = json['createdAt'];
    walletId = json['wallet_id'];
    customerId = json['customer_id'];
    rejectedRemark = json['rejected_remark'];
    timezone = json['timezone'];
    percentageProfileComplete =
        double.parse(json['percentage_profile_complete'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['status'] = this.status;
    data['consultation_fee'] = this.consultationFee;
    data['account_request_status'] = this.accountRequestStatus;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['country_code'] = this.countryCode;
    data['phone'] = this.phone;
    data['role'] = this.role;
    data['is_email_verified'] = this.isEmailVerified;
    data['is_phone_verified'] = this.isPhoneVerified;
    data['social_id'] = this.socialId;
    data['createdAt'] = this.createdAt;
    data['wallet_id'] = this.walletId;
    data['customer_id'] = this.customerId;
    data['rejected_remark'] = this.rejectedRemark;
    data['timezone'] = this.timezone;
    data['percentage_profile_complete'] = this.percentageProfileComplete;
    return data;
  }
}

class Prescriptions {
  int requisitionOrderId;
  int requisitionId;
  int masterOrderId;
  int type;
  PharmacyOrderItem1 pharmacyOrderItem;
  LabOrderItem labOrderItem;
  ImagingOrderItem imagingOrderItem;
  int status;
  OrderDeclineReason orderDeclineReason;
  Requisition requisition;

  Prescriptions({this.requisitionOrderId,
    this.requisitionId,
    this.masterOrderId,
    this.type,
    this.pharmacyOrderItem,
    this.labOrderItem,
    this.imagingOrderItem,
    this.status,
    this.orderDeclineReason,
    this.requisition});

  Prescriptions.fromJson(Map<String, dynamic> json) {
    requisitionOrderId = json['requisition_order_id'];
    requisitionId = json['requisition_id'];
    masterOrderId = json['master_order_id'];
    type = json['type'];
    pharmacyOrderItem = json['pharmacy_order_item'] != null
        ? new PharmacyOrderItem1.fromJson(json['pharmacy_order_item'])
        : null;
    labOrderItem = json['lab_order_item'] != null
        ? new LabOrderItem.fromJson(json['lab_order_item'])
        : null;
    imagingOrderItem = json['imaging_order_item'] != null
        ? new ImagingOrderItem.fromJson(json['imaging_order_item'])
        : null;
    status = json['status'];
    orderDeclineReason = json['order_decline_reason'] != null
        ? new OrderDeclineReason.fromJson(json['order_decline_reason'])
        : null;
    requisition = json['requisition'] != null
        ? new Requisition.fromJson(json['requisition'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['requisition_order_id'] = this.requisitionOrderId;
    data['requisition_id'] = this.requisitionId;
    data['master_order_id'] = this.masterOrderId;
    data['type'] = this.type;
    if (this.pharmacyOrderItem != null) {
      data['pharmacy_order_item'] = this.pharmacyOrderItem.toJson();
    }
    if (this.labOrderItem != null) {
      data['lab_order_item'] = this.labOrderItem.toJson();
    }
    if (this.imagingOrderItem != null) {
      data['imaging_order_item'] = this.imagingOrderItem.toJson();
    }
    data['status'] = this.status;
    if (this.orderDeclineReason != null) {
      data['order_decline_reason'] = this.orderDeclineReason.toJson();
    }
    if (this.requisition != null) {
      data['requisition'] = this.requisition.toJson();
    }
    return data;
  }
}

class PharmacyOrderItem1 {
  String pharmacy;
  List<PrescribedDrugs> prescribedDrugs;
  String remarks;

  PharmacyOrderItem1({this.pharmacy, this.prescribedDrugs, this.remarks});

  PharmacyOrderItem1.fromJson(Map<String, dynamic> json) {
    pharmacy = json['pharmacy'];
    if (json['prescribed_drugs'] != null) {
      prescribedDrugs = new List<PrescribedDrugs>();
      json['prescribed_drugs'].forEach((v) {
        prescribedDrugs.add(new PrescribedDrugs.fromJson(v));
      });
    }
    remarks = json['remarks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pharmacy'] = this.pharmacy;
    if (this.prescribedDrugs != null) {
      data['prescribed_drugs'] =
          this.prescribedDrugs.map((v) => v.toJson()).toList();
    }
    data['remarks'] = this.remarks;
    return data;
  }
}

class PrescribedDrugs {
  String drugName;
  int unit;
  String dosage;

  PrescribedDrugs({this.drugName, this.unit, this.dosage});

  PrescribedDrugs.fromJson(Map<String, dynamic> json) {
    drugName = json['drug_name'];
    unit = json['unit'];
    dosage = json['dosage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['drug_name'] = this.drugName;
    data['unit'] = this.unit;
    data['dosage'] = this.dosage;
    return data;
  }
}

class LabOrderItem {
  String laboratory;
  LabRequisition labRequisition;
  String additionalClinicalData;

  LabOrderItem(
      {this.laboratory, this.labRequisition, this.additionalClinicalData});

  LabOrderItem.fromJson(Map<String, dynamic> json) {
    laboratory = json['laboratory'];
    labRequisition = json['lab_requisition'] != null
        ? new LabRequisition.fromJson(json['lab_requisition'])
        : null;
    additionalClinicalData = json['additional_clinical_data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['laboratory'] = this.laboratory;
    if (this.labRequisition != null) {
      data['lab_requisition'] = this.labRequisition.toJson();
    }
    data['additional_clinical_data'] = this.additionalClinicalData;
    return data;
  }
}

class LabRequisition {
  List<String> labTests;

  LabRequisition({this.labTests});

  LabRequisition.fromJson(Map<String, dynamic> json) {
    labTests = json['lab_tests'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lab_tests'] = this.labTests;
    return data;
  }
}

class ImagingOrderItem {
  String imagingFacility;
  List<Imaging> imaging;
  String additionalClinicalData;

  ImagingOrderItem(
      {this.imagingFacility, this.imaging, this.additionalClinicalData});

  ImagingOrderItem.fromJson(Map<String, dynamic> json) {
    imagingFacility = json['imaging_facility'];
    if (json['imaging'] != null) {
      imaging = new List<Imaging>();
      json['imaging'].forEach((v) {
        imaging.add(new Imaging.fromJson(v));
      });
    }
    additionalClinicalData = json['additional_clinical_data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imaging_facility'] = this.imagingFacility;
    if (this.imaging != null) {
      data['imaging'] = this.imaging.map((v) => v.toJson()).toList();
    }
    data['additional_clinical_data'] = this.additionalClinicalData;
    return data;
  }
}

class Imaging {
  String imagingType;
  String bodyPart;
  bool withContrast;

  Imaging({this.imagingType, this.bodyPart, this.withContrast});

  Imaging.fromJson(Map<String, dynamic> json) {
    imagingType = json['imaging_type'];
    bodyPart = json['body_part'];
    withContrast = json['with_contrast'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imaging_type'] = this.imagingType;
    data['body_part'] = this.bodyPart;
    data['with_contrast'] = this.withContrast;
    return data;
  }
}

class OrderDeclineReason {
  String reason;
  String additionalDetails;

  OrderDeclineReason({this.reason, this.additionalDetails});

  OrderDeclineReason.fromJson(Map<String, dynamic> json) {
    reason = json['reason'];
    additionalDetails = json['additional_details'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reason'] = this.reason;
    data['additional_details'] = this.additionalDetails;
    return data;
  }
}

class Requisition {
  String email;
  String phone;
  String requisitionName;
  String countryCode;
  String requisitionType;

  Requisition({this.email,
    this.phone,
    this.requisitionName,
    this.countryCode,
    this.requisitionType});

  Requisition.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    phone = json['phone'];
    requisitionName = json['requisition_name'];
    countryCode = json['country_code'];
    requisitionType = json['requisition_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['requisition_name'] = this.requisitionName;
    data['country_code'] = this.countryCode;
    data['requisition_type'] = this.requisitionType;
    return data;
  }
}

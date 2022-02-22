// To parse this JSON data, do
//
//     final orderDetailsModel = orderDetailsModelFromJson(jsonString);

import 'dart:convert';

class OrderDetailsModel {
  OrderDetailsModel({
    this.status,
    this.success,
    this.message,
    this.body,
  });

  int status;
  bool success;
  String message;
  Body body;

  factory OrderDetailsModel.fromRawJson(String str) =>
      OrderDetailsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) =>
      OrderDetailsModel(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        body: Body.fromJson(json["body"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "body": body.toJson(),
      };
}

class Body {
  Body({
    this.data,
  });

  Data data;

  factory Body.fromRawJson(String str) => Body.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.orderId,
    this.doctorId,
    this.patientId,
    this.appointmentId,
    this.referral,
    this.admission,
    this.doctorNotes,
    this.createdAt,
    this.updatedAt,
    this.doctor,
    this.patient,
    this.prescriptions,
  });

  int orderId;
  int doctorId;
  int patientId;
  int appointmentId;
  Referral referral;
  Admission admission;
  DoctorNotes doctorNotes;
  DateTime createdAt;
  DateTime updatedAt;
  Doctor doctor;
  Doctor patient;
  List<Prescription> prescriptions;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        orderId: json["order_id"],
        doctorId: json["doctor_id"],
        patientId: json["patient_id"],
        appointmentId: json["appointment_id"],
        referral: Referral.fromJson(json["referral"]),
        admission: Admission.fromJson(json["admission"]),
        doctorNotes: DoctorNotes.fromJson(json["doctor_notes"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        doctor: Doctor.fromJson(json["doctor"]),
        patient: Doctor.fromJson(json["patient"]),
        prescriptions: List<Prescription>.from(
            json["prescriptions"].map((x) => Prescription.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "doctor_id": doctorId,
        "patient_id": patientId,
        "appointment_id": appointmentId,
        "referral": referral.toJson(),
        "admission": admission.toJson(),
        "doctor_notes": doctorNotes.toJson(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "doctor": doctor.toJson(),
        "patient": patient.toJson(),
        "prescriptions":
            List<dynamic>.from(prescriptions.map((x) => x.toJson())),
      };
}

class Admission {
  Admission({
    this.admitTo,
    this.nameOfAcceptingPhysician,
    this.admissionComment,
    this.acceptingPhysicianPhone,
  });

  String admitTo;
  String nameOfAcceptingPhysician;
  String admissionComment;
  String acceptingPhysicianPhone;

  factory Admission.fromRawJson(String str) =>
      Admission.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Admission.fromJson(Map<String, dynamic> json) => Admission(
        admitTo: json["admit_to"],
        nameOfAcceptingPhysician: json["name_of_accepting_physician"],
        admissionComment: json["admission_comment"],
        acceptingPhysicianPhone: json["accepting_physician_phone"],
      );

  Map<String, dynamic> toJson() => {
        "admit_to": admitTo,
        "name_of_accepting_physician": nameOfAcceptingPhysician,
        "admission_comment": admissionComment,
        "accepting_physician_phone": acceptingPhysicianPhone,
      };
}

class Doctor {
  Doctor({
    this.userId,
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
    this.userProfile,
  });

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
  DateTime createdAt;
  String walletId;
  String customerId;
  UserProfile userProfile;

  factory Doctor.fromRawJson(String str) => Doctor.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        userId: json["user_id"],
        status: json["status"],
        consultationFee: json["consultation_fee"],
        accountRequestStatus: json["account_request_status"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        countryCode: json["country_code"],
        phone: json["phone"],
        role: json["role"],
        isEmailVerified: json["is_email_verified"],
        isPhoneVerified: json["is_phone_verified"],
        socialId: json["social_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        walletId: json["wallet_id"],
        customerId: json["customer_id"],
        userProfile: UserProfile.fromJson(json["user_profile"]),
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "status": status,
        "consultation_fee": consultationFee,
        "account_request_status": accountRequestStatus,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "country_code": countryCode,
        "phone": phone,
        "role": role,
        "is_email_verified": isEmailVerified,
        "is_phone_verified": isPhoneVerified,
        "social_id": socialId,
        "createdAt": createdAt.toIso8601String(),
        "wallet_id": walletId,
        "customer_id": customerId,
        "user_profile": userProfile.toJson(),
      };
}

class UserProfile {
  UserProfile({
    this.profileImage,
  });

  String profileImage;

  factory UserProfile.fromRawJson(String str) =>
      UserProfile.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        profileImage: json["profile_image"],
      );

  Map<String, dynamic> toJson() => {
        "profile_image": profileImage,
      };
}

class DoctorNotes {
  DoctorNotes({
    this.excuseType,
    this.startingDate,
    this.endingDate,
    this.notes,
  });

  List<ExcuseType> excuseType;
  String startingDate;
  String endingDate;
  String notes;

  factory DoctorNotes.fromRawJson(String str) =>
      DoctorNotes.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DoctorNotes.fromJson(Map<String, dynamic> json) => DoctorNotes(
        excuseType: List<ExcuseType>.from(
            json["excuse_type"].map((x) => ExcuseType.fromJson(x))),
        startingDate: json["starting_date"],
        endingDate: json["ending_date"],
        notes: json["notes"],
      );

  Map<String, dynamic> toJson() => {
        "excuse_type": List<dynamic>.from(excuseType.map((x) => x.toJson())),
        "starting_date": startingDate,
        "ending_date": endingDate,
        "notes": notes,
      };
}

class ExcuseType {
  ExcuseType({
    this.rest,
    this.contagious,
    this.hospitalization,
  });

  bool rest;
  bool contagious;
  bool hospitalization;

  factory ExcuseType.fromRawJson(String str) =>
      ExcuseType.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ExcuseType.fromJson(Map<String, dynamic> json) => ExcuseType(
        rest: json["rest"],
        contagious: json["contagious"],
        hospitalization: json["hospitalization"],
      );

  Map<String, dynamic> toJson() => {
        "rest": rest,
        "contagious": contagious,
        "hospitalization": hospitalization,
      };
}

class Prescription {
  Prescription({
    this.requisitionOrderId,
    this.requisitionId,
    this.masterOrderId,
    this.type,
    this.pharmacyOrderItem,
    this.labOrderItem,
    this.imagingOrderItem,
    this.status,
    this.orderDeclineReason,
    this.requisition,
  });

  int requisitionOrderId;
  int requisitionId;
  int masterOrderId;
  int type;
  PharmacyOrderItem pharmacyOrderItem;
  LabOrderItem labOrderItem;
  ImagingOrderItem imagingOrderItem;
  int status;
  OrderDeclineReason orderDeclineReason;
  Requisition requisition;

  factory Prescription.fromRawJson(String str) =>
      Prescription.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Prescription.fromJson(Map<String, dynamic> json) => Prescription(
        requisitionOrderId: json["requisition_order_id"],
        requisitionId: json["requisition_id"],
        masterOrderId: json["master_order_id"],
        type: json["type"],
        pharmacyOrderItem:
            PharmacyOrderItem.fromJson(json["pharmacy_order_item"]),
        labOrderItem: LabOrderItem.fromJson(json["lab_order_item"]),
        imagingOrderItem: ImagingOrderItem.fromJson(json["imaging_order_item"]),
        status: json["status"],
        orderDeclineReason:
            OrderDeclineReason.fromJson(json["order_decline_reason"]),
        requisition: Requisition.fromJson(json["requisition"]),
      );

  Map<String, dynamic> toJson() => {
        "requisition_order_id": requisitionOrderId,
        "requisition_id": requisitionId,
        "master_order_id": masterOrderId,
        "type": type,
        "pharmacy_order_item": pharmacyOrderItem.toJson(),
        "lab_order_item": labOrderItem.toJson(),
        "imaging_order_item": imagingOrderItem.toJson(),
        "status": status,
        "order_decline_reason": orderDeclineReason.toJson(),
        "requisition": requisition.toJson(),
      };
}

class ImagingOrderItem {
  ImagingOrderItem({
    this.imagingFacility,
    this.imaging,
    this.additionalClinicalData,
  });

  String imagingFacility;
  List<Imaging> imaging;
  String additionalClinicalData;

  factory ImagingOrderItem.fromRawJson(String str) =>
      ImagingOrderItem.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ImagingOrderItem.fromJson(Map<String, dynamic> json) =>
      ImagingOrderItem(
        imagingFacility: json["imaging_facility"],
        imaging:
            List<Imaging>.from(json["imaging"].map((x) => Imaging.fromJson(x))),
        additionalClinicalData: json["additional_clinical_data"],
      );

  Map<String, dynamic> toJson() => {
        "imaging_facility": imagingFacility,
        "imaging": List<dynamic>.from(imaging.map((x) => x.toJson())),
        "additional_clinical_data": additionalClinicalData,
      };
}

class Imaging {
  Imaging({
    this.imagingType,
    this.bodyPart,
    this.withContrast,
  });

  String imagingType;
  String bodyPart;
  bool withContrast;

  factory Imaging.fromRawJson(String str) => Imaging.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Imaging.fromJson(Map<String, dynamic> json) => Imaging(
        imagingType: json["imaging_type"],
        bodyPart: json["body_part"],
        withContrast: json["with_contrast"],
      );

  Map<String, dynamic> toJson() => {
        "imaging_type": imagingType,
        "body_part": bodyPart,
        "with_contrast": withContrast,
      };
}

class LabOrderItem {
  LabOrderItem({
    this.laboratory,
    this.labRequisition,
    this.additionalClinicalData,
  });

  String laboratory;
  LabRequisition labRequisition;
  String additionalClinicalData;

  factory LabOrderItem.fromRawJson(String str) =>
      LabOrderItem.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LabOrderItem.fromJson(Map<String, dynamic> json) => LabOrderItem(
        laboratory: json["laboratory"],
        labRequisition: LabRequisition.fromJson(json["lab_requisition"]),
        additionalClinicalData: json["additional_clinical_data"],
      );

  Map<String, dynamic> toJson() => {
        "laboratory": laboratory,
        "lab_requisition": labRequisition.toJson(),
        "additional_clinical_data": additionalClinicalData,
      };
}

class LabRequisition {
  LabRequisition({
    this.labTests,
  });

  List<String> labTests;

  factory LabRequisition.fromRawJson(String str) =>
      LabRequisition.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LabRequisition.fromJson(Map<String, dynamic> json) => LabRequisition(
        labTests: List<String>.from(json["lab_tests"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "lab_tests": List<dynamic>.from(labTests.map((x) => x)),
      };
}

class OrderDeclineReason {
  OrderDeclineReason({
    this.reason,
    this.additionalDetails,
  });

  String reason;
  String additionalDetails;

  factory OrderDeclineReason.fromRawJson(String str) =>
      OrderDeclineReason.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OrderDeclineReason.fromJson(Map<String, dynamic> json) =>
      OrderDeclineReason(
        reason: json["reason"],
        additionalDetails: json["additional_details"],
      );

  Map<String, dynamic> toJson() => {
        "reason": reason,
        "additional_details": additionalDetails,
      };
}

class PharmacyOrderItem {
  PharmacyOrderItem({
    this.remarks,
    this.pharmacy,
    this.prescribedDrugs,
  });

  String remarks;
  String pharmacy;
  List<PrescribedDrug> prescribedDrugs;

  factory PharmacyOrderItem.fromRawJson(String str) =>
      PharmacyOrderItem.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PharmacyOrderItem.fromJson(Map<String, dynamic> json) =>
      PharmacyOrderItem(
        remarks: json["remarks"],
        pharmacy: json["pharmacy"],
        prescribedDrugs: List<PrescribedDrug>.from(
            json["prescribed_drugs"].map((x) => PrescribedDrug.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "remarks": remarks,
        "pharmacy": pharmacy,
        "prescribed_drugs":
            List<dynamic>.from(prescribedDrugs.map((x) => x.toJson())),
      };
}

class PrescribedDrug {
  PrescribedDrug({
    this.dosage,
    this.drugName,
    this.unit,
  });

  String dosage;
  String drugName;
  int unit;

  factory PrescribedDrug.fromRawJson(String str) =>
      PrescribedDrug.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PrescribedDrug.fromJson(Map<String, dynamic> json) => PrescribedDrug(
        dosage: json["dosage"],
        drugName: json["drug_name"],
        unit: json["unit"],
      );

  Map<String, dynamic> toJson() => {
        "dosage": dosage,
        "drug_name": drugName,
        "unit": unit,
      };
}

class Requisition {
  Requisition({
    this.email,
    this.phone,
    this.requisitionName,
    this.countryCode,
    this.requisitionType,
  });

  String email;
  String phone;
  String requisitionName;
  String countryCode;
  String requisitionType;

  factory Requisition.fromRawJson(String str) =>
      Requisition.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Requisition.fromJson(Map<String, dynamic> json) => Requisition(
        email: json["email"],
        phone: json["phone"],
        requisitionName: json["requisition_name"],
        countryCode: json["country_code"],
        requisitionType: json["requisition_type"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "phone": phone,
        "requisition_name": requisitionName,
        "country_code": countryCode,
        "requisition_type": requisitionType,
      };
}

class Referral {
  Referral({
    this.specialistReferral,
    this.referralComment,
    this.specialistName,
    this.specialistPhone,
  });

  String specialistReferral;
  String referralComment;
  String specialistName;
  String specialistPhone;

  factory Referral.fromRawJson(String str) =>
      Referral.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Referral.fromJson(Map<String, dynamic> json) => Referral(
        specialistReferral: json["specialist_referral"],
        referralComment: json["referral_comment"],
        specialistName: json["specialist_name"],
        specialistPhone: json["specialist_phone"],
      );

  Map<String, dynamic> toJson() => {
        "specialist_referral": specialistReferral,
        "referral_comment": referralComment,
        "specialist_name": specialistName,
        "specialist_phone": specialistPhone,
      };
}

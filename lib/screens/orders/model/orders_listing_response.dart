class OrdersListingResponse {
  Body body;
  String message;
  int status;
  bool success;

  OrdersListingResponse({this.body, this.message, this.status, this.success});

  factory OrdersListingResponse.fromJson(Map<String, dynamic> json) {
    return OrdersListingResponse(
      body: json['body'] != null ? Body.fromJson(json['body']) : null,
      message: json['message'],
      status: json['status'],
      success: json['success'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    data['success'] = this.success;
    if (this.body != null) {
      data['body'] = this.body.toJson();
    }
    return data;
  }
}

class Body {
  Data data;

  Body({this.data});

  factory Body.fromJson(Map<String, dynamic> json) {
    return Body(
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
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
  int count;
  List<OrderListingItem> rows;

  Data({this.count, this.rows});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      count: json['count'],
      rows: json['rows'] != null
          ? (json['rows'] as List)
              .map((i) => OrderListingItem.fromJson(i))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.rows != null) {
      data['rows'] = this.rows.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderListingItem {
  String createdAt;
  ImagingOrderItem imaging_order_item;
  bool is_deleted;
  LabOrderItem lab_order_item;
  int master_order_id;
  Order order;
  OrderDeclineReason order_decline_reason;
  PharmacyOrderItem pharmacy_order_item;
  int requisition_id;
  int requisition_order_id;
  int status;
  int type;
  String updatedAt;
  Requisition requisition;

  OrderListingItem(
      {this.createdAt,
      this.imaging_order_item,
      this.is_deleted,
      this.lab_order_item,
      this.master_order_id,
      this.order,
      this.order_decline_reason,
      this.pharmacy_order_item,
      this.requisition,
      this.requisition_id,
      this.requisition_order_id,
      this.status,
      this.type,
      this.updatedAt});

  factory OrderListingItem.fromJson(Map<String, dynamic> json) {
    return OrderListingItem(
      createdAt: json['createdAt'],
      imaging_order_item: json['imaging_order_item'] != null
          ? ImagingOrderItem.fromJson(json['imaging_order_item'])
          : null,
      is_deleted: json['is_deleted'],
      lab_order_item: json['lab_order_item'] != null
          ? LabOrderItem.fromJson(json['lab_order_item'])
          : null,
      master_order_id: json['master_order_id'],
      order: json['order'] != null ? Order.fromJson(json['order']) : null,
      order_decline_reason: json['order_decline_reason'] != null
          ? OrderDeclineReason.fromJson(json['order_decline_reason'])
          : null,
      pharmacy_order_item: json['pharmacy_order_item'] != null
          ? PharmacyOrderItem.fromJson(json['pharmacy_order_item'])
          : null,
      requisition: json['requisition'] != null
          ? Requisition.fromJson(json['requisition'])
          : null,
      requisition_id: json['requisition_id'],
      requisition_order_id: json['requisition_order_id'],
      status: json['status'],
      type: json['type'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['is_deleted'] = this.is_deleted;
    data['master_order_id'] = this.master_order_id;
    data['requisition_id'] = this.requisition_id;
    data['requisition_order_id'] = this.requisition_order_id;
    data['status'] = this.status;
    data['type'] = this.type;
    data['updatedAt'] = this.updatedAt;
    if (this.imaging_order_item != null) {
      data['imaging_order_item'] = this.imaging_order_item.toJson();
    }
    if (this.lab_order_item != null) {
      data['lab_order_item'] = this.lab_order_item.toJson();
    }
    if (this.order != null) {
      data['order'] = this.order.toJson();
    }
    if (this.order_decline_reason != null) {
      data['order_decline_reason'] = this.order_decline_reason.toJson();
    }
    if (this.pharmacy_order_item != null) {
      data['pharmacy_order_item'] = this.pharmacy_order_item.toJson();
    }
    if (this.requisition != null) {
      data['requisition'] = this.requisition.toJson();
    }
    return data;
  }
}

class Requisition {
  String country_code;
  String email;
  String phone;
  String requisition_name;
  String requisition_type;

  Requisition(
      {this.country_code,
      this.email,
      this.phone,
      this.requisition_name,
      this.requisition_type});

  factory Requisition.fromJson(Map<String, dynamic> json) {
    return Requisition(
      country_code: json['country_code'],
      email: json['email'],
      phone: json['phone'],
      requisition_name: json['requisition_name'],
      requisition_type: json['requisition_type'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country_code'] = this.country_code;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['requisition_name'] = this.requisition_name;
    data['requisition_type'] = this.requisition_type;
    return data;
  }
}

class Doctor {
  int account_request_status;
  int consultation_fee;
  String country_code;
  String createdAt;
  String customer_id;
  String email;
  String first_name;
  bool is_email_verified;
  bool is_phone_verified;
  String last_name;
  String phone;
  String role;
  String social_id;
  int status;
  int user_id;
  UserProfileX user_profile;
  String wallet_id;

  Doctor(
      {this.account_request_status,
      this.consultation_fee,
      this.country_code,
      this.createdAt,
      this.customer_id,
      this.email,
      this.first_name,
      this.is_email_verified,
      this.is_phone_verified,
      this.last_name,
      this.phone,
      this.role,
      this.social_id,
      this.status,
      this.user_id,
      this.user_profile,
      this.wallet_id});

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      account_request_status: json['account_request_status'],
      consultation_fee: json['consultation_fee'],
      country_code: json['country_code'],
      createdAt: json['createdAt'],
      customer_id: json['customer_id'],
      email: json['email'],
      first_name: json['first_name'],
      is_email_verified: json['is_email_verified'],
      is_phone_verified: json['is_phone_verified'],
      last_name: json['last_name'],
      phone: json['phone'],
      role: json['role'],
      social_id: json['social_id'],
      status: json['status'],
      user_id: json['user_id'],
      user_profile: json['user_profile'] != null
          ? UserProfileX.fromJson(json['user_profile'])
          : null,
      wallet_id: json['wallet_id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['account_request_status'] = this.account_request_status;
    data['consultation_fee'] = this.consultation_fee;
    data['country_code'] = this.country_code;
    data['createdAt'] = this.createdAt;
    data['customer_id'] = this.customer_id;
    data['email'] = this.email;
    data['first_name'] = this.first_name;
    data['is_email_verified'] = this.is_email_verified;
    data['is_phone_verified'] = this.is_phone_verified;
    data['last_name'] = this.last_name;
    data['phone'] = this.phone;
    data['role'] = this.role;
    data['social_id'] = this.social_id;
    data['status'] = this.status;
    data['user_id'] = this.user_id;
    data['wallet_id'] = this.wallet_id;
    if (this.user_profile != null) {
      data['user_profile'] = this.user_profile.toJson();
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

class ImagingOrderItem {
  String additional_clinical_data;
  List<Imaging> imaging;
  String imaging_facility;

  ImagingOrderItem(
      {this.additional_clinical_data, this.imaging, this.imaging_facility});

  factory ImagingOrderItem.fromJson(Map<String, dynamic> json) {
    return ImagingOrderItem(
      additional_clinical_data: json['additional_clinical_data'],
      imaging: json['imaging'] != null
          ? (json['imaging'] as List).map((i) => Imaging.fromJson(i)).toList()
          : null,
      imaging_facility: json['imaging_facility'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['additional_clinical_data'] = this.additional_clinical_data;
    data['imaging_facility'] = this.imaging_facility;
    if (this.imaging != null) {
      data['imaging'] = this.imaging.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LabOrderItem {
  String additional_clinical_data;
  LabRequisition lab_requisition;
  String laboratory;

  LabOrderItem(
      {this.additional_clinical_data, this.lab_requisition, this.laboratory});

  factory LabOrderItem.fromJson(Map<String, dynamic> json) {
    return LabOrderItem(
      additional_clinical_data: json['additional_clinical_data'],
      lab_requisition: json['lab_requisition'] != null
          ? LabRequisition.fromJson(json['lab_requisition'])
          : null,
      laboratory: json['laboratory'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['additional_clinical_data'] = this.additional_clinical_data;
    data['laboratory'] = this.laboratory;
    if (this.lab_requisition != null) {
      data['lab_requisition'] = this.lab_requisition.toJson();
    }
    return data;
  }
}

class LabRequisition {
  List<String> lab_tests;

  LabRequisition({this.lab_tests});

  factory LabRequisition.fromJson(Map<String, dynamic> json) {
    return LabRequisition(
      lab_tests: json['lab_tests'] != null
          ? new List<String>.from(json['lab_tests'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.lab_tests != null) {
      data['lab_tests'] = this.lab_tests;
    }
    return data;
  }
}

class Order {
  int appointment_id;
  Doctor doctor;
  int doctor_id;
  int order_id;
  Patient patient;
  int patient_id;

  Order(
      {this.appointment_id,
      this.doctor,
      this.doctor_id,
      this.order_id,
      this.patient,
      this.patient_id});

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      appointment_id: json['appointment_id'],
      doctor: json['doctor'] != null ? Doctor.fromJson(json['doctor']) : null,
      doctor_id: json['doctor_id'],
      order_id: json['order_id'],
      patient:
          json['patient'] != null ? Patient.fromJson(json['patient']) : null,
      patient_id: json['patient_id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appointment_id'] = this.appointment_id;
    data['doctor_id'] = this.doctor_id;
    data['order_id'] = this.order_id;
    data['patient_id'] = this.patient_id;
    if (this.doctor != null) {
      data['doctor'] = this.doctor.toJson();
    }
    if (this.patient != null) {
      data['patient'] = this.patient.toJson();
    }
    return data;
  }
}

class OrderDeclineReason {
  String additional_details;
  String reason;

  OrderDeclineReason({this.additional_details, this.reason});

  factory OrderDeclineReason.fromJson(Map<String, dynamic> json) {
    return OrderDeclineReason(
      additional_details: json['additional_details'],
      reason: json['reason'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['additional_details'] = this.additional_details;
    data['reason'] = this.reason;
    return data;
  }
}

class Patient {
  int account_request_status;
  int consultation_fee;
  String country_code;
  String createdAt;
  String customer_id;
  String email;
  String first_name;
  bool is_email_verified;
  bool is_phone_verified;
  String last_name;
  String phone;
  String role;
  String social_id;
  int status;
  int user_id;
  UserProfile user_profile;
  String wallet_id;

  Patient(
      {this.account_request_status,
      this.consultation_fee,
      this.country_code,
      this.createdAt,
      this.customer_id,
      this.email,
      this.first_name,
      this.is_email_verified,
      this.is_phone_verified,
      this.last_name,
      this.phone,
      this.role,
      this.social_id,
      this.status,
      this.user_id,
      this.user_profile,
      this.wallet_id});

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      account_request_status: json['account_request_status'],
      consultation_fee: json['consultation_fee'],
      country_code: json['country_code'],
      createdAt: json['createdAt'],
      customer_id: json['customer_id'],
      email: json['email'],
      first_name: json['first_name'],
      is_email_verified: json['is_email_verified'],
      is_phone_verified: json['is_phone_verified'],
      last_name: json['last_name'],
      phone: json['phone'],
      role: json['role'],
      social_id: json['social_id'],
      status: json['status'],
      user_id: json['user_id'],
      user_profile: json['user_profile'] != null
          ? UserProfile.fromJson(json['user_profile'])
          : null,
      wallet_id: json['wallet_id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['account_request_status'] = this.account_request_status;
    data['consultation_fee'] = this.consultation_fee;
    data['country_code'] = this.country_code;
    data['createdAt'] = this.createdAt;
    data['customer_id'] = this.customer_id;
    data['email'] = this.email;
    data['first_name'] = this.first_name;
    data['is_email_verified'] = this.is_email_verified;
    data['is_phone_verified'] = this.is_phone_verified;
    data['last_name'] = this.last_name;
    data['phone'] = this.phone;
    data['role'] = this.role;
    data['social_id'] = this.social_id;
    data['status'] = this.status;
    data['user_id'] = this.user_id;
    data['wallet_id'] = this.wallet_id;
    if (this.user_profile != null) {
      data['user_profile'] = this.user_profile.toJson();
    }
    return data;
  }
}

class PharmacyOrderItem {
  String pharmacy;
  List<PrescribedDrug> prescribed_drugs;
  String remarks;

  PharmacyOrderItem({this.pharmacy, this.prescribed_drugs, this.remarks});

  factory PharmacyOrderItem.fromJson(Map<String, dynamic> json) {
    return PharmacyOrderItem(
      pharmacy: json['pharmacy'],
      prescribed_drugs: json['prescribed_drugs'] != null
          ? (json['prescribed_drugs'] as List)
              .map((i) => PrescribedDrug.fromJson(i))
              .toList()
          : null,
      remarks: json['remarks'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pharmacy'] = this.pharmacy;
    data['remarks'] = this.remarks;
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

class UserProfile {
  String profile_image;

  UserProfile({this.profile_image});

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      profile_image: json['profile_image'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['profile_image'] = this.profile_image;
    return data;
  }
}

class UserProfileX {
  String profile_image;

  UserProfileX({this.profile_image});

  factory UserProfileX.fromJson(Map<String, dynamic> json) {
    return UserProfileX(
      profile_image: json['profile_image'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['profile_image'] = this.profile_image;
    return data;
  }
}

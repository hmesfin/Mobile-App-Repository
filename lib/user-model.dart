class UserModel {
  int status;
  bool success;
  String message;
  Body body;

  UserModel({this.status, this.success, this.message, this.body});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    message = json['message'];
    body = json['body'] != null ? new Body.fromJson(json['body']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.body != null) {
      data['body'] = this.body.toJson();
    }
    return data;
  }
}

class Body {
  Data data;

  Body({this.data});

  Body.fromJson(Map<String, dynamic> json) {
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
  int userId;
  int status;
  int accountRequestStatus;
  String firstName;
  String lastName;
  String email;
  String countryCode;
  String phone;
  String role;
  bool isEmailVerified;
  bool isPhoneVerified;
  Null socialId;
  UserProfile userProfile;
  int percentageProfileComplete;

  Data(
      {this.userId,
      this.status,
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
      this.userProfile,
      this.percentageProfileComplete});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    status = json['status'];
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
    userProfile = json['user_profile'] != null
        ? new UserProfile.fromJson(json['user_profile'])
        : null;
    percentageProfileComplete = json['percentage_profile_complete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['status'] = this.status;
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
    if (this.userProfile != null) {
      data['user_profile'] = this.userProfile.toJson();
    }
    data['percentage_profile_complete'] = this.percentageProfileComplete;
    return data;
  }
}

class UserProfile {
  int profileId;
  int fkUserId;
  int maxProfilingStep;
  List<String> completedSteps;
  String profileImage;
  Null location;
  Null language;
  bool isNotify;
  List<String> fcmTokens;
  Biometrics biometrics;
  Null personalHistory;
  Null medicalHistory;
  Null familyHistory;
  EnrollmentInformation enrollmentInformation;
  Address address;
  Documents documents;
  int avgRating;
  Null description;
  int consultationFee;
  String createdAt;
  String updatedAt;

  UserProfile(
      {this.profileId,
      this.fkUserId,
      this.maxProfilingStep,
      this.completedSteps,
      this.profileImage,
      this.location,
      this.language,
      this.isNotify,
      this.fcmTokens,
      this.biometrics,
      this.personalHistory,
      this.medicalHistory,
      this.familyHistory,
      this.enrollmentInformation,
      this.address,
      this.documents,
      this.avgRating,
      this.description,
      this.consultationFee,
      this.createdAt,
      this.updatedAt});

  UserProfile.fromJson(Map<String, dynamic> json) {
    profileId = json['profile_id'];
    fkUserId = json['fk_user_id'];
    maxProfilingStep = json['max_profiling_step'];
    completedSteps = json['completed_steps'].cast<String>();
    profileImage = json['profile_image'];
    location = json['location'];
    language = json['language'];
    isNotify = json['is_notify'];
    fcmTokens = json['fcm_tokens'].cast<String>();
    biometrics = json['biometrics'] != null
        ? new Biometrics.fromJson(json['biometrics'])
        : null;
    personalHistory = json['personal_history'];
    medicalHistory = json['medical_history'];
    familyHistory = json['family_history'];
    enrollmentInformation = json['enrollment_information'] != null
        ? new EnrollmentInformation.fromJson(json['enrollment_information'])
        : null;
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    documents = json['documents'] != null
        ? new Documents.fromJson(json['documents'])
        : null;
    avgRating = json['avg_rating'];
    description = json['description'];
    consultationFee = json['consultation_fee'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['profile_id'] = this.profileId;
    data['fk_user_id'] = this.fkUserId;
    data['max_profiling_step'] = this.maxProfilingStep;
    data['completed_steps'] = this.completedSteps;
    data['profile_image'] = this.profileImage;
    data['location'] = this.location;
    data['language'] = this.language;
    data['is_notify'] = this.isNotify;
    data['fcm_tokens'] = this.fcmTokens;
    if (this.biometrics != null) {
      data['biometrics'] = this.biometrics.toJson();
    }
    data['personal_history'] = this.personalHistory;
    data['medical_history'] = this.medicalHistory;
    data['family_history'] = this.familyHistory;
    if (this.enrollmentInformation != null) {
      data['enrollment_information'] = this.enrollmentInformation.toJson();
    }
    if (this.address != null) {
      data['address'] = this.address.toJson();
    }
    if (this.documents != null) {
      data['documents'] = this.documents.toJson();
    }
    data['avg_rating'] = this.avgRating;
    data['description'] = this.description;
    data['consultation_fee'] = this.consultationFee;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Biometrics {
  String dob;
  String gender;

  Biometrics({this.dob, this.gender});

  Biometrics.fromJson(Map<String, dynamic> json) {
    dob = json['dob'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    return data;
  }
}

class EnrollmentInformation {
  String dlNumber;
  String speciality;
  String ssnNumber;
  String subSpeciality;
  String additionalInfo;
  String dlIssuingState;
  List<String> languagesSpoken;
  String dlIssuingCountry;
  int yearsOfExperience;
  String usDeaLicenseNumber;
  List<String> countriesLicenseToPractice;

  EnrollmentInformation(
      {this.dlNumber,
      this.speciality,
      this.ssnNumber,
      this.subSpeciality,
      this.additionalInfo,
      this.dlIssuingState,
      this.languagesSpoken,
      this.dlIssuingCountry,
      this.yearsOfExperience,
      this.usDeaLicenseNumber,
      this.countriesLicenseToPractice});

  EnrollmentInformation.fromJson(Map<String, dynamic> json) {
    dlNumber = json['dl_number'];
    speciality = json['speciality'];
    ssnNumber = json['ssn_number'];
    subSpeciality = json['sub_speciality'];
    additionalInfo = json['additional_info'];
    dlIssuingState = json['dl_issuing_state'];
    languagesSpoken = json['languages_spoken'].cast<String>();
    dlIssuingCountry = json['dl_issuing_country'];
    yearsOfExperience = json['years_of_experience'];
    usDeaLicenseNumber = json['us_dea_license_number'];
    countriesLicenseToPractice =
        json['countries_license_to_practice'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dl_number'] = this.dlNumber;
    data['speciality'] = this.speciality;
    data['ssn_number'] = this.ssnNumber;
    data['sub_speciality'] = this.subSpeciality;
    data['additional_info'] = this.additionalInfo;
    data['dl_issuing_state'] = this.dlIssuingState;
    data['languages_spoken'] = this.languagesSpoken;
    data['dl_issuing_country'] = this.dlIssuingCountry;
    data['years_of_experience'] = this.yearsOfExperience;
    data['us_dea_license_number'] = this.usDeaLicenseNumber;
    data['countries_license_to_practice'] = this.countriesLicenseToPractice;
    return data;
  }
}

class Address {
  String city;
  Null state;
  String region;
  Null wereda;
  Null country;
  String houseNo;
  String subCity;
  Null zipCode;
  Null groupNumber;
  Null insuredName;
  Null policyNumber;
  Null addressLine1;
  Null addressLine2;
  Null insuranceCarrier;

  Address(
      {this.city,
      this.state,
      this.region,
      this.wereda,
      this.country,
      this.houseNo,
      this.subCity,
      this.zipCode,
      this.groupNumber,
      this.insuredName,
      this.policyNumber,
      this.addressLine1,
      this.addressLine2,
      this.insuranceCarrier});

  Address.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    state = json['state'];
    region = json['region'];
    wereda = json['wereda'];
    country = json['country'];
    houseNo = json['house_no'];
    subCity = json['sub_city'];
    zipCode = json['zip_code'];
    groupNumber = json['group_number'];
    insuredName = json['insured_name'];
    policyNumber = json['policy_number'];
    addressLine1 = json['address_line_1'];
    addressLine2 = json['address_line_2'];
    insuranceCarrier = json['insurance_carrier'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['state'] = this.state;
    data['region'] = this.region;
    data['wereda'] = this.wereda;
    data['country'] = this.country;
    data['house_no'] = this.houseNo;
    data['sub_city'] = this.subCity;
    data['zip_code'] = this.zipCode;
    data['group_number'] = this.groupNumber;
    data['insured_name'] = this.insuredName;
    data['policy_number'] = this.policyNumber;
    data['address_line_1'] = this.addressLine1;
    data['address_line_2'] = this.addressLine2;
    data['insurance_carrier'] = this.insuranceCarrier;
    return data;
  }
}

class Documents {
  String residencyDoc;
  String fellowshipDoc;
  Null deaCertification;
  Null stateLicenseDoc;
  String nationalLicenseDoc;
  String digitalSignatureDoc;
  String undergraduateDegreeDoc;
  String medicalSchoolDegreeDoc;

  Documents(
      {this.residencyDoc,
      this.fellowshipDoc,
      this.deaCertification,
      this.stateLicenseDoc,
      this.nationalLicenseDoc,
      this.digitalSignatureDoc,
      this.undergraduateDegreeDoc,
      this.medicalSchoolDegreeDoc});

  Documents.fromJson(Map<String, dynamic> json) {
    residencyDoc = json['residency_doc'];
    fellowshipDoc = json['fellowship_doc'];
    deaCertification = json['dea_certification'];
    stateLicenseDoc = json['state_license_doc'];
    nationalLicenseDoc = json['national_license_doc'];
    digitalSignatureDoc = json['digital_signature_doc'];
    undergraduateDegreeDoc = json['undergraduate_degree_doc'];
    medicalSchoolDegreeDoc = json['medical_school_degree_doc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['residency_doc'] = this.residencyDoc;
    data['fellowship_doc'] = this.fellowshipDoc;
    data['dea_certification'] = this.deaCertification;
    data['state_license_doc'] = this.stateLicenseDoc;
    data['national_license_doc'] = this.nationalLicenseDoc;
    data['digital_signature_doc'] = this.digitalSignatureDoc;
    data['undergraduate_degree_doc'] = this.undergraduateDegreeDoc;
    data['medical_school_degree_doc'] = this.medicalSchoolDegreeDoc;
    return data;
  }
}

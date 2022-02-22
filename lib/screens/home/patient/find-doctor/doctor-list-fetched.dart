class DoctorList {
  int status;
  bool success;
  String message;
  Body body;

  DoctorList({this.status, this.success, this.message, this.body});

  DoctorList.fromJson(Map<String, dynamic> json) {
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
  int count;
  List<Rows> rows;

  Data({this.count, this.rows});

  Data.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['rows'] != null) {
      rows = new List<Rows>();
      json['rows'].forEach((v) {
        rows.add(new Rows.fromJson(v));
      });
    }
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

class Rows {
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
  String createdAt;
  String totalReviews;
  UserProfile userProfile;

  Rows({this.userId,
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
    this.createdAt,
    this.totalReviews,
    this.userProfile});

  Rows.fromJson(Map<String, dynamic> json) {
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
    createdAt = json['createdAt'];
    totalReviews = json['total_reviews'];
    userProfile = json['user_profile'] != null
        ? new UserProfile.fromJson(json['user_profile'])
        : null;
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
    data['createdAt'] = this.createdAt;
    data['total_reviews'] = this.totalReviews;
    if (this.userProfile != null) {
      data['user_profile'] = this.userProfile.toJson();
    }
    return data;
  }
}

class UserProfile {
  String profileImage;
  EnrollmentInformation enrollmentInformation;
  double avgRating;
  Address address;
  int consultationFee;
  Null description;
  List<String> completedSteps;
  int maxProfilingStep;

  UserProfile({this.profileImage,
    this.enrollmentInformation,
    this.avgRating,
    this.address,
    this.consultationFee,
    this.description,
    this.completedSteps,
    this.maxProfilingStep});

  UserProfile.fromJson(Map<String, dynamic> json) {
    profileImage = json['profile_image'];
    enrollmentInformation = json['enrollment_information'] != null
        ? new EnrollmentInformation.fromJson(json['enrollment_information'])
        : null;
    avgRating = json['avg_rating'];
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    consultationFee = json['consultation_fee'];
    description = json['description'];
    completedSteps = json['completed_steps']?.cast<String>();
    maxProfilingStep = json['max_profiling_step'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['profile_image'] = this.profileImage;
    if (this.enrollmentInformation != null) {
      data['enrollment_information'] = this.enrollmentInformation.toJson();
    }
    data['avg_rating'] = this.avgRating;
    if (this.address != null) {
      data['address'] = this.address.toJson();
    }
    data['consultation_fee'] = this.consultationFee;
    data['description'] = this.description;
    data['completed_steps'] = this.completedSteps;
    data['max_profiling_step'] = this.maxProfilingStep;
    return data;
  }
}

class EnrollmentInformation {
  List<String> speciality;
  String subSpeciality;
  int yearsOfExperience;
  String dlNumber;
  String postGrad;
  String ssnNumber;
  String underGrad;
  String additionalInfo;
  String dlIssuingState;
  List<String> languagesSpoken;
  String dlIssuingCountry;
  String usDeaLicenseNumber;
  String stateLicenseToPractice;
  List<String> countriesLicenseToPractice;

  EnrollmentInformation({this.speciality,
    this.subSpeciality,
    this.yearsOfExperience,
    this.dlNumber,
    this.postGrad,
    this.ssnNumber,
    this.underGrad,
    this.additionalInfo,
    this.dlIssuingState,
    this.languagesSpoken,
    this.dlIssuingCountry,
    this.usDeaLicenseNumber,
    this.stateLicenseToPractice,
    this.countriesLicenseToPractice});

  EnrollmentInformation.fromJson(Map<String, dynamic> json) {
    speciality = json['speciality']?.cast<String>();
    subSpeciality = json['sub_speciality'];
    yearsOfExperience = json['years_of_experience'];
    dlNumber = json['dl_number'];
    postGrad = json['post_grad'];
    ssnNumber = json['ssn_number'];
    underGrad = json['under_grad'];
    additionalInfo = json['additional_info'];
    dlIssuingState = json['dl_issuing_state'];
    languagesSpoken = json['languages_spoken']?.cast<String>();
    dlIssuingCountry = json['dl_issuing_country'];
    usDeaLicenseNumber = json['us_dea_license_number'];
    stateLicenseToPractice = json['state_license_to_practice'];
    countriesLicenseToPractice =
        json['countries_license_to_practice']?.cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['speciality'] = this.speciality;
    data['sub_speciality'] = this.subSpeciality;
    data['years_of_experience'] = this.yearsOfExperience;
    data['dl_number'] = this.dlNumber;
    data['post_grad'] = this.postGrad;
    data['ssn_number'] = this.ssnNumber;
    data['under_grad'] = this.underGrad;
    data['additional_info'] = this.additionalInfo;
    data['dl_issuing_state'] = this.dlIssuingState;
    data['languages_spoken'] = this.languagesSpoken;
    data['dl_issuing_country'] = this.dlIssuingCountry;
    data['us_dea_license_number'] = this.usDeaLicenseNumber;
    data['state_license_to_practice'] = this.stateLicenseToPractice;
    data['countries_license_to_practice'] = this.countriesLicenseToPractice;
    return data;
  }
}

class Address {
  String city;
  String state;
  String country;
  String region;
  Null wereda;
  String houseNo;
  String subCity;
  String zipCode;
  Null groupNumber;
  Null insuredName;
  Null policyNumber;
  String addressLine1;
  String addressLine2;
  Null insuranceCarrier;

  Address({this.city,
    this.state,
    this.country,
    this.region,
    this.wereda,
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
    country = json['country'];
    region = json['region'];
    wereda = json['wereda'];
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
    data['country'] = this.country;
    data['region'] = this.region;
    data['wereda'] = this.wereda;
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

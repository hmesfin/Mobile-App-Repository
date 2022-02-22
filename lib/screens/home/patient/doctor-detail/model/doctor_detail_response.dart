class DoctorDetailResponse {
  int status;
  bool success;
  String message;
  DoctorDetailBody body;

  DoctorDetailResponse({this.status, this.success, this.message, this.body});

  DoctorDetailResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    message = json['message'];
    body = json['body'] != null
        ? new DoctorDetailBody.fromJson(json['body'])
        : null;
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

class DoctorDetailBody {
  DoctorDetailData data;

  DoctorDetailBody({this.data});

  DoctorDetailBody.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? new DoctorDetailData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class DoctorDetailData {
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
  DoctorDetailUserProfile userProfile;

  DoctorDetailData({this.userId,
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
    this.userProfile});

  DoctorDetailData.fromJson(Map<String, dynamic> json) {
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
    userProfile = json['user_profile'] != null
        ? new DoctorDetailUserProfile.fromJson(json['user_profile'])
        : null;
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
    if (this.userProfile != null) {
      data['user_profile'] = this.userProfile.toJson();
    }
    return data;
  }
}

class DoctorDetailUserProfile {
  String profileImage;
  DoctorDetailEnrollmentInformation enrollmentInformation;
  DoctorDetailBiometrics biometrics;
  double avgRating;
  DoctorDetailAddress address;
  String description;
  List<String> completedSteps;
  int maxProfilingStep;

  DoctorDetailUserProfile({this.profileImage,
    this.enrollmentInformation,
    this.biometrics,
    this.avgRating,
    this.address,
    this.description,
    this.completedSteps,
    this.maxProfilingStep});

  DoctorDetailUserProfile.fromJson(Map<String, dynamic> json) {
    profileImage = json['profile_image'];
    enrollmentInformation = json['enrollment_information'] != null
        ? new DoctorDetailEnrollmentInformation.fromJson(
        json['enrollment_information'])
        : null;
    biometrics = json['biometrics'] != null
        ? new DoctorDetailBiometrics.fromJson(json['biometrics'])
        : null;
    avgRating = json['avg_rating'].toDouble();
    address = json['address'] != null
        ? new DoctorDetailAddress.fromJson(json['address'])
        : null;
    description = json['description'];
    completedSteps = json['completed_steps'].cast<String>();
    maxProfilingStep = json['max_profiling_step'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['profile_image'] = this.profileImage;
    if (this.enrollmentInformation != null) {
      data['enrollment_information'] = this.enrollmentInformation.toJson();
    }
    if (this.biometrics != null) {
      data['biometrics'] = this.biometrics.toJson();
    }
    data['avg_rating'] = this.avgRating;
    if (this.address != null) {
      data['address'] = this.address.toJson();
    }
    data['description'] = this.description;
    data['completed_steps'] = this.completedSteps;
    data['max_profiling_step'] = this.maxProfilingStep;
    return data;
  }
}

class DoctorDetailEnrollmentInformation {
  String dlNumber;
  String postGrad;
  List<String> speciality;
  String ssnNumber;
  String underGrad;
  String subSpeciality;
  String additionalInfo;
  List<String> languagesSpoken;
  String dlIssuingCountry;
  int yearsOfExperience;
  String usDeaLicenseNumber;
  List<String> stateLicenseToPractice;
  List<String> countriesLicenseToPractice;

  DoctorDetailEnrollmentInformation({this.dlNumber,
    this.postGrad,
    this.speciality,
    this.ssnNumber,
    this.underGrad,
    this.subSpeciality,
    this.additionalInfo,
    this.languagesSpoken,
    this.dlIssuingCountry,
    this.yearsOfExperience,
    this.usDeaLicenseNumber,
    this.stateLicenseToPractice,
    this.countriesLicenseToPractice});

  DoctorDetailEnrollmentInformation.fromJson(Map<String, dynamic> json) {
    dlNumber = json['dl_number'];
    postGrad = json['post_grad'];
    speciality = json['speciality'].cast<String>();
    ssnNumber = json['ssn_number'];
    underGrad = json['under_grad'];
    subSpeciality = json['sub_speciality'];
    additionalInfo = json['additional_info'];
    languagesSpoken = json['languages_spoken'] != null
        ? json['languages_spoken'].cast<String>()
        : [''];
    dlIssuingCountry = json['dl_issuing_country'];
    yearsOfExperience = json['years_of_experience'];
    usDeaLicenseNumber = json['us_dea_license_number'];
    stateLicenseToPractice = json['state_license_to_practice'] != null
        ? json['state_license_to_practice'].cast<String>()
        : [""];
    countriesLicenseToPractice = json['countries_license_to_practice'] != null
        ? json['countries_license_to_practice'].cast<String>()
        : [''];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dl_number'] = this.dlNumber;
    data['post_grad'] = this.postGrad;
    data['speciality'] = this.speciality;
    data['ssn_number'] = this.ssnNumber;
    data['under_grad'] = this.underGrad;
    data['sub_speciality'] = this.subSpeciality;
    data['additional_info'] = this.additionalInfo;
    data['languages_spoken'] = this.languagesSpoken;
    data['dl_issuing_country'] = this.dlIssuingCountry;
    data['years_of_experience'] = this.yearsOfExperience;
    data['us_dea_license_number'] = this.usDeaLicenseNumber;
    data['state_license_to_practice'] = this.stateLicenseToPractice;
    data['countries_license_to_practice'] = this.countriesLicenseToPractice;
    return data;
  }
}

class DoctorDetailBiometrics {
  String dob;
  String unit;
  String gender;
  int height;
  int weight;

  DoctorDetailBiometrics(
      {this.dob, this.unit, this.gender, this.height, this.weight});

  DoctorDetailBiometrics.fromJson(Map<String, dynamic> json) {
    dob = json['dob'];
    unit = json['unit'];
    gender = json['gender'];
    height = json['height'];
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dob'] = this.dob;
    data['unit'] = this.unit;
    data['gender'] = this.gender;
    data['height'] = this.height;
    data['weight'] = this.weight;
    return data;
  }
}

class DoctorDetailAddress {
  String city;
  String state;
  String region;
  String wereda;
  String country;
  String houseNo;
  String subCity;
  String zipCode;
  String groupNumber;
  String insuredName;
  String policyNumber;
  String addressLine1;
  String addressLine2;
  String insuranceCarrier;

  DoctorDetailAddress({this.city,
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

  DoctorDetailAddress.fromJson(Map<String, dynamic> json) {
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

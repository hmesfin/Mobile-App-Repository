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
  bool accountRequestStatus;
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
  UserProfile userProfile;
  int percentageProfileComplete;

  Data({this.userId,
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
    createdAt = json['createdAt'];
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
    data['createdAt'] = this.createdAt;
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
  String location;
  String language;
  bool isNotify;
  List<String> fcmTokens;
  Biometrics biometrics;
  PersonalHistory personalHistory;
  MedicalHistory medicalHistory;
  FamilyHistory familyHistory;
  EnrollmentInformation enrollmentInformation;
  Addess address;
  Documents documents;
  int avgRating;
  String description;
  int consultationFee;
  String createdAt;
  String updatedAt;

  UserProfile({this.profileId,
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
    personalHistory = json['personal_history'] != null
        ? new PersonalHistory.fromJson(json['personal_history'])
        : null;
    medicalHistory = json['medical_history'] != null
        ? new MedicalHistory.fromJson(json['medical_history'])
        : null;
    familyHistory = json['family_history'] != null
        ? new FamilyHistory.fromJson(json['family_history'])
        : null;
    enrollmentInformation = json['enrollment_information'] != null
        ? new EnrollmentInformation.fromJson(json['enrollment_information'])
        : null;
    address = json['address'];
    documents = json['documents'];
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
    if (this.personalHistory != null) {
      data['personal_history'] = this.personalHistory.toJson();
    }
    if (this.medicalHistory != null) {
      data['medical_history'] = this.medicalHistory.toJson();
    }
    if (this.familyHistory != null) {
      data['family_history'] = this.familyHistory.toJson();
    }
    if (this.enrollmentInformation != null) {
      data['enrollment_information'] = this.enrollmentInformation.toJson();
    }
    data['address'] = this.address;
    data['documents'] = this.documents;
    data['avg_rating'] = this.avgRating;
    data['description'] = this.description;
    data['consultation_fee'] = this.consultationFee;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Documents {
  String residencyDoc;
  String fellowshipDoc;
  String deaCertification;
  String stateLicenseDoc;
  String nationalLicenseDoc;
  String digitalSignatureDoc;
  String undergraduateDegreeDoc;
  String medicalSchoolDegreeDoc;
  String specialityDoc;
  String subspecialityDoc;

  Documents({this.residencyDoc,
    this.fellowshipDoc,
    this.deaCertification,
    this.stateLicenseDoc,
    this.specialityDoc,
    this.subspecialityDoc,
    this.nationalLicenseDoc,
    this.digitalSignatureDoc,
    this.undergraduateDegreeDoc,
    this.medicalSchoolDegreeDoc});

  Documents.fromJson(Map<String, dynamic> json) {
    residencyDoc = json['residency_doc'] ?? '';
    fellowshipDoc = json['fellowship_doc'] ?? '';
    deaCertification = json['dea_certification'] ?? '';
    stateLicenseDoc = json['state_license_doc'] ?? '';
    nationalLicenseDoc = json['national_license_doc'] ?? '';
    digitalSignatureDoc = json['digital_signature_doc'] ?? '';
    undergraduateDegreeDoc = json['undergraduate_degree_doc'] ?? '';
    medicalSchoolDegreeDoc = json['medical_school_degree_doc'] ?? '';
    specialityDoc = json['speciality_doc'] ?? '';
    subspecialityDoc = json['sub_speciality_doc'] ?? '';
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
    data['speciality_doc'] = this.specialityDoc;
    data['sub_speciality_doc'] = this.subspecialityDoc;
    return data;
  }
}

class Addess {
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

  Addess({this.city,
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

  Addess.fromJson(Map<String, dynamic> json) {
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

class Biometrics {
  String dob;
  String unit;
  String gender;
  int height;
  int weight;
  String profileImage;

  Biometrics({this.dob,
    this.unit,
    this.gender,
    this.height,
    this.weight,
    this.profileImage});

  Biometrics.fromJson(Map<String, dynamic> json) {
    dob = json['dob'];
    unit = json['unit'];
    gender = json['gender'];
    height = json['height'];
    weight = json['weight'];
    profileImage = json['profile_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dob'] = this.dob;
    data['unit'] = this.unit;
    data['gender'] = this.gender;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['profile_image'] = this.profileImage;
    return data;
  }
}

class PersonalHistory {
  Drink drink;
  Drink drugs;
  Drink smoke;
  Drink children;
  String maritalStatus;

  PersonalHistory(
      {this.drink, this.drugs, this.smoke, this.children, this.maritalStatus});

  PersonalHistory.fromJson(Map<String, dynamic> json) {
    drink = json['drink'] != null ? new Drink.fromJson(json['drink']) : null;
    drugs = json['drugs'] != null ? new Drink.fromJson(json['drugs']) : null;
    smoke = json['smoke'] != null ? new Drink.fromJson(json['smoke']) : null;
    children =
    json['children'] != null ? new Drink.fromJson(json['children']) : null;
    maritalStatus = json['marital_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.drink != null) {
      data['drink'] = this.drink.toJson();
    }
    if (this.drugs != null) {
      data['drugs'] = this.drugs.toJson();
    }
    if (this.smoke != null) {
      data['smoke'] = this.smoke.toJson();
    }
    if (this.children != null) {
      data['children'] = this.children.toJson();
    }
    data['marital_status'] = this.maritalStatus;
    return data;
  }
}

class Drink {
  int count;
  bool isbool;

  Drink({this.count, this.isbool});

  Drink.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    isbool = json['isbool'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['isbool'] = this.isbool;
    return data;
  }
}

class MedicalHistory {
  bool copdDisease;
  bool heartDisease;
  bool asthmaDisease;
  bool cancerDisease;
  bool kidenyDisease;
  bool hospitalization;
  bool diabetesDisease;
  int howLongAgoMonths;
  bool highBlodPresureDisease;

  MedicalHistory({this.copdDisease,
    this.heartDisease,
    this.asthmaDisease,
    this.cancerDisease,
    this.kidenyDisease,
    this.hospitalization,
    this.diabetesDisease,
    this.howLongAgoMonths,
    this.highBlodPresureDisease});

  MedicalHistory.fromJson(Map<String, dynamic> json) {
    copdDisease = json['copd_disease'];
    heartDisease = json['heart_disease'];
    asthmaDisease = json['asthma_disease'];
    cancerDisease = json['cancer_disease'];
    kidenyDisease = json['kideny_disease'];
    hospitalization = json['hospitalization'];
    diabetesDisease = json['diabetes_disease'];
    howLongAgoMonths = json['how_long_ago_months'];
    highBlodPresureDisease = json['high_blod_presure_disease'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['copd_disease'] = this.copdDisease;
    data['heart_disease'] = this.heartDisease;
    data['asthma_disease'] = this.asthmaDisease;
    data['cancer_disease'] = this.cancerDisease;
    data['kideny_disease'] = this.kidenyDisease;
    data['hospitalization'] = this.hospitalization;
    data['diabetes_disease'] = this.diabetesDisease;
    data['how_long_ago_months'] = this.howLongAgoMonths;
    data['high_blod_presure_disease'] = this.highBlodPresureDisease;
    return data;
  }
}

class FamilyHistory {
  HeartDisease heartDisease;
  HeartDisease asthmaDisease;
  HeartDisease cancerDisease;
  HeartDisease diabetesDisease;
  HeartDisease highBlodPresureDisease;

  FamilyHistory({this.heartDisease,
    this.asthmaDisease,
    this.cancerDisease,
    this.diabetesDisease,
    this.highBlodPresureDisease});

  FamilyHistory.fromJson(Map<String, dynamic> json) {
    heartDisease = json['heart_disease'] != null
        ? new HeartDisease.fromJson(json['heart_disease'])
        : null;
    asthmaDisease = json['asthma_disease'] != null
        ? new HeartDisease.fromJson(json['asthma_disease'])
        : null;
    cancerDisease = json['cancer_disease'] != null
        ? new HeartDisease.fromJson(json['cancer_disease'])
        : null;
    diabetesDisease = json['diabetes_disease'] != null
        ? new HeartDisease.fromJson(json['diabetes_disease'])
        : null;
    highBlodPresureDisease = json['high_blod_presure_disease'] != null
        ? new HeartDisease.fromJson(json['high_blod_presure_disease'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.heartDisease != null) {
      data['heart_disease'] = this.heartDisease.toJson();
    }
    if (this.asthmaDisease != null) {
      data['asthma_disease'] = this.asthmaDisease.toJson();
    }
    if (this.cancerDisease != null) {
      data['cancer_disease'] = this.cancerDisease.toJson();
    }
    if (this.diabetesDisease != null) {
      data['diabetes_disease'] = this.diabetesDisease.toJson();
    }
    if (this.highBlodPresureDisease != null) {
      data['high_blod_presure_disease'] = this.highBlodPresureDisease.toJson();
    }
    return data;
  }
}

class HeartDisease {
  bool isbool;
  List<String> memberNames;

  HeartDisease({this.isbool, this.memberNames});

  HeartDisease.fromJson(Map<String, dynamic> json) {
    isbool = json['isbool'];
    memberNames = json['member_names'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isbool'] = this.isbool;
    data['member_names'] = this.memberNames;
    return data;
  }
}

class EnrollmentInformation {
  String dlNumber;
  String postGrad;
  List<String> speciality;
  String ssnNumber;
  String underGrad;
  String subSpeciality;
  String additionalInfo;
  String dlIssuingState;
  List<String> languagesSpoken;
  String dlIssuingCountry;
  int yearsOfExperience;
  String usDeaLicenseNumber;
  List<String> stateLicenseToPractice;
  List<String> countriesLicenseToPractice;

  EnrollmentInformation({this.dlNumber,
    this.postGrad,
    this.speciality,
    this.ssnNumber,
    this.underGrad,
    this.subSpeciality,
    this.additionalInfo,
    this.dlIssuingState,
    this.languagesSpoken,
    this.dlIssuingCountry,
    this.yearsOfExperience,
    this.usDeaLicenseNumber,
    this.stateLicenseToPractice,
    this.countriesLicenseToPractice});

  EnrollmentInformation.fromJson(Map<String, dynamic> json) {
    dlNumber = json['dl_number'];
    postGrad = json['post_grad'];
    speciality =
    json['speciality'].length != 0 ? json['speciality'].cast<String>() : [];
    ssnNumber = json['ssn_number'];
    underGrad = json['under_grad'];
    subSpeciality = json['sub_speciality'];
    additionalInfo = json['additional_info'];
    dlIssuingState = json['dl_issuing_state'];
    languagesSpoken = json['languages_spoken'] != null
        ? json['languages_spoken'].cast<String>()
        : ['N.A.'];
    dlIssuingCountry = json['dl_issuing_country'];
    yearsOfExperience = json['years_of_experience'];
    usDeaLicenseNumber = json['us_dea_license_number'];
    stateLicenseToPractice = json['state_license_to_practice'] != null
        ? json['state_license_to_practice'].cast<String>()
        : ['N.A.'];
    countriesLicenseToPractice = json['countries_license_to_practice'] != null
        ? json['countries_license_to_practice'].cast<String>()
        : ['N.A.'];
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
    data['dl_issuing_state'] = this.dlIssuingState;
    data['languages_spoken'] = this.languagesSpoken;
    data['dl_issuing_country'] = this.dlIssuingCountry;
    data['years_of_experience'] = this.yearsOfExperience;
    data['us_dea_license_number'] = this.usDeaLicenseNumber;
    data['state_license_to_practice'] = this.stateLicenseToPractice;
    data['countries_license_to_practice'] = this.countriesLicenseToPractice;
    return data;
  }
}

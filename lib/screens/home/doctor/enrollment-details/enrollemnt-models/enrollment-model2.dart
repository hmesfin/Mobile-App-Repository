class EnrollStepModel2 {
  String action;
  EnrollmentStep2 enrollmentStep2;

  EnrollStepModel2({this.action, this.enrollmentStep2});

  EnrollStepModel2.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    enrollmentStep2 = json['enrollment_step_2'] != null
        ? new EnrollmentStep2.fromJson(json['enrollment_step_2'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['action'] = this.action;
    if (this.enrollmentStep2 != null) {
      data['enrollment_step_2'] = this.enrollmentStep2.toJson();
    }
    return data;
  }
}

class EnrollmentStep2 {
  int yearsOfExperience;
  List<String> speciality;
  String subSpeciality;
  String ssnNumber;
  String dlNumber;
  String dlIssuingCountry;
  String dlIssuingState;
  String usDeaLicenseNumber;
  List<String> languagesSpoken;
  List<String> countriesLicenseToPractice;
  List<String> stateLicenseToPractice;
  String additionalInfo;
  String underGrad;
  String postGrad;

  EnrollmentStep2({this.yearsOfExperience,
    this.speciality,
    this.subSpeciality,
    this.ssnNumber,
    this.dlNumber,
    this.dlIssuingCountry,
    this.dlIssuingState,
    this.usDeaLicenseNumber,
    this.languagesSpoken,
    this.countriesLicenseToPractice,
    this.stateLicenseToPractice,
    this.additionalInfo,
    this.underGrad,
    this.postGrad});

  EnrollmentStep2.fromJson(Map<String, dynamic> json) {
    yearsOfExperience = json['years_of_experience'];
    speciality = json['speciality'].cast<String>();
    subSpeciality = json['sub_speciality'];
    ssnNumber = json['ssn_number'];
    dlNumber = json['dl_number'];
    dlIssuingCountry = json['dl_issuing_country'];
    dlIssuingState = json['dl_issuing_state'];
    usDeaLicenseNumber = json['us_dea_license_number'];
    languagesSpoken = json['languages_spoken'].cast<String>();
    countriesLicenseToPractice =
        json['countries_license_to_practice'].cast<String>();
    stateLicenseToPractice = json['state_license_to_practice'];
    additionalInfo = json['additional_info'];
    underGrad = json['under_grad'];
    postGrad = json['post_grad'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['years_of_experience'] = this.yearsOfExperience;
    data['speciality'] = this.speciality;
    data['sub_speciality'] = this.subSpeciality;
    data['ssn_number'] = this.ssnNumber;
    data['dl_number'] = this.dlNumber;
    data['dl_issuing_country'] = this.dlIssuingCountry;
    data['dl_issuing_state'] = this.dlIssuingState;
    data['us_dea_license_number'] = this.usDeaLicenseNumber;
    data['languages_spoken'] = this.languagesSpoken;
    data['countries_license_to_practice'] = this.countriesLicenseToPractice;
    data['state_license_to_practice'] = this.stateLicenseToPractice;
    data['additional_info'] = this.additionalInfo;
    data['under_grad'] = this.underGrad;
    data['post_grad'] = this.postGrad;
    return data;
  }
}

class EnrollStepModel3 {
  EnrollmentStep3 enrollmentStep3;
  String action;

  EnrollStepModel3({this.enrollmentStep3, this.action});

  EnrollStepModel3.fromJson(Map<String, dynamic> json) {
    enrollmentStep3 = json['enrollment_step_3'] != null
        ? new EnrollmentStep3.fromJson(json['enrollment_step_3'])
        : null;
    action = json['action'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.enrollmentStep3 != null) {
      data['enrollment_step_3'] = this.enrollmentStep3.toJson();
      data['action'] = this.action;
    }
    return data;
  }
}

class EnrollmentStep3 {
  String undergraduateDegreeDoc;
  String medicalSchoolDegreeDoc;
  String residencyDoc;
  String fellowshipDoc;
  String stateLicenseDoc;
  String nationalLicenseDoc;
  String deaCertification;
  String digitalSignatureDoc;
  String specialityDoc;
  String subspecialityDoc;

  EnrollmentStep3({this.undergraduateDegreeDoc,
    this.medicalSchoolDegreeDoc,
    this.residencyDoc,
    this.fellowshipDoc,
    this.stateLicenseDoc,
    this.nationalLicenseDoc,
    this.deaCertification,
    this.specialityDoc,
    this.subspecialityDoc,
    this.digitalSignatureDoc});

  EnrollmentStep3.fromJson(Map<String, dynamic> json) {
    undergraduateDegreeDoc = json['undergraduate_degree_doc'];
    medicalSchoolDegreeDoc = json['medical_school_degree_doc'];
    residencyDoc = json['residency_doc'];
    fellowshipDoc = json['fellowship_doc'];
    stateLicenseDoc = json['state_license_doc'];
    nationalLicenseDoc = json['national_license_doc'];
    deaCertification = json['dea_certification'];
    digitalSignatureDoc = json['digital_signature_doc'];
    specialityDoc = json['speciality_doc'] ?? '';
    subspecialityDoc = json['sub_speciality_doc'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['undergraduate_degree_doc'] = this.undergraduateDegreeDoc;
    data['medical_school_degree_doc'] = this.medicalSchoolDegreeDoc;
    data['residency_doc'] = this.residencyDoc;
    data['fellowship_doc'] = this.fellowshipDoc;
    data['state_license_doc'] = this.stateLicenseDoc;
    data['national_license_doc'] = this.nationalLicenseDoc;
    data['dea_certification'] = this.deaCertification;
    data['digital_signature_doc'] = this.digitalSignatureDoc;
    data['speciality_doc'] = this.specialityDoc;
    data['sub_speciality_doc'] = this.subspecialityDoc;
    return data;
  }
}

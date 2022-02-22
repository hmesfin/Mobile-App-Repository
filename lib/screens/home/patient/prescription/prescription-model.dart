class HistoryModel {
  int appointmentId;
  int doctorId;
  int patientId;
  String startTime;
  String endTime;
  String date;
  String purpose;
  String additionalNote;
  int status;
  double rating;

  String createdAt;
  String updatedAt;
  Doctor doctor;

  HistoryModel({this.appointmentId,
    this.doctorId,
    this.patientId,
    this.startTime,
    this.endTime,
    this.date,
    this.purpose,
    this.additionalNote,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.rating,
    this.doctor});

  HistoryModel.fromJson(Map<String, dynamic> json) {
    appointmentId = json['appointment_id'];
    doctorId = json['doctor_id'];
    patientId = json['patient_id'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    date = json['date'];
    rating = json['rating'] == null ? null : json['rating'].toDouble();
    purpose = json['purpose'];
    additionalNote = json['additional_note'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    doctor =
    json['doctor'] != null ? new Doctor.fromJson(json['doctor']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appointment_id'] = this.appointmentId;
    data['doctor_id'] = this.doctorId;
    data['patient_id'] = this.patientId;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['rating'] = this.rating;
    data['date'] = this.date;
    data['purpose'] = this.purpose;
    data['additional_note'] = this.additionalNote;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.doctor != null) {
      data['doctor'] = this.doctor.toJson();
    }
    return data;
  }
}

class Doctor {
  int userId;
  String firstName;
  String lastName;
  String email;
  String phone;
  UserProfile userProfile;

  Doctor({this.userId,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.userProfile});

  Doctor.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    userProfile = json['user_profile'] != null
        ? new UserProfile.fromJson(json['user_profile'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    if (this.userProfile != null) {
      data['user_profile'] = this.userProfile.toJson();
    }
    return data;
  }
}

class UserProfile {
  String profileImage;
  EnrollmentInformation enrollmentInformation;
  Biometrics biometrics;
  double avgRating;
  Address address;
  String description;
  List<String> completedSteps;
  int maxProfilingStep;

  UserProfile({this.profileImage,
    this.enrollmentInformation,
    this.biometrics,
    this.avgRating,
    this.address,
    this.description,
    this.completedSteps,
    this.maxProfilingStep});

  UserProfile.fromJson(Map<String, dynamic> json) {
    profileImage = json['profile_image'];
    enrollmentInformation = json['enrollment_information'] != null
        ? new EnrollmentInformation.fromJson(json['enrollment_information'])
        : null;
    biometrics = json['biometrics'] != null
        ? new Biometrics.fromJson(json['biometrics'])
        : null;
    avgRating =
    json['avg_rating'] == null ? 0.0 : json['avg_rating'].toDouble();

    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
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

class EnrollmentInformation {
  List<String> speciality;
  String subSpeciality;
  int yearsOfExperience;

  EnrollmentInformation(
      {this.speciality, this.subSpeciality, this.yearsOfExperience});

  EnrollmentInformation.fromJson(Map<String, dynamic> json) {
    speciality = json['speciality'].cast<String>();
    subSpeciality = json['sub_speciality'];
    yearsOfExperience = json['years_of_experience'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['speciality'] = this.speciality;
    data['sub_speciality'] = this.subSpeciality;
    data['years_of_experience'] = this.yearsOfExperience;
    return data;
  }
}

class Biometrics {
  String dob;
  String unit;
  String gender;
  int height;
  int weight;

  Biometrics({this.dob, this.unit, this.gender, this.height, this.weight});

  Biometrics.fromJson(Map<String, dynamic> json) {
    dob = json['dob'] ?? 'N.A.';
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

class Address {
  String city;
  String state;
  String region;
  String country;
  String zipCode;
  String groupNumber;
  String insuredName;
  String policyNumber;
  String addressLine1;
  String addressLine2;
  String insuranceCarrier;

  Address({this.city,
    this.state,
    this.region,
    this.country,
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
    country = json['country'];
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
    data['country'] = this.country;
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

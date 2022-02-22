class EnrollStepModel1 {
  EnrollmentStep1 enrollmentStep1;
  String action;

  EnrollStepModel1({this.enrollmentStep1, this.action});

  EnrollStepModel1.fromJson(Map<String, dynamic> json) {
    enrollmentStep1 = json['enrollment_step_1'] != null
        ? new EnrollmentStep1.fromJson(json['enrollment_step_1'])
        : null;
    action = json['action'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.enrollmentStep1 != null) {
      data['enrollment_step_1'] = this.enrollmentStep1.toJson();
      data['action'] = this.action;
    }
    return data;
  }
}

class EnrollmentStep1 {
  String firstName;
  String lastName;
  String email;
  String gender;
  String dob;
  String profileImage;
  UserAddress address;

  // String page;

  EnrollmentStep1({this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.dob,
    this.profileImage,
    this.address,
    // this.page
  });

  EnrollmentStep1.fromJson(Map<String, dynamic> json) {
    // page = json['page'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    gender = json['gender'];
    dob = json['dob'];
    profileImage = json['profile_image'];
    address = json['address'] != null
        ? new UserAddress.fromJson(json['address'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    //  data['page'] = this.page;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['profile_image'] = this.profileImage;
    if (this.address != null) {
      data['address'] = this.address.toJson();
    }
    return data;
  }
}

class UserAddress {
  String country;
  String region;
  String city;
  String subCity;
  String wereda;
  String houseNo;
  String addressLine1;
  String addressLine2;
  String state;
  String zipCode;
  String insuranceCarrier;
  String insuredName;
  String groupNumber;
  String policyNumber;

  UserAddress({this.country,
    this.region,
    this.city,
    this.subCity,
    this.wereda,
    this.houseNo,
    this.addressLine1,
    this.addressLine2,
    this.state,
    this.zipCode,
    this.insuranceCarrier,
    this.insuredName,
    this.groupNumber,
    this.policyNumber});

  UserAddress.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    region = json['region'];
    city = json['city'];
    subCity = json['sub_city'];
    wereda = json['wereda'];
    houseNo = json['house_no'];
    addressLine1 = json['address_line_1'];
    addressLine2 = json['address_line_2'];
    state = json['state'];
    zipCode = json['zip_code'];
    insuranceCarrier = json['insurance_carrier'];
    insuredName = json['insured_name'];
    groupNumber = json['group_number'];
    policyNumber = json['policy_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['region'] = this.region;
    data['city'] = this.city;
    data['sub_city'] = this.subCity;
    data['wereda'] = this.wereda;
    data['house_no'] = this.houseNo;
    data['address_line_1'] = this.addressLine1;
    data['address_line_2'] = this.addressLine2;
    data['state'] = this.state;
    data['zip_code'] = this.zipCode;
    data['insurance_carrier'] = this.insuranceCarrier;
    data['insured_name'] = this.insuredName;
    data['group_number'] = this.groupNumber;
    data['policy_number'] = this.policyNumber;
    return data;
  }
}

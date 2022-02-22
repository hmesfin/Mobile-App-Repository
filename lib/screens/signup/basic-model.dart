class BasicModel {
  Biometrics biometrics;
  String action;

  BasicModel({this.biometrics, this.action});

  BasicModel.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    biometrics = json['biometrics'] != null
        ? new Biometrics.fromJson(json['biometrics'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.biometrics != null) {
      data['biometrics'] = this.biometrics.toJson();
      data['action'] = this.action;
    }
    return data;
  }
}

class Biometrics {
  String profileImage;
  String gender;
  String dob;
  String unit;
  int height;
  int weight;
  String medicationAllergy;

  Biometrics({
    this.profileImage,
    this.gender,
    this.dob,
    this.unit,
    this.height,
    this.weight,
    this.medicationAllergy,
  });

  Biometrics.fromJson(Map<String, dynamic> json) {
    profileImage = json['profile_image'];
    gender = json['gender'];
    dob = json['dob'] ?? 'N.A.';
    unit = json['unit'];
    height = json['height'];
    weight = json['weight'];
    medicationAllergy = json['medication_allergy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['profile_image'] = this.profileImage;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['unit'] = this.unit;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['medication_allergy'] = this.medicationAllergy;
    return data;
  }
}

class Speciality {
  String specialtyName;
  bool isSelected;

  Speciality({this.specialtyName, this.isSelected});

  Speciality.fromJson(Map<String, dynamic> json) {
    specialtyName = json['specialty_name'];
    isSelected = json['is_selected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['specialty_name'] = this.specialtyName;
    data['is_selected'] = this.isSelected;
    return data;
  }
}

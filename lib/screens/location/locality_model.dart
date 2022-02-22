class LocalityModel {
  int id;
  Details details;
  int cityId;
  String createdAt;
  String updatedAt;

  LocalityModel(
      {this.id, this.details, this.cityId, this.createdAt, this.updatedAt});

  LocalityModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    details =
        json['details'] != null ? new Details.fromJson(json['details']) : null;
    cityId = json['city_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.details != null) {
      data['details'] = this.details.toJson();
    }
    data['city_id'] = this.cityId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Details {
  String locality;
  String zipCode;

  Details({this.locality, this.zipCode});

  Details.fromJson(Map<String, dynamic> json) {
    locality = json['locality'];
    zipCode = json['zip_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['locality'] = this.locality;
    data['zip_code'] = this.zipCode;
    return data;
  }
}

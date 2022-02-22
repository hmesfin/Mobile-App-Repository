class CityModel {
  int cityId;
  String city;
  int regionId;
  String createdAt;
  String updatedAt;

  CityModel(
      {this.cityId, this.city, this.regionId, this.createdAt, this.updatedAt});

  CityModel.fromJson(Map<String, dynamic> json) {
    cityId = json['city_id'];
    city = json['city'];
    regionId = json['region_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city_id'] = this.cityId;
    data['city'] = this.city;
    data['region_id'] = this.regionId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

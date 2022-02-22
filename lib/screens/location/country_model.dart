class RegionModel {
  int regionId;
  String region;
  String countryCode;
  String createdAt;
  String updatedAt;

  RegionModel(
      {this.regionId,
      this.region,
      this.countryCode,
      this.createdAt,
      this.updatedAt});

  RegionModel.fromJson(Map<String, dynamic> json) {
    regionId = json['region_id'];
    region = json['region'];
    countryCode = json['country_code'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['region_id'] = this.regionId;
    data['region'] = this.region;
    data['country_code'] = this.countryCode;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class CountryModel {
  int countryId;
  String name;
  String code;
  String createdAt;
  String updatedAt;

  CountryModel(
      {this.countryId, this.name, this.code, this.createdAt, this.updatedAt});

  CountryModel.fromJson(Map<String, dynamic> json) {
    countryId = json['country_id'];
    name = json['name'];
    code = json['code'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country_id'] = this.countryId;
    data['name'] = this.name;
    data['code'] = this.code;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

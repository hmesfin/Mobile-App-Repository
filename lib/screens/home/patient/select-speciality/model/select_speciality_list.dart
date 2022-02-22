class SelectSpecialityListResponse {
  Body body;
  String message;
  int status;
  bool success;

  SelectSpecialityListResponse(
      {this.body, this.message, this.status, this.success});

  factory SelectSpecialityListResponse.fromJson(Map<String, dynamic> json) {
    return SelectSpecialityListResponse(
      body: json['body'] != null ? Body.fromJson(json['body']) : null,
      message: json['message'],
      status: json['status'],
      success: json['success'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    data['success'] = this.success;
    if (this.body != null) {
      data['body'] = this.body.toJson();
    }
    return data;
  }
}

class SelectSpecialityList {
  String createdAt;
  int is_primary;
  int specialty_id;
  String specialty_name;
  String updatedAt;
  String image;
  bool selected;

  SelectSpecialityList(
      {this.createdAt,
      this.is_primary,
      this.specialty_id,
      this.specialty_name,
      this.image,
      this.selected,
      this.updatedAt});

  factory SelectSpecialityList.fromJson(Map<String, dynamic> json) {
    return SelectSpecialityList(
      createdAt: json['createdAt'],
      is_primary: json['is_primary'],
      specialty_id: json['specialty_id'],
      specialty_name: json['specialty_name'],
      updatedAt: json['updatedAt'],
      image: json['image'],
      selected: json['selected'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['is_primary'] = this.is_primary;
    data['specialty_id'] = this.specialty_id;
    data['specialty_name'] = this.specialty_name;
    data['updatedAt'] = this.updatedAt;
    data['image'] = this.image;
    data['selected'] = this.selected;
    return data;
  }
}

class Body {
  List<SelectSpecialityList> data;

  Body({this.data});

  factory Body.fromJson(Map<String, dynamic> json) {
    return Body(
      data: json['data'] != null
          ? (json['data'] as List)
              .map((i) => SelectSpecialityList.fromJson(i))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

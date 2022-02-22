class FeedbackListResponse {
  FeedbackListBody body;
  String message;
  int status;
  bool success;

  FeedbackListResponse({this.body, this.message, this.status, this.success});

  factory FeedbackListResponse.fromJson(Map<String, dynamic> json) {
    return FeedbackListResponse(
      body:
          json['body'] != null ? FeedbackListBody.fromJson(json['body']) : null,
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

class FeedbackListBody {
  FeedbackListData data;

  FeedbackListBody({this.data});

  factory FeedbackListBody.fromJson(Map<String, dynamic> json) {
    return FeedbackListBody(
      data:
          json['data'] != null ? FeedbackListData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class FeedbackListData {
  int count;
  List<FeedbackListRow> rows;

  FeedbackListData({this.count, this.rows});

  factory FeedbackListData.fromJson(Map<String, dynamic> json) {
    return FeedbackListData(
      count: json['count'],
      rows: json['rows'] != null
          ? (json['rows'] as List)
              .map((i) => FeedbackListRow.fromJson(i))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.rows != null) {
      data['rows'] = this.rows.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FeedbackListRow {
  String additional_note;
  String admin_note;
  String createdAt;
  int appointment_id;
  int doctor_id;
  double rating;
  Object report_request_status;
  Object reported_by_id;
  Object reported_reason;
  Object reported_timestamp;
  String review;
  FeedbackListReviewBy review_by;
  int review_by_id;
  int review_id;
  bool visibility;

  FeedbackListRow(
      {this.additional_note,
      this.admin_note,
      this.appointment_id,
      this.doctor_id,
      this.rating,
      this.report_request_status,
      this.reported_by_id,
      this.reported_reason,
      this.reported_timestamp,
      this.review,
      this.createdAt,
      this.review_by,
      this.review_by_id,
      this.review_id,
      this.visibility});

  factory FeedbackListRow.fromJson(Map<String, dynamic> json) {
    return FeedbackListRow(
      additional_note: json['additional_note'] ?? "",
      admin_note: json['admin_note'] ?? "",
      appointment_id: json['appointment_id'],
      doctor_id: json['doctor_id'],
      rating: double.parse((json['rating'] ?? "0.0").toString()),
      report_request_status: json['report_request_status'] ?? null,
      reported_by_id: json['reported_by_id'] ?? null,
      reported_reason: json['reported_reason'] ?? null,
      reported_timestamp: json['reported_timestamp'] ?? null,
      review: json['review'],
      review_by: json['review_by'] != null
          ? FeedbackListReviewBy.fromJson(json['review_by'])
          : null,
      review_by_id: json['review_by_id'],
      review_id: json['review_id'],
      visibility: json['visibility'],
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appointment_id'] = this.appointment_id;
    data['doctor_id'] = this.doctor_id;
    data['rating'] = this.rating;
    data['review'] = this.review;
    data['review_by_id'] = this.review_by_id;
    data['review_id'] = this.review_id;
    data['visibility'] = this.visibility;
    data['createdAt'] = this.createdAt;
    if (this.additional_note != null) {
      data['additional_note'] = this.additional_note;
    }
    if (this.admin_note != null) {
      data['admin_note'] = this.admin_note;
    }
    if (this.report_request_status != null) {
      data['report_request_status'] = this.report_request_status;
    }
    if (this.reported_by_id != null) {
      data['reported_by_id'] = this.reported_by_id;
    }
    if (this.reported_reason != null) {
      data['reported_reason'] = this.reported_reason;
    }
    if (this.reported_timestamp != null) {
      data['reported_timestamp'] = this.reported_timestamp;
    }
    if (this.review_by != null) {
      data['review_by'] = this.review_by.toJson();
    }
    return data;
  }
}

class FeedbackListReviewBy {
  int account_request_status;
  String country_code;
  String email;
  String first_name;
  bool is_email_verified;
  bool is_phone_verified;
  String last_name;
  String phone;
  String role;
  int social_id;
  int status;
  int user_id;
  FeedbackListUserProfile user_profile;

  FeedbackListReviewBy(
      {this.account_request_status,
      this.country_code,
      this.email,
      this.first_name,
      this.is_email_verified,
      this.is_phone_verified,
      this.last_name,
      this.phone,
      this.role,
      this.social_id,
      this.status,
      this.user_id,
      this.user_profile});

  factory FeedbackListReviewBy.fromJson(Map<String, dynamic> json) {
    return FeedbackListReviewBy(
      account_request_status: json['account_request_status'] ?? null,
      country_code: json['country_code'],
      email: json['email'],
      first_name: json['first_name'],
      is_email_verified: json['is_email_verified'],
      is_phone_verified: json['is_phone_verified'],
      last_name: json['last_name'],
      phone: json['phone'],
      role: json['role'],
      social_id: json['social_id'] is String
          ? int.parse(json['social_id'] == "" ? "0" : json['social_id'])
          : json['social_id'],
      status: json['status'],
      user_id: json['user_id'],
      user_profile: json['user_profile'] != null
          ? FeedbackListUserProfile.fromJson(json['user_profile'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country_code'] = this.country_code;
    data['email'] = this.email;
    data['first_name'] = this.first_name;
    data['is_email_verified'] = this.is_email_verified;
    data['is_phone_verified'] = this.is_phone_verified;
    data['last_name'] = this.last_name;
    data['phone'] = this.phone;
    data['role'] = this.role;
    data['status'] = this.status;
    data['user_id'] = this.user_id;
    if (this.account_request_status != null) {
      data['account_request_status'] = this.account_request_status;
    }
    if (this.social_id != null) {
      data['social_id'] = this.social_id;
    }
    if (this.user_profile != null) {
      data['user_profile'] = this.user_profile.toJson();
    }
    return data;
  }
}

class FeedbackListUserProfile {
  String profile_image;

  FeedbackListUserProfile({this.profile_image});

  factory FeedbackListUserProfile.fromJson(Map<String, dynamic> json) {
    return FeedbackListUserProfile(
      profile_image: json['profile_image'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['profile_image'] = this.profile_image;
    return data;
  }
}

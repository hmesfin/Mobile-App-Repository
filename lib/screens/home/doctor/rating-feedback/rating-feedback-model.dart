class RatingFeedbackModel {
  int reviewId;
  int appointmentId;
  int doctorId;
  int reviewById;
  int rating;
  String review;
  String adminNote;
  bool visibility;
  String additionalNote;
  String reportedReason;
  int reportedById;
  int reportRequestStatus;
  String reportedTimestamp;
  String createdAt;
  String updatedAt;
  ReviewBy reviewBy;
  String dateAgo;

  RatingFeedbackModel({this.reviewId,
    this.appointmentId,
    this.doctorId,
    this.reviewById,
    this.rating,
    this.review,
    this.adminNote,
    this.visibility,
    this.additionalNote,
    this.reportedReason,
    this.reportedById,
    this.reportRequestStatus,
    this.reportedTimestamp,
    this.createdAt,
    this.updatedAt,
    this.reviewBy,
    this.dateAgo});

  RatingFeedbackModel.fromJson(Map<String, dynamic> json) {
    reviewId = json['review_id'];
    appointmentId = json['appointment_id'];
    doctorId = json['doctor_id'];
    reviewById = json['review_by_id'];
    rating = json['rating'] ?? 0.0;
    review = json['review'];
    adminNote = json['admin_note'];
    visibility = json['visibility'];
    additionalNote = json['additional_note'];
    reportedReason = json['reported_reason'];
    reportedById = json['reported_by_id'];
    reportRequestStatus = json['report_request_status'];
    reportedTimestamp = json['reported_timestamp'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    reviewBy = json['review_by'] != null
        ? new ReviewBy.fromJson(json['review_by'])
        : null;
    dateAgo = json['dateAgo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['review_id'] = this.reviewId;
    data['appointment_id'] = this.appointmentId;
    data['doctor_id'] = this.doctorId;
    data['review_by_id'] = this.reviewById;
    data['rating'] = this.rating;
    data['review'] = this.review;
    data['admin_note'] = this.adminNote;
    data['visibility'] = this.visibility;
    data['additional_note'] = this.additionalNote;
    data['reported_reason'] = this.reportedReason;
    data['reported_by_id'] = this.reportedById;
    data['report_request_status'] = this.reportRequestStatus;
    data['reported_timestamp'] = this.reportedTimestamp;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.reviewBy != null) {
      data['review_by'] = this.reviewBy.toJson();
    }
    data['dateAgo'] = this.dateAgo;
    return data;
  }
}

class ReviewBy {
  int userId;
  int status;
  int consultationFee;
  int accountRequestStatus;
  String firstName;
  String lastName;
  String email;
  String countryCode;
  String phone;
  String role;
  bool isEmailVerified;
  bool isPhoneVerified;
  String socialId;
  String createdAt;
  String walletId;
  String customerId;
  UserProfile userProfile;

  ReviewBy({this.userId,
    this.status,
    this.consultationFee,
    this.accountRequestStatus,
    this.firstName,
    this.lastName,
    this.email,
    this.countryCode,
    this.phone,
    this.role,
    this.isEmailVerified,
    this.isPhoneVerified,
    this.socialId,
    this.createdAt,
    this.walletId,
    this.customerId,
    this.userProfile});

  ReviewBy.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    status = json['status'];
    consultationFee = json['consultation_fee'];
    accountRequestStatus = json['account_request_status'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    countryCode = json['country_code'];
    phone = json['phone'];
    role = json['role'];
    isEmailVerified = json['is_email_verified'];
    isPhoneVerified = json['is_phone_verified'];
    socialId = json['social_id'];
    createdAt = json['createdAt'];
    walletId = json['wallet_id'];
    customerId = json['customer_id'];
    userProfile = json['user_profile'] != null
        ? new UserProfile.fromJson(json['user_profile'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['status'] = this.status;
    data['consultation_fee'] = this.consultationFee;
    data['account_request_status'] = this.accountRequestStatus;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['country_code'] = this.countryCode;
    data['phone'] = this.phone;
    data['role'] = this.role;
    data['is_email_verified'] = this.isEmailVerified;
    data['is_phone_verified'] = this.isPhoneVerified;
    data['social_id'] = this.socialId;
    data['createdAt'] = this.createdAt;
    data['wallet_id'] = this.walletId;
    data['customer_id'] = this.customerId;
    if (this.userProfile != null) {
      data['user_profile'] = this.userProfile.toJson();
    }
    return data;
  }
}

class UserProfile {
  String profileImage;

  UserProfile({this.profileImage});

  UserProfile.fromJson(Map<String, dynamic> json) {
    profileImage = json['profile_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['profile_image'] = this.profileImage;
    return data;
  }
}

class ReportFeedbackModel {
  int reviewId;
  String reportReason;
  String additionalNote;

  ReportFeedbackModel({this.reviewId, this.additionalNote, this.reportReason});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['review_id'] = reviewId;
    data['reported_reason'] = reportReason;
    data['additional_note'] = additionalNote;
    return data;
  }
}

class FamilyModel {
  FamilyHistoryModel familyHistory;
  String action;

  FamilyModel({this.familyHistory, this.action});

  FamilyModel.fromJson(Map<String, dynamic> json) {
    familyHistory = json['family_history'] != null
        ? new FamilyHistoryModel.fromJson(json['family_history'])
        : null;
    action = json['action'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.familyHistory != null) {
      data['family_history'] = this.familyHistory.toJson();
      data['action'] = this.action;
    }
    return data;
  }
}

class FamilyHistoryModel {
  HeartDisease heartDisease;
  HeartDisease cancerDisease;
  HeartDisease diabetesDisease;
  HeartDisease highBlodPresureDisease;
  HeartDisease asthmaDisease;
  bool isSkip = true;

  FamilyHistoryModel({this.heartDisease,
    this.cancerDisease,
    this.diabetesDisease,
    this.highBlodPresureDisease,
    this.isSkip,
    this.asthmaDisease});

  FamilyHistoryModel.fromJson(Map<String, dynamic> json) {
    isSkip = json['is_skip'];
    heartDisease = json['heart_disease'] != null
        ? new HeartDisease.fromJson(json['heart_disease'])
        : null;
    cancerDisease = json['cancer_disease'] != null
        ? new HeartDisease.fromJson(json['cancer_disease'])
        : null;
    diabetesDisease = json['diabetes_disease'] != null
        ? new HeartDisease.fromJson(json['diabetes_disease'])
        : null;
    highBlodPresureDisease = json['high_blod_presure_disease'] != null
        ? new HeartDisease.fromJson(json['high_blod_presure_disease'])
        : null;
    asthmaDisease = json['asthma_disease'] != null
        ? new HeartDisease.fromJson(json['asthma_disease'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_skip'] = this.isSkip;
    if (this.heartDisease != null) {
      data['heart_disease'] = this.heartDisease.toJson();
    }
    if (this.cancerDisease != null) {
      data['cancer_disease'] = this.cancerDisease.toJson();
    }
    if (this.diabetesDisease != null) {
      data['diabetes_disease'] = this.diabetesDisease.toJson();
    }
    if (this.highBlodPresureDisease != null) {
      data['high_blod_presure_disease'] = this.highBlodPresureDisease.toJson();
    }
    if (this.asthmaDisease != null) {
      data['asthma_disease'] = this.asthmaDisease.toJson();
    }
    return data;
  }
}

class HeartDisease {
  bool isbool;
  List<String> memberNames;

  HeartDisease({this.isbool, this.memberNames});

  HeartDisease.fromJson(Map<String, dynamic> json) {
    isbool = json['isbool'];
    memberNames = List<String>.from(json['member_names'] ?? ['']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isbool'] = this.isbool;
    data['member_names'] = this.memberNames;
    return data;
  }
}

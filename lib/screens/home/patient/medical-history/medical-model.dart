class MedicalModel {
  MedicalHistoryModel medicalHistory;
  String action;
  MedicalModel({this.medicalHistory, this.action});

  MedicalModel.fromJson(Map<String, dynamic> json) {
    medicalHistory = json['medical_history'] != null
        ? new MedicalHistoryModel.fromJson(json['medical_history'])
        : null;
    action = json['action'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.medicalHistory != null) {
      data['medical_history'] = this.medicalHistory.toJson();
      data['action'] = this.action;
    }
    return data;
  }
}

class MedicalHistoryModel {
  int howLongAgoMonths;
  bool isSkip = true;
  bool heartDisease;
  bool cancerDisease;
  bool diabetesDisease;
  bool copdDisease;
  bool kidenyDisease;
  bool highBlodPresureDisease;
  bool asthmaDisease;
  bool hospitalization;

  MedicalHistoryModel(
      {this.howLongAgoMonths,
      this.heartDisease,
      this.cancerDisease,
      this.diabetesDisease,
      this.copdDisease,
      this.kidenyDisease,
      this.highBlodPresureDisease,
      this.asthmaDisease,
      this.isSkip,
      this.hospitalization});

  MedicalHistoryModel.fromJson(Map<String, dynamic> json) {
    howLongAgoMonths = json['how_long_ago_months'];
    isSkip = json['is_skip'];
    heartDisease = json['heart_disease'];
    cancerDisease = json['cancer_disease'];
    diabetesDisease = json['diabetes_disease'];
    copdDisease = json['copd_disease'];
    kidenyDisease = json['kideny_disease'];
    highBlodPresureDisease = json['high_blod_presure_disease'];
    asthmaDisease = json['asthma_disease'];
    hospitalization = json['hospitalization'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['how_long_ago_months'] = this.howLongAgoMonths;
    data['heart_disease'] = this.heartDisease;
    data['is_skip'] = this.isSkip;
    data['cancer_disease'] = this.cancerDisease;
    data['diabetes_disease'] = this.diabetesDisease;
    data['copd_disease'] = this.copdDisease;
    data['kideny_disease'] = this.kidenyDisease;
    data['high_blod_presure_disease'] = this.highBlodPresureDisease;
    data['asthma_disease'] = this.asthmaDisease;
    data['hospitalization'] = this.hospitalization;
    return data;
  }
}

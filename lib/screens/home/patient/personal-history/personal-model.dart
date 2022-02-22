class PersonalModel {
  PersonalHistoryModel personalHistory;
  String action;
  PersonalModel({this.personalHistory, this.action});

  PersonalModel.fromJson(Map<String, dynamic> json) {
    personalHistory = json['personal_history'] != null
        ? new PersonalHistoryModel.fromJson(json['personal_history'])
        : null;
    action = json['action'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.personalHistory != null) {
      data['personal_history'] = this.personalHistory.toJson();
      data['action'] = this.action;
    }
    return data;
  }
}

class PersonalHistoryModel {
  String maritalStatus;
  Children children;
  Children smoke;
  Children drink;
  Drugs drugs;
  bool isSkip;

  PersonalHistoryModel(
      {this.maritalStatus,
      this.children,
      this.smoke,
      this.drink,
      this.drugs,
      this.isSkip});

  PersonalHistoryModel.fromJson(Map<String, dynamic> json) {
    maritalStatus = json['marital_status'];
    isSkip = json['is_skip'];
    children = json['children'] != null
        ? new Children.fromJson(json['children'])
        : null;
    smoke = json['smoke'] != null ? new Children.fromJson(json['smoke']) : null;
    drink = json['drink'] != null ? new Children.fromJson(json['drink']) : null;
    drugs = json['drugs'] != null ? new Drugs.fromJson(json['drugs']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_skip'] = this.isSkip;
    data['marital_status'] = this.maritalStatus;
    if (this.children != null) {
      data['children'] = this.children.toJson();
    }
    if (this.smoke != null) {
      data['smoke'] = this.smoke.toJson();
    }
    if (this.drink != null) {
      data['drink'] = this.drink.toJson();
    }
    if (this.drugs != null) {
      data['drugs'] = this.drugs.toJson();
    }
    return data;
  }
}

class Children {
  bool isbool;
  int count;

  Children({this.isbool, this.count});

  Children.fromJson(Map<String, dynamic> json) {
    isbool = json['isbool'];
    count = json['count'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isbool'] = this.isbool;
    data['count'] = this.count;
    return data;
  }
}

class Drugs {
  bool isbool;
  List<String> typeOfDrugs;

  Drugs({this.isbool, this.typeOfDrugs});

  Drugs.fromJson(Map<String, dynamic> json) {
    isbool = json['isbool'];
    typeOfDrugs = List<String>.from(json['type_of_drugs'] ?? []) ?? [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isbool'] = this.isbool;
    data['type_of_drugs'] = this.typeOfDrugs;
    return data;
  }
}

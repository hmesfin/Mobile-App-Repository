class FilterModel {
  List<Speciality> speciality;
  List<Lang> lang;
  List<Sex> sex;
  List<Experience> experience;
  String name;

  FilterModel(
      {this.speciality, this.lang, this.sex, this.experience, this.name});

  FilterModel.fromJson(Map<String, dynamic> json) {
    if (json['speciality'] != null) {
      speciality = new List<Speciality>();
      json['speciality'].forEach((v) {
        speciality.add(new Speciality.fromJson(v));
      });
    }
    if (json['lang'] != null) {
      lang = new List<Lang>();
      json['lang'].forEach((v) {
        lang.add(new Lang.fromJson(v));
      });
    }
    if (json['sex'] != null) {
      sex = new List<Sex>();
      json['sex'].forEach((v) {
        sex.add(new Sex.fromJson(v));
      });
    }
    if (json['experience'] != null) {
      experience = new List<Experience>();
      json['experience'].forEach((v) {
        experience.add(new Experience.fromJson(v));
      });
    }
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.speciality != null) {
      data['speciality'] = this.speciality.map((v) => v.toJson()).toList();
    }
    if (this.lang != null) {
      data['lang'] = this.lang.map((v) => v.toJson()).toList();
    }
    if (this.sex != null) {
      data['sex'] = this.sex.map((v) => v.toJson()).toList();
    }
    if (this.experience != null) {
      data['experience'] = this.experience.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    return data;
  }
}

class Speciality {
  String specialityType;
  bool isSelected;

  Speciality({this.specialityType, this.isSelected});

  Speciality.fromJson(Map<String, dynamic> json) {
    specialityType = json['speciality_type'];
    isSelected = json['is_selected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['speciality_type'] = this.specialityType;
    data['is_selected'] = this.isSelected;
    return data;
  }
}

class Lang {
  String langType;
  bool isSelected;

  Lang({this.langType, this.isSelected});

  Lang.fromJson(Map<String, dynamic> json) {
    langType = json['lang_type'];
    isSelected = json['is_selected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lang_type'] = this.langType;
    data['is_selected'] = this.isSelected;
    return data;
  }
}

class Sex {
  String gender;
  bool isSelected;

  Sex({this.gender, this.isSelected});

  Sex.fromJson(Map<String, dynamic> json) {
    gender = json['gender'];
    isSelected = json['is_selected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gender'] = this.gender;
    data['is_selected'] = this.isSelected;
    return data;
  }
}

class Experience {
  String expRange;
  bool isSelected;

  Experience({this.expRange, this.isSelected});

  Experience.fromJson(Map<String, dynamic> json) {
    expRange = json['exp_range'];
    isSelected = json['is_selected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['exp_range'] = this.expRange;
    data['is_selected'] = this.isSelected;
    return data;
  }
}

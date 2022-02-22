class UpdateLangModel {
  String lang;
  String action;

  UpdateLangModel({this.lang});


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['action'] = "set_language";
    data['language'] = lang;

    return data;
  }
}
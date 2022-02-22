class LoginClass {
  String countryCode;
  String username;
  String password;

  LoginClass({this.countryCode, this.username, this.password});

  LoginClass.fromJson(Map<String, dynamic> json) {
    countryCode = json['country_code'];
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country_code'] = this.countryCode;
    data['username'] = this.username;
    data['password'] = this.password;
    return data;
  }
}

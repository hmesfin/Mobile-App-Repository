
class ChangePasswordModel {
  String newPassword;
  String currentPassword;
  ChangePasswordModel({this.currentPassword,this.newPassword});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_password'] = currentPassword;
    data['new_password'] = newPassword;
    return data;
  }
}

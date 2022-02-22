import 'package:virtudoc_app/index.dart';

class UserImageModel {
  File avatar;

  UserImageModel({this.avatar});

  UserImageModel.fromJson(Map<String, dynamic> json) {
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatar'] = this.avatar;
    return data;
  }
}

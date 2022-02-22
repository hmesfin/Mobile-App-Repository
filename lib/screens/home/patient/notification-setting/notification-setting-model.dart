class NotificationSettingModel{
  bool isNotify;
  String action;

  NotificationSettingModel({this.isNotify});
  

  Map<String ,dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['action']="notification_setting";  
    data['is_notify']=isNotify;  

    return data;
  }
}
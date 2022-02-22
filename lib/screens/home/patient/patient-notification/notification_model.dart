class NotificationModel {
  int notificationId;
  String notificationBody;
  int senderId;
  int receiverId;
  String date;
  int appointmentId;
  int prescriptionId;
  int paymentId;
  bool readStatus;
  String goToScreen;
  String sendBy;
  String createdAt;
  String updatedAt;
  String dateAgo;
  String username;
  String roomname;
  String doctorname;
  String userpic;
  NotificationModel(
      {this.notificationId,
      this.notificationBody,
      this.senderId,
      this.receiverId,
      this.date,
      this.appointmentId,
      this.prescriptionId,
      this.paymentId,
      this.readStatus,
      this.goToScreen,
      this.sendBy,
      this.createdAt,
      this.updatedAt,
      this.username,
      this.roomname,
      this.userpic,
      this.doctorname,
      this.dateAgo});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    notificationId = json['notification_id'];
    notificationBody = json['notification_body'];
    senderId = json['sender_id'];
    receiverId = json['receiver_id'];
    date = json['date'];
    appointmentId = json['appointment_id'] ?? 0;
    prescriptionId = json['prescription_id'] ?? 0;
    paymentId = json['payment_id'] ?? 0;
    readStatus = json['read_Status'];
    goToScreen = json['go_to_screen'];
    sendBy = json['send_by'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    dateAgo = json['dateAgo'];
    roomname = json['roomname'];
    username = json['username'];
    doctorname = json['doctorname'];
    userpic = json['userpic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notification_id'] = this.notificationId;
    data['notification_body'] = this.notificationBody;
    data['sender_id'] = this.senderId;
    data['receiver_id'] = this.receiverId;
    data['date'] = this.date;
    data['appointment_id'] = this.appointmentId;
    data['prescription_id'] = this.prescriptionId;
    data['payment_id'] = this.paymentId;
    data['read_Status'] = this.readStatus;
    data['go_to_screen'] = this.goToScreen;
    data['send_by'] = this.sendBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['dateAgo'] = this.dateAgo;
    data['doctorname'] = this.doctorname;
    data['username'] = this.username;
    data['roomname'] = this.roomname;
    data['userpic'] = this.userpic;
    return data;
  }
}

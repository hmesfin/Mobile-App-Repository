class DoctorNotificationModel {
  final int notificationId;
  final String notificationBody;
  final bool readStatus;
  final int receiverId;
  final String gotoScreen;
  final String dateAgo;
  final int prescriptionId;
  final int appointmentId;
  final String sendBy;

  DoctorNotificationModel({
    this.notificationId,
    this.notificationBody,
    this.readStatus,
    this.gotoScreen,
    this.receiverId,
    this.dateAgo,
    this.prescriptionId,
    this.appointmentId,
    this.sendBy,
  });

  factory DoctorNotificationModel.fromJson(Map<String, dynamic> parsedJson) {
    return DoctorNotificationModel(
      appointmentId: parsedJson['appointment_id'],
      notificationId: parsedJson['notification_id'],
      notificationBody: parsedJson['notification_body'],
      readStatus: parsedJson['read_Status'],
      gotoScreen: parsedJson['go_to_screen'],
      receiverId: parsedJson['receiver_id'],
      dateAgo: parsedJson['dateAgo'],
      prescriptionId: parsedJson['prescription_id'],
      sendBy: parsedJson['send_by'],
    );
  }
}

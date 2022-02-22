class BookAppointmentBody {
  String doctorId;
  String startTime;
  String endTime;
  String additionalNote;
  String date;
  String purpose;
  String token;

  BookAppointmentBody({this.doctorId,
    this.startTime,
    this.endTime,
    this.additionalNote,
    this.purpose,
    this.date,
    this.token});

  BookAppointmentBody.fromJson(dynamic json) {
    doctorId = json["doctor_id"];
    startTime = json["start_time"];
    endTime = json["end_time"];
    additionalNote = json["additional_note"];
    purpose = json["purpose"];
    date = json["date"];
    token = json["token"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["doctor_id"] = doctorId;
    map["start_time"] = startTime;
    map["end_time"] = endTime;
    map["additional_note"] = additionalNote;
    map["purpose"] = purpose;
    map["date"] = date;
    map["token"] = token;
    return map;
  }
}

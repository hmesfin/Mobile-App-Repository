class PrescriptionDetailFilter {
  int appointmentId;

  PrescriptionDetailFilter({this.appointmentId});

  PrescriptionDetailFilter.fromJson(Map<String, int> json) {
    appointmentId = json['appointment_id'];
  }

  Map<String, int> toJson() {
    final Map<String, int> data = new Map<String, int>();

    data['appointment_id'] = this.appointmentId;
    return data;
  }
}

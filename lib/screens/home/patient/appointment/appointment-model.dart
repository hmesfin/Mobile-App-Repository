class AppointmentModel {
  String drName, patientName, patientDob, gender, purpose, endTime;
  List speciality;
  String city,
      country,
      houseNumber,
      startTime,
      date,
      subCity,
      subSpeciality,
      drPic,
      region,
      state,
      patientPic;
  int appointmentId;

  AppointmentModel({this.drName,
    this.subCity,
    this.patientName,
    this.patientDob,
    this.region,
    this.gender,
    this.purpose,
    this.state,
    this.endTime,
    this.drPic,
    this.patientPic,
    this.appointmentId,
    this.speciality,
    this.city,
    this.subSpeciality,
    this.country,
    this.houseNumber,
    this.startTime,
    this.date});
}

class AppointmentDetailModel {
  List speciality;
  int experience,
      appointmentId,
      drId,
      patientId,
      patientWeight,
      patientHeight,
      status,
      fee;
  bool isChatInitiated = false;
  String patientName,
      patientUnit,
      patientPic,
      drPic,
      drSubCity,
      drRegion,
      drName,
      postGrad,
      patientState,
      drState,
      underGrad,
      startTime,
      endTime,
      date,
      patientDob,
      patientGender,
      patientCity,
      patientHouseNo,
      patientSubCity,
      patientRegion,
      patientCountry,
      patientHouseNumber,
      drCity,
      drCountry,
      drHouseNumber,
      additionalNote,
      purpose,
      subSpeciality;

  AppointmentDetailModel({
    this.subSpeciality,
    this.patientCity,
    this.status,
    this.patientCountry,
    this.patientPic,
    this.patientHouseNumber,
    this.patientState,
    this.drState,
    this.patientHouseNo,
    this.patientSubCity,
    this.patientRegion,
    this.drSubCity,
    this.drRegion,
    this.patientUnit,
    this.drPic,
    this.patientId,
    this.additionalNote,
    this.drId,
    this.appointmentId,
    this.patientName,
    this.drName,
    this.postGrad,
    this.underGrad,
    this.startTime,
    this.endTime,
    this.date,
    this.patientDob,
    this.patientWeight,
    this.patientGender,
    this.patientHeight,
    this.drCity,
    this.drCountry,
    this.drHouseNumber,
    this.purpose,
    this.experience,
    this.speciality,
  });
}
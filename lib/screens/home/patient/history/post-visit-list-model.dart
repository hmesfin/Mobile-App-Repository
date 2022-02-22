// To parse this JSON data, do
//
//     final postVisitListModel = postVisitListModelFromJson(jsonString);

import 'dart:convert';

class PostVisitListModel {
  PostVisitListModel({
    this.postVisitId,
    this.doctorId,
    this.patientId,
    this.appointmentId,
    this.name,
    this.age,
    this.gender,
    this.patientDetails,
    this.historyAndPhysicalExamination,
    this.doctorsNoteProgressNote,
    this.doctorsNoteNewPatient,
    this.createdAt,
    this.updatedAt,
  });

  int postVisitId;
  int doctorId;
  int patientId;
  int appointmentId;
  String name;
  int age;
  String gender;
  String patientDetails;
  HistoryAndPhysicalExamination historyAndPhysicalExamination;
  dynamic doctorsNoteProgressNote;
  DoctorsNoteNewPatient doctorsNoteNewPatient;
  DateTime createdAt;
  DateTime updatedAt;

  factory PostVisitListModel.fromRawJson(String str) =>
      PostVisitListModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PostVisitListModel.fromJson(Map<String, dynamic> json) =>
      PostVisitListModel(
        postVisitId: json["post_visit_id"],
        doctorId: json["doctor_id"],
        patientId: json["patient_id"],
        appointmentId: json["appointment_id"],
        name: json["name"],
        age: json["age"],
        gender: json["gender"],
        patientDetails: json["patient_details"],
        historyAndPhysicalExamination: HistoryAndPhysicalExamination.fromJson(
            json["history_and_physical_examination"]),
        doctorsNoteProgressNote: json["doctors_note_progress_note"],
        doctorsNoteNewPatient: json["doctors_note_new_patient"] != null
            ? DoctorsNoteNewPatient.fromJson(json["doctors_note_new_patient"])
            : null,
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() =>
      {
        "post_visit_id": postVisitId,
        "doctor_id": doctorId,
        "patient_id": patientId,
        "appointment_id": appointmentId,
        "name": name,
        "age": age,
        "gender": gender,
        "patient_details": patientDetails,
        "history_and_physical_examination":
        historyAndPhysicalExamination.toJson(),
        "doctors_note_progress_note": doctorsNoteProgressNote,
        "doctors_note_new_patient": doctorsNoteNewPatient.toJson(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

class DoctorsNoteNewPatient {
  DoctorsNoteNewPatient({
    this.neck,
    this.plan,
    this.heent,
    this.lungs,
    this.vitals,
    this.abdomen,
    this.cardiac,
    this.objective,
    this.assessment,
    this.psychiatry,
    this.subjective,
    this.extremities,
    this.dermatologic,
    this.neurological,
    this.musculoskeletal,
    this.generalAppearance,
  });

  String neck;
  String plan;
  String heent;
  String lungs;
  List<DoctorsNoteNewPatientVital> vitals;
  String abdomen;
  String cardiac;
  String objective;
  String assessment;
  String psychiatry;
  String subjective;
  String extremities;
  String dermatologic;
  String neurological;
  String musculoskeletal;
  String generalAppearance;

  factory DoctorsNoteNewPatient.fromRawJson(String str) =>
      DoctorsNoteNewPatient.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DoctorsNoteNewPatient.fromJson(Map<String, dynamic> json) =>
      DoctorsNoteNewPatient(
        neck: json["neck"] ?? '',
        plan: json["plan"] ?? '',
        heent: json["HEENT"] ?? '',
        lungs: json["lungs"] ?? '',
        vitals: List<DoctorsNoteNewPatientVital>.from(json["vitals"]
            .map((x) => DoctorsNoteNewPatientVital.fromJson(x ?? {}))),
        abdomen: json["abdomen"] ?? '',
        cardiac: json["cardiac"] ?? '',
        objective: json["objective"] ?? '',
        assessment: json["assessment"] ?? '',
        psychiatry: json["psychiatry"] ?? '',
        subjective: json["subjective"] ?? '',
        extremities: json["extremities"] ?? '',
        dermatologic: json["dermatologic"] ?? '',
        neurological: json["neurological"] ?? '',
        musculoskeletal: json["musculoskeletal"] ?? '',
        generalAppearance: json["general_appearance"] ?? '',
      );

  Map<String, dynamic> toJson() =>
      {
        "neck": neck,
        "plan": plan,
        "HEENT": heent,
        "lungs": lungs,
        "vitals": List<dynamic>.from(vitals.map((x) => x.toJson())),
        "abdomen": abdomen,
        "cardiac": cardiac,
        "objective": objective,
        "assessment": assessment,
        "psychiatry": psychiatry,
        "subjective": subjective,
        "extremities": extremities,
        "dermatologic": dermatologic,
        "neurological": neurological,
        "musculoskeletal": musculoskeletal,
        "general_appearance": generalAppearance,
      };
}

class DoctorsNoteNewPatientVital {
  DoctorsNoteNewPatientVital({
    this.temp,
    this.tempValue,
  });

  String temp;
  int tempValue;

  factory DoctorsNoteNewPatientVital.fromRawJson(String str) =>
      DoctorsNoteNewPatientVital.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DoctorsNoteNewPatientVital.fromJson(Map<String, dynamic> json) =>
      DoctorsNoteNewPatientVital(
        temp: json["temp"] ?? '',
        tempValue: json["tempValue"] ?? 0,
      );

  Map<String, dynamic> toJson() =>
      {
        "temp": temp,
        "tempValue": tempValue,
      };
}

class HistoryAndPhysicalExamination {
  HistoryAndPhysicalExamination({
    this.vitals,
    this.allergy,
    this.medication,
    this.socialHistory,
    this.chiefComplaint,
    this.reviewOfSystem,
    this.pastSurgicalHistory,
    this.hospitalizationHistory,
    this.historyOfPresentIllness,
  });

  List<HistoryAndPhysicalExaminationVital> vitals;
  String allergy;
  String medication;
  String socialHistory;
  String chiefComplaint;
  String reviewOfSystem;
  String pastSurgicalHistory;
  String hospitalizationHistory;
  String historyOfPresentIllness;

  factory HistoryAndPhysicalExamination.fromRawJson(String str) =>
      HistoryAndPhysicalExamination.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HistoryAndPhysicalExamination.fromJson(Map<String, dynamic> json) =>
      HistoryAndPhysicalExamination(
        vitals: List<HistoryAndPhysicalExaminationVital>.from(json["vitals"]
            .map((x) => HistoryAndPhysicalExaminationVital.fromJson(x))),
        allergy: json["allergy"],
        medication: json["medication"],
        socialHistory: json["social_history"],
        chiefComplaint: json["chief_complaint"],
        reviewOfSystem: json["review_of_system"],
        pastSurgicalHistory: json["past_surgical_history"],
        hospitalizationHistory: json["hospitalization_history"],
        historyOfPresentIllness: json["history_of_present_illness"],
      );

  Map<String, dynamic> toJson() =>
      {
        "vitals": List<dynamic>.from(vitals.map((x) => x.toJson())),
        "allergy": allergy,
        "medication": medication,
        "social_history": socialHistory,
        "chief_complaint": chiefComplaint,
        "review_of_system": reviewOfSystem,
        "past_surgical_history": pastSurgicalHistory,
        "hospitalization_history": hospitalizationHistory,
        "history_of_present_illness": historyOfPresentIllness,
      };
}

class HistoryAndPhysicalExaminationVital {
  HistoryAndPhysicalExaminationVital({
    this.tempHp,
    this.tempValueHp,
  });

  String tempHp;
  String tempValueHp;

  factory HistoryAndPhysicalExaminationVital.fromRawJson(String str) =>
      HistoryAndPhysicalExaminationVital.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HistoryAndPhysicalExaminationVital.fromJson(
      Map<String, dynamic> json) =>
      HistoryAndPhysicalExaminationVital(
        tempHp: json["tempHP"],
        tempValueHp: "${json["tempValueHP"]}",
      );

  Map<String, dynamic> toJson() =>
      {
        "tempHP": tempHp,
        "tempValueHP": "$tempValueHp",
      };
}

class PostVisitRequest {
  int age;
  int appointment_id;
  int doctor_id;
  DoctorsNoteProgressNote doctors_note_progress_note;
  DoctorsNoteNewPatient doctors_note_new_patient;
  String gender;
  HistoryAndPhysicalExamination history_and_physical_examination;
  String name;
  String patient_details;
  int patient_id;
  String visitType;

  PostVisitRequest({this.age,
    this.appointment_id,
    this.doctor_id,
    this.doctors_note_progress_note,
    this.doctors_note_new_patient,
    this.gender,
    this.history_and_physical_examination,
    this.name,
    this.patient_details,
    this.patient_id,
    this.visitType});

  factory PostVisitRequest.fromJson(Map<String, dynamic> json) {
    return PostVisitRequest(
      age: json['age'],
      appointment_id: json['appointment_id'],
      doctor_id: json['doctor_id'],
      doctors_note_progress_note: json['doctors_note_progress_note'] != null
          ? DoctorsNoteProgressNote.fromJson(json['doctors_note_progress_note'])
          : null,
      doctors_note_new_patient: json['doctors_note_new_patient'] != null
          ? DoctorsNoteNewPatient.fromJson(json['doctors_note_new_patient'])
          : null,
      gender: json['gender'],
      history_and_physical_examination:
      json['history_and_physical_examination'] != null
          ? HistoryAndPhysicalExamination.fromJson(
          json['history_and_physical_examination'])
          : null,
      name: json['name'],
      patient_details: json['patient_details'],
      patient_id: json['patient_id'],
      visitType: json['visitType'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['age'] = this.age;
    data['appointment_id'] = this.appointment_id;
    data['doctor_id'] = this.doctor_id;
    data['gender'] = this.gender;
    data['name'] = this.name;
    data['patient_details'] = this.patient_details;
    data['patient_id'] = this.patient_id;
    data['visitType'] = this.visitType;
    if (this.doctors_note_progress_note != null) {
      data['doctors_note_progress_note'] =
          this.doctors_note_progress_note.toJson();
    }
    if (this.doctors_note_new_patient != null) {
      data['doctors_note_new_patient'] = this.doctors_note_new_patient.toJson();
    }
    if (this.history_and_physical_examination != null) {
      data['history_and_physical_examination'] =
          this.history_and_physical_examination.toJson();
    }
    return data;
  }
}

class HistoryAndPhysicalExamination {
  String chief_complaint;
  String history_of_present_illness;
  String hospitalization_history;
  String medication;
  String past_surgical_history;
  String review_of_system;
  String social_history;
  String allergy;
  String pastSurgicalHistory;
  List<Vital> vitals;

  HistoryAndPhysicalExamination({this.chief_complaint,
    this.history_of_present_illness,
    this.pastSurgicalHistory,
    this.hospitalization_history,
    this.medication,
    this.past_surgical_history,
    this.review_of_system,
    this.social_history,
    this.allergy,
    this.vitals});

  factory HistoryAndPhysicalExamination.fromJson(Map<String, dynamic> json) {
    return HistoryAndPhysicalExamination(
      chief_complaint: json['chief_complaint'],
      history_of_present_illness: json['history_of_present_illness'],
      hospitalization_history: json['hospitalization_history'],
      medication: json['medication'],
      past_surgical_history: json['past_surgical_history'],
      // review_of_system: json['review_of_system'],
      review_of_system: json['family_history'],
      social_history: json['social_history'],
      allergy: json['allergy'],
      pastSurgicalHistory: json['past_surgical_history'],
      vitals: json['vitals'] != null
          ? (json['vitals'] as List).map((i) => Vital.fromJson(i)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['chief_complaint'] = this.chief_complaint;
    data['history_of_present_illness'] = this.history_of_present_illness;
    data['hospitalization_history'] = this.hospitalization_history;
    data['medication'] = this.medication;
    data['past_surgical_history'] = this.past_surgical_history;
    // data['review_of_system'] = this.review_of_system;
    data['family_history'] = this.review_of_system;
    data['social_history'] = this.social_history;
    data['past_surgical_history'] = this.pastSurgicalHistory;
    data['allergy'] = this.allergy;
    if (this.vitals != null) {
      data['vitals'] = this.vitals.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DoctorsNoteProgressNote {
  String cardiovascular;
  String constitutional;
  String eNT_mouth;
  String endocrine;
  String gastrointestinal;
  String genitourinary;
  String heme_lymph;
  String mosculoskeletan;
  String neuro;
  String psych;
  String respiratory;
  String skin;
  String plan;
  String assessment;

  DoctorsNoteProgressNote({this.cardiovascular,
    this.constitutional,
    this.eNT_mouth,
    this.assessment,
    this.plan,
    this.endocrine,
    this.gastrointestinal,
    this.genitourinary,
    this.heme_lymph,
    this.mosculoskeletan,
    this.neuro,
    this.psych,
    this.respiratory,
    this.skin});

  factory DoctorsNoteProgressNote.fromJson(Map<String, dynamic> json) {
    return DoctorsNoteProgressNote(
      cardiovascular: json['cardiovascular'],
      constitutional: json['constitutional'],
      assessment: json['assessment'],
      plan: json['plan'],
      eNT_mouth: json['ENT_mouth'],
      endocrine: json['endocrine'],
      gastrointestinal: json['gastrointestinal'],
      genitourinary: json['genitourinary'],
      heme_lymph: json['heme_lymph'],
      mosculoskeletan: json['mosculoskeletan'],
      neuro: json['neuro'],
      psych: json['psych'],
      respiratory: json['respiratory'],
      skin: json['skin'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cardiovascular'] = this.cardiovascular ?? "";
    data['constitutional'] = this.constitutional ?? "";
    data['ENT_mouth'] = this.eNT_mouth ?? "";
    data['endocrine'] = this.endocrine ?? "";
    data['gastrointestinal'] = this.gastrointestinal ?? "";
    data['genitourinary'] = this.genitourinary ?? "";
    data['heme_lymph'] = this.heme_lymph ?? "";
    data['mosculoskeletan'] = this.mosculoskeletan ?? "";
    data['neuro'] = this.neuro ?? "";
    data['psych'] = this.psych ?? "";
    data['respiratory'] = this.respiratory ?? "";
    data['skin'] = this.skin ?? "";
    data['assessment'] = this.assessment ?? "";
    data['plan'] = this.plan ?? "";
    return data;
  }
}

class DoctorsNoteNewPatient {
  String subjective;
  String objective;
  String general_appearance;
  String HEENT;
  String neck;
  String cardiac;
  String abdomen;
  String musculoskeletal;
  String extremities;
  String lungs;
  String dermatologic;
  String neurological;
  String psychiatry;
  String assessment;
  String plan;
  List<Vital> vitals;

  DoctorsNoteNewPatient({this.subjective,
    this.objective,
    this.general_appearance,
    this.HEENT,
    this.neck,
    this.cardiac,
    this.abdomen,
    this.musculoskeletal,
    this.extremities,
    this.lungs,
    this.dermatologic,
    this.neurological,
    this.psychiatry,
    this.assessment,
    this.plan,
    this.vitals});

  factory DoctorsNoteNewPatient.fromJson(Map<String, dynamic> json) {
    return DoctorsNoteNewPatient(
      subjective: json['subjective'],
      objective: json['objective'],
      general_appearance: json['general_appearance'],
      HEENT: json['HEENT'],
      neck: json['neck'],
      cardiac: json['cardiac'],
      abdomen: json['abdomen'],
      musculoskeletal: json['musculoskeletal'],
      extremities: json['extremities'],
      lungs: json['lungs'],
      dermatologic: json['dermatologic'],
      neurological: json['neurological'],
      psychiatry: json['psychiatry'],
      assessment: json['assessment'],
      plan: json['plan'],
      vitals: json['vitals'] != null
          ? (json['vitals'] as List).map((i) => Vital.fromJson(i)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subjective'] = this.subjective ?? "";
    data['objective'] = this.objective ?? "";
    data['general_appearance'] = this.general_appearance ?? "";
    data['HEENT'] = this.HEENT ?? "";
    data['neck'] = this.neck ?? "";
    data['cardiac'] = this.cardiac ?? "";
    data['abdomen'] = this.abdomen ?? "";
    data['musculoskeletal'] = this.musculoskeletal ?? "";
    data['extremities'] = this.extremities ?? "";
    data['lungs'] = this.lungs ?? "";
    data['dermatologic'] = this.dermatologic ?? "";
    data['neurological'] = this.neurological ?? "";
    data['psychiatry'] = this.psychiatry ?? "";
    data['assessment'] = this.assessment ?? "";
    data['plan'] = this.plan ?? "";
    if (this.vitals != null) {
      data['vitals'] = this.vitals.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Vital {
  String types;
  String values;

  Vital({this.types, this.values});

  factory Vital.fromJson(Map<String, dynamic> json) {
    return Vital(
      types: json['types'],
      values: json['values'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['types'] = this.types;
    data['values'] = this.values;
    return data;
  }
}

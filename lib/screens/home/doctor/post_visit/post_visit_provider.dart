import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/screens/home/doctor/post_visit/model/post_visit_request.dart';

class PostVisitProvider with ChangeNotifier {
  bool isLoading = false;
  bool isProgressNote = false;
  List<TextEditingController> vitalTypeController = <TextEditingController>[];
  List<TextEditingController> vitalValuesController = <TextEditingController>[];
  List<TextEditingController> vitalTypeControllerNew =
  <TextEditingController>[];
  List<TextEditingController> vitalValuesControllerNew =
  <TextEditingController>[];
  var genderController = TextEditingController();

  PostVisitRequest postVisitRequest = new PostVisitRequest();

  HistoryAndPhysicalExamination historyAndPhysicalExamination =
  new HistoryAndPhysicalExamination();
  DoctorsNoteProgressNote doctorsNoteProgressNote =
  new DoctorsNoteProgressNote();
  DoctorsNoteNewPatient doctorsNoteNewPatient = new DoctorsNoteNewPatient();

  //progress note
  TextEditingController constitutional = new TextEditingController();
  TextEditingController eNT_mouth = new TextEditingController();
  TextEditingController cardiovascular = new TextEditingController();
  TextEditingController respiratory = new TextEditingController();
  TextEditingController gastrointestinal = new TextEditingController();
  TextEditingController genitourinary = new TextEditingController();
  TextEditingController mosculoskeletan = new TextEditingController();
  TextEditingController skin = new TextEditingController();
  TextEditingController neuro = new TextEditingController();
  TextEditingController psych = new TextEditingController();
  TextEditingController hemeLymph = new TextEditingController();
  TextEditingController endocrine = new TextEditingController();
  TextEditingController assessment_progress = new TextEditingController();
  TextEditingController plan_progress = new TextEditingController();

  // new patient
  TextEditingController subjective = new TextEditingController();
  TextEditingController objective = new TextEditingController();
  TextEditingController generalAppearance = new TextEditingController();
  TextEditingController heent = new TextEditingController();
  TextEditingController neck = new TextEditingController();
  TextEditingController cardiac = new TextEditingController();
  TextEditingController abdomen = new TextEditingController();
  TextEditingController musculoskeletal = new TextEditingController();
  TextEditingController extremities = new TextEditingController();
  TextEditingController lungs = new TextEditingController();
  TextEditingController dermatologic = new TextEditingController();
  TextEditingController neurological = new TextEditingController();
  TextEditingController psychiatry = new TextEditingController();
  TextEditingController assessment = new TextEditingController();
  TextEditingController plan = new TextEditingController();

  void init({doctorId = 0,
    appointmentId = 0,
    patientId = 0,
    visitType = "",
    name,
    age,
    gender,
    patient_details}) {
    postVisitRequest = new PostVisitRequest();
    postVisitRequest.doctor_id = doctorId;
    postVisitRequest.appointment_id = appointmentId;
    postVisitRequest.visitType = visitType;
    postVisitRequest.patient_id = patientId;
    postVisitRequest.age = age;
    postVisitRequest.name = name;
    postVisitRequest.patient_details = patient_details;
    postVisitRequest.gender = gender;
    genderController.text = gender;
    initHistoryExam();
    notifyListeners();
  }

  void initHistoryExam() {
    historyAndPhysicalExamination = new HistoryAndPhysicalExamination();
    historyAndPhysicalExamination.vitals = [];
    vitalTypeController.clear();
    vitalValuesController.clear();
    TextEditingController defaultVitalTypeController =
    new TextEditingController(text: Strings.vitalTypeList.first);
    TextEditingController defaultVitalValueController =
    new TextEditingController(text: "0");
    vitalTypeController.add(defaultVitalTypeController);
    vitalValuesController.add(defaultVitalValueController);
    initDoctorNote();
    notifyListeners();
  }

  void initDoctorNote({switchVal = false}) {
    doctorsNoteProgressNote = new DoctorsNoteProgressNote();
    doctorsNoteProgressNote.constitutional = constitutional.text;
    doctorsNoteProgressNote.eNT_mouth = Strings.entMouthHint;
    doctorsNoteProgressNote.cardiovascular = Strings.cardiovascularHint;
    doctorsNoteProgressNote.respiratory = Strings.respiratoryHint;
    doctorsNoteProgressNote.gastrointestinal = Strings.gastrointestinalHint;
    doctorsNoteProgressNote.genitourinary = Strings.genitourinaryHint;
    doctorsNoteProgressNote.mosculoskeletan = Strings.mosculoskeletanHint;
    doctorsNoteProgressNote.skin = Strings.skinHint;
    doctorsNoteProgressNote.neuro = Strings.neuroHint;
    doctorsNoteProgressNote.psych = Strings.psychHint;
    doctorsNoteProgressNote.heme_lymph = Strings.hemeLymphHint;
    doctorsNoteProgressNote.endocrine = Strings.endocrineHint;

    // doctorsNoteProgressNote.assessment = Strings.assessment;
    // doctorsNoteProgressNote.plan = Strings.plan;

    doctorsNoteNewPatient = new DoctorsNoteNewPatient();

    isProgressNote = switchVal;
    vitalTypeControllerNew.clear();
    vitalValuesControllerNew.clear();
    TextEditingController defaultVitalTypeController =
    new TextEditingController(text: Strings.vitalTypeList.first);
    TextEditingController defaultVitalValueController =
    new TextEditingController(text: "0");
    vitalTypeControllerNew.add(defaultVitalTypeController);
    vitalValuesControllerNew.add(defaultVitalValueController);

    //progress note
    constitutional.text = Strings.constitutionalHint;
    eNT_mouth.text = Strings.entMouthHint;
    cardiovascular.text = Strings.cardiovascularHint;
    respiratory.text = Strings.respiratoryHint;
    gastrointestinal.text = Strings.gastrointestinalHint;
    genitourinary.text = Strings.genitourinaryHint;
    mosculoskeletan.text = Strings.mosculoskeletanHint;
    skin.text = Strings.skinHint;
    neuro.text = Strings.neuroHint;
    psych.text = Strings.psychHint;
    hemeLymph.text = Strings.hemeLymphHint;
    endocrine.text = Strings.endocrineHint;
    // assessment_progress.text = Strings.assessment;
    // plan_progress.text = Strings.plan;
    assessment_progress.clear();
    plan_progress.clear();
    // new patient
    subjective.clear();
    objective.text = Strings.objectiveHint;
    generalAppearance.text = Strings.generalAppearanceHint;
    heent.text = Strings.heentHint;
    neck.text = Strings.neckHint;
    cardiac.text = Strings.cardiacHint;
    abdomen.text = Strings.abdomenHint;
    musculoskeletal.text = Strings.musculoskeletalHint;
    extremities.text = Strings.extremitiesHint;
    lungs.text = Strings.lungsHint;
    dermatologic.text = Strings.dermatologicHint;
    neurological.text = Strings.neurologicalHint;
    psychiatry.text = Strings.psychiatryHint;
    assessment.clear();
    plan.clear();
    notifyListeners();
  }

  Future setPatientInfo({Function failure, Function success}) async {
    if (postVisitRequest.name == "" || postVisitRequest.name == null) {
      return failure(Strings.pleaseEnter(Strings.enterName));
    } else if (postVisitRequest.age == 0 || postVisitRequest.age == null) {
      return failure(Strings.pleaseEnter(Strings.enterAge));
    } else if (postVisitRequest.gender == "" ||
        postVisitRequest.gender == null) {
      return failure(Strings.selectGender);
    } else if (postVisitRequest.patient_details == "" ||
        postVisitRequest.patient_details == null) {
      return failure(Strings.pleaseEnter(Strings.enterPatientDetails));
    }

    return success();
  }

  var vitalTypeList = {
    "Temperature(centigrade)",
    "Blood Pressure(mmHg)",
    "Pulse Rate(rate/min)",
    "Respiratory Rate(ate/min)",
    "SPOX(%)"
  };

  Future addVitalType() async {
    TextEditingController defaultVitalTypeController =
    new TextEditingController(text: 'Please Select');
    TextEditingController defaultVitalValueController =
    new TextEditingController(text: "0");

    vitalTypeController.add(defaultVitalTypeController);
    vitalValuesController.add(defaultVitalValueController);
    vitalTypeController.forEach((element) {
      vitalTypeList.remove(element.text);
    });
    // vitalValues.add(0);
    notifyListeners();
  }

  Future deleteVitalType(int index) async {
    if (vitalTypeController.length != 1) {
      vitalTypeList.add(vitalTypeController[index].text);
      vitalTypeController.removeAt(index);
      vitalValuesController.removeAt(index);
    }
    notifyListeners();
  }

  //
  // Future addVitalTypeNew() async {
  //   TextEditingController defaultVitalTypeController =
  //       new TextEditingController(text: Strings.vitalTypeList.first);
  //   TextEditingController defaultVitalValueController =
  //       new TextEditingController(text: "0");
  //   vitalTypeControllerNew.add(defaultVitalTypeController);
  //   vitalValuesControllerNew.add(defaultVitalValueController);
  //   // vitalValues.add(0);
  //   notifyListeners();
  // }

  // Future deleteVitalTypeNew(int index) async {
  //   if (vitalTypeControllerNew.length != 1) {
  //     vitalTypeControllerNew.removeAt(index);
  //     vitalValuesControllerNew.removeAt(index);
  //   }
  //   notifyListeners();
  // }

  Future setHistoryPhysicalExamination(
      {Function failure, Function success}) async {
    //historyAndPhysicalExamination.vitals = [];

    if (historyAndPhysicalExamination.chief_complaint == "" ||
        historyAndPhysicalExamination.chief_complaint == null) {
      return failure(Strings.pleaseEnter(Strings.chiefCompaint));
    } else if (historyAndPhysicalExamination.history_of_present_illness == "" ||
        historyAndPhysicalExamination.history_of_present_illness == null) {
      return failure(Strings.pleaseEnter(Strings.historyofPresentillness));
    } else if (historyAndPhysicalExamination.hospitalization_history == "" ||
        historyAndPhysicalExamination.hospitalization_history == null) {
      return failure(Strings.pleaseEnter(Strings.hospitalizationHistory));
    } else if (historyAndPhysicalExamination.social_history == "" ||
        historyAndPhysicalExamination.social_history == null) {
      return failure(Strings.pleaseEnter(Strings.socialHistory));
    } else if (historyAndPhysicalExamination.allergy == "" ||
        historyAndPhysicalExamination.allergy == null) {
      return failure(Strings.pleaseEnter(Strings.allergy));
    } else if (historyAndPhysicalExamination.review_of_system == "" ||
        historyAndPhysicalExamination.review_of_system == null) {
      return failure(Strings.pleaseEnter(Strings.review_of_system));
    } else if (historyAndPhysicalExamination.medication == "" ||
        historyAndPhysicalExamination.medication == null) {
      return failure(Strings.pleaseEnter(Strings.medication));
    } else {
      // for (var item in vitalValuesController) {
      //   if (item.text == null ||
      //       item.text.trim() == "" ||
      //       item.text.trim() == "0") {
      //     return failure(Strings.pleaseEnter(Strings.units));
      //   }
      // }
    }
    // for (var index = 0; index < vitalTypeController.length; ++index) {
    //   var vital = Vital();
    //   vital.types = vitalTypeController.elementAt(index).text;
    //   vital.values = vitalValuesController.elementAt(index).text;
    //   historyAndPhysicalExamination.vitals.add(vital);
    // }

    postVisitRequest.history_and_physical_examination =
        historyAndPhysicalExamination;

    return success();
  }

  Future setProgressNoteSwitch(isChecked) async {
    initDoctorNote(switchVal: isChecked);
    doctorsNoteProgressNote = new DoctorsNoteProgressNote();
    doctorsNoteProgressNote.constitutional = constitutional.text;
    doctorsNoteProgressNote.eNT_mouth = Strings.entMouthHint;
    doctorsNoteProgressNote.cardiovascular = Strings.cardiovascularHint;
    doctorsNoteProgressNote.respiratory = Strings.respiratoryHint;
    doctorsNoteProgressNote.gastrointestinal = Strings.gastrointestinalHint;
    doctorsNoteProgressNote.genitourinary = Strings.genitourinaryHint;
    doctorsNoteProgressNote.mosculoskeletan = Strings.mosculoskeletanHint;
    doctorsNoteProgressNote.skin = Strings.skinHint;
    doctorsNoteProgressNote.neuro = Strings.neuroHint;
    doctorsNoteProgressNote.psych = Strings.psychHint;
    doctorsNoteProgressNote.heme_lymph = Strings.hemeLymphHint;
    doctorsNoteProgressNote.endocrine = Strings.endocrineHint;

    // doctorsNoteProgressNote.assessment = Strings.assessment;
    // doctorsNoteProgressNote.plan = Strings.plan;

    doctorsNoteNewPatient = new DoctorsNoteNewPatient();
    doctorsNoteNewPatient.subjective = "";
    doctorsNoteNewPatient.objective = Strings.objectiveHint;
    doctorsNoteNewPatient.general_appearance = Strings.generalAppearanceHint;
    doctorsNoteNewPatient.HEENT = Strings.heentHint;
    doctorsNoteNewPatient.neck = Strings.neckHint;
    doctorsNoteNewPatient.cardiac = Strings.cardiacHint;
    doctorsNoteNewPatient.abdomen = Strings.abdomenHint;
    doctorsNoteNewPatient.musculoskeletal = Strings.musculoskeletalHint;
    doctorsNoteNewPatient.extremities = Strings.extremitiesHint;
    doctorsNoteNewPatient.lungs = Strings.lungsHint;
    doctorsNoteNewPatient.dermatologic = Strings.dermatologicHint;
    doctorsNoteNewPatient.neurological = Strings.neurologicalHint;
    doctorsNoteNewPatient.psychiatry = Strings.psychiatryHint;
    doctorsNoteNewPatient.assessment = "";
    doctorsNoteNewPatient.plan = "";

    //progress note
    constitutional.text = Strings.constitutionalHint;
    eNT_mouth.text = Strings.entMouthHint;
    cardiovascular.text = Strings.cardiovascularHint;
    respiratory.text = Strings.respiratoryHint;
    gastrointestinal.text = Strings.gastrointestinalHint;
    genitourinary.text = Strings.genitourinaryHint;
    mosculoskeletan.text = Strings.mosculoskeletanHint;
    skin.text = Strings.skinHint;
    neuro.text = Strings.neuroHint;
    psych.text = Strings.psychHint;
    hemeLymph.text = Strings.hemeLymphHint;
    endocrine.text = Strings.endocrineHint;

    assessment_progress.text = Strings.assessment;
    plan_progress.text = Strings.plan;
    // new patient
    subjective.clear();
    objective.text = Strings.objectiveHint;
    generalAppearance.text = Strings.generalAppearanceHint;
    heent.text = Strings.heentHint;
    neck.text = Strings.neckHint;
    cardiac.text = Strings.cardiacHint;
    abdomen.text = Strings.abdomenHint;
    musculoskeletal.text = Strings.musculoskeletalHint;
    extremities.text = Strings.extremitiesHint;
    lungs.text = Strings.lungsHint;
    dermatologic.text = Strings.dermatologicHint;
    neurological.text = Strings.neurologicalHint;
    psychiatry.text = Strings.psychiatryHint;
    assessment.clear();
    plan.clear();

    notifyListeners();
  }

  Future setDoctorNote({Function failure, Function success}) async {
    if (!isProgressNote) {
      postVisitRequest.visitType = Strings.progressNote.toLowerCase();
    } else {
      postVisitRequest.visitType = Strings.newPatient.toLowerCase();
    }
    if (!isProgressNote) {
      if (doctorsNoteProgressNote.constitutional == "") {
        return failure(Strings.pleaseEnter(Strings.constitutional));
      } else if (doctorsNoteProgressNote.eNT_mouth == "") {
        return failure(Strings.pleaseEnter(Strings.entMouth));
      } else if (doctorsNoteProgressNote.cardiovascular == "") {
        return failure(Strings.pleaseEnter(Strings.cardiovascular));
      } else if (doctorsNoteProgressNote.respiratory == "") {
        return failure(Strings.pleaseEnter(Strings.respiratory));
      } else if (doctorsNoteProgressNote.gastrointestinal == "") {
        return failure(Strings.pleaseEnter(Strings.gastrointestinal));
      } else if (doctorsNoteProgressNote.genitourinary == "") {
        return failure(Strings.pleaseEnter(Strings.genitourinary));
      } else if (doctorsNoteProgressNote.mosculoskeletan == "") {
        return failure(Strings.pleaseEnter(Strings.mosculoskeletan));
      } else if (doctorsNoteProgressNote.skin == "") {
        return failure(Strings.pleaseEnter(Strings.skin));
      } else if (doctorsNoteProgressNote.neuro == "") {
        return failure(Strings.pleaseEnter(Strings.neuro));
      } else if (doctorsNoteProgressNote.psych == "") {
        return failure(Strings.pleaseEnter(Strings.psych));
      } else if (doctorsNoteProgressNote.heme_lymph == "") {
        return failure(Strings.pleaseEnter(Strings.hemeLymph));
      } else if (doctorsNoteProgressNote.endocrine == "") {
        return failure(Strings.pleaseEnter(Strings.endocrine));
      } else if (doctorsNoteProgressNote.assessment == "" ||
          doctorsNoteProgressNote.assessment == null) {
        return failure(Strings.pleaseEnter(Strings.assessment));
      } else if (doctorsNoteProgressNote.plan == "" ||
          doctorsNoteProgressNote.plan == null) {
        return failure(Strings.pleaseEnter(Strings.plan));
      }
    } else {
      if (doctorsNoteNewPatient.subjective == "") {
        return failure(Strings.pleaseEnter(Strings.subjective));
      } else {
        // for (var item in vitalValuesControllerNew) {
        //   if (item.text == null ||
        //       item.text.trim() == "" ||
        //       item.text.trim() == "0") {
        //     return failure(Strings.pleaseEnter(Strings.units));
        //   }
        // }
      }
      if (doctorsNoteNewPatient.general_appearance == "") {
        return failure(Strings.pleaseEnter(Strings.generalAppearance));
      } else if (doctorsNoteNewPatient.HEENT == "") {
        return failure(Strings.pleaseEnter(Strings.heent));
      } else if (doctorsNoteNewPatient.neck == "") {
        return failure(Strings.pleaseEnter(Strings.neck));
      } else if (doctorsNoteNewPatient.cardiac == "") {
        return failure(Strings.pleaseEnter(Strings.cardiac));
      } else if (doctorsNoteNewPatient.abdomen == "") {
        return failure(Strings.pleaseEnter(Strings.abdomen));
      } else if (doctorsNoteNewPatient.musculoskeletal == "") {
        return failure(Strings.pleaseEnter(Strings.musculoskeletal));
      } else if (doctorsNoteNewPatient.extremities == "") {
        return failure(Strings.pleaseEnter(Strings.extremities));
      } else if (doctorsNoteNewPatient.lungs == "") {
        return failure(Strings.pleaseEnter(Strings.lungs));
      } else if (doctorsNoteNewPatient.dermatologic == "") {
        return failure(Strings.pleaseEnter(Strings.dermatologic));
      } else if (doctorsNoteNewPatient.neurological == "") {
        return failure(Strings.pleaseEnter(Strings.neurological));
      } else if (doctorsNoteNewPatient.psychiatry == "") {
        return failure(Strings.pleaseEnter(Strings.psychiatry));
      } else if (doctorsNoteNewPatient.assessment == "") {
        return failure(Strings.pleaseEnter(Strings.assessment));
      } else if (doctorsNoteNewPatient.plan == "") {
        return failure(Strings.pleaseEnter(Strings.plan));
      }
    }
    // doctorsNoteNewPatient.vitals = [];
    // for (var index = 0; index < vitalTypeControllerNew.length; ++index) {
    //   var vital = Vital();
    //   vital.types = vitalTypeControllerNew.elementAt(index).text;
    //   vital.values = vitalValuesControllerNew.elementAt(index).text;
    //   doctorsNoteNewPatient.vitals.add(vital);
    // }

    postVisitRequest.doctors_note_progress_note = doctorsNoteProgressNote;
    postVisitRequest.doctors_note_new_patient = doctorsNoteNewPatient;
    var connected = await CommonWidgets().internetCheck();
    if (!connected) {
      return failure(Strings.not_connected);
    }
    isLoading = true;
    notifyListeners();
    var response = await ApiRequest.postApi(
        ApiUrl.postVisitForm, postVisitRequest.toJson());
    isLoading = false;
    Map decode = jsonDecode(response.body);
    if (response.statusCode == 200) {
      notifyListeners();
      return success();
    } else {
      notifyListeners();
      return failure(decode['message']);
    }
  }
}

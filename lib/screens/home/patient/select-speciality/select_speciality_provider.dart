import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/screens/home/patient/select-speciality/model/select_speciality_list.dart';

class SelectSpecialityProvider with ChangeNotifier {
  bool isLoading = false;
  List<SelectSpecialityList> isPrimaryList = [];
  List<SelectSpecialityList> notPrimaryList = [];
  List<String> notPrimaryStringList = [];
  List<SelectSpecialityList> allList = [];
  String speciality = "";
  int specialty_id = 0;
  String speciality_name = '';

  Future getSpeciality() async {
    notPrimaryStringList.clear();
    notPrimaryStringList.add(Strings.selectSpecialityDropDown);
    speciality = "";
    notifyListeners();
    isLoading = true;
    isPrimaryList.clear();
    notPrimaryList.clear();
    specialty_id = 0;
    notifyListeners();
    var responnse = await ApiRequest.getApi(ApiUrl.getSpeciality);
    Map decoded = jsonDecode(responnse.body);
    SelectSpecialityListResponse res =
        SelectSpecialityListResponse.fromJson(decoded);
    await createSeperateList(res.body.data);
    isLoading = false;
    notifyListeners();
  }

  Future createSeperateList(List<SelectSpecialityList> list) async {
    allList.clear();
    for (var index = 0; index < list.length; index++) {
      allList.add(list.elementAt(index));
      if (list.elementAt(index).is_primary == 1) {
        isPrimaryList.add(list.elementAt(index));
        continue;
      }
      if (list.elementAt(index).is_primary == 0) {
        notPrimaryList.add(list.elementAt(index));
        notPrimaryStringList.add(list.elementAt(index).specialty_name);
        notifyListeners();
        continue;
      }
    }
    for (var item in isPrimaryList) {
      if (item.specialty_name.contains("General")) {
        item.image = "assets/images/generalist.png";
      }
      if (item.specialty_name.contains("Pediatric")) {
        item.image = "assets/images/pediatric.png";
      }
      if (item.specialty_name.contains("Internal")) {
        item.image = "assets/images/dermatology.png";
      }
      if (item.specialty_name.contains("Infectious")) {
        item.image = "assets/images/infectiousdisease.png";
      }
      if (item.specialty_name.contains("Psychiatry")) {
        item.image = "assets/images/psychiatrist.png";
      }
      if (item.specialty_name.contains("Dermatology")) {
        item.image = "assets/images/dermatology.png";
      }
      if (item.specialty_name.contains("Gynecology")) {
        item.image = "assets/images/gynecology.png";
      }
    }
    notifyListeners();
  }

  String getSpecialityString() {
    if (speciality == "") {
      return notPrimaryStringList[0];
    }
    return speciality;
  }

  void setSpecialityString(special, {Function success, Function failure}) {
    speciality = special;
    speciality_name = speciality;
    notPrimaryList.forEach((element) {
      if (element.specialty_name == speciality) {
        specialty_id = element.specialty_id;
        notifyListeners();
        return success();
      }
    });
    if (special == Strings.selectSpecialityDropDown) {
      return failure();
    }
  }
}

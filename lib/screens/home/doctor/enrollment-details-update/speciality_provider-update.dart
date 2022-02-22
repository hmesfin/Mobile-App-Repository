import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/screens/home/patient/select-speciality/model/select_speciality_list.dart';

class SpecialityProviderUpdate with ChangeNotifier {
  bool isLoading = false;
  List<SelectSpecialityList> allList = [];
  List<SelectSpecialityList> selectedSpeciality = [];
  List<dynamic> selectedSpecialityArray = [];

  Future getSpeciality() async {
    isLoading = true;
    notifyListeners();
    var responnse = await ApiRequest.getApi(ApiUrl.getSpeciality);
    Map decoded = jsonDecode(responnse.body);
    SelectSpecialityListResponse res =
    SelectSpecialityListResponse.fromJson(decoded);
    allList.clear();
    selectedSpecialityArray.clear();
    selectedSpeciality.clear();
    allList.addAll(res.body.data);
    isLoading = false;
    notifyListeners();
  }

  List getSelectedSpecialityyArray() {
    return selectedSpecialityArray;
  }
}

import 'package:virtudoc_app/index.dart';

class LabTestProvider with ChangeNotifier {
  Map<String, bool> values = {};

  List<String> selectedItems = [];
  List<Map<String, String>> filteredResults = [];

  initValues() {
    Strings.labList.forEach((element) {
      values[element['test_name']] = false;
    });
    filteredResults = [...Strings.labList];
  }

  toggleCheckbox(String val, bool value) {
    values[val] = value;
    var selected = Map.from(values)
      ..removeWhere((k, v) => v == false);

    selectedItems.clear();

    selectedItems.clear();
    for (var item in selected.keys) {
      selectedItems.add(item);
    }
    notifyListeners();
  }

  filterResults(text) {
    try {
      filteredResults = Strings.labList
          .where((Map element) => element['test_name'].contains(text))
          .toList();
    } catch (err) {}
    notifyListeners();
  }
}

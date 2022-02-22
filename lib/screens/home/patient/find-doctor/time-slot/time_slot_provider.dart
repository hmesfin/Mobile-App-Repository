import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/screens/home/patient/find-doctor/time-slot/models/time_slot_response/time_slot_response.dart';

class TimeSlotProvider with ChangeNotifier {
  bool isLoading = false;
  bool noData = false;
  String doctorId = '';
  String date = '';
  List<String> dateSlotList = [];
  List<int> slotAvailableList = [];
  List<TimeSlotDataItem> timeSlotList = new List<TimeSlotDataItem>();
  Map<String, dynamic> parentHashMap = new Map<String, dynamic>();
  int atIndex = 0;
  bool hasNext = false;
  var selectedDateSlot = "";
  var selectedStartTimeSlot = "";
  var selectedEndTimeSlot = "";

  Future initData() async {
    parentHashMap.clear();
    dateSlotList.clear();
    timeSlotList.clear();
    slotAvailableList.clear();
    selectedDateSlot = "";
    selectedStartTimeSlot = "";
    selectedEndTimeSlot = "";
    noData = false;
    notifyListeners();
  }

  Future getDoctorAvailability({doctorId = "", dateStamp = ""}) async {
    if (doctorId != "") {
      this.doctorId = doctorId;
    }
    if (dateStamp == "") {
      // date = DateTime.now().toUtc().toString();
      date = DateFormat(Strings.utcFormat).format(DateTime.now());
    } else {
      // date = dateStamp;
      var splitArr = dateStamp.toString().split('-');
      var dayString = splitArr.elementAt(2);
      var monthString = splitArr.elementAt(1);
      var yearString = splitArr.elementAt(0);
      if (splitArr
          .elementAt(1)
          .length == 1) {
        monthString = "0${splitArr.elementAt(1)}";
      }
      if (splitArr
          .elementAt(2)
          .length == 1) {
        dayString = "0${splitArr.elementAt(2)}";
      }
      date = DateFormat(Strings.utcFormat)
          .format(DateTime.parse("$yearString-$monthString-$dayString"));
    }
    noData = false;
    isLoading = true;
    notifyListeners();
    var response = await ApiRequest.getApi(
        ApiUrl.getDoctorAvailablity(date + "Z", this.doctorId));
    if (response.statusCode == 200) {
      Map decode = jsonDecode(response.body);

      parentHashMap.addAll(decode['body']['data']['items']);
      hasNext = decode['body']['data']['hasNext'];
      decode['body']['data']['items'].forEach((key, value) {
        var slotAvailable = 0;
        dateSlotList.add(key?.toString());
        (value as List).forEach((element) {
          TimeSlotDataItem timeSlotDataItem =
          new TimeSlotDataItem.fromJson(jsonDecode(jsonEncode(element)));
          if (timeSlotDataItem?.available == "Yes") {
            ++slotAvailable;
          }
        });
        slotAvailableList.add(slotAvailable);
      });

      notifyListeners();
      if (dateStamp == "") {
        setTimeSlots(atIndex: 0);
      }
    } else {
      noData = true;
    }
    isLoading = false;
    notifyListeners();
  }

  Future setTimeSlots({atIndex = 0}) async {
    this.atIndex = atIndex;
    selectedDateSlot = dateSlotList.elementAt(this.atIndex);
    timeSlotList.clear();
    notifyListeners();
    var keys = parentHashMap.keys.toList();
    var val = parentHashMap[keys[(this.atIndex)]];
    (val as List).forEach((element) {
      TimeSlotDataItem timeSlotDataItem =
      new TimeSlotDataItem.fromJson(jsonDecode(jsonEncode(element)));
      timeSlotList.add(timeSlotDataItem);
    });
    notifyListeners();
  }
}

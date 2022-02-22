import 'package:virtudoc_app/index.dart';

class SetAvailabilityProvider with ChangeNotifier {
  bool isLoading = false;
  bool repeatAvailability = false;
  bool isNeverBool = false;
  bool isDailyBool = false;

  String startDate = "";
  String startTime = "";
  String endDate = "";
  String endTime = "";

  int duration = 15;

  int startHrs = 0;
  int startMins = 0;
  int endHrs = 0;
  int endMins = 0;
  DateTime startDateForcomp;
  var endDateForcomp;
  TimeOfDay startTimeForComp;
  TimeOfDay endTimeForComp;

  var startDateController = TextEditingController();
  var startTimeController = TextEditingController();
  var endDateController = TextEditingController();
  var endTimeController = TextEditingController();
  var slotDuration = TextEditingController(text: '');
  var availabilityText = TextEditingController();
  var dateFormat = "dd MMM, yyyy";

  List<int> selectedDaysInt = [];
  List<String> selectedDays = [];

  init() {
    startTimeController.clear();
    endDateController.clear();
    endTimeController.clear();
    slotDuration.clear();
    availabilityText.clear();
    selectedDaysInt.clear();
    selectedDays.clear();
    repeatAvailability = false;
    isNeverBool = false;
    isDailyBool = false;
    startDate = "";
    startTime = "";
    endDate = "";
    endTime = "";
    startHrs = 0;
    startMins = 0;
    endHrs = 0;
    endMins = 0;
    duration = 15;
    initCustomRecurrence();
    notifyListeners();
  }

  setStartDate(date) async {
    startDateForcomp = date;
    startDateController.clear();
    startDateController.text = DateFormat(dateFormat).format(date)?.toString();
    startDate = CommonWidgets().utcTimeSTamp(date);
    notifyListeners();
  }

  setStartTime(time) async {
    try {
      var formattedTime =
          "${time?.toString()?.substring(0, 2)}:${time?.toString()?.substring(
          3, 5)}";
      startHrs = int.parse(time?.toString()?.substring(0, 2) ?? "00:00");
      startMins = int.parse(time?.toString()?.substring(3, 5) ?? "00:00");
      startTimeController.text = formattedTime;
      startTime = formattedTime;
    } catch (e) {}
    notifyListeners();
  }

  setEndDate(date) async {
    endDateForcomp = date;
    endDateController.text = DateFormat(dateFormat).format(date)?.toString();
    endDate = CommonWidgets().utcTimeSTamp(date);
    notifyListeners();
  }

  setEndTime(time) async {
    try {
      var formattedTime =
          "${time?.toString()?.substring(0, 2)}:${time?.toString()?.substring(
          3, 5)}";
      endHrs = int.parse(time?.toString()?.substring(0, 2));
      endMins = int.parse(time?.toString()?.substring(3, 5));
      endTimeController.text = formattedTime;
      endTime = formattedTime;
    } catch (e) {}
    notifyListeners();
  }

  setSlotDuration(dur) async {
    if (dur != null) {
      if (dur != "") {
        duration = int.parse(dur);
      } else {
        duration = 15;
      }
    } else {
      duration = 15;
    }
    notifyListeners();
  }

  initCustomRecurrence() {
    endDateController.clear();
    availabilityText.clear();
    selectedDaysInt.clear();
    selectedDays.clear();
    repeatAvailability = false;
    isNeverBool = false;
    isDailyBool = false;
    isLoading = false;
    notifyListeners();
  }

  setCustomRecurrence({Function success, Function failure}) {
    var endOnText = "";
    var days;

    if (!isDailyBool) {
      if (selectedDaysInt.isEmpty) {
        return failure("Select any day to set recurring");
      } else {
        days = "Available weekly on " + selectedDays.join(", ");
      }
    } else {
      days = "Available daily";
    }
    if (!isNeverBool) {
      if (endDateController.text.isEmpty) {
        return failure(Strings.pleaseSelect(Strings.endDate));
      } else {
        if (startDateController.text == endDateController.text) {
          return failure(Strings.pleaseSelect(
              "select different end date other than start date"));
        } else {
          DateTime dateTimeCreatedAt =
          DateFormat(dateFormat).parse(startDateController.text);
          DateTime dateTimeEndedAt =
          DateFormat(dateFormat).parse(endDateController.text);
          final differenceInDays =
              dateTimeEndedAt
                  .difference(dateTimeCreatedAt)
                  .isNegative;
          if (differenceInDays) {
            return failure(Strings.pleaseSelect(
                "select different end date greater than start date"));
          } else {
            endOnText = days + " until " + endDateController.text;
          }
        }
      }
    } else {
      endOnText = days;
    }
    availabilityText.text = endOnText;
    notifyListeners();
    return success();
  }

  Future setAvailability({Function success, Function failure}) async {
    var connected = await CommonWidgets().internetCheck();
    if (!connected) {
      return failure(Strings.not_connected);
    }
    if (startDateController.text.isEmpty) {
      return failure(Strings.pleaseEnter(Strings.startDate));
    }

    if (startTimeController.text.isEmpty) {
      return failure(Strings.pleaseEnter(Strings.startTime));
    }

    if ((DateTime
        .now()
        .day == startDateForcomp.day) &&
        (DateTime
            .now()
            .hour > startTimeForComp.hour)) {
      return failure('Entered time should be greater than current time.');
    }
    if (endTimeController.text.isEmpty) {
      return failure(Strings.pleaseEnter(Strings.endTime));
    }

    if (!repeatAvailability) {
      if (startTimeController.text == endTimeController.text) {
        return failure(Strings.enteCorrectTimeDiff);
      }
      if (startHrs == endHrs) {
        if (endMins - startMins != duration) {
          return failure(Strings.enteCorrectTimeDiff);
        }
      }
      if (endHrs < startHrs) {
        return failure(Strings.enteCorrectTimeDiff);
      }
    }

    var format = DateFormat("HH:mm");
    var one = format.parse(startTime);
    var two = format.parse(endTime);
    var diff = two.difference(one);

    if (diff.inMinutes % duration != 0) {
      return failure(Strings.enteCorrectTimeDiff);
    }

    isLoading = true;
    notifyListeners();
    if (selectedDaysInt.isNotEmpty) {
      for (var index = 0; index < selectedDaysInt.length; ++index) {
        if (selectedDaysInt.elementAt(index) == 0) {
          selectedDaysInt[index] = 7;
          break;
        }
      }
    }

    var startDateTime = DateFormat('yyyy-MM-dd HH:mm')
        .parse(
        DateFormat('yyyy-MM-dd').parse(startDate).toString().split(" ")[0] +
            " " +
            startTime)
        .toUtc();

    var endDateTime = DateFormat('yyyy-MM-dd HH:mm')
        .parse(
        DateFormat('yyyy-MM-dd').parse(startDate).toString().split(" ")[0] +
            " " +
            endTime)
        .toUtc();

    Map map = {
      "start_date": startDate,
      "start_time": DateFormat('HH:mm').format(startDateTime),
      if (repeatAvailability)
        if (!isNeverBool) "end_date": endDate,
      "end_time": DateFormat('HH:mm').format(endDateTime),
      "duration": duration,
      "is_recurring": repeatAvailability,
      if (repeatAvailability)
        "recurring_type": isDailyBool ? 'daily' : 'weekly',
      if (repeatAvailability)
        if (!isDailyBool) "repeats_on": selectedDaysInt.join(','),
      if (repeatAvailability) "is_recurring_ended": !isNeverBool,
    };

    var getCalenderView = await ApiRequest.postApi(ApiUrl.setAvailability, map);

    Map decode = jsonDecode(getCalenderView.body);
    isLoading = false;
    notifyListeners();
    if (getCalenderView.statusCode == 200) {
      return success();
    } else {
      return failure(decode['message']);
    }
  }
}
